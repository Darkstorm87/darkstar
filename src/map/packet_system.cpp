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

#include "../common/blowfish.h"
#include "../common/md52.h"
#include "../common/mmo.h"
#include "../common/showmsg.h"
#include "../common/socket.h"
#include "../common/strlib.h"
#include "../common/taskmgr.h"
#include "../common/timer.h"
#include "../common/utils.h"

#include <string.h>

#include "packet_system.h"
#include "conquest_system.h"
#include "battleutils.h"
#include "charutils.h"
#include "fishingutils.h"
#include "itemutils.h"
#include "linkshell.h"
#include "map.h"
#include "mobentity.h"
#include "npcentity.h"
#include "synthutils.h"
#include "trade_container.h"
#include "zone.h"
#include "zoneutils.h"

#include "lua/luautils.h"

#include "packets/auction_house.h"
#include "packets/automaton_update.h"
#include "packets/bazaar_check.h"
#include "packets/bazaar_close.h"
#include "packets/bazaar_confirmation.h"
#include "packets/bazaar_item.h"
#include "packets/bazaar_message.h"
#include "packets/bazaar_purchase.h"
#include "packets/campaing_map.h"
#include "packets/char.h"
#include "packets/char_abilities.h"
#include "packets/char_appearance.h"
#include "packets/char_check.h"
#include "packets/char_equip.h"
#include "packets/char_emotion.h"
#include "packets/char_jobs.h"
#include "packets/char_health.h"
#include "packets/char_skills.h"
#include "packets/char_spells.h"
#include "packets/char_stats.h"
#include "packets/char_sync.h"
#include "packets/char_update.h"
#include "packets/chat_message.h"
#include "packets/chocobo_digging.h"
#include "packets/chocobo_music.h"
#include "packets/conquest_map.h"
#include "packets/cs_position.h"
#include "packets/delivery_box.h"
#include "packets/downloading_data.h"
#include "packets/entity_update.h"
#include "packets/guild_menu_buy.h"
#include "packets/guild_menu_sell.h"
#include "packets/inventory_assign.h"
#include "packets/inventory_finish.h"
#include "packets/inventory_item.h"
#include "packets/inventory_modify.h"
#include "packets/inventory_size.h"
#include "packets/lock_on.h"
#include "packets/linkshell_equip.h"
#include "packets/linkshell_message.h"
#include "packets/menu_config.h"
#include "packets/menu_merit.h"
#include "packets/message_basic.h"
#include "packets/message_debug.h"
#include "packets/message_standard.h"
#include "packets/message_system.h"
#include "packets/party_invite.h"
#include "packets/party_map.h"
#include "packets/party_search.h"
#include "packets/position.h"
#include "packets/release.h"
#include "packets/server_ip.h"
#include "packets/server_message.h"
#include "packets/shop_appraise.h"
#include "packets/shop_buy.h"
#include "packets/stop_downloading.h"
#include "packets/trade_action.h"
#include "packets/trade_request.h"
#include "packets/trade_item.h"
#include "packets/trade_update.h"
#include "packets/wide_scan_track.h"
#include "packets/world_pass.h"
#include "packets/zone_in.h"
#include "packets/zone_visited.h"
#include "packets/menu_raisetractor.h"

void (*PacketParser[512])(map_session_data_t*, CCharEntity*, int8*);

/************************************************************************
*																		*
*  Отображения содержимого входящего пакета в консоли					*
*																		*
************************************************************************/

void PrintPacket(int8* data)
{
	int8 message[50];
	memset(&message,0,50);

	for(int y = 0; y < data[1]*2; y++) 
	{
		sprintf(message,"%s %02hx",message,(uint8)data[y]);
		if(((y+1)%16) == 0) 
		{
			message[48] = '\n';
			ShowDebug(message);
			memset(&message,0,50);
		}
	}
	if (strlen(message) > 0) 
	{
		message[strlen(message)] = '\n';
		ShowDebug(message);
	}
}

/************************************************************************
*                                                                       *
*  Неизвестный пакет                                                    *
*                                                                       *
************************************************************************/

void SmallPacket0x000(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    ShowWarning(CL_YELLOW"parse: Unhandled game packet %03hX from user: %s\n"CL_RESET, (RBUFW(data,0) & 0x1FF), PChar->GetName());
    return;
}

/************************************************************************
*                                                                       *
*  Нереализованный пакет                                                *
*                                                                       *
************************************************************************/

void SmallPacket0xFFF(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    ShowDebug(CL_CYAN"parse: SmallPacket is not implemented Type<%03hX>\n"CL_RESET, (RBUFW(data,0) & 0x1FF));
    return;
}

/************************************************************************
*																		*
*  Вход в зону															*
*																		*
*  Обновляем sessionkey и порт клиента при каждом переходе между зонами *
*  Мы должны оставлять правильный ключ при переходе с сервера на сервер	*
*																		*
************************************************************************/

void SmallPacket0x00A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	WBUFL(data,(0x5C)) = 0;

    bool firstlogin = false; // временное решение, до появления PlayTime

	PChar->clearPacketList();

	if (PChar->status == STATUS_DISAPPEAR)
	{
        if (PChar->loc.zone != NULL)
        {
            PacketParser[0x00D](session, PChar, NULL);
        }

		session->blowfish.key[4] += 2;
        session->blowfish.status = BLOWFISH_SENT;

		md5((uint8*)(session->blowfish.key), session->blowfish.hash, 20);

		for(uint32 i = 0; i < 16; ++i)
		{
			if(session->blowfish.hash[i] == 0)
			{
				memset(session->blowfish.hash+i, 0, 16-i);
				break;
			}
		}
		blowfish_init((int8*)session->blowfish.hash, 16, session->blowfish.P, session->blowfish.S[0]);

		int8 session_key[20*2+1];
		bin2hex(session_key,(uint8*)session->blowfish.key,20);

        if (PChar->loc.destination != 0 && 
            PChar->loc.destination != 214) 
		{
            zoneutils::GetZone(PChar->loc.destination)->IncreaseZoneCounter(PChar);
		} else {
            PChar->loc.zone = zoneutils::GetZone(PChar->loc.destination);
        }

        firstlogin = true;

        for(uint32 i = 0; i < sizeof(PChar->m_ZonesList); ++i)
        {
            if (PChar->m_ZonesList[i] != 0) firstlogin = false;
        }
		PChar->m_ZonesList[PChar->getZone() >> 3] |= (1 << (PChar->getZone()%8));

		const int8* fmtQuery = "UPDATE accounts_sessions SET targid = %u, session_key = x'%s', server_addr = %u, client_port = %u WHERE charid = %u";

		Sql_Query(SqlHandle,fmtQuery,
			PChar->targid,
			session_key,
            PChar->loc.zone->GetIP(),
			session->client_port,
			PChar->id);

		PChar->status = STATUS_NORMAL;
	}
	else
	{
        if (PChar->loc.zone != NULL)
        {
            ShowWarning(CL_YELLOW"Client cannot receive packet or key is invalid: %s\n"CL_RESET, PChar->GetName());
        }
	}
    if (PChar->loc.prevzone == 0 && !firstlogin)
	{
		PChar->loc.prevzone = PChar->getZone();
	}
	int16 EventID = luautils::OnZoneIn(PChar);

	charutils::SaveCharPosition(PChar);
	charutils::SaveZonesVisited(PChar);

	PChar->pushPacket(new CDownloadingDataPacket());
	PChar->pushPacket(new CZoneInPacket(PChar,EventID));
	PChar->pushPacket(new CZoneVisitedPacket(PChar));
	return;
};

/************************************************************************
*																		*
*  Пакет-запрос информации о персонаже. Приходит только во время 		*
*  перехода между зонами / входа в игру (что почти одно и то же)		*																	
*																		*
************************************************************************/

void SmallPacket0x00C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CInventorySizePacket(PChar));
	PChar->pushPacket(new CMenuConfigPacket(PChar));
	PChar->pushPacket(new CCharJobsPacket(PChar));
	PChar->pushPacket(new CChocoboMusicPacket());

	if (PChar->PParty != NULL)
	{
		PChar->PParty->ReloadParty();
	}
	// TODO: в MogHouse TreasurePool сейчас не создается, по этому необходима проверка
	if (PChar->PTreasurePool != NULL)
	{
		PChar->PTreasurePool->UpdatePool(PChar);
	}
    PChar->loc.zone->SpawnTransport(PChar);
	return;
} 

/************************************************************************
*																		*
*  Персонаж покидает зону каким-либо из возможных способов. В случае 	*
*  выхода из игры, текущая зона находится в переменной zone, во всех	*
*  остальных случаех в prevzone. Делаем соответствующую проверку для	*
*  правильного удаления персонажа их списка зоны.						*
*																		*
************************************************************************/

void SmallPacket0x00D(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    session->blowfish.status = BLOWFISH_WAITING;

    PChar->TradePending.clean();
    PChar->InvitePending.clean();
	PChar->PWideScanTarget = NULL;

	if (PChar->animation == ANIMATION_ATTACK)
	{
		PChar->animation = ANIMATION_NONE;
	}

    RecastList_t::iterator it = PChar->RecastList.begin();

	while(it != PChar->RecastList.end())
	{
		Recast_t* recast = *it;
        if (recast->Type == RECAST_MAGIC)
		{
            PChar->RecastList.erase(it++);
            delete recast;
            continue;
		}
		it++;
    }
    charutils::SaveCharStats(PChar);
	charutils::SaveCharPosition(PChar);
	charutils::SaveCharExp(PChar, PChar->GetMJob());

	if (PChar->status == STATUS_SHUTDOWN)
	{
		if (PChar->PParty != NULL)
		{
            // удаляем персонажа из группы
			PChar->PParty->RemoveMember(PChar);
		}
        if (PChar->PLinkshell != NULL) 
        {
            // удаляем персонажа из linkshell
            PChar->PLinkshell->DelMember(PChar);
        }
		CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("close_session", gettick()+2500, session, CTaskMgr::TASK_ONCE, map_close_session));
	} 
	else  // проверка именно при покидании зоны, чтобы не делать двойную проверку при входе в игру 
	{
        charutils::CheckEquipLogic(PChar, SCRIPT_CHANGEZONE, PChar->getZone());
	}
    // персонаж может отвалиться во время перехода между зонами, 
    // map_cleanup вызовет этот метод и zone персонажа будет NULL
    if (PChar->loc.zone != NULL)
    {
        PChar->loc.zone->DecreaseZoneCounter(PChar);
    }
	PChar->status = STATUS_DISAPPEAR;
    PChar->PBattleAI->Reset();
	return;
} 	

/************************************************************************
*																		*
*  Запрос на список квестов и миссий, предметов и ключевых предметов	*																	
*																		*
************************************************************************/

void SmallPacket0x00F(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	charutils::SendKeyItems(PChar);
	charutils::SendQuestMissionLog(PChar);

	PChar->pushPacket(new CCharSpellsPacket(PChar));
	PChar->pushPacket(new CCharAbilitiesPacket(PChar));
	PChar->pushPacket(new CAutomatonUpdatePacket(PChar));
	PChar->pushPacket(new CCharSyncPacket(PChar));
	PChar->pushPacket(new CBazaarMessagePacket(PChar));

	charutils::SendInventory(PChar);
	return;
}

/************************************************************************
*																		*
*  Первый пакет после входа в игру / перехода между зонами, является	*
*  подтверждением завершения перехода персонажа.						*
*  Привязываем экипированные предметы           	 					*
*																		*
************************************************************************/	

void SmallPacket0x011(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    session->blowfish.status = BLOWFISH_ACCEPTED;

	PChar->health.tp = 0;

	for(uint8 i = 0; i < 16; ++i) 
	{
		if (PChar->equip[i] != 0) 
		{
			PChar->pushPacket(new CEquipPacket(PChar->equip[i], i));
		}
	}
	return;
}

/************************************************************************
*																		*
*  Перемещение персонажа (обновление позиции в зоне)					*
*  Обновление цели, выбранной персонажем, для правильного отображения	*
*  поворота головы. Из-за блуждания монстров необходимо проверять их 	*
*  видимость постоянно, так же как и видимость питомцев					*
*																		*
************************************************************************/

void SmallPacket0x015(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_SHUTDOWN &&
        PChar->status != STATUS_DISAPPEAR)
	{
		bool isUpdate = ( (PChar->status == STATUS_UPDATE) ||
						  (PChar->loc.p.x  != RBUFF(data,(0x04))) || 
						  (PChar->loc.p.z  != RBUFF(data,(0x0C))) ||
						  (PChar->m_TargID != RBUFW(data,(0x16))) );

		PChar->loc.p.x = RBUFF(data,(0x04));
		PChar->loc.p.y = RBUFF(data,(0x08));
		PChar->loc.p.z = RBUFF(data,(0x0C));

		PChar->loc.p.moving   = RBUFW(data,(0x12));
		PChar->loc.p.rotation = RBUFB(data,(0x14));

		PChar->m_TargID = RBUFW(data,(0x16));

		if (isUpdate)
		{
			PChar->status = STATUS_NORMAL;
            PChar->loc.zone->SpawnPCs(PChar);
			PChar->loc.zone->SpawnNPCs(PChar);
		}

		PChar->loc.zone->SpawnMOBs(PChar);
		PChar->loc.zone->SpawnPETs(PChar);

		if (PChar->PWideScanTarget != NULL)
		{
			PChar->pushPacket(new CWideScanTrackPacket(PChar->PWideScanTarget));

			if (PChar->PWideScanTarget->status == STATUS_DISAPPEAR)
			{
				PChar->PWideScanTarget = NULL;
			}
		}
	}
	return;
}

/************************************************************************
*																		*
*  Клиент запрашивает информацию об NPC, для отображения их в событиях	*
*																		*
************************************************************************/

void SmallPacket0x016(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 targid = RBUFW(data,(0x04));

	if (PChar->targid == targid)
	{
		PChar->pushPacket(new CCharPacket(PChar, ENTITY_SPAWN));
        PChar->pushPacket(new CCharUpdatePacket(PChar));
	}else{
		CBaseEntity* PNpc = PChar->loc.zone->GetEntity(targid, TYPE_NPC);

		if (PNpc == NULL)
		{
			PNpc = zoneutils::GetTrigger(targid, PChar->getZone());
		}
		PChar->pushPacket(new CEntityUpdatePacket(PNpc, ENTITY_SPAWN));
	}
	return;
}

/************************************************************************
*																		*
*  Kлиент сообщает серверу об ошибочном типе npc						*
*																		*
************************************************************************/

