/*
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

#include "trigger_state.h"

#include "../../lua/luautils.h"
#include "../../entities/charentity.h"
#include "../../entities/npcentity.h"
#include "../../packets/entity_update.h"

CTriggerState::CTriggerState(CBaseEntity* PEntity, uint16 targid) :
    CState(PEntity, targid)
{
}

bool CTriggerState::Update(time_point tick)
{
    auto PChar = static_cast<CCharEntity*>(GetTarget());
    if (PChar && luautils::OnTrigger(PChar, m_PEntity) == -1 && m_PEntity->animation == ANIMATION_CLOSE_DOOR)
    {
        m_PEntity->animation = ANIMATION_OPEN_DOOR;
        PChar->loc.zone->PushPacket(m_PEntity, CHAR_INRANGE, new CEntityUpdatePacket(m_PEntity, ENTITY_UPDATE, UPDATE_COMBAT));
        CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("close_door", /*tick +*/ 7000, m_PEntity, CTaskMgr::TASK_ONCE, close_door));
    }
    return true;
}

bool CTriggerState::CanChangeState()
{
    return false;
}
