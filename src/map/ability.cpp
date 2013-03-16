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

#include "ability.h"


CAbility::CAbility(uint16 id)
{
	m_ID = id;
}

void CAbility::resetMsg()
{
  m_message = m_DefaultMessage;
}

void CAbility::setID(uint16 id)
{
	m_ID = id;
}

uint16 CAbility::getID()
{
	return m_ID;
}

void CAbility::setJob(JOBTYPE Job)
{
	m_Job = Job;
}

void CAbility::setMeritModID(uint16 value)
{
	m_meritModID = value;
}

JOBTYPE	CAbility::getJob()
{
	return m_Job;
}

void CAbility::setLevel(uint8 level)
{
	m_level = level;
}

uint8 CAbility::getLevel()
{
	return m_level;
}

void CAbility::setRange(uint8 range)
{
	m_range = range;
}

uint8 CAbility::getRange()
{
	return m_range;
}

void CAbility::setAOE(uint8 aoe)
{
	m_aoe = aoe;
}

uint8 CAbility::getAOE()
{
	return m_aoe;
}

void CAbility::setAnimationID(uint8 animationID)
{
	m_animationID = animationID;
}

uint8 CAbility::getAnimationID()
{
	return m_animationID;
}

void CAbility::setRecastTime(uint16 recastTime)
{
	m_recastTime =  recastTime;
}

uint16 CAbility::getRecastTime()
{
	return m_recastTime;
}

uint16 CAbility::getMeritModID()
{
	return m_meritModID;
}

void CAbility::setValidTarget(uint8 validTarget)
{
	m_validTarget = validTarget;
}

uint8 CAbility::getValidTarget()
{
	return m_validTarget;
}

ADDTYPE CAbility::getAddType()
{
    return m_addType;
}

void CAbility::setAddType(ADDTYPE addType)
{
    m_addType = addType;
}

const int8* CAbility::getName()
{
	return m_name.c_str();
}

void CAbility::setName(int8* name)
{
	m_name.clear();
	m_name.insert(0,name);
}

uint16 CAbility::getRecastId()
{
	return m_recastId;
}

void CAbility::setRecastId(uint16 recastId)
{
	m_recastId = recastId;
}

void CAbility::setCE(uint16 CE)
{
	m_CE = CE;
}

uint16 CAbility::getCE()
{
	return m_CE;
}

void CAbility::setVE(uint16 VE)
{
	m_VE = VE;
}

uint16 CAbility::getVE()
{
	return m_VE;
}

/************************************************************************
*                                                                       *
*  Получаем/Устанавливаем сообщение способности                         *
*                                                                       *
************************************************************************/

uint16 CAbility::getMessage()
{
    return m_message;
}

void CAbility::setMessage(uint16 message)
{
    m_message = message;
}

uint16 CAbility::getAoEMsg()
{
  switch(m_message){
        case 185:
            return 264;
        case 186:
            return 266;
        case 187:
            return 281;
        case 188:
            return 282;
        case 189:
            return 283;
        case 225:
            return 366;
        case 226:
            return 226; //no message for this... I guess there is no aoe TP drain move
        case 103: //recover hp
        case 102: //recover hp
        case 238: //recover hp
        case 306: //recover hp
        case 318: //recover hp
            return 24;
        case 242:
            return 277;
        case 243:
            return 278;
        case 284:
            return 284; //already the aoe message
        case 370:
            return 404;
        case 362:
            return 363;
        case 378:
            return 343;
        case 224: //recovers mp
          return 276;
        default:
            return m_message;
    }
}

uint16 CAbility::getDefaultMessage()
{
    return m_DefaultMessage;
}

void CAbility::setDefaultMessage(uint16 message)
{
    m_DefaultMessage = message;
}

/************************************************************************
*                                                                       *
*  Реализация namespase для работы со способностями                     *
*                                                                       *
************************************************************************/

namespace ability
{
    CAbility* PAbilityList[MAX_ABILITY_ID];                     // Complete Abilities List
    std::vector<CAbility*> PAbilitiesList[MAX_JOBTYPE];			// Abilities List By Job Type

    /************************************************************************
    *                                                                       *
    *  Load Abilities from Database                                         *
    *                                                                       *
    ************************************************************************/