void SmallPacket0x017(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 targid = RBUFW(data,(0x04));
	uint32 npcid  = RBUFL(data,(0x08));
	uint8  type   = RBUFB(data,(0x12));

	ShowError(CL_RED"SmallPacket0x17: Incorrect NPC(%u,%u) type(%u)\n"CL_RESET, targid, npcid, type);
	return;
}

/************************************************************************
*																		*
*  Различные действия персонажа в игре: рыбалка, команды боя, общение	*
*  с npc и подобные														*
*																		*
************************************************************************/

void SmallPacket0x01A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 ID     = RBUFL(data,(0x04));
	uint16 TargID =	RBUFW(data,(0x08));
	uint8  action = RBUFB(data,(0x0A));

	switch (action) 
	{
		case 0x00: // trigger
		{
			if (PChar->m_Costum != 0 || PChar->animation == ANIMATION_SYNTH)
            {
                PChar->pushPacket(new CReleasePacket(PChar, RELEASE_STANDARD));
                return;
            }
            CBaseEntity* PNpc = zoneutils::GetZone(PChar->getZone() != 0 ? PChar->getZone() : PChar->loc.prevzone)->GetEntity(TargID, TYPE_NPC);

			if (PNpc != NULL)
			{
				if (luautils::OnTrigger(PChar, PNpc) == -1 && PNpc->animation == ANIMATION_CLOSE_DOOR)
				{
					PNpc->animation = ANIMATION_OPEN_DOOR;
					PChar->loc.zone->PushPacket(PNpc, CHAR_INRANGE, new CEntityUpdatePacket(PNpc,ENTITY_UPDATE)); 
					CTaskMgr::getInstance()->AddTask(new CTaskMgr::CTask("close_door", gettick()+7000, PNpc, CTaskMgr::TASK_ONCE, close_door));
				}
			}
			if(PChar->m_event.EventID == -1) 
			{
				PChar->m_event.reset();
				PChar->pushPacket(new CReleasePacket(PChar, RELEASE_STANDARD));
			}
		}
		break;	
		case 0x02: // attack
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_ENGAGE, TargID);
            
            if (PChar->PBattleAI->GetCurrentAction() == ACTION_ENGAGE)
            {
                if (PChar->animation == ANIMATION_CHOCOBO)
                {
                    PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CHOCOBO);
                }
                PChar->PBattleAI->CheckCurrentAction(gettick());
            }
		}
		break;	
		case 0x03: // spellcast
		{
			uint16 SpellID = RBUFW(data,(0x0C));

			PChar->PBattleAI->SetCurrentSpell(SpellID);
			PChar->PBattleAI->SetCurrentAction(ACTION_MAGIC_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x04: // disengage
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_DISENGAGE);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;	
		case 0x05: // call for help
		{
			for (SpawnIDList_t::iterator it = PChar->SpawnMOBList.begin(); it != PChar->SpawnMOBList.end(); ++it)
			{
				CMobEntity* MOB = (CMobEntity*)it->second;

				if (MOB->animation == ANIMATION_ATTACK &&
					MOB->PBattleAI->GetBattleTarget() == PChar)
				{
					MOB->m_CallForHelp = 0x20;
					PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageBasicPacket(PChar,PChar,0,0,19));
					break;
				}
			}
			PChar->pushPacket(new CMessageBasicPacket(PChar,PChar,0,0,22));
		}
		break;
		case 0x07: // weaponskill
		{
			uint16 WSkillID = RBUFW(data,(0x0C));
			PChar->PBattleAI->SetCurrentWeaponSkill(WSkillID);
			PChar->PBattleAI->SetCurrentAction(ACTION_WEAPONSKILL_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}	
		break;	
		case 0x09: // jobability
		{
			uint16 JobAbilityID = RBUFW(data,(0x0C));
			PChar->PBattleAI->SetCurrentJobAbility(JobAbilityID-16);
			PChar->PBattleAI->SetCurrentAction(ACTION_JOBABILITY_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x0B: // homepoint
		{
			PChar->health.hp = PChar->GetMaxHP();
            PChar->health.mp = PChar->GetMaxMP();

			PChar->loc.boundary = 0;
			PChar->loc.p = PChar->profile.home_point.p;
            PChar->loc.destination = PChar->profile.home_point.destination;

			PChar->status = STATUS_DISAPPEAR;
			PChar->animation = ANIMATION_NONE;

			PChar->clearPacketList();
			PChar->pushPacket(new CServerIPPacket(PChar,2));
		}		
		break;
		case 0x0C: break;	// assist
		case 0x0D: 	// raise menu
	    {
			if(RBUFB(data,(0x0C)) == 0) //ACCEPTED RAISE
            {
				PChar->PBattleAI->SetCurrentAction(ACTION_RAISE_MENU_SELECTION);
				PChar->PBattleAI->CheckCurrentAction(gettick());
			}
            PChar->m_hasRaise = 0;
	    } 
        break;
		case 0x0E: // рыбалка
		{
			fishingutils::StartFishing(PChar);
		}
		break;
		case 0x0F: // смена цели во время боя
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_CHANGE_TARGET, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x10: // rangedattack
		{
			PChar->PBattleAI->SetCurrentAction(ACTION_RANGED_START, TargID);
			PChar->PBattleAI->CheckCurrentAction(gettick());
		}
		break;
		case 0x11: // chocobo digging
		{
			// bunch of gysahl greens
			uint8 slotID = PChar->getStorage(LOC_INVENTORY)->SearchItem(4545);

			if (slotID != ERROR_SLOTID)
			{
				charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -1);

				PChar->pushPacket(new CInventoryFinishPacket());
				PChar->pushPacket(new CChocoboDiggingPacket(PChar));
			}else{
				// You don't have any gysahl greens
				PChar->pushPacket(new CMessageSystemPacket(4545,0,39));			
			}
		}
		break;	
		case 0x12: 	// dismount
        {
            PChar->status = STATUS_UPDATE;
			PChar->animation = ANIMATION_NONE;
			PChar->StatusEffectContainer->DelStatusEffect(EFFECT_CHOCOBO);
			PChar->pushPacket(new CCharUpdatePacket(PChar));
        }
        break;
		case 0x13: // tractor menu
		{
                // по любому, это работает неправильно. проблемный код в комментарии

			    //PChar->PBattleAI->SetCurrentAction(ACTION_RAISE_MENU_SELECTION);
			    //PChar->PBattleAI->CheckCurrentAction(gettick());
			
			/*
			if(RBUFB(data,(0x0C)) == 0)
			{   
				PChar->status = STATUS_DISAPPEAR;
				PChar->loc.p  = PChar->m_StartActionPos;

				PChar->loc.boundary = 0;
				PChar->clearPacketList();
				PChar->pushPacket(new CServerIPPacket(PChar,2));
			}else{
				PChar->m_hasTractor = 0;
			}
			*/
		}
		break;	
		case 0x14: // окончание обновления данных персонажа
		{
			if (PChar->getZone() == 0)
			{
				zoneutils::GetZone(PChar->loc.prevzone)->SpawnMoogle(PChar);
			}else{
				PChar->loc.zone->SpawnPCs(PChar);
				PChar->loc.zone->SpawnNPCs(PChar);
				PChar->loc.zone->SpawnMOBs(PChar);
			}
		}
		break;
        case 0x15: break; // ballista - quarry
        case 0x16: break; // ballista - sprint
		case 0x18: // /blockaid
		{
			// Blockaid is currently inactive
			PChar->pushPacket(new CMessageSystemPacket(0,0,224));
		}
		break;
		default:
		{
			ShowWarning(CL_YELLOW"CLIENT PERFORMING UNHANDLED ACTION %02hX\n"CL_RESET, action);
			return;
		}
		break;
	}
	ShowDebug(CL_CYAN"CLIENT %s PERFORMING ACTION %02hX\n"CL_RESET, PChar->GetName(),action);
	return;
} 

/************************************************************************
*                                                                       *
*  Генерация World Pass                                                 *
*                                                                       *
************************************************************************/

void SmallPacket0x01B(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    // 0 - world pass, 2 - gold world pass; +1 - purchase

    PChar->pushPacket(new CWorldPassPacket(RBUFB(data,(0x04)) & 1 ? rand() % 9999999999 : 0));
    return;
} 

/************************************************************************
*																		*
*  Назначение пакета неизвестно, но начинает появляться при				*
*  использовании способностей, если у персонажа есть питомец. Возможно	*
*  клиент требует недостающие пакеты.									*
*																		*
************************************************************************/

void SmallPacket0x01C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);
	return;
} 

/************************************************************************
*																		*
*  Удаление предметов из хранилищ										*
*																		*
************************************************************************/

void SmallPacket0x028(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	int32 quantity = RBUFB(data,(0x04));
	uint8  slotID  = RBUFB(data,(0x09));
	
    CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

    if (PItem != NULL && !(PItem->getSubType() & ITEM_LOCKED))
    {
        uint16 ItemID = PItem->getID();

	    if (charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -quantity) != 0) 
	    {
            // TODO: сломать linkshell, если раковина была выброшена

		    PChar->pushPacket(new CMessageStandardPacket(NULL, ItemID, quantity, 180));
            PChar->pushPacket(new CInventoryFinishPacket());
	    }
        return;
    }
    ShowWarning(CL_YELLOW"SmallPacket0x028: Attempt of removal NULL or LOCKED item from slot %u\n"CL_RESET, slotID);
	return;
}

/************************************************************************
*																		*
*  Перемещение предметов между хранилищами								*
*																		*
************************************************************************/

void SmallPacket0x029(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 quantity       = RBUFB(data,(0x04));
	uint8  FromLocationID = RBUFB(data,(0x08));
	uint8  ToLocationID   = RBUFB(data,(0x09));
	uint8  FromSlotID	  = RBUFB(data,(0x0A));
	uint8  ToSlotID		  = RBUFB(data,(0x0B));

    if (ToLocationID   >= MAX_CONTAINER_ID ||
        FromLocationID >= MAX_CONTAINER_ID)
        return;

	CItem* PItem = PChar->getStorage(FromLocationID)->GetItem(FromSlotID);

    if(PItem == NULL || (PItem->getSubType() & ITEM_LOCKED))
	{
		if(PItem==NULL){
			ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move NULL item from location %u slot %u to location %u slot %u of quan %u \n"CL_RESET, FromLocationID, FromSlotID, ToLocationID, ToSlotID,quantity);
		}
		else{
			ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move LOCKED item %i from location %u slot %u to location %u slot %u of quan %u \n"CL_RESET, PItem->getID(),FromLocationID, FromSlotID, ToLocationID, ToSlotID,quantity);
		}
		return;
	}
	if(PItem->getQuantity() < quantity) 
	{
		ShowWarning(CL_YELLOW"SmallPacket0x29: Trying to move too much quantity from location %u slot %u\n"CL_RESET, FromLocationID, FromSlotID);
		return;
	}

	uint32 NewQuantity = PItem->getQuantity() - quantity;

	if(NewQuantity != 0) // делим пачку
	{
		if (charutils::AddItem(PChar, ToLocationID, PItem->getID(), quantity) != ERROR_SLOTID) 
		{
			charutils::UpdateItem(PChar, FromLocationID, FromSlotID, -(int32)quantity);
		}
	}
    else // переносим всю пачку, или пытаемся объединить одинаковые предметы
    {
		if (ToSlotID < 82) // 80 + 1
		{
			// объединение еще не реализовано
			ShowDebug("SmallPacket0x29: Trying to unite items\n", FromLocationID, FromSlotID);
			return;
		}

		uint8 NewSlotID = PChar->getStorage(ToLocationID)->InsertItem(PItem);

		if(NewSlotID != ERROR_SLOTID) 
		{
			const int8* Query = "UPDATE char_inventory \
								 SET location = %u, slot = %u \
								 WHERE charid = %u AND location = %u AND slot = %u;";

			if( Sql_Query(SqlHandle, Query, ToLocationID, NewSlotID, PChar->id, FromLocationID, FromSlotID) != SQL_ERROR &&
				Sql_AffectedRows(SqlHandle) != 0)
			{
				PChar->getStorage(FromLocationID)->InsertItem(NULL, FromSlotID);

				PChar->pushPacket(new CInventoryItemPacket(NULL, FromLocationID, FromSlotID));	// убираем предмет из FormLocationID
				PChar->pushPacket(new CInventoryItemPacket(PItem, ToLocationID, NewSlotID));		// добавляем предмет в ToLocationID
			}
            else // в случае ошибки отменяем перемещение предмета
            {
                PChar->getStorage(ToLocationID)->InsertItem(NULL, NewSlotID);       // убираем предмет 
                PChar->getStorage(FromLocationID)->InsertItem(PItem, FromSlotID);   // возвращаем предмет (для обновления Location и Slot предмета)
            }
		}
        else
        {
            // клиент не позволяет перемещать предмет в полный контейнер. 
            // если мы видим это сообщение, значит данные клиента и сервера различаются
			// Client thinks that ToLocationID is NOT full, so lets send those packets again and tell them it is!
			uint8 size = PChar->getStorage(ToLocationID)->GetSize();
			for(uint8 slotID = 0; slotID <= size; ++slotID) 
			{
				CItem* PItem = PChar->getStorage(ToLocationID)->GetItem(slotID);
				if(PItem != NULL) 
				{
					PChar->pushPacket(new CInventoryItemPacket(PItem, ToLocationID, slotID));		
				}
			}
			PChar->pushPacket(new CInventoryFinishPacket());

			ShowError(CL_RED"SmallPacket0x29: Location %u Slot %u is full\n"CL_RESET, ToLocationID,ToSlotID);
			return;
		}
	}
	PChar->pushPacket(new CInventoryFinishPacket());
	return;
}

/************************************************************************
*                                                                       *
*  Запрос начала обмена между персонажами (trade)                       *
*                                                                       *
************************************************************************/

void SmallPacket0x032(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    uint32 charid = RBUFL(data,(0x04));
    uint16 targid = RBUFW(data,(0x08));

    CCharEntity* PTarget = (CCharEntity*)PChar->loc.zone->GetEntity(targid, TYPE_PC);

    if ((PTarget != NULL) && (PTarget->id == charid))
    {
        if (PTarget->TradePending.id == PChar->id)
        {
            ShowDebug(CL_CYAN"You have already sent a trade request to %s\n"CL_RESET, PTarget->GetName());
            return;
        }
        if (!PTarget->UContainer->IsContainerEmpty())
        {
            ShowDebug(CL_CYAN"You cannot trade with %s at this time\n"CL_RESET, PTarget->GetName());
            return;
        }
        PChar->TradePending.id     = charid;
        PChar->TradePending.targid = targid;

        PTarget->TradePending.id     = PChar->id;
        PTarget->TradePending.targid = PChar->targid;
        PTarget->pushPacket(new CTradeRequestPacket(PChar));
    }
    return;
}

