-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Thierride
-- Quest NPC
-----------------------------------
require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
if (player:getQuestStatus(0,100) == 1) then
	count = trade:getItemCount();
		carta = trade:hasItemQty(4358, 5);
		gil = trade:getGil();
		if (carta and count == 5 and gil == 0) then
			player:startEvent(0x0319);
			end
			end
			end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	conejo = player:getQuestStatus(0,100);
	if (conejo == 0) then
	player:startEvent(0x0318);
	end
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
 if (csid == 0x0318) then
     player:getQuestStatus(0,100);
    player:addQuest(100);
 elseif (csid == 0x0319) then
  player:completeQuest(0,100);
  player:addFame(0,SAN_FAME*30);
  player:tradeComplete();
  player:addGil(GIL_RATE*150);
  player:messageSpecial(6404,GIL_RATE*150);
end
end;
