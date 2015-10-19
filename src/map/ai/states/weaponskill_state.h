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

#ifndef _CWEAPONSKILL_STATE_H
#define _CWEAPONSKILL_STATE_H

#include "state.h"

class CWeaponSkill;
class CMobSkill;

class CWeaponSkillState : public CState
{
public:
    CWeaponSkillState(CBattleEntity* PEntity, uint16 targid);

    bool StartWeaponSkill(uint16 wsid);
    bool StartMobSkill(uint16 mobskillid);
    CWeaponSkill* GetWeaponSkill();
    CMobSkill* GetMobSkill();

    void SpendCost();
protected:
    virtual bool CanChangeState() override { return false; }
    virtual bool Update(time_point tick) override;
    virtual void Cleanup(time_point tick) override;

    CBattleEntity* const m_PEntity;
    std::unique_ptr<CWeaponSkill> m_PWeaponSkill;
    std::unique_ptr<CMobSkill> m_PMobSkill;
    time_point m_finishTime;
};

#endif