/************************************************************************
*                                                                       *
*  Запрос начала обмена между персонажами (trade)                       *
*                                                                       *
************************************************************************/

void SmallPacket0x033(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    CCharEntity* PTarget = (CCharEntity*)PChar->loc.zone->GetEntity(PChar->TradePending.targid, TYPE_PC);

    if (PTarget != NULL && PChar->TradePending.id == PTarget->id)
    {
        uint16 action = RBUFB(data,(0x04));

        switch (action)
        {
            case 0x00: // request accepted
            {
                // цели обмена у персонажей соответствующие
                if (PChar->TradePending.id == PTarget->id && PTarget->TradePending.id == PChar->id)
                {
                    // контейнеры у персонажей свободны
                    if (PChar->UContainer->IsContainerEmpty() && PTarget->UContainer->IsContainerEmpty())
                    {
                        // между персонажами соответствующая дистанция
                        if (distance(PChar->loc.p, PTarget->loc.p) < 6)
                        {
                            PChar->UContainer->SetType(UCONTAINER_TRADE);
                            PChar->pushPacket(new CTradeActionPacket(PTarget, action));

                            PTarget->UContainer->SetType(UCONTAINER_TRADE);
                            PTarget->pushPacket(new CTradeActionPacket(PChar, action));
                            return;
                        }
                    }
                    PChar->TradePending.clean();
                    PTarget->TradePending.clean();

                    ShowDebug(CL_CYAN"Trade: UContainer is not empty\n"CL_RESET);
                }
            }
            break;
            case 0x01: // trade cancelled
            {
                // цели обмена у персонажей соответствующие
                if (PChar->TradePending.id == PTarget->id && PTarget->TradePending.id == PChar->id)
                {
                    // контейнер у цели зарезервирован для обмена
                    if (PTarget->UContainer->GetType() == UCONTAINER_TRADE)
                    {
                        PTarget->TradePending.clean();
                        PTarget->UContainer->Clean();

                        PTarget->pushPacket(new CTradeActionPacket(PChar, action));
                    }
                } 
                if (PChar->UContainer->GetType() == UCONTAINER_TRADE)
                {                    
                    PChar->UContainer->Clean();
                }
                PChar->TradePending.clean();
            }
            break;
            case 0x02: // trade accepted
            {
                // цели обмена у персонажей соответствующие
                if (PChar->TradePending.id == PTarget->id && PTarget->TradePending.id == PChar->id)
                {
                    PChar->UContainer->SetLock();
                    PTarget->pushPacket(new CTradeActionPacket(PChar, action));

                    // совершаем обмен предметами в контейнерах персонажей
                    if (PTarget->UContainer->IsLocked())
                    {
                        if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() < PTarget->UContainer->GetItemsCount() ||
                            PTarget->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() < PChar->UContainer->GetItemsCount())
                        {
                            // обмен не состоялся, недостаточно места в контейнере одного или обоих персонажей
                            PChar->pushPacket(new CTradeActionPacket(PTarget, 1));
                            PTarget->pushPacket(new CTradeActionPacket(PChar, 1));
                        }
                        else
                        {
                            for (uint8 slotid = 0; slotid <= 8; ++slotid)
                            {
                                CItem* PItem = PTarget->UContainer->GetItem(slotid);

                                if (PItem != NULL)
                                {
                                    if (PItem->getStackSize() == 1)
                                    {
                                        charutils::AddItem(PChar, LOC_INVENTORY, itemutils::GetItem(PItem));
                                    } else {
                                        charutils::AddItem(PChar, LOC_INVENTORY, PItem->getID(), PItem->getReserve());
                                    }
                                    charutils::UpdateItem(PTarget, LOC_INVENTORY, PItem->getSlotID(), -PItem->getReserve());
                                }
                            }
                            PTarget->pushPacket(new CTradeActionPacket(PChar, 9));

                            // абсолютная копия метода. пока не знаю, где реализовать функцию

                            for (uint8 slotid = 0; slotid <= 8; ++slotid)
                            {
                                CItem* PItem = PChar->UContainer->GetItem(slotid);

                                if (PItem != NULL)
                                {
                                    if (PItem->getStackSize() == 1)
                                    {
                                        charutils::AddItem(PTarget, LOC_INVENTORY, itemutils::GetItem(PItem));
                                    } else {
                                        charutils::AddItem(PTarget, LOC_INVENTORY, PItem->getID(), PItem->getReserve());
                                    }
                                    charutils::UpdateItem(PChar, LOC_INVENTORY, PItem->getSlotID(), -PItem->getReserve());
                                }
                            }
                            PChar->pushPacket(new CTradeActionPacket(PTarget, 9));
                        }
                        PChar->TradePending.clean();
                        PChar->UContainer->Clean();

                        PTarget->TradePending.clean();
                        PTarget->UContainer->Clean();
                    }
                }
            }
            break;
        }
    }
    return;
}

/************************************************************************
*                                                                       *
*  Заполняем ячейки окошка trade (обмен между персонажами)              *
*                                                                       *
************************************************************************/

void SmallPacket0x034(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    uint32 quantity    = RBUFL(data,(0x04));
    uint16 itemID      = RBUFW(data,(0x08));
    uint8  invSlotID   = RBUFB(data,(0x0A)); 
    uint8  tradeSlotID = RBUFB(data,(0x0B));

    CCharEntity* PTarget = (CCharEntity*)PChar->loc.zone->GetEntity(PChar->TradePending.targid, TYPE_PC);

    if (PTarget != NULL && PTarget->id == PChar->TradePending.id)
    {
        CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID);

        // обмен редкими предметами временно недоступен
        if (PItem != NULL && PItem->getID() == itemID && !(PItem->getFlag() & ITEM_FLAG_RARE))
        {
            // если количество предметов равно нулю, то удаляем предмет из контейнера
            PItem->setReserve(quantity);
            PChar->UContainer->SetItem(tradeSlotID, quantity > 0 ? PItem : NULL);

            PChar->pushPacket(new CTradeItemPacket(PItem, tradeSlotID));
            PTarget->pushPacket(new CTradeUpdatePacket(PItem, tradeSlotID));
        }
    }
    return;
}

/************************************************************************
*																		*
*  Передача предметов NPC (команда обмен - "trade")						*
*																		*
************************************************************************/

void SmallPacket0x036(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 npcid  = RBUFL(data,(0x04));
	uint16 targid = RBUFW(data,(0x3A));

	CBaseEntity* PNpc = PChar->loc.zone->GetEntity(targid, TYPE_NPC);

	if ((PNpc != NULL) && (PNpc->id == npcid))
	{
        uint8 numItems = RBUFB(data,(0x3C));

	    PChar->Container->Clean();

	    for(int32 slotID = 0; slotID < numItems; ++slotID) 
	    {
		    uint8  invSlotID = RBUFB(data,(0x30+slotID));
		    uint32 Quantity  = RBUFL(data,(0x08+slotID*4));
						
		    CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(invSlotID);

            if (PItem != NULL && PItem->getQuantity() >= Quantity)
		    {
			    PChar->Container->setItem(slotID, PItem->getID(), invSlotID, Quantity);
		    }
	    }
		luautils::OnTrade(PChar, PNpc);
	}				
	return;
}

/************************************************************************
*																		*
*  Использование предметов												*
*																		*
************************************************************************/

void SmallPacket0x037(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 EntityID = RBUFL(data,(0x04));
	uint16 TargetID = RBUFW(data,(0x0C));
	uint8  SlotID   = RBUFB(data,(0x0E));

	CItemUsable* PItem = (CItemUsable*)PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

	if ((PItem != NULL) && 
		(PItem->getType() & ITEM_USABLE))
	{
		if (PItem->getType() & ITEM_ARMOR)
		{
			//TODO: если ITEM_LOCKED, то должна быть проверка на то, что предмет экипирован
		}
		else if (PItem->getSubType() & ITEM_LOCKED)
		{
			return;
		}
		if (PChar->UContainer->GetType() == UCONTAINER_EMPTY)
		{
			PChar->UContainer->SetType(UCONTAINER_USEITEM);
			PChar->UContainer->SetItem(0, PItem);

			PChar->PBattleAI->SetCurrentAction(ACTION_ITEM_START, TargetID);

			if (PChar->PBattleAI->GetCurrentAction() != ACTION_ITEM_START)
			{
				PChar->UContainer->Clean();
                return;
			}
            PChar->PBattleAI->CheckCurrentAction(gettick());
		}
	}
	return;
}

/************************************************************************
*																		*
*  Сортировка инвентаря													*
*  Жестокий алгоритм, но лучшего для неупорядоченного массива не найдем	*
*  80 - ячеек. Минимальное количество проверок - 80, максимальное 3240	*
*																		*
************************************************************************/

void SmallPacket0x03A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	CItemContainer* PItemContainer = PChar->getStorage(RBUFB(data,(0x04)));

	uint8 size = PItemContainer->GetSize();

    if (gettick() - PItemContainer->LastSortingTime < 1000)
    {
        if (map_config.lightluggage_block == ++PItemContainer->SortingPacket)
        {
            ShowWarning(CL_YELLOW"lightluggage detected: <%s> will be removed from server\n"CL_RESET, PChar->GetName());

            PChar->status = STATUS_SHUTDOWN;
            PChar->pushPacket(new CServerIPPacket(PChar,1));
        }
        return;
    }
    else
    {
        PItemContainer->SortingPacket = 0;
        PItemContainer->LastSortingTime = gettick();
    }
    for (uint8 slotID = 1; slotID <= size; ++slotID) 
    {
        CItem* PItem = PItemContainer->GetItem(slotID);

        if ((PItem != NULL) && 
            (PItem->getQuantity() < PItem->getStackSize()) &&
           !(PItem->getSubType() & ITEM_LOCKED))
        {
            for (uint8 slotID2 = slotID+1; slotID2 <= size; ++slotID2) 
            {
                CItem* PItem2 = PItemContainer->GetItem(slotID2);

                if ((PItem2 != NULL) &&  
                    (PItem2->getID() == PItem->getID()) &&
                    (PItem2->getQuantity() < PItem2->getStackSize()) &&
                   !(PItem2->getSubType() & ITEM_LOCKED)) 
                {
                    uint32 totalQty = PItem->getQuantity() + PItem2->getQuantity();
                    uint32 moveQty  = 0;

                    if (totalQty >= PItem->getStackSize()) {
                        moveQty = PItem->getStackSize() - PItem->getQuantity();
                    } else {
                        moveQty = PItem2->getQuantity();
                    }
                    if(moveQty > 0) 
                    {
						charutils::UpdateItem(PChar, PItemContainer->GetID(), slotID, moveQty);
                        charutils::UpdateItem(PChar, PItemContainer->GetID(), slotID2, -(int32)moveQty);								
                    }
                }
            }
        }
    }
    PChar->pushPacket(new CInventoryFinishPacket());
	return;
}

/************************************************************************
*																		*
*  Вероятно сообщение о недополучении каких-либо инициализирующих		*
*  пакетов для монстров, npc или других игроков. всегда пустое.			*
*																		*
************************************************************************/

void SmallPacket0x03C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	ShowWarning(CL_YELLOW"SmallPacket0x03C\n"CL_RESET);
	return;
}

/************************************************************************
*																		*
*  Персонаж голосует за предмет в TreasurePool							*
*																		*
************************************************************************/					

void SmallPacket0x041(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);
	
    uint8 SlotID  = RBUFB(data,(0x04));

	PChar->PTreasurePool->LotItem(PChar, SlotID, 1+(rand()%999)); //1 ~ 998+1
	return;
}

/************************************************************************
*																		*
*  Персонаж отказывается от предмета в TreasurePool						*
*																		*
************************************************************************/					

void SmallPacket0x042(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);

	uint8 SlotID  = RBUFB(data,(0x04));

	PChar->PTreasurePool->LotItem(PChar, SlotID, 0);
	return;
}

/************************************************************************
*																		*
*  Отправляем приветственное сообщение сервера.							*
*  По умолчанию появится сообщение <<< Welcome to "server name" >>> +	*
*  можно отправить дополнительные строки информации в размере 230 байт	*
*																		*
************************************************************************/					

void SmallPacket0x04B(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    PChar->pushPacket(new CServerMessagePacket(map_config.server_message));
	return;
}

/************************************************************************
*																		*
*  Все действия с Delivery Box											*
*																		*
************************************************************************/					

