-----------------------------------
-- Area: Metalworks
-- NPC:  Raibaht
-- Starts and Finishes Quest: Dark Legacy
-- Involved in Quest: The Usual, Riding on the Clouds
-- @zone 237
-- @pos -27 -10 -1
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Metalworks/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(JEUNO,RIDING_ON_THE_CLOUDS) == QUEST_ACCEPTED and player:getVar("ridingOnTheClouds_2") == 7) then
		if(trade:hasItemQty(1127,1) and trade:getItemCount() == 1) then -- Trade Kindred seal
			player:setVar("ridingOnTheClouds_2",0);
			player:addKeyItem(SMILING_STONE);
			player:messageSpecial(KEYITEM_OBTAINED,SMILING_STONE);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	darkLegacy = player:getQuestStatus(BASTOK,DARK_LEGACY);
	
	mLvl = player:getMainLvl();
	mJob = player:getMainJob();
	
	if(darkLegacy == QUEST_AVAILABLE and mJob == 8 and mLvl >= AF1_QUEST_LEVEL) then
		player:startEvent(0x02ef); -- Start Quest "Dark Legacy"
	elseif(player:hasKeyItem(DARKSTEEL_FORMULA)) then
		player:startEvent(0x02f3); -- Finish Quest "Dark Legacy"
	elseif(player:hasKeyItem(STEAMING_SHEEP_INVITATION) and player:getVar("TheUsual_Event") ~= 1) then
		player:startEvent(0x01fe);
	else
		player:startEvent(0x01f5);
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

	if(csid == 0x01fe and option == 0) then
		player:setVar("TheUsual_Event",1);
	elseif(csid == 0x02ef) then
		player:addQuest(BASTOK,DARK_LEGACY);
		player:setVar("darkLegacyCS",1);
	elseif(csid == 0x02f3) then
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16798); -- Raven Scythe
		else
			player:delKeyItem(DARKSTEEL_FORMULA);
			player:addItem(16798);
			player:messageSpecial(ITEM_OBTAINED, 16798); -- Raven Scythe
			player:setVar("darkLegacyCS",0);
			player:addFame(BASTOK,AF1_FAME);
			player:completeQuest(BASTOK,DARK_LEGACY);
		end
	end

end;