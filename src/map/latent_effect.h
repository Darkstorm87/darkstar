﻿/*
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

#ifndef _LATENTEFFECT_H
#define _LATENTEFFECT_H

#include "../common/cbasetypes.h"
#include "../common/mmo.h"

enum LATENT
{
	LATENT_HP_UNDER					= 0,  //hp less than or equal to % - PARAM: HP PERCENT
	LATENT_HP_OVER					= 1,  //hp more than % - PARAM: HP PERCENT
	LATENT_HP_UNDER_TP_UNDER_100	= 2,  //hp less than or equal to %, tp under 100 - PARAM: HP PERCENT
	LATENT_HP_OVER_TP_UNDER_100		= 3,  //hp more than %, tp over 100 - PARAM: HP PERCENT
	LATENT_MP_UNDER_PERCENT			= 4,  //mp less than or equal to % - PARAM: MP PERCENT
	LATENT_MP_UNDER					= 5,  //mp less than # - PARAM: MP #
	LATENT_MP_UNDER_VISIBLE_GEAR	= 45, //mp less than or equal to %, calculated using MP bonuses from visible gear only
	LATENT_TP_UNDER_100				= 6,  //tp under 100 and during WS - PARAM: NONE
	LATENT_TP_OVER_100				= 7,  //tp over 100 - PARAM: NONE
	LATENT_SUBJOB					= 8,  //subjob - PARAM: JOBTYPE
	LATENT_PET_ID					= 9,  //pettype - PARAM: PETID
	LATENT_WEAPON_DRAWN				= 10, //weapon drawn - PARAM: HP DRAIN/SEC
	LATENT_WEAPON_SHEATHED			= 11, //weapon sheathed
	LATENT_WEAPON_DRAWN_MP_DRAIN	= 12, //weapon drawn - PARAM: MP DRAIN/SEC
	LATENT_STATUS_EFFECT_ACTIVE		= 13, //status effect on player - PARAM: EFFECTID
	LATENT_NO_FOOD_ACTIVE			= 14, //no food effects active on player
	LATENT_PARTY_MEMBERS			= 16, //party has members other than self - PARAM: # OF MEMBERS
	LATENT_AVATAR_IN_PARTY			= 21, //party has a specific avatar - PARAM: same as globals/pets.lua (21 for any avatar)
	LATENT_JOB_IN_PARTY				= 22, //party has job - PARAM: JOBTYPE
	LATENT_ZONE						= 23, //in zone - PARAM: zoneid
	LATENT_SYNTH_TRAINEE			= 24, //synth skill under 40 + no support
	LATENT_SONG_ROLL_ACTIVE			= 25, //any song or roll active
	LATENT_TIME_OF_DAY				= 26, //PARAM: 0: DAYTIME 1: NIGHTTIME 2: DUSK-DAWN
	LATENT_FIRESDAY					= 28, 
	LATENT_EARTHSDAY				= 29,
	LATENT_WATERSDAY				= 30,
	LATENT_WINDSDAY					= 31,
	LATENT_ICEDAY					= 34,
	LATENT_LIGHTNINGSDAY			= 35,
	LATENT_LIGHTSDAY				= 36,
	LATENT_MOON_FIRST_QUARTER		= 37,
	LATENT_JOB_MULTIPLE_5			= 38,
	LATENT_JOB_MULTIPLE_10			= 39,
	LATENT_JOB_MULTIPLE_13_NIGHT	= 40,
	LATENT_JOB_LEVEL_ODD			= 41,
	LATENT_JOB_LEVEL_EVEN			= 42,
	LATENT_WEAPON_DRAWN_HP_UNDER	= 43, //PARAM: HP PERCENT
	LATENT_WEAPON_DRAWN_TP_DRAIN	= 44 //TP must be >= to drain to activate latent PARAM: TP DRAIN/TICK
};

#define MAX_LATENTEFFECTID    50

/************************************************************************
*																		*
*  Нерешенные задачи:													*
*																		*
*  - сохранение ID сущности, добавившей эффект							*
*  - обновление эффекта (например перезапись protect 1 на protect 2)    *
*																		*
************************************************************************/

class CBattleEntity;

class CLatentEffect
{
public:

	LATENT		GetConditionsID();
	uint16		GetConditionsValue();
    uint8		GetSlot();
	uint16		GetModValue();
    uint16		GetModPower();
    bool		IsActivated();
	uint16		GetFlag();

	CBattleEntity* GetOwner();

    void    SetConditionsId(LATENT id);
    void    SetConditionsValue(uint16 value);
	void	SetSlot(uint8 slot);
    void    SetModValue(uint16 value);
	void	SetModPower(uint16 power);
    void    Activate();
	void	Deactivate();
    void    SetOwner(CBattleEntity* Owner);

	CLatentEffect(
		 LATENT conditionsId,
         uint16 conditionsValue,
		 uint8 slot, 
		 uint16 modValue, 
		 uint32 modPower
	);

   ~CLatentEffect();

private:

    CBattleEntity* m_POwner;            

	LATENT		m_ConditionsID;			//condition type to be true
	uint16		m_ConditionsValue;		//condition parameter to be met
	uint8		m_SlotID;				//slot associated with latent
    uint16      m_ModValue;             //mod ID to be applied when active
	uint16		m_ModPower;				//power of mod to be applied when active
	bool		m_Activated;			//active or not active
};

#endif