void SmallPacket0x04D(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8 action  = RBUFB(data,(0x04));
	uint8 boxtype = RBUFB(data,(0x05));
	uint8 slotID  = RBUFB(data,(0x06));

    ShowDebug(CL_CYAN"DeliveryBox Action (%02hx)\n"CL_RESET, RBUFB(data,(0x04)));
    PrintPacket(data);

	// 0x01 - отправка клиенту старых предметов
	// 0x02 - добавление предметов в список отправляемых (подготовка к отправке)
	// 0x03 - подтверждение отправки (отправляем предметы)
	// 0x04 - возврат неправильно отправленного предмета (отмена выполненной отправки)
	// 0x05 - отправка клиенту количества новых предметов
	// 0x06 - отправка клиенту новых предметов
	// 0x07 -
	// 0x08 - обновление предмета в ячейке перед удалением
	// 0x09 - вернуть предмет отправителю
    // 0x0a - взять предмет из ячейки
	// 0x0b - удаление предмета из ячейки
	// 0x0c - подтверждение введенного имени в окне отправки
	// 0x0d - открытие окна отправки почты
	// 0x0e - открытие окна приема почты
	// 0x0f - закрытие окна почты

	switch (action)
	{
		case 0x01:
		{
			// отправляем персонажу старые предметы (предметы, которые персонаж уже видел в delivery box)
			// все старые предметы расположены в ячейках 0-7

            PChar->UContainer->Clean();
            PChar->UContainer->SetType(UCONTAINER_DELIVERYBOX);

			const int8* fmtQuery = "SELECT itemid, itemsubid, slot, quantity, sender \
                                    FROM delivery_box \
							        WHERE charid = %u \
							        ORDER BY slot \
							        LIMIT 8";

	        int32 ret = Sql_Query(SqlHandle, fmtQuery, PChar->id);

	        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0)
	        {
                uint8 slotid    = 8;
                uint8 old_items = 0;

		        while(Sql_NextRow(SqlHandle) == SQL_SUCCESS) 
		        {
                    CItem* PItem = itemutils::GetItem(Sql_GetIntData(SqlHandle,0));

                    PItem->setSubID(Sql_GetIntData(SqlHandle,1));
                    PItem->setSlotID(Sql_GetIntData(SqlHandle,2));
                    PItem->setQuantity(Sql_GetUIntData(SqlHandle,3));
                    PItem->setSender(Sql_GetData(SqlHandle,4));

                    if (PItem->getSlotID() < 8)
                    {
                        old_items++;
                        PChar->UContainer->SetItem(PItem->getSlotID(), PItem);
                        continue;
                    }
                    PChar->UContainer->SetItem(slotid++, PItem);
		        }
                for (uint8 i = 0; i < 8; ++i)
                {
                    if (!PChar->UContainer->IsSlotEmpty(i))
                    {
                        PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(i), old_items));
                    }
                }
	        }
            return;
		}
		case 0x05:
		{
			// отправляем персонажу количество новых предметов (предметы, которые персонаж еще не видел в delivery box)
			// все новые предметы помещаются в контейнет начиная со значения 8
			// перемещаем новые предметы в свободные ячейки delivery box
			
            if (PChar->UContainer->GetType() != UCONTAINER_DELIVERYBOX) return;
 
            uint8 new_items = 0;
            
            for (uint8 slotid = 8; slotid < 16; ++slotid)
		    {
                if (PChar->UContainer->IsSlotEmpty(slotid)) break;

                CItem* PItem = PChar->UContainer->GetItem(slotid);

                for (uint8 i = 0; i < 8 ; ++i)
                {
                    if (PChar->UContainer->IsSlotEmpty(i))
                    {
                        int32 ret = Sql_Query(SqlHandle, "UPDATE delivery_box SET slot = %u WHERE charid = %u AND slot = %u", i, PChar->id, PItem->getSlotID());

                        if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) != 0)
                        {
                            PItem->setSlotID(i);
                            PChar->UContainer->SetItem(i, PItem);
                            PChar->UContainer->SetItem(slotid, NULL);
                            new_items++;
                        }
                        break;
                    }
                }
			}
			PChar->pushPacket(new CDeliveryBoxPacket(action, new_items));
			return;
		}
		case 0x06:
		case 0x08:
		{
			// 0x08 и 0x06 идентичны
			//
			// 0х06 - добавляем предмет в определенную ячейку
			// 0х08 - обновляем предмет в определенной ячейке

			// отправляем персонажу все новые предметы (предметы, которые персонаж еще не видел в delivery box)
			// клиент отправляет запрос серверу для каждого нового предмета, при этом указывая, какая ячейка его интересует
			//
			// сервер должен отправлять два пакета с действием 0х06
			// у первого пакета data[0x0c] равняется 0x02, у второго 0x01, в остальном заголовок идентичен
			// возможно это связано с тем, что я сам отправлял себе предметы
			//
			// 0x4b 0x2c 0x00 0x00 0x06 0x01 0x01 0x01 0xff 0xff 0xff 0xff 0x02 0x01 0xff 0xff
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			// 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
			//
			// зачем нужен этот пустой пакет я не знаю, но и без него все отлично работает
			// предположительно он отчищает целевую ячейку от предметов, на всякий случай

            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
               !PChar->UContainer->IsSlotEmpty(slotID))
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(slotID), 1));
            }
			return;
		}
        case 0x09:
        {
            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
               !PChar->UContainer->IsSlotEmpty(slotID))
            {
                PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(slotID), 1));
            }
			return;
        }
        case 0x0A:
        {
            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
               !PChar->UContainer->IsSlotEmpty(slotID))
            {
                CItem* PItem = PChar->UContainer->GetItem(slotID);

                ShowMessage("FreeSlots %u\n", PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount());
                ShowMessage("ItemType %u", PItem->getType());

                if (PItem->getType() != ITEM_CURRENCY &&
                    PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() == 0)
                {
                    PChar->pushPacket(new CDeliveryBoxPacket(action, PItem, PChar->UContainer->GetItemsCount(), 0xB9));
                    return;
                }
                int32 ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND slot = %u LIMIT 1", PChar->id, slotID);

                if (ret != SQL_ERROR &&  Sql_AffectedRows(SqlHandle) != 0)
                {
                    charutils::AddItem(PChar, LOC_INVENTORY, PItem->getID(), PItem->getQuantity());
                   
                    PChar->UContainer->SetItem(slotID, NULL);

                    PChar->pushPacket(new CDeliveryBoxPacket(action, PItem, PChar->UContainer->GetItemsCount()));
                    PChar->pushPacket(new CInventoryFinishPacket());
                    delete PItem;
                }
            }
			return;
        }
		case 0x0B:
		{
            // удаление предмета из ячейки

            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX &&
               !PChar->UContainer->IsSlotEmpty(slotID))
            {
                int32 ret = Sql_Query(SqlHandle, "DELETE FROM delivery_box WHERE charid = %u AND slot = %u LIMIT 1", PChar->id, slotID);

                if (ret != SQL_ERROR && Sql_AffectedRows(SqlHandle) != 0)
                {
                    CItem* PItem = PChar->UContainer->GetItem(slotID);
                    PChar->UContainer->SetItem(slotID, NULL);

                    PChar->pushPacket(new CDeliveryBoxPacket(action, PChar->UContainer->GetItem(slotID), PChar->UContainer->GetItemsCount()));
                    delete PItem;
                }
            }
			return;
		}
        case 0x0F:
        {
            if (PChar->UContainer->GetType() == UCONTAINER_DELIVERYBOX)
            {
                PChar->UContainer->Clean();
            }
        }
        break;
	}
	
	// отправка простых действий - открыть окно почты, закрыть окно почты

	PChar->pushPacket(new CDeliveryBoxPacket(action, 0));
	return;
}

/************************************************************************
*																		*
*  Все действия с Auction House                                         *
*																		*
************************************************************************/					

void SmallPacket0x04E(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8  action   = RBUFB(data,(0x04));
    uint8  slotid   = RBUFB(data,(0x05));
    uint32 price    = RBUFL(data,(0x08));
    uint8  slot     = RBUFB(data,(0x0C));
    uint16 itemid   = RBUFW(data,(0x0E));
    uint8  quantity = RBUFB(data,(0x10));

    ShowDebug(CL_CYAN"AH Action (%02hx)\n"CL_RESET, RBUFB(data,(0x04)));

    // 0x04 - продажа предмета
    // 0x05 - похоже, что в ответ на этот пакет мы можем открыть список продаж или предложить персонажу подождать немного
    // 0x0A - получение списка продаваемых персонажем предметов
    // 0x0B - подтверждение покупки
    // 0x0E - покупка предмета
    // 0x0С - отмена продажи
    // 0x0D - обновление списка продаваемых персонажем предметов

    switch(action) 
    {	
        case 0x04:
        { 
            CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slot);

            if ((PItem != NULL) && 
                (PItem->getID() == itemid) &&
               !(PItem->getSubType() & ITEM_LOCKED) &&
               !(PItem->getFlag() & ITEM_FLAG_NOAUCTION))
            {
                PItem->setCharPrice(price);
                PChar->pushPacket(new CAuctionHousePacket(action, PItem, quantity));
            }
		} 
        break;
        case 0x05: 
        { 
            // TODO: необходим таймер последного запроса статуса продаж; открывать список не чаще раза в 5 секунд

            PChar->pushPacket(new CAuctionHousePacket(action));
		} 
        break;
        case 0x0A: 
        { 
            // TODO: в идеале, хорошо было бы загружать продаваемые предметы в универсальный контейнер персонажа
            
            // ограничение клиента игры на 7 одновременно продаваемых предмета

            for (int8 slot = 0; slot < 5; ++slot)
            {
                PChar->pushPacket(new CAuctionHousePacket(0x0C, slot));
            }
		}
        break;
		case 0x0B: 
        {
            CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slot);

            if ((PItem != NULL) && 
               !(PItem->getSubType() & ITEM_LOCKED) &&
               !(PItem->getFlag() & ITEM_FLAG_NOAUCTION))
            {
                if (quantity == 0 &&
                   (PItem->getStackSize() == 1 ||
                    PItem->getStackSize() != PItem->getQuantity()))
                {
                    ShowError(CL_RED"SmallPacket0x04E::AuctionHouse: Incorrect quantity of item\n"CL_RESET);
                    return;
                }

                const int8* fmtQuery = "INSERT INTO auction_house(itemid, stack, seller, seller_name, date, price) \
									    VALUES(%u,%u,%u,'%s',%u,%u)";

			    if (Sql_Query(SqlHandle, 
                              fmtQuery,
                              PItem->getID(),
                              quantity == 0,
                              PChar->id,
                              PChar->GetName(),
                              CVanaTime::getInstance()->getSysTime(),
                              price) == SQL_ERROR)
			    {
				    ShowError(CL_RED"SmallPacket0x04E::AuctionHouse: Cannot insert item to database\n"CL_RESET);
				    return;
			    }
                charutils::UpdateItem(PChar, LOC_INVENTORY, slot, -(int32)(quantity != 0 ? 1 : PItem->getStackSize()));
            }
		} 
        break;
		case 0x0E: 
        {
            itemid = RBUFW(data,(0x0C));

            if (PChar->getStorage(LOC_INVENTORY)->GetFreeSlotsCount() == 0)
            {
                PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, 0, 0));
            }
            else
            {
                CItem* PItem = itemutils::GetItemPointer(itemid);

                if (PItem != NULL)
                {
                    if (PItem->getFlag() & ITEM_FLAG_RARE)
                    {
                        for (uint8 LocID = 0; LocID < MAX_CONTAINER_ID; ++LocID)
			            {
				            if (PChar->getStorage(LocID)->SearchItem(itemid) != ERROR_SLOTID)
				            {
					            PChar->pushPacket(new CAuctionHousePacket(action, 0xE5, 0, 0));           
					            return;
				            }
			            }
                    }
                    CItem* gil  = PChar->getStorage(LOC_INVENTORY)->GetItem(0);
	
	                if (gil != NULL && 
                        gil->getType() & ITEM_CURRENCY &&
                        gil->getQuantity() >= price)
	                {
                        const int8* fmtQuery = "UPDATE auction_house \
                                                SET buyer_name = '%s', sale = %u, sell_date = %u \
                                                WHERE itemid = %u AND buyer_name IS NULL AND stack = %u AND price <= %u \
                                                ORDER BY price \
                                                LIMIT 1";

                        if (Sql_Query(SqlHandle, 
                                      fmtQuery, 
                                      PChar->GetName(), 
                                      price, 
                                      CVanaTime::getInstance()->getSysTime(),
                                      itemid,
                                      quantity == 0,
                                      price) != SQL_ERROR &&
                            Sql_AffectedRows(SqlHandle) != 0)
                        {
                            uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, itemid, (quantity == 0 ? PItem->getStackSize() : 1));

			                if (SlotID != ERROR_SLOTID)
			                {
				                charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -(int32)(price));

                                PChar->pushPacket(new CAuctionHousePacket(action, 0x01, itemid, price));
				                PChar->pushPacket(new CInventoryFinishPacket());
                            }
                            return;
                        }
                    }
                }
                PChar->pushPacket(new CAuctionHousePacket(action, 0xC5, itemid, price));
            }
        } 
        break;
        case 0x0C: 
        {
		
		}
        break;
		case 0x0D: 
        {
            PChar->pushPacket(new CAuctionHousePacket(action, slotid));
		} 
        break;
	}
    return;
}

/************************************************************************
*																		*
*  Смена экипировки														*
*																		*
************************************************************************/					

void SmallPacket0x050(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL && 
        PChar->status != STATUS_UPDATE)
		return;

	uint8 slotID      = RBUFB(data,(0x04));
	uint8 equipSlotID = RBUFB(data,(0x05));
	
	charutils::EquipItem(PChar, slotID, equipSlotID);
	return;
}

/************************************************************************
*																		*
*  Завершение синтеза													*
*																		*
************************************************************************/					

void SmallPacket0x059(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	synthutils::sendSynthDone(PChar);
	return;
}

/************************************************************************
*																		*
*  Обновляем карты conquest, besieged, compaing							*
*																		*
************************************************************************/					

void SmallPacket0x05A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CConquestPacket(PChar));
	PChar->pushPacket(new CCampaingPacket(PChar,0));
	PChar->pushPacket(new CCampaingPacket(PChar,1));

	// пакет не на своем месте, возможно 0x0F
	PChar->pushPacket(new CStopDownloadingPacket(PChar)); 
	return;
}

/************************************************************************
*																		*
*  Завершаем или обновляем текущее событие                              *
*																		*
************************************************************************/					

void SmallPacket0x05B(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 EventID = RBUFW(data,(0x12));
	uint32 Result  = RBUFL(data,(0x08));

    if (PChar->m_event.Option != 0) Result = PChar->m_event.Option;

	if (RBUFB(data,(0x0E)) != 0){
		luautils::OnEventUpdate(PChar,EventID,Result);
	}else{
		luautils::OnEventFinish(PChar,EventID,Result);
		PChar->m_event.reset();
	}

	PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
	return;
}

/************************************************************************
*																		*
*  Завершаем или обновляем текущее событие                              *
*  Так же требуется обновить позицию персонажа                          *
*																		*
************************************************************************/					

void SmallPacket0x05C(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 EventID = RBUFW(data,(0x1A));

	PChar->loc.p.x = RBUFF(data,(0x04));
	PChar->loc.p.y = RBUFF(data,(0x08));
	PChar->loc.p.z = RBUFF(data,(0x0C));
	PChar->loc.p.rotation = RBUFB(data,(0x1F));

	if (RBUFB(data,(0x1E)) != 0){
		luautils::OnEventUpdate(PChar,EventID,0);
	}else{
		luautils::OnEventFinish(PChar,EventID,0);
		PChar->m_event.reset();
	}

	PChar->pushPacket(new CCSPositionPacket(PChar));
	PChar->pushPacket(new CPositionPacket(PChar));
	PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
	return;
}

/************************************************************************
*																		*
*  Эмоции персонажей, включая специфические (/jobemote [job])			*
*																		*
************************************************************************/					

void SmallPacket0x05D(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CCharEmotionPacket(PChar,data));
	return;
}

/************************************************************************
*																		*
*  Перемещение персонажа между зонами (zoneline)						*
*																		*
************************************************************************/					

