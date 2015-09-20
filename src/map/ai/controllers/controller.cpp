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

#include "controller.h"

#include "../../entities/battleentity.h"

CController::CController(CBattleEntity* _POwner, bool _canUpdate) :
    POwner(_POwner),
    canUpdate(_canUpdate)
{}

void CController::Cast(uint16 targid, uint16 spellid)
{
    if (POwner)
    {
        POwner->PAIBattle()->Internal_Cast(targid, spellid);
    }
}

bool CController::Engage(uint16 targid)
{
    if (POwner)
    {
        return POwner->PAIBattle()->Internal_Engage(targid);
    }
    return false;
}

void CController::ChangeTarget(uint16 targid)
{
    if (POwner)
    {
        POwner->PAIBattle()->Internal_ChangeTarget(targid);
    }
}

void CController::Disengage()
{
    if (POwner)
    {
        POwner->PAIBattle()->Internal_Disengage();
    }
}
