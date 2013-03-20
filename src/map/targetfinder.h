/*
===========================================================================

  Copyright (c) 2010-2012 Darkstar Dev Teams

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

#ifndef _TARGETFINDER_H
#define _TARGETFINDER_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

class CBattleEntity;

// max targets a mobs buff move will accept
// 10+ will cause a crash
#define MAX_AOE_BUFF_TARGETS 9

// max targets for offensive AoEs
#define MAX_AOE_TARGETS 12

// allow pets to recieve buffs from protectra, curaga etc
#define PETS_CAN_AOE_BUFF false

enum AOERADIUS
{
  AOERADIUS_ATTACKER = 1,
  AOERADIUS_TARGET = 2
};

class CTargetFinder
{
public:
  CTargetFinder(CBattleEntity* PBattleEntity);

  void reset(); // remove all found targets

  // Main methods for finding targets
  void findSingleTarget(CBattleEntity* PTarget);
  void findWithinArea(CBattleEntity* PTarget, AOERADIUS radiusType, float radius);
  void findWithinCone(CBattleEntity* PTarget, float distance, float angle);

  // add all targets in contexts
  void addAllInAlliance(CBattleEntity* PTarget, bool withPet);
  void addAllInParty(CBattleEntity* PTarget, bool withPet);
  void addAllInMobList(CBattleEntity* PTarget, bool withPet);
  void addEntity(CBattleEntity* PTarget, bool withPet);

  // helpers
  bool isMobOwner(CBattleEntity* PTarget);
  CBattleEntity* findMaster(CBattleEntity* PTarget);
  bool validEntity(CBattleEntity* PTarget);
  bool isPlayer();

  bool isWithinArea(CBattleEntity* PTarget);
  bool isWithinCone(CBattleEntity* PTarget);
  bool isWithinRange(CBattleEntity* PTarget, float range);

  std::vector<CBattleEntity*> m_targets; // contains all found entities
  bool m_targetDead;

protected:

  float m_radius;
  position_t* m_PRadiusAround;

  CBattleEntity* m_PBattleEntity; // user

  CBattleEntity* m_PMasterTarget; // mater of target
  CBattleEntity* m_PTarget; // first target

  uint16 m_zone;

  // conal vars
  bool m_conal;
  float m_scalar;
  position_t* m_APoint;
  position_t m_BPoint;
  position_t m_CPoint;
};

#endif