void SmallPacket0x05E(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 zoneLineID = RBUFL(data,(0x04));
	uint8  town		  = RBUFB(data,(0x16)); // используются при выходе из mog house
	uint8  zone		  = RBUFB(data,(0x17)); // используются при выходе из mog house

	// переход между зонами с использованием таблицы zoneline
	//
	// игнорируем все zoneline пакеты,
	// пока не завершен текущий переход

	if (PChar->status == STATUS_NORMAL ||
        PChar->status == STATUS_UPDATE)
	{
		PChar->status = STATUS_DISAPPEAR;
		PChar->loc.boundary = 0;

		zoneLine_t* PZoneLine = PChar->loc.zone->GetZoneLine(zoneLineID);

		if (PZoneLine == NULL) // разворачиваем персонажа на 180° и отправляем туда, откуда пришел
		{
            ShowError(CL_RED"SmallPacket0x5E: Zone line %u not found\n"CL_RESET, zoneLineID); // в идеале нужно добавить зону и координаты

			PChar->loc.p.rotation += 128;

            PChar->pushPacket(new CMessageSystemPacket(0,0,2));
            PChar->pushPacket(new CCSPositionPacket(PChar));

            PChar->status = STATUS_UPDATE;
            return;
		}else{
			if (zoneutils::GetZone(PZoneLine->m_toZone)->GetIP() == 0) 	// разворачиваем персонажа на 180° и отправляем туда, откуда пришел
			{
				ShowDebug(CL_CYAN"SmallPacket0x5E: Zone %u closed to chars\n"CL_RESET, PZoneLine->m_toZone);

				PChar->loc.p.rotation += 128;

                PChar->pushPacket(new CMessageSystemPacket(0,0,2));
                PChar->pushPacket(new CCSPositionPacket(PChar));

                PChar->status = STATUS_UPDATE;
                return;
			} else {
                // выход из MogHouse
				if(PZoneLine->m_zoneLineID == 1903324538)
				{
                    uint8 prevzone = PChar->loc.prevzone;

                    if (zone != 0)  // 0 - выход в предыдущую зону, остальные значения - выбор зоны по имени
                    {
					    switch (town)
					    {
						    case 1: prevzone = zone + 0xE5; break;
						    case 2: prevzone = zone + 0xE9; break;
						    case 3: prevzone = zone + 0xED; break;
						    case 4: prevzone = zone + 0xF2; break;
						    case 5: prevzone = zone + (zone == 1 ? 0x2F : 0x30); break;
					    }
                    }
                    PChar->loc.destination = prevzone;
				} else {
                    PChar->loc.destination = PZoneLine->m_toZone;
				}
				PChar->loc.p = PZoneLine->m_toPos;
			}
		}
        ShowInfo(CL_WHITE"Zoning from zone %u to zone %u: %s\n"CL_RESET, PChar->getZone(), PChar->loc.destination, PChar->GetName());
	}
	PChar->clearPacketList();
	PChar->pushPacket(new CServerIPPacket(PChar,2));
	return;
}

/************************************************************************
*                                                                       *
*  Персонаж присылает текстовую информацию для продолжения события      *
*                                                                       *
************************************************************************/					

// zone 245 cs 0x00C7 Password

void SmallPacket0x060(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);

  //luautils::OnEventUpdate(PChar, 0, 0);
  //PChar->pushPacket(new CReleasePacket(PChar,RELEASE_EVENT));
	return;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/					

void SmallPacket0x061(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	PChar->pushPacket(new CCharHealthPacket(PChar));
	PChar->pushPacket(new CCharStatsPacket(PChar));
	PChar->pushPacket(new CCharSkillsPacket(PChar));
	PChar->pushPacket(new CMenuMeritPacket(PChar));
	return;
}

/************************************************************************
*																		*
*  Завершение раскопок chocobo (chocobo gigging)						*
*																		*
************************************************************************/					

void SmallPacket0x063(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return;
}

/************************************************************************
*																		*
*  Помечаем KeyItem как "увиденный"										*
*																		*
************************************************************************/					

void SmallPacket0x064(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8 KeyTable = RBUFB(data,(0x4A));
	memcpy(PChar->keys.seenList+(0x40*KeyTable),data+(0x08),0x40);

	charutils::SaveKeyItems(PChar);
	return;
}

/************************************************************************
*																		*
*  Окончание рыбалки													*
*																		*
************************************************************************/					

void SmallPacket0x066(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PrintPacket(data);

	uint16 stamina = RBUFW(data,(0x08));
	uint8  action  = RBUFB(data,(0x0E));
					
	fishingutils::FishingAction(PChar, (FISHACTION)action, stamina);
	return;
}

/************************************************************************
*                                                                       *
*  Персонаж приглашает другого персонажа в группу                       *
*                                                                       *
************************************************************************/					

void SmallPacket0x06E(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 charid = RBUFL(data,0x04);
	uint16 targid = RBUFW(data,0x08);

	// Персонаж не должен приглашать сам себя.
	if (PChar->id == charid)
		return;

    if (PChar->PParty == NULL || PChar->PParty->GetLeader() == PChar)
    {
        // если targid персонажа клиенту не известен, то получаем его из таблицы активных сессий
        if (targid == 0)
        {
	        int32 ret = Sql_Query(SqlHandle, "SELECT targid FROM accounts_sessions WHERE charid = %u LIMIT 1", charid);

	        if (ret != SQL_ERROR && Sql_NumRows(SqlHandle) != 0 && Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	        {
		        targid = (uint16)Sql_GetIntData(SqlHandle,0); 
	        }
        }

        CCharEntity* PInvitee = zoneutils::GetCharFromRegion(
			charid, 
			targid, 
			conquest::GetCurrentRegion(PChar->getZone()));

	    if (PInvitee != NULL)
	    {
		    if (PInvitee->PParty != NULL)
		    {
			    PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 12));
			    return;
		    }
		    if (PInvitee->isDead() ||
			    PInvitee->InvitePending.id != 0)
		    {
			    PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 23));
			    return;
		    }

            PInvitee->InvitePending.id = PChar->id;
            PInvitee->InvitePending.targid = PChar->targid;
		    PInvitee->pushPacket(new CPartyInvitePacket(PInvitee, PChar, INVITE_PARTY));

		    if (PChar->PParty != NULL &&
			    PChar->PParty->GetSyncTarget() != NULL)
		    {
			    PInvitee->pushPacket(new CMessageStandardPacket(PInvitee, 0, 0, 235));
		    }
	    }
    }
	return;
}

/************************************************************************
*																		*
*  Персонаж покидает группу												*
*																		*
************************************************************************/					

void SmallPacket0x06F(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL)
	{
		PChar->PParty->RemoveMember(PChar);
	}
	return;
}

/************************************************************************
*																		*
*  Лидер распускает группу												*
*																		*
************************************************************************/					

void SmallPacket0x070(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL &&
		PChar->PParty->GetLeader() == PChar) 
	{
		PChar->PParty->DisbandParty();
	}
	return;
}

/************************************************************************
*																		*
*  Удаляем члена группы или linckshell									*
*																		*
************************************************************************/					

void SmallPacket0x071(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	switch(RBUFB(data,(0x0A)))
	{
		case 0: // party
		{
			if (PChar->PParty != NULL &&
				PChar->PParty->GetLeader() == PChar)
			{
				PChar->PParty->RemoveMemberByName(data+0x0C);
			}
		}
		break;
        case 1: // linkshell
        {
            if (PChar->PLinkshell != NULL)
            {
                CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LINK]);

                if (PItemLinkshell != NULL && (PItemLinkshell->getType() & ITEM_LINKSHELL))
                {
					if(PItemLinkshell->GetLSType() == LSTYPE_LINKSHELL || PItemLinkshell->GetLSType() == LSTYPE_PEARLSACK){
						PChar->PLinkshell->RemoveMemberByName(data+0x0C);
					}
                }
            }
        }
        break;
		default:
		{
			ShowError(CL_RED"SmallPacket0x071 : unknown byte <%.2X>\n"CL_RESET, RBUFB(data,(0x0A)));
		}
	}
	return;
}

/************************************************************************
*																		*
*  Персонаж отвечает на приглашение в группу							*
*																		*
************************************************************************/					

void SmallPacket0x074(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    CCharEntity* PInviter = zoneutils::GetCharFromRegion(
        PChar->InvitePending.id,
        PChar->InvitePending.targid, 
        conquest::GetCurrentRegion(PChar->getZone()));

	if (PInviter != NULL) 
	{
		uint8 InviteAnswer = RBUFB(data,(0x04));

		if (InviteAnswer == 0)
		{
			PInviter->pushPacket(new CMessageStandardPacket(PInviter, 0, 0, 11));
		}
        else if (PChar->PParty == NULL)
		{
			if (PInviter->PParty == NULL)
			{
				CParty* PParty = new CParty(PInviter);
			}
            if (PInviter->PParty->GetLeader() == PInviter)
            {
				if(PInviter->PParty->members.size()==6){//someone else accepted invitation
					PInviter->pushPacket(new CMessageStandardPacket(PInviter, 0, 0, 14));
					PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 14));
				}
				else{
					PInviter->PParty->AddMember(PChar); 
				}
            }
		}
	}
    PChar->InvitePending.clean();
	return;
}

/************************************************************************
*																		*
*  Персонаж запрашивает информацию о членах группы						*
*																		*
************************************************************************/					

void SmallPacket0x076(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL)
	{
		PChar->PParty->ReloadPartyMembers(PChar);
	}
	return;
}

/************************************************************************
*																		*
*																		*
*																		*
************************************************************************/					

void SmallPacket0x077(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	switch(RBUFB(data,(0x14)))
	{
		case 0: // party
		{
			if (PChar->PParty != NULL &&
				PChar->PParty->GetLeader() == PChar)
			{
				PChar->PParty->AssignPartyRole(data+0x04, RBUFB(data,(0x15)));
			}
		}
		break;
        case 1: // linkshell
        {
            if (PChar->PLinkshell != NULL)
            {
				PChar->PLinkshell->ChangeMemberRank(data+0x04, RBUFB(data,(0x15)));
            }
        }
        break;
		default:
		{
			ShowError(CL_RED"SmallPacket0x077 : changing role packet with unknown byte <%.2X>\n"CL_RESET, RBUFB(data,(0x14)));
		}
	}
	return;
}

/************************************************************************
*																		*
*  Запрос перед поиском членов группы									*
*																		*
************************************************************************/					

void SmallPacket0x078(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->pushPacket(new CPartySearchPacket(PChar));
	return;
}

/************************************************************************
*																		*
*  Покупка предмета в магазине											*
*																		*
************************************************************************/					

void SmallPacket0x083(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8  quantity   = RBUFB(data,(0x04)); 	
	uint8  shopSlotID = RBUFB(data,(0x0A));

	uint16 itemID = PChar->Container->getItemID(shopSlotID);
	uint32 price  = PChar->Container->getQuantity(shopSlotID); // здесь мы сохранили стоимость предмета

	CItem* gil  = PChar->getStorage(LOC_INVENTORY)->GetItem(0);
	
	if ((gil != NULL) && (gil->getType() & ITEM_CURRENCY))
	{
		if (gil->getQuantity() > (price * quantity))
		{
			uint8 SlotID = charutils::AddItem(PChar, LOC_INVENTORY, itemID, quantity);

			if (SlotID != ERROR_SLOTID)
			{
				charutils::UpdateItem(PChar, LOC_INVENTORY, 0, -(int32)(price * quantity));

				PChar->pushPacket(new CShopBuyPacket(shopSlotID, quantity));
				PChar->pushPacket(new CInventoryFinishPacket());
			}
		}
	}
	return;
}

/************************************************************************
*																		*
*  Оценка стоимости предмета перед продажей в магазин					*
*  Помещаем информацию о продаваемом предмете в последнюю ячейку		*
*  контейнера															*
*																		*
************************************************************************/					

void SmallPacket0x084(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 quantity = RBUFL(data,(0x04)); 
	uint16 itemID   = RBUFW(data,(0x08));		
	uint8  slotID   = RBUFB(data,(0x0A));

	CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);
	if( (PItem != NULL) && 
		(PItem->getID() == itemID) && 
	   !(PItem->getFlag() & ITEM_FLAG_NOSALE) )
	{
		// подготавливаем предмет для продажи
		PChar->Container->setItem(16, itemID, slotID, quantity);
		PChar->pushPacket(new CShopAppraisePacket(slotID, PItem->getBasePrice()));
	}
	return;
}

/************************************************************************
*																		*
*  Продажа предмета в магазин											*
*  Информация о продаваемом предмете была предварительно сохранена в	*
*  последней (16-ой) ячейке контейнера в 0x084-ом пакете 				*
*																		*
************************************************************************/					

void SmallPacket0x085(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 quantity = PChar->Container->getQuantity(16);
	uint16 itemID   = PChar->Container->getItemID(16);
	uint8  slotID   = PChar->Container->getInvSlotID(16);

	CItem* gil   = PChar->getStorage(LOC_INVENTORY)->GetItem(0);
	CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

	if ( (PItem != NULL) && (gil != NULL) && (gil->getType() & ITEM_CURRENCY) )
	{
		charutils::UpdateItem(PChar, LOC_INVENTORY, 0, quantity * PItem->getBasePrice());
		charutils::UpdateItem(PChar, LOC_INVENTORY, slotID, -(int32)quantity);

		PChar->pushPacket(new CMessageStandardPacket(0, itemID, quantity, 232));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	// очищаем ячейку для безопасности (защита от группы 0x085-ых пакетов)
	PChar->Container->setItem(16,0,-1,0);	
	return;
}

/************************************************************************
*																		*
*  Начало синтеза														*
*  В нулевой ячейке будет храниться кристалл							*
*																		*
************************************************************************/					

void SmallPacket0x096(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->Container->Clean();

	uint32 ItemID    = RBUFL(data,(0x06));
	uint8  invSlotID = RBUFB(data,(0x08));

	uint8  numItems  = RBUFB(data,(0x09));

	PChar->Container->setItem(0, ItemID, invSlotID, 0);

	for(int32 SlotID = 0; SlotID < numItems; ++SlotID) 
	{
		ItemID    = RBUFL(data,(0x0A+SlotID*2));
		invSlotID = RBUFB(data,(0x1A+SlotID));
	
		PChar->Container->setItem(SlotID+1, ItemID, invSlotID, 1);
	}

	synthutils::startSynth(PChar);
	return;
}

/************************************************************************
*																		*
*  Генерация случайного числа (команда /diceroll)						*
*																		*
************************************************************************/					

void SmallPacket0x0A2(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 diceroll = 1 + rand()%1000;

	PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE_SELF, new CMessageStandardPacket(PChar, diceroll, 88)); 
	return;
}

