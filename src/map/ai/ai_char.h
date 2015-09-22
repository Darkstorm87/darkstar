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

#ifndef _AICHAR_H
#define _AICHAR_H

#include "ai_battle.h"

class CCharEntity;

class CAIChar : public CAIBattle
{
public:
    CAIChar(CCharEntity*);

protected:

    /* Attacking functions */
    virtual bool CanAttack(CBattleEntity* PTarget, std::unique_ptr<CMessageBasicPacket>& errMsg) override;
    virtual bool Attack(action_t&) override;
    virtual CBattleEntity* IsValidTarget(uint16 targid, uint8 validTargetFlags, std::unique_ptr<CMessageBasicPacket>& errMsg) override;
    virtual void OnChangeTarget(CBattleEntity* PNewTarget) override;
    virtual void OnDisengage() override;

    /* Casting functions */
    virtual void OnCastFinished(CMagicState&, action_t&) override;
    virtual void OnCastInterrupted(CMagicState&, action_t&, MSGBASIC_ID msg) override;
    virtual void OnWeaponskillFinished(CWeaponskillState&, action_t&) override;

    time_point m_errMsgTime;
};

#endif