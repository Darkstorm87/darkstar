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

#include "despawn_state.h"
#include "../../entities/baseentity.h"
#include "../../packets/entity_animation.h"

CDespawnState::CDespawnState(CBaseEntity* _PEntity, duration spawnTime) :
    CState(_PEntity, _PEntity->targid),
    m_spawnTime(spawnTime)
{
    if (_PEntity->PAI->IsSpawned())
    {
        _PEntity->loc.zone->PushPacket(_PEntity, CHAR_INRANGE, new CEntityAnimationPacket(_PEntity, CEntityAnimationPacket::Fade_Out));
        _PEntity->PAI->QueueAction(queueAction_t(3s, false, [](CBaseEntity* PEntity) {
            PEntity->status = STATUS_DISAPPEAR;
            //#event despawn
        }));
    }
}

CDespawnState::CDespawnState(CBaseEntity* _PEntity) :
    CDespawnState(_PEntity, 0s)
{}

bool CDespawnState::Update(time_point tick)
{
    if (m_spawnTime > 0s && tick > getEntryTime() + m_spawnTime)
    {
        return true;
    }
    return false;
}

void CDespawnState::Cleanup(time_point tick)
{
    m_PEntity->Spawn();
    //spawn here - PEntity with a virtual reset method?(cant use in constructor)
}

bool CDespawnState::CanChangeState()
{
    return false;
}