/************************************************************************
*																		*
*  Отправляем персонажу список продаваемых гильдией предметов			*
*																		*
************************************************************************/					

void SmallPacket0x0AB(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PGuildShop != NULL)
	{
		PChar->pushPacket(new CGuildMenuBuyPacket(PChar, PChar->PGuildShop));
	}
	return;
}

/************************************************************************
*																		*
*  Отправляем персонажу список покупаемых гильдией предметов			*
*																		*
************************************************************************/					

void SmallPacket0x0AD(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PGuildShop != NULL)
	{
		PChar->pushPacket(new CGuildMenuSellPacket(PChar, PChar->PGuildShop));
	}
	return;
}

/************************************************************************
*																		*
*  Текстовое общение между персонажами (chat)							*
*																		*
************************************************************************/					

void SmallPacket0x0B5(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (RBUFB(data,(0x06)) == '@' && PChar->nameflags.flags & FLAG_GM)
	{
		CmdHandler.call(PChar, (const int8*)data+7);
	}
    else if (RBUFB(data,(0x06)) == '#' && PChar->nameflags.flags & FLAG_GM)
    {
        for (uint16 zone = 0; zone < 256; ++zone)
        {
            zoneutils::GetZone(zone)->PushPacket(
                NULL, 
                CHAR_INZONE, 
                new CChatMessagePacket(PChar, MESSAGE_SYSTEM_1, data+7));
        }
    }
    else
    {
		switch(RBUFB(data,(0x04)))
		{
			case MESSAGE_SAY:		PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CChatMessagePacket(PChar, MESSAGE_SAY,     data+6)); break;
			case MESSAGE_EMOTION:	PChar->loc.zone->PushPacket(PChar, CHAR_INRANGE, new CChatMessagePacket(PChar, MESSAGE_EMOTION, data+6)); break;
			case MESSAGE_SHOUT:		PChar->loc.zone->PushPacket(PChar, CHAR_INSHOUT, new CChatMessagePacket(PChar, MESSAGE_SHOUT,   data+6)); break;
			case MESSAGE_LINKSHELL: 
            {
                if (PChar->PLinkshell != NULL)
                {
                    PChar->PLinkshell->PushPacket(PChar, new CChatMessagePacket(PChar, MESSAGE_LINKSHELL, data+6));
                }
            }
            break;
			case MESSAGE_PARTY:		
			{
				if (PChar->PParty != NULL)
				{
					PChar->PParty->PushPacket(PChar, 0, new CChatMessagePacket(PChar, MESSAGE_PARTY, data+6));
				}
			}
			break;
            case MESSAGE_YELL: PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 256)); break;
		}
	}
	return;
}

/************************************************************************
*																		*
*  Текстовое общение между персонажами /tell							*
*																		*
************************************************************************/					

void SmallPacket0x0B6(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    string_t RecipientName = data+5;

	const int8* Query = "SELECT charid, targid, pos_zone FROM chars INNER JOIN accounts_sessions USING(charid) WHERE charname = '%s' LIMIT 1";
    
	int32 ret = Sql_Query(SqlHandle, Query, RecipientName.c_str());

	if (ret != SQL_ERROR && 
		Sql_NumRows(SqlHandle) != 0 &&
		Sql_NextRow(SqlHandle) == SQL_SUCCESS)
	{
		uint32 CharID = (uint32)Sql_GetUIntData(SqlHandle,0);
		uint16 TargID = (uint16)Sql_GetUIntData(SqlHandle,1);
		uint8  ZoneID = (uint8) Sql_GetUIntData(SqlHandle,2);
		
		CCharEntity* PTellRecipient = (CCharEntity*)zoneutils::GetZone(ZoneID)->GetEntity(TargID, TYPE_PC);

		if(PTellRecipient==NULL && ZoneID==0){//in a moghouse, do a full sweep
			map_session_list_t::iterator it = map_session_list.begin();
			while(it != map_session_list.end())
			{ 
				map_session_data_t* map_session_data = it->second;
				CCharEntity* PChar = map_session_data->PChar;
				if(PChar->id == CharID){
					PTellRecipient = PChar;
					break;
				}
				++it;
			}
		}

		if (PTellRecipient != NULL &&
			PTellRecipient->id == CharID &&
			PTellRecipient->status != STATUS_DISAPPEAR)
		{
			if (PTellRecipient->nameflags.flags & FLAG_AWAY)
			{
				PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 181));
				return;
			}
			PTellRecipient->pushPacket(new CChatMessagePacket(PChar, MESSAGE_TELL, data+20));
			return;
		}
	}
	PChar->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 125));
	return;
}

/************************************************************************
*																		*
*  Меняем режим	получения опыта между Exp и Limit Points				*
*																		*
************************************************************************/					

void SmallPacket0x0BE(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return;
}

/************************************************************************
*                                                                       *
*  Создание жемчужины (Pearl) экипированной LinkShell                   *
*                                                                       *
************************************************************************/					

void SmallPacket0x0C3(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LINK]);

    if (PItemLinkshell != NULL && (PItemLinkshell->getType() & ITEM_LINKSHELL))
    {
        CItemLinkshell* PItemLinkPearl = new CItemLinkshell(*PItemLinkshell);
		if(PItemLinkPearl->GetLSType()==LSTYPE_PEARLSACK || PItemLinkPearl->GetLSType()==LSTYPE_LINKSHELL){
			PItemLinkPearl->setID(515);
			PItemLinkPearl->setSubType(ITEM_UNLOCKED);

			charutils::AddItem(PChar, LOC_INVENTORY, PItemLinkPearl);
		}
    }
    return;
}

/************************************************************************
*                                                                       *
*  Создание и экипировка LinkShell                                      *
*                                                                       *
************************************************************************/					

void SmallPacket0x0C4(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    uint8 SlotID = RBUFB(data,(0x06));
    uint8 action = RBUFB(data,(0x07));  

    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(SlotID);

    if (PItemLinkshell != NULL && (PItemLinkshell->getType() & ITEM_LINKSHELL))
    {
        if (PItemLinkshell->getID() == 512) // создание новой linkshell
        {
            uint32   LinkshellID    = 0;
            uint16   LinkshellColor = RBUFW(data,(0x04));
            string_t LinkshellName  = data+8;

            // TODO: проверить имя на необходимость добавления окончания строки 

            if (LinkshellID = linkshell::RegisterNewLinkshell(LinkshellName.c_str(), LinkshellColor)) // здесь дейтсвительно присваивание
            {
	            const int8* Query = "UPDATE char_inventory SET signature = '%s', itemId = 513 WHERE charid = %u AND location = 0 AND slot = %u LIMIT 1";

		        if (Sql_Query(SqlHandle, Query, LinkshellName.c_str(), PChar->id, SlotID) != SQL_ERROR && 
                    Sql_AffectedRows(SqlHandle) != 0)
                {
                    PItemLinkshell->setID(513);
                    PItemLinkshell->SetLSID(LinkshellID);
                    PItemLinkshell->setSignature((int8*)LinkshellName.c_str());
                    PItemLinkshell->SetLSColor(LinkshellColor);

                    PChar->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
                }
            }
            else
            {
                PChar->pushPacket(new CMessageStandardPacket(112));
                //DE
                //20
                //1D
                return;
            }
        }
        else
        {
            switch (action)
            {
                case 0: // unequip linkshell
                {
                    linkshell::DelOnlineMember(PChar, PItemLinkshell);

                    PItemLinkshell->setSubType(ITEM_UNLOCKED);

                    PChar->equip[SLOT_LINK] = 0;
                    PChar->nameflags.flags &= ~FLAG_LINKSHELL;

                    PChar->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_NORMAL));
                }
                break;
                case 1: // equip linkshell
                {
                    if (PItemLinkshell->GetLSID() == 0) // linkshell no exists, item is unusable
                    {
                        PChar->pushPacket(new CMessageSystemPacket(0,0,110));
                        return;
                    }
                    if (PChar->PLinkshell != NULL) // switching linkshell group
                    {
                        CItemLinkshell* POldItemLinkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LINK]);

                        if (POldItemLinkshell != NULL && (POldItemLinkshell->getType() & ITEM_LINKSHELL))
                        {
                            linkshell::DelOnlineMember(PChar, POldItemLinkshell);

                            POldItemLinkshell->setSubType(ITEM_UNLOCKED);
                            PChar->pushPacket(new CInventoryAssignPacket(POldItemLinkshell, INV_NORMAL));
                        }
                    }
                    linkshell::AddOnlineMember(PChar, PItemLinkshell);

                    PItemLinkshell->setSubType(ITEM_LOCKED);

                    PChar->equip[SLOT_LINK] = SlotID;
                    PChar->nameflags.flags |= FLAG_LINKSHELL; 

                    PChar->pushPacket(new CInventoryAssignPacket(PItemLinkshell, INV_LINKSHELL));
                }
                break;
            }
            charutils::SaveCharStats(PChar);
            charutils::SaveCharEquip(PChar);

            if (PChar->status == STATUS_NORMAL) PChar->status = STATUS_UPDATE;

            PChar->pushPacket(new CLinkshellEquipPacket(PChar));
            PChar->pushPacket(new CInventoryItemPacket(PItemLinkshell, LOC_INVENTORY, SlotID));
        }
        PChar->pushPacket(new CInventoryFinishPacket());
        PChar->pushPacket(new CCharUpdatePacket(PChar));
    }
	return;
}

/************************************************************************
*																		*
*  Отображаем членов группы на карте									*
*																		*
************************************************************************/					

void SmallPacket0x0D2(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->PParty != NULL)
	{
		for (int32 i = 0; i < PChar->PParty->members.size(); ++i) 
		{
			CCharEntity* PPartyMember = (CCharEntity*)PChar->PParty->members.at(i);

			if (PPartyMember->getZone() == PChar->getZone())
			{
				PChar->pushPacket(new CPartyMapPacket(PPartyMember));
			}
		}
	} 
	else 
	{
		PChar->pushPacket(new CPartyMapPacket(PChar));
	}
	return;
}

/************************************************************************
*																		*
*  Отправляем жалобу GM'y												*
*  help desk -> i want to report -> yes -> yes -> execute				*
*																		*
************************************************************************/					

void SmallPacket0x0D3(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return;
}

/************************************************************************
*																		*
*  Установка разных nameFlags: party, away, autogroup,					*
*  флаги в help desk и т.д.												*
*																		*
************************************************************************/					

void SmallPacket0x0DC(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	switch(RBUFW(data,(0x04)))
	{
		case 0x0001: 
			PChar->nameflags.flags ^= FLAG_INVITE; 
			break;
		case 0x0002:
			if(RBUFB(data,(0x10)) == 1)
				PChar->nameflags.flags |=  FLAG_AWAY;
			if(RBUFB(data,(0x10)) == 2)
				PChar->nameflags.flags &= ~FLAG_AWAY;
			break;
		case 0x0004: 
			PChar->nameflags.flags ^= FLAG_ANON; 
			break;
		case 0x4000:
			if(RBUFB(data,(0x10)) == 1)
                PChar->m_hasAutoTarget = false;
			if(RBUFB(data,(0x10)) == 2)
                PChar->m_hasAutoTarget = true;
			break;
		case 0x8000: 
			//if(RBUFB(data,(0x10)) == 1)	// autogroup on
			//if(RBUFB(data,(0x10)) == 2)	// autogroup off
			break;
	}
    charutils::SaveCharStats(PChar);

	PChar->status = STATUS_UPDATE;
	PChar->pushPacket(new CMenuConfigPacket(PChar));
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	return;
}

/************************************************************************
*																		*
*  Устанавливаем предпочтительный язык общения							*
*																		*
************************************************************************/					

void SmallPacket0x0DB(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->search.language = RBUFB(data,(0x24));
	return;
}

/************************************************************************
*																		*
*  Проверяем монстров или персонажей									*
*																		*
*  170 - <target> seems It seems to have high evasion and defense.		*
*  171 - <target> seems It seems to have high evasion.					*
*  172 - <target> seems It seems to have high evasion but low defense.	*
*  173 - <target> seems It seems to have high defense.					*
*  174 - <target> seems													*
*  175 - <target> seems It seems to have low defense.					*
*  176 - <target> seems It seems to have low evasion but high defense.	*
*  177 - <target> seems It seems to have low evasion.					*
*  178 - <target> seems It seems to have low evasion and defense.		*
*																		*
*  Логическая ошибка использовать опыт для определения сложности боя	*
*  Необходимы условия, основанные на разницах уровней					*
*																		*
************************************************************************/					

void SmallPacket0x0DD(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint32 id     = RBUFL(data,(0x04));
	uint16 targid = RBUFW(data,(0x08));

	CBaseEntity* PEntity = PChar->loc.zone->GetEntity(targid, TYPE_MOB | TYPE_PC);

	if (PEntity == NULL || PEntity->id != id) 
		return;

	switch (PEntity->objtype)
	{
		case TYPE_MOB:
		{
			CMobEntity* PTarget = (CMobEntity*)PEntity;

            if (PTarget->m_Type & MOBTYPE_NOTORIOUS) 
			{
			    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0, 249));
			}
            else
            {
				uint32 baseExp = charutils::GetRealExp(PChar->GetMLevel(),PTarget->GetMLevel());

				if(baseExp >= 400) {
					PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x46, 174));
				} else if(baseExp >= 240) {
					PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x45, 174));
				} else if(baseExp >= 120) {
					PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x44, 174));
				} else if(baseExp == 100) {
					PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x43, 174));
				} else if(baseExp >=  75) {
					PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x42, 174));
				} else if(baseExp >=  15) {
					PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x41, 174));
				} else if(baseExp ==   0) {
                    PChar->pushPacket(new CMessageBasicPacket(PChar, PTarget, 0, 0x40, 174));
				}
            }
		}
		break;
		case TYPE_PC:
		{
			CCharEntity* PTarget = (CCharEntity*)PEntity;

			PTarget->pushPacket(new CMessageStandardPacket(PChar, 0, 0, 89));

			PChar->pushPacket(new CBazaarMessagePacket(PTarget));
            PChar->pushPacket(new CCheckPacket(PChar, PTarget));
		}
		break;
	}

	return;
}

/************************************************************************
*																		*
*  Устанавливаем сообщене bazaar										*
*  Буфера в 256 байт вполне достаточно для преобразования 120 байт		*
*																		*
************************************************************************/					

