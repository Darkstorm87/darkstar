﻿/*
===========================================================================

Copyright (c) 2010-2015 Darkstar Dev Teams

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see http://www.gnu.org/licenses/

This file is part of DarkStar-server source code.

===========================================================================
*/

#include <string.h>
#include <algorithm>

#include "ai/states/death_state.h"

#include "alliance.h"

#include "battlefield.h"
#include "battlefield_handler.h"

#include "entities/battleentity.h"
#include "entities/charentity.h"
#include "entities/mobentity.h"

#include "lua/luautils.h"

#include "packets/char_recast.h"
#include "packets/char_skills.h"
#include "packets/message_basic.h"

#include "recast_container.h"
#include "status_effect.h"
#include "status_effect_container.h"

#include "utils/charutils.h"
#include "utils/zoneutils.h"

#include "zone.h"


CBattlefieldHandler::CBattlefieldHandler(CZone* PZone)
{
    m_PZone = PZone;
    m_MaxBattlefields = luautils::OnBattlefieldHandlerInitialise(PZone);
}

void CBattlefieldHandler::HandleBattlefields(time_point tick)
{
    // todo: probably stop being a pussy and use raw pointers otherwise might be fucking up lua
    // dont want this to run again if we removed a battlefield
    for (auto& PBattlefield : m_Battlefields)
    {
        if (!PBattlefield.second->CanCleanup())
            PBattlefield.second->onTick(tick);
    }

    // can't std::remove_if in map so i'll ghetto it
    for (auto it = m_Battlefields.begin(); it != m_Battlefields.end();)
    {
        auto PBattlefield = it->second;
        if (PBattlefield->CanCleanup())
        {
            PBattlefield->Cleanup();
            it = m_Battlefields.erase(it);
            ShowDebug("[CBattlefieldHandler]HandleBattlefields cleaned up Battlefield %s\n", PBattlefield->GetName().c_str());
            delete PBattlefield;
        }
        else
        {
            ++it;
        }
    }
}

uint8 CBattlefieldHandler::LoadBattlefield(CCharEntity* PChar, uint16 battlefieldID, uint8 area)
{
    if (PChar->PBattlefield == nullptr && m_Battlefields.size() < m_MaxBattlefields)
    {
        for (auto&& battlefield : m_Battlefields)
        {
            if (battlefield.first == area)
            {
                return BATTLEFIELD_RETURN_CODE_INCREMENT_REQUEST;
            }
        }

        if (battlefieldID == 0xFFFF)
        {
            // made it this far so looks like there's a free battlefield
            return BATTLEFIELD_RETURN_CODE_CUTSCENE;
        }

        auto fmtQuery = "SELECT name, bcnmId, fastestName, fastestTime, fastestPartySize, timeLimit, levelCap, lootDropId, rules, partySize, \
                            zoneId \
						    FROM bcnm_info i\
							WHERE bcnmId = %u";

        auto ret = Sql_Query(SqlHandle, fmtQuery, battlefieldID);

        if (ret == SQL_ERROR ||
            Sql_NumRows(SqlHandle) == 0 ||
            Sql_NextRow(SqlHandle) != SQL_SUCCESS)
        {
            ShowError("Cannot load battlefield : %u \n", battlefieldID);
            return BATTLEFIELD_RETURN_CODE_REQS_NOT_MET;
        }
        else
        {
            auto name = Sql_GetData(SqlHandle, 0);

            auto recordholder = Sql_GetData(SqlHandle, 2);
            auto recordtime = std::chrono::seconds(Sql_GetUIntData(SqlHandle, 3));
            auto recordPartySize = Sql_GetUIntData(SqlHandle, 4);
            auto timelimit = std::chrono::seconds(Sql_GetUIntData(SqlHandle, 5));
            auto levelcap = Sql_GetUIntData(SqlHandle, 6);
            auto lootid = Sql_GetUIntData(SqlHandle, 7);
            auto maxplayers = Sql_GetUIntData(SqlHandle, 8);
            auto rulemask = Sql_GetUIntData(SqlHandle, 9);

            auto PBattlefield = new CBattlefield(battlefieldID, m_PZone, area, PChar);

            PBattlefield->SetName(name);
            PBattlefield->SetRecord(recordholder, recordtime, recordPartySize);
            PBattlefield->SetTimeLimit(timelimit);
            PBattlefield->SetLevelCap(levelcap);

            PBattlefield->SetMaxParticipants(maxplayers);
            PBattlefield->SetRuleMask(rulemask);

            m_Battlefields.insert(std::make_pair(PBattlefield->GetArea(), PBattlefield));

            if (!PBattlefield->LoadMobs())
            {
                PBattlefield->SetStatus(BATTLEFIELD_STATUS_LOST);
                PBattlefield->CanCleanup(true);
                PBattlefield->Cleanup();
                ShowDebug("battlefield loading failed\n");
                return BATTLEFIELD_RETURN_CODE_WAIT;
            }

            PBattlefield->InsertEntity(PChar, true);

            if (lootid != 0)
                PBattlefield->SetLocalVar("loot", lootid);

            luautils::OnBattlefieldInitialise(PBattlefield);
            return BATTLEFIELD_RETURN_CODE_CUTSCENE;
        }
    }
    return BATTLEFIELD_RETURN_CODE_WAIT;
}