    void LoadAbilitiesList()
    {
        // TODO: добавить поле message в таблицу

	    memset(PAbilityList,0,sizeof(PAbilityList));

	    const int8* Query =
            "SELECT "
              "abilityId,"
              "name,"
              "job,"
              "level,"
              "validTarget,"
              "recastTime,"
              "message1, "
              "message2, "
              "animation,"
              "`range`,"
              "isAOE,"
              "recastId,"
              "CE,"
              "VE, "
              "meritModID, "
			  "addType "
            "FROM abilities  "
            "WHERE job > 0 AND job < %u AND abilityId < %u "
            "ORDER BY job, level ASC";

	    int32 ret = Sql_Query(SqlHandle, Query, MAX_JOBTYPE, MAX_ABILITY_ID);

	    if( ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	    {
		    while(Sql_NextRow(SqlHandle) == SQL_SUCCESS)
		    {
			    CAbility* PAbility = new CAbility(Sql_GetIntData(SqlHandle,0));

			    PAbility->setName(Sql_GetData(SqlHandle,1));
			    PAbility->setJob((JOBTYPE)Sql_GetIntData(SqlHandle,2));
			    PAbility->setLevel(Sql_GetIntData(SqlHandle,3));
			    PAbility->setValidTarget(Sql_GetIntData(SqlHandle,4));
			    PAbility->setRecastTime(Sql_GetIntData(SqlHandle,5));
                PAbility->setMessage(Sql_GetIntData(SqlHandle,6));
				PAbility->setDefaultMessage(Sql_GetIntData(SqlHandle,6));
              //PAbility->setMessage(Sql_GetIntData(SqlHandle,7));
			    PAbility->setAnimationID(Sql_GetIntData(SqlHandle,8));
			    PAbility->setRange(Sql_GetIntData(SqlHandle,9));
			    PAbility->setAOE(Sql_GetIntData(SqlHandle,10));
			    PAbility->setRecastId(Sql_GetIntData(SqlHandle,11));
			    PAbility->setCE(Sql_GetIntData(SqlHandle,12));
			    PAbility->setVE(Sql_GetIntData(SqlHandle,13));
			    PAbility->setMeritModID(Sql_GetIntData(SqlHandle,14));
				PAbility->setAddType((ADDTYPE)Sql_GetIntData(SqlHandle,15));

			    PAbilityList[PAbility->getID()] = PAbility;
			    PAbilitiesList[PAbility->getJob()].push_back(PAbility);
		    }
	    }
    }

    /************************************************************************
    *                                                                       *
    *  Get Ability By ID                                                    *
    *                                                                       *
    ************************************************************************/

    CAbility* GetAbility(uint16 AbilityID)
    {
	    if (AbilityID < MAX_ABILITY_ID)
	    {
		    return PAbilityList[AbilityID];
	    }
	    ShowFatalError(CL_RED"AbilityID <%u> is out of range\n" CL_RESET, AbilityID);
	    return NULL;
    }

    /************************************************************************
    *                                                                       *
    *  Получаем основную способность профессии                              *
    *                                                                       *
    ************************************************************************/

    CAbility* GetTwoHourAbility(JOBTYPE JobID)
    {
        DSP_DEBUG_BREAK_IF(JobID < JOB_WAR || JobID > JOB_SCH);

        switch(JobID)
        {
            case JOB_WAR: return PAbilityList[ABILITY_MIGHTY_STRIKES]; break;
            case JOB_MNK: return PAbilityList[ABILITY_HUNDRED_FISTS]; break;
            case JOB_WHM: return PAbilityList[ABILITY_BENEDICTION]; break;
            case JOB_BLM: return PAbilityList[ABILITY_MANAFONT]; break;
            case JOB_RDM: return PAbilityList[ABILITY_CHAINSPELL]; break;
            case JOB_THF: return PAbilityList[ABILITY_PERFECT_DODGE]; break;
            case JOB_PLD: return PAbilityList[ABILITY_INVINCIBLE]; break;
            case JOB_DRK: return PAbilityList[ABILITY_BLOOD_WEAPON]; break;
            case JOB_BST: return PAbilityList[ABILITY_FAMILIAR]; break;
            case JOB_BRD: return PAbilityList[ABILITY_SOUL_VOICE]; break;
            case JOB_RNG: return PAbilityList[ABILITY_EAGLE_EYE_SHOT]; break;
            case JOB_SAM: return PAbilityList[ABILITY_MEIKYO_SHISUI]; break;
            case JOB_NIN: return PAbilityList[ABILITY_MIJIN_GAKURE]; break;
            case JOB_DRG: return PAbilityList[ABILITY_SPIRIT_SURGE]; break;
            case JOB_SMN: return PAbilityList[ABILITY_ASTRAL_FLOW]; break;
            case JOB_BLU: return PAbilityList[ABILITY_AZURE_LORE]; break;
            case JOB_COR: return PAbilityList[ABILITY_WILD_CARD]; break;
            case JOB_PUP: return PAbilityList[ABILITY_OVERDRIVE]; break;
            case JOB_DNC: return PAbilityList[ABILITY_TRANCE]; break;
            case JOB_SCH: return PAbilityList[ABILITY_TABULA_RASA]; break;
        }
        return NULL;
    }

	bool CanLearnAbility(CBattleEntity* PUser, uint16 AbilityID)
	{
	    if (GetAbility(AbilityID) != NULL)
	    {
		    uint8 Job = PAbilityList[AbilityID]->getJob();
		    uint8 JobLvl = PAbilityList[AbilityID]->getLevel();

			return ((PUser->GetMJob() == Job && PUser->GetMLevel() >= JobLvl) ||
				(PUser->GetSJob() == Job && PUser->GetSLevel() >= JobLvl));
	    }
	    return false;
	}

    /************************************************************************
    *                                                                       *
    *  Get Abilities By JobID                                               *
    *                                                                       *
    ************************************************************************/

    std::vector<CAbility*> GetAbilities(JOBTYPE JobID)
    {
	    return PAbilitiesList[JobID];
    }
};