void SmallPacket0x0DE(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->bazaar.message.clear();
	PChar->bazaar.message.insert(0,data+4);

	int8 message[256];
	Sql_EscapeString(SqlHandle,message,data+4);

	Sql_Query(SqlHandle, "UPDATE char_stats SET bazaar_message = '%s' WHERE charid = %u;", message, PChar->id);
	return;
}

/************************************************************************
*																		*
*  Комментарий, отображаемый в списке поиска							*
*  Не уверен насчет необходимости удаления пробелов в конце строки,		*
*  об их назначении мы узнаем лишь после реализации поиска				*
*																		*
************************************************************************/					

void SmallPacket0x0E0(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->search.message.clear();
	PChar->search.message.insert(0,data+4);

	PChar->search.messagetype = RBUFB(data,(0xA4));

    // в ответ на этот пакет не нужно посылать что-либо клиенту
	// эта информация используется лишь при поиске персонажа
					
	//                s   a   l   u   t
	//e0  4c  c2  00  73  61  6c  75  74  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  20 
	//20  20  20  20  20  20  20  20  20  20  20  20  20  20  20  00 
	//00  00  00  00  2f  15  4c  4b  57  49  4e  08  3f  00  00  00 
	//ff  00  00  00  11  00  00  00 

	// сообщение максимум 120, 3 строки по 40 символов, идущие подряд, начиная с 5-го байта
	// тип сообщения - 4й байт с конца

	//EXP party
	    //0x11 - seek party
		//0x12 - find member
		//0x13 - other
	//Mission
		//0x21 - seek party
		//0x22 - find member
		//0x23 - other
	//Quest
		//0x31 - seek party
		//0x32 - find member
		//0x33 - other
	//Battlefield
		//0x41 - seek party
		//0x42 - find member
		//0x43 - other
	//Item
		//0x51 - Want to Sell
		//0x52 - Want to Buy
		//0x53 - Other
	//Synthesis
		//0x61 - Need Made
		//0x62 - Can Make
		//0x63 - Other
    //Others
		//0x73 - others
	return;
}

/************************************************************************
*                                                                       *
*  Отправляем персонажу приветственное сообщение LinkShell (/lsmes)     *
*                                                                       *
************************************************************************/					

void SmallPacket0x0E1(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    if (PChar->PLinkshell != NULL)
    {
        PChar->pushPacket(new CLinkshellMessagePacket(PChar->PLinkshell));
    }
    return;
}

/************************************************************************
*                                                                       *
*  Обновление преветственного cообщения LinkShell                       *
*                                                                       *
************************************************************************/					

void SmallPacket0x0E2(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    CItemLinkshell* PItemLinkshell = (CItemLinkshell*)PChar->getStorage(LOC_INVENTORY)->GetItem(PChar->equip[SLOT_LINK]);

    if (PChar->PLinkshell != NULL && (PItemLinkshell != NULL && (PItemLinkshell->getType() & ITEM_LINKSHELL)))
    {
        switch (RBUFB(data,(0x04)) & 0xF0) // назначение первых бит пока неизвестно
        {
            case 0x20: // устанавливаем права на изменение сообщения
            {
                // TODO: ....
            }
            break;
            case 0x40: // изменяем сообщение
            {
                if (PItemLinkshell->GetLSType() == LSTYPE_LINKSHELL ||
                    PItemLinkshell->GetLSType() == LSTYPE_PEARLSACK)
                {
                    string_t Message = data+12;
                    uint32   MessageTime = time(NULL);

                    const int8* Query = "UPDATE linkshells SET poster = '%s', message = '%s', messagetime = %u WHERE linkshellid = %u LIMIT 1";

                    if (Sql_Query(SqlHandle, Query, PChar->GetName(), Message.c_str(), MessageTime, PChar->PLinkshell->getID()) != SQL_ERROR && 
                        Sql_AffectedRows(SqlHandle) != 0)
                    {
                        PChar->PLinkshell->setPoster((int8*)PChar->GetName());
                        PChar->PLinkshell->setMessage((int8*)Message.c_str());
                        PChar->PLinkshell->setMessageTime(MessageTime);

                        PChar->PLinkshell->PushPacket(NULL, new CLinkshellMessagePacket(PChar->PLinkshell));
                        return;
                    }
                }
            }
            break;
        }
    }
    PChar->pushPacket(new CLinkshellMessagePacket(NULL)); // you are not authorized to this action
    return;
}

/************************************************************************
*																		*
*  Запрос на выход из игры. Shutdown и Logout отправляют одинаковые		*
*  запросы. В MogHouse персонаж выходит сразу, без задержки в 30 секунд	*
*																		*
*  ExitType: 1 - logout; 3 - shutdown									*
*																		*
************************************************************************/					

void SmallPacket0x0E7(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL)
		return;

	if (PChar->getZone() == 0 ||
		PChar->nameflags.flags & FLAG_GM)
	{
		PChar->status = STATUS_SHUTDOWN;
		PChar->pushPacket(new CServerIPPacket(PChar,1));
	}
	else if (PChar->animation == ANIMATION_NONE) 
	{
		uint8 ExitType = (RBUFB(data,(0x06)) == 1 ? 7 : 35);

		if (PChar->PPet == NULL || 
		   (PChar->PPet->m_EcoSystem != SYSTEM_AVATAR &&
			PChar->PPet->m_EcoSystem != SYSTEM_ELEMENTAL))
		{
			PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING,0,0,10,0));
		}
		PChar->status = STATUS_UPDATE;
		PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEAVEGAME,0,ExitType,5,0));
	}
	else if (PChar->animation == ANIMATION_HEALING)
	{
		if (PChar->StatusEffectContainer->HasStatusEffect(EFFECT_LEAVEGAME))
		{
			PChar->status = STATUS_UPDATE;
			PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
		} else {
			uint8 ExitType = (RBUFB(data,(0x06)) == 1 ? 7 : 35);

			PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_LEAVEGAME,0,ExitType,5,0));
		}
	}
	return;
}

/************************************************************************
*																		*
*  Отдых персонажа (восстановление жизней, выход из игры, прерывание	*
*  чтения заклинаний, повышенная агрессия монстров и т.д.)				*
*																		*
************************************************************************/					

void SmallPacket0x0E8(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL)
		return;

	switch (PChar->animation) 
	{
		case ANIMATION_NONE:
		{
			if (PChar->PPet == NULL || 
			   (PChar->PPet->m_EcoSystem != SYSTEM_AVATAR &&
				PChar->PPet->m_EcoSystem != SYSTEM_ELEMENTAL))
			{
				switch (PChar->PBattleAI->GetCurrentAction())
				{
					case ACTION_ITEM_USING:		PChar->PBattleAI->SetCurrentAction(ACTION_ITEM_INTERRUPT);	break;
					case ACTION_MAGIC_CASTING:	PChar->PBattleAI->SetCurrentAction(ACTION_MAGIC_INTERRUPT);	break;
				}
				PChar->status = STATUS_UPDATE;
				PChar->PBattleAI->CheckCurrentAction(gettick());
				PChar->StatusEffectContainer->AddStatusEffect(new CStatusEffect(EFFECT_HEALING,0,0,10,0));
				return;
			}
			PChar->pushPacket(new CMessageBasicPacket(PChar,PChar,0,0,345));
		}
		break;
		case ANIMATION_HEALING: 
		{
			PChar->status = STATUS_UPDATE;
			PChar->StatusEffectContainer->DelStatusEffect(EFFECT_HEALING);
		}
		break;
	}
	return;
}

/************************************************************************
*																		*
*  Команда /sit (персонаж садится и наслаждается окружением)		 	*
*																		*
************************************************************************/					

void SmallPacket0x0EA(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->status != STATUS_NORMAL)
		return;

	PChar->status = STATUS_UPDATE;
	PChar->animation = (PChar->animation == ANIMATION_SIT ? ANIMATION_NONE : ANIMATION_SIT);
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	return;
}

/************************************************************************
*																		*
*  Удаление статус эффекта щелчком по его иконке						*
*																		*
************************************************************************/					

void SmallPacket0x0F1(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 IconID = RBUFW(data,(0x04));

    if (IconID != 0) // удаляем только видимые эффекты
    {
	    PChar->StatusEffectContainer->DelStatusEffectsByIcon(IconID);
    }
	return;
}

/************************************************************************
*																		*
*  Клиент сообщает серверу, что входит в подобласть зоны				*
*  (в простонародье - boundary). Во избежание всяких казусов мы должны	*
*  сразу сохранять эту переменную.										*	 
*																		*
************************************************************************/					

void SmallPacket0x0F2(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->loc.boundary = RBUFW(data,(0x06));

	charutils::SaveCharPosition(PChar);
	return;
}

/************************************************************************
*																		*
*  Сканирование местности (Wide Scan)							 		*
*																		*
************************************************************************/					

void SmallPacket0x0F4(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->loc.zone->WideScan(PChar,PChar->getMod(MOD_WIDESCAN)); 
	return;
}

/************************************************************************
*																		*
*  Следим за выбранной целью в Wide Scan						 		*
*																		*
************************************************************************/					

void SmallPacket0x0F5(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 TargID = RBUFW(data,(0x04));

	PChar->PWideScanTarget = PChar->loc.zone->GetEntity(TargID, TYPE_MOB | TYPE_NPC);
	return;
}

/************************************************************************
*																		*
*  Отмена слежения за целью, выбранной в Wide Scan				 		*
*																		*
************************************************************************/

void SmallPacket0x0F6(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	PChar->PWideScanTarget = NULL;
	return;
}

/************************************************************************
*																		*
*  Установка мебели в MogHouse									 		*
*																		*
************************************************************************/					

void SmallPacket0x0FA(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 ItemID = RBUFW(data,(0x04));

	if (ItemID == 0)
	{
		// выход из режима установки мебели
		// здесь мы считаем ауру и добавляем необходимый keyitem
		return;
	}

	uint8  slotID	= RBUFB(data,(0x06));
	uint8  col		= RBUFB(data,(0x07));
	uint8  level	= RBUFB(data,(0x08));
	uint8  row		= RBUFB(data,(0x09));
	uint8  rotation	= RBUFB(data,(0x0A));

	CItemFurnishing* PItem = (CItemFurnishing*)PChar->getStorage(LOC_MOGSAFE)->GetItem(slotID);
	
	if (PItem != NULL &&
		PItem->getID() == ItemID &&
		PItem->getType() & ITEM_FURNISHING) 
	{
		if (PItem->getFlag() & ITEM_FLAG_WALLHANDING)
		{
			rotation = (col >= 2 ? 3 : 1);
		}

		// обновляем данные в базе

		PItem->setCol(col);
		PItem->setRow(row);
		PItem->setLevel(level);
		PItem->setRotation(rotation);
	
		PItem->setSubType(ITEM_LOCKED);

		PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_MOGSAFE, slotID));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	return;
}

/************************************************************************
*																		*
*  Удаление мебели в MogHouse									 		*
*																		*
************************************************************************/					

void SmallPacket0x0FB(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint16 ItemID = RBUFW(data,(0x04));

	if (ItemID == 0)
	{
		return;
	}
	
	uint8  slotID = RBUFB(data,(0x06));
	
	CItemFurnishing* PItem = (CItemFurnishing*)PChar->getStorage(LOC_MOGSAFE)->GetItem(slotID);
	
	if (PItem != NULL &&
		PItem->getID() == ItemID &&
		PItem->getType() & ITEM_FURNISHING) 
	{	
		// удаляем данные из базы
			
		PItem->setCol(0);
		PItem->setRow(0);
		PItem->setLevel(0);
		PItem->setRotation(0);
		
		PItem->setSubType(ITEM_UNLOCKED);

		PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_MOGSAFE, slotID));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	return;
}

/************************************************************************
*																		*
*  Смена профессии. Разрешена только в зоне с флагом MISC_MOGMENU.		*
*  При смене профессии с персонажа снимаются все положительные эффекты	*
*																		*
************************************************************************/					

void SmallPacket0x100(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	if (PChar->loc.zone->CanUseMisc(MISC_MOGMENU))
	{
		uint8 mjob = RBUFB(data,(0x04));
		uint8 sjob = RBUFB(data,(0x05));

		if ((mjob > 0x00) && (mjob < MAX_JOBTYPE)) 
		{
			PChar->SetMJob(mjob);
			PChar->SetMLevel(PChar->jobs.job[PChar->GetMJob()]);
			PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);
		}
		if ((sjob > 0x00) && (sjob < MAX_JOBTYPE)) 
		{
			JOBTYPE prevsjob = PChar->GetSJob();

			PChar->SetSJob(sjob);
			PChar->SetSLevel(PChar->jobs.job[PChar->GetSJob()]);

			charutils::CheckEquipLogic(PChar, SCRIPT_CHANGESJOB, prevsjob);
		}

		charutils::CheckValidEquipment(PChar);
		charutils::CalculateStats(PChar);
		charutils::BuildingCharSkillsTable(PChar);
        charutils::BuildingCharTraitsTable(PChar);
		charutils::BuildingCharAbilityTable(PChar);
        charutils::BuildingCharWeaponSkills(PChar);

        PChar->StatusEffectContainer->DelStatusEffectsByFlag(EFFECTFLAG_DISPELABLE);

        PChar->UpdateHealth();

        PChar->health.hp = PChar->GetMaxHP();
        PChar->health.mp = PChar->GetMaxMP();

        charutils::SaveCharStats(PChar);

		PChar->pushPacket(new CCharJobsPacket(PChar));
		PChar->pushPacket(new CCharUpdatePacket(PChar));
		PChar->pushPacket(new CCharHealthPacket(PChar));
		PChar->pushPacket(new CCharStatsPacket(PChar));
		PChar->pushPacket(new CCharSkillsPacket(PChar));
		PChar->pushPacket(new CCharAbilitiesPacket(PChar));
		PChar->pushPacket(new CAutomatonUpdatePacket(PChar));
		PChar->pushPacket(new CMenuMeritPacket(PChar));
		PChar->pushPacket(new CCharSyncPacket(PChar));
	}
	return;
}

/************************************************************************
*																		*
*  Устанавливаем активные заклинания синего мага, модифицируем автомат	*
*																		*
************************************************************************/					

void SmallPacket0x102(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	return;
}

/************************************************************************
*																		*
*  Closing the "View wares", sending a message to the bazaar			*	
*  that you have left the shop	                                        *
*																		*
************************************************************************/	

