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

#ifndef _CABILITY_STATE_H
#define _CABILITY_STATE_H

#include "state.h"

class CAbility;

class CAbilityState : public CState
{
public:
    CAbilityState(CCharEntity* PEntity, uint16 targid);

    bool StartAbility(uint16 abilityid);
    CAbility* GetAbility();

    void ApplyEnmity();

protected:
    virtual bool CanChangeState() override;
    virtual bool Update(time_point tick) override;
    virtual void Cleanup(time_point tick) override {}

    bool CanUseAbility();

private:
    CCharEntity* const m_PEntity;
    std::unique_ptr<CAbility> m_PAbility;
    bool m_used {false};
    time_point m_useTime;
};


#endif