CBattlefield* CBattlefieldHandler::GetBattlefield(CBaseEntity* PEntity)
{
    auto entity = dynamic_cast<CBattleEntity*>(PEntity);

    if (entity && entity->objtype == TYPE_PC)
    {
        for (auto& battlefield : m_Battlefields)
        {
            if (battlefield.second->IsRegistered(static_cast<CCharEntity*>(entity)))
                return battlefield.second;
        }
    }

    for (auto& battlefield : m_Battlefields)
    {
        if (battlefield.second->GetEntity(entity))
            return battlefield.second;
    }
    return nullptr;
}

CBattlefield* CBattlefieldHandler::GetBattlefieldByInitiator(uint32 charID)
{
    for (auto& battlefield : m_Battlefields)
    {
        if (battlefield.second->GetInitiator().id == charID)
            return battlefield.second;
    }
    return nullptr;
}

uint8 CBattlefieldHandler::RegisterBattlefield(CCharEntity* PChar, uint16 battlefield, uint8 area, uint32 initiator)
{
    // attempt to add to an existing battlefield
    auto PBattlefield = GetBattlefield(PChar);

    // entity wasnt found in battlefield, assume they have the effect but not physically inside battlefield
    if (PBattlefield)
    {
        if (!PBattlefield->CheckInProgress())
        {
            // players havent started fighting yet, try entering
            if (area != PBattlefield->GetArea())
                return BATTLEFIELD_RETURN_CODE_INCREMENT_REQUEST;

            return PBattlefield->InsertEntity(PChar, false) ? BATTLEFIELD_RETURN_CODE_CUTSCENE : BATTLEFIELD_RETURN_CODE_BATTLEFIELD_FULL;
        }
        else
        {
            // can't enter, mobs been slapped
            return BATTLEFIELD_RETURN_CODE_LOCKED;
        }
    }
    else if (PChar->PBattlefield)
    {
        // todo: fuck you entering multiple battlefields
        ShowDebug("%s tried to enter another fuckin battlefield\n", PChar->GetName());
        return false;
    }
    return LoadBattlefield(PChar, battlefield, area);
}

bool CBattlefieldHandler::RemoveFromBattlefield(CBaseEntity* PEntity, CBattlefield* PBattlefield, uint8 leavecode)
{
    // would only be true for pets and players
    PBattlefield = PBattlefield ? PBattlefield : GetBattlefield(PEntity);
    return PBattlefield ? PBattlefield->RemoveEntity(PEntity, leavecode) : false;
}

bool CBattlefieldHandler::IsRegistered(CCharEntity * PChar)
{
    for (const auto& battlefield : m_Battlefields)
    {
        if (battlefield.second->IsRegistered(PChar))
            return true;
    }
    return false;
}