void SmallPacket0x104(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    CCharEntity* PTarget = (CCharEntity*)PChar->loc.zone->GetEntity(PChar->BazaarID.targid, TYPE_PC);

    if (PTarget != NULL && PTarget->id == PChar->BazaarID.id)
	{
        // надеюсь, что персонаж прописался в массиве однажны, но на всякий случай пробегаем по всему
        for (uint32 i = 0; i < PTarget->BazaarCustomers.size(); ++i)
		{
            if (PTarget->BazaarCustomers[i].id == PChar->targid)
            {
                PTarget->BazaarCustomers.erase(PTarget->BazaarCustomers.begin() + i--);
			}
		}
	    PTarget->pushPacket(new CBazaarCheckPacket(PChar, BAZAAR_LEAVE));
	}
    PChar->BazaarID.clean();
	return;
}

/************************************************************************
*                                                                       *
*  Clicking "View wares", opening the bazaar for browsing               *
*                                                                       *
************************************************************************/

void SmallPacket0x105(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    DSP_DEBUG_BREAK_IF(PChar->BazaarID.id != 0);
    DSP_DEBUG_BREAK_IF(PChar->BazaarID.targid != 0);

	uint32 charid = RBUFL(data,(0x04));

    CCharEntity* PTarget = (CCharEntity*)PChar->loc.zone->GetEntity(PChar->m_TargID, TYPE_PC);

    if (PTarget != NULL && PTarget->id == charid && (PTarget->nameflags.flags & FLAG_BAZAAR)) 
	{
        PChar->BazaarID.id = PTarget->id;
        PChar->BazaarID.targid = PTarget->targid;

        EntityID_t EntityID = { PChar->id, PChar->targid };

		PTarget->pushPacket(new CBazaarCheckPacket(PChar, BAZAAR_ENTER));
        PTarget->BazaarCustomers.push_back(EntityID);

		CItemContainer* PBazaar = PTarget->getStorage(LOC_INVENTORY);

		for(uint8 SlotID = 1; SlotID <= PBazaar->GetSize(); ++SlotID) 
		{
			CItem* PItem = PBazaar->GetItem(SlotID);

			if ((PItem != NULL) && (PItem->getCharPrice() != 0))
			{
                PChar->pushPacket(new CBazaarItemPacket(PItem, SlotID, PChar->loc.zone->GetTax()));
			}
		}
	}
	return;
}

/************************************************************************
*                                                                       *
*  Purchasing an item from a bazaar                                     *
*                                                                       *
************************************************************************/	

void SmallPacket0x106(map_session_data_t* session, CCharEntity* PChar, int8* data)
{	
	uint8 Quantity = RBUFB(data,0x08);
	uint8 SlotID   = RBUFB(data,0x04);

    CCharEntity* PTarget = (CCharEntity*)PChar->loc.zone->GetEntity(PChar->BazaarID.targid, TYPE_PC);

    if (PTarget == NULL || PTarget->id != PChar->BazaarID.id)
		return;

    CItemContainer* PBazaar = PTarget->getStorage(LOC_INVENTORY);
	CItemContainer* PBuyerInventory = PChar->getStorage(LOC_INVENTORY);

    if (PChar->id == PTarget->id || PBuyerInventory->GetFreeSlotsCount() == 0)
    {
        PChar->pushPacket(new CBazaarPurchasePacket(PTarget, false));
        return;
    }

	CItem* PBazaarItem = PBazaar->GetItem(SlotID);

    if ((PBazaarItem != NULL) && (PBazaarItem->getCharPrice() != 0) && (PBazaarItem->getQuantity() >= Quantity)) 
    {
        CItem* PItem = itemutils::GetItem(PBazaarItem);

        PItem->setCharPrice(0);
        PItem->setQuantity(Quantity);
        PItem->setSubType(ITEM_UNLOCKED);

        if (charutils::AddItem(PChar, LOC_INVENTORY, PItem) == ERROR_SLOTID) 
            return;

        // TODO: мне так лень делать проверки на текущее количество gil, на первое время понадеемся на клиента

        uint32 Price1 = (PBazaarItem->getCharPrice() * Quantity);               // цена
        uint32 Price2 = (PChar->loc.zone->GetTax() * Price1) / 10000 + Price1;  // цена + налог

        charutils::UpdateItem(PChar,   LOC_INVENTORY, 0, -Price2); 
        charutils::UpdateItem(PTarget, LOC_INVENTORY, 0,  Price1); 

        PChar->pushPacket(new CBazaarPurchasePacket(PTarget, true));

        PTarget->pushPacket(new CBazaarConfirmationPacket(PChar, SlotID, Quantity));

        charutils::UpdateItem(PTarget, LOC_INVENTORY, SlotID, -Quantity);

        PTarget->pushPacket(new CInventoryItemPacket(PBazaar->GetItem(SlotID), LOC_INVENTORY, SlotID));
		PTarget->pushPacket(new CInventoryFinishPacket());

        bool BazaarIsEmpty = true;
	
        for(uint8 BazaarSlotID = 1; BazaarSlotID <= PBazaar->GetSize(); ++BazaarSlotID) 
	    {
		    PItem = PBazaar->GetItem(BazaarSlotID);
	
		    if ((PItem != NULL) && (PItem->getCharPrice() != 0))
		    {
			    BazaarIsEmpty = false;
                break;
		    }	
	    }
        for (uint32 i = 0; i < PTarget->BazaarCustomers.size(); ++i)
        {
            CCharEntity* PCustomer = (CCharEntity*)PTarget->loc.zone->GetEntity(PTarget->BazaarCustomers[i].targid, TYPE_PC);

            if (PCustomer != NULL && PCustomer->id == PTarget->BazaarCustomers[i].id)
            {
                if (PCustomer->id != PChar->id)
                {
                    PCustomer->pushPacket(new CBazaarConfirmationPacket(PChar, SlotID, Quantity));
                }
                PCustomer->pushPacket(new CBazaarItemPacket(PBazaar->GetItem(SlotID), SlotID, PChar->loc.zone->GetTax()));

                if (BazaarIsEmpty)
                {
                    PCustomer->pushPacket(new CBazaarClosePacket(PTarget)); 
                }
            }
        }
        if (BazaarIsEmpty)
        {
            PTarget->status = STATUS_UPDATE;
		    PTarget->nameflags.flags &= ~FLAG_BAZAAR;
		    PTarget->pushPacket(new CCharUpdatePacket(PTarget));
	    }
        return;
    }
    PChar->pushPacket(new CBazaarPurchasePacket(PTarget, false));
    return;
}

/************************************************************************
*																		*
*  Выходим из режима установки цен bazaar						 		*
*																		*
************************************************************************/					

void SmallPacket0x109(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	CItemContainer* PStorage = PChar->getStorage(LOC_INVENTORY);

	for (uint8 slotID = 1; slotID <= PStorage->GetSize(); ++slotID) 
	{
		CItem* PItem = PStorage->GetItem(slotID);

		if ((PItem != NULL) && (PItem->getCharPrice() != 0)) 
		{
            PChar->status = STATUS_UPDATE;
			PChar->nameflags.flags |= FLAG_BAZAAR;
			PChar->pushPacket(new CCharUpdatePacket(PChar));
			return;
		}
	}
	return;
}

/************************************************************************
*																		*
*  Устанавливаем цены bazaar на предметы							 	*
*																		*
************************************************************************/					

void SmallPacket0x10A(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
	uint8  slotID = RBUFB(data,(0x04));
	uint32 price  = RBUFL(data,(0x08));

	CItem* PItem = PChar->getStorage(LOC_INVENTORY)->GetItem(slotID);

	if ((PItem != NULL) && !(PItem->getFlag() & ITEM_FLAG_EX))
	{
		Sql_Query(SqlHandle,"UPDATE char_inventory SET bazaar = %u WHERE charid = %u AND location = 0 AND slot = %u;", price, PChar->id, slotID);		

		PItem->setCharPrice(price);
		PItem->setSubType((price == 0 ? ITEM_UNLOCKED : ITEM_LOCKED));

		PChar->pushPacket(new CInventoryItemPacket(PItem, LOC_INVENTORY, slotID));
		PChar->pushPacket(new CInventoryFinishPacket());
	}
	return;
}

/************************************************************************
*																		*
*  Opening "Set Prices" in bazaar-menu, closing the bazaar		 		*
*																		*
************************************************************************/

void SmallPacket0x10B(map_session_data_t* session, CCharEntity* PChar, int8* data)
{
    for (uint32 i = 0; i < PChar->BazaarCustomers.size(); ++i)
    {
        CCharEntity* PCustomer = (CCharEntity*)PChar->loc.zone->GetEntity(PChar->BazaarCustomers[i].targid, TYPE_PC);

        if (PCustomer != NULL && PCustomer->id == PChar->BazaarCustomers[i].id)
        {
			PCustomer->pushPacket(new CBazaarClosePacket(PChar));
		}
	}
    PChar->BazaarCustomers.clear();

    PChar->status = STATUS_UPDATE;
	PChar->nameflags.flags &= ~FLAG_BAZAAR;
	PChar->pushPacket(new CCharUpdatePacket(PChar));
	return;
}

/************************************************************************
*																		*
*  Инициализация массива процедур                   					*
*																		*
************************************************************************/

void PacketParserInitialize()
{
    for (uint16 i = 0; i < 512; ++i)
    {
        PacketParser[i] = &SmallPacket0x000;
    }
    PacketParser[0x00A] = &SmallPacket0x00A;
    PacketParser[0x00C] = &SmallPacket0x00C;
    PacketParser[0x00D] = &SmallPacket0x00D;
    PacketParser[0x00F] = &SmallPacket0x00F;
    PacketParser[0x011] = &SmallPacket0x011;
    PacketParser[0x015] = &SmallPacket0x015;
    PacketParser[0x016] = &SmallPacket0x016;
    PacketParser[0x017] = &SmallPacket0x017;
    PacketParser[0x01A] = &SmallPacket0x01A;
    PacketParser[0x01B] = &SmallPacket0x01B;
    PacketParser[0x01C] = &SmallPacket0x01C;
    PacketParser[0x028] = &SmallPacket0x028;
    PacketParser[0x029] = &SmallPacket0x029;
    PacketParser[0x032] = &SmallPacket0x032;
    PacketParser[0x033] = &SmallPacket0x033;
    PacketParser[0x034] = &SmallPacket0x034;
    PacketParser[0x036] = &SmallPacket0x036;
    PacketParser[0x037] = &SmallPacket0x037;
    PacketParser[0x03A] = &SmallPacket0x03A;
    PacketParser[0x03C] = &SmallPacket0x03C;
    PacketParser[0x041] = &SmallPacket0x041;
    PacketParser[0x042] = &SmallPacket0x042;
    PacketParser[0x04B] = &SmallPacket0x04B;
    PacketParser[0x04D] = &SmallPacket0x04D;
    PacketParser[0x04E] = &SmallPacket0x04E;
    PacketParser[0x050] = &SmallPacket0x050;
    PacketParser[0x059] = &SmallPacket0x059;
    PacketParser[0x05A] = &SmallPacket0x05A;
    PacketParser[0x05B] = &SmallPacket0x05B;
    PacketParser[0x05C] = &SmallPacket0x05C;
    PacketParser[0x05D] = &SmallPacket0x05D;
    PacketParser[0x05E] = &SmallPacket0x05E;
    PacketParser[0x060] = &SmallPacket0x060;
    PacketParser[0x061] = &SmallPacket0x061;
    PacketParser[0x063] = &SmallPacket0x063;
    PacketParser[0x064] = &SmallPacket0x064;
    PacketParser[0x066] = &SmallPacket0x066;
    PacketParser[0x06E] = &SmallPacket0x06E;
    PacketParser[0x06F] = &SmallPacket0x06F;
    PacketParser[0x070] = &SmallPacket0x070;
    PacketParser[0x071] = &SmallPacket0x071;
    PacketParser[0x074] = &SmallPacket0x074;
    PacketParser[0x076] = &SmallPacket0x076;
    PacketParser[0x077] = &SmallPacket0x077;
    PacketParser[0x078] = &SmallPacket0x078;
    PacketParser[0x083] = &SmallPacket0x083;
    PacketParser[0x084] = &SmallPacket0x084;
    PacketParser[0x085] = &SmallPacket0x085;
    PacketParser[0x096] = &SmallPacket0x096;
    PacketParser[0x0A0] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x0A1] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x0A2] = &SmallPacket0x0A2;
    PacketParser[0x0AA] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x0AB] = &SmallPacket0x0AB;
    PacketParser[0x0AC] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x0AD] = &SmallPacket0x0AD;
    PacketParser[0x0B5] = &SmallPacket0x0B5;
    PacketParser[0x0B6] = &SmallPacket0x0B6;
    PacketParser[0x0BE] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x0C3] = &SmallPacket0x0C3;
    PacketParser[0x0C4] = &SmallPacket0x0C4;
    PacketParser[0x0CB] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x0D2] = &SmallPacket0x0D2;
    PacketParser[0x0D3] = &SmallPacket0x0D3;
    PacketParser[0x0D4] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x0DB] = &SmallPacket0x0DB;
    PacketParser[0x0DC] = &SmallPacket0x0DC;
    PacketParser[0x0DD] = &SmallPacket0x0DD;
    PacketParser[0x0DE] = &SmallPacket0x0DE;
    PacketParser[0x0E0] = &SmallPacket0x0E0;
    PacketParser[0x0E1] = &SmallPacket0x0E1;
    PacketParser[0x0E2] = &SmallPacket0x0E2;
    PacketParser[0x0E7] = &SmallPacket0x0E7;
    PacketParser[0x0E8] = &SmallPacket0x0E8;
    PacketParser[0x0EA] = &SmallPacket0x0EA;
    PacketParser[0x0F1] = &SmallPacket0x0F1;
    PacketParser[0x0F2] = &SmallPacket0x0F2;
    PacketParser[0x0F4] = &SmallPacket0x0F4;
    PacketParser[0x0F5] = &SmallPacket0x0F5;
    PacketParser[0x0F6] = &SmallPacket0x0F6;
    PacketParser[0x0FA] = &SmallPacket0x0FA;
    PacketParser[0x0FB] = &SmallPacket0x0FB;
    PacketParser[0x100] = &SmallPacket0x100;
    PacketParser[0x102] = &SmallPacket0xFFF;	// not implemented
    PacketParser[0x104] = &SmallPacket0x104;
    PacketParser[0x105] = &SmallPacket0x105;
    PacketParser[0x106] = &SmallPacket0x106;
    PacketParser[0x109] = &SmallPacket0x109;
    PacketParser[0x10A] = &SmallPacket0x10A;
    PacketParser[0x10B] = &SmallPacket0x10B;
}

/************************************************************************
*																		*
*																 		*
*																		*
************************************************************************/