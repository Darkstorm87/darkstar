-----------------------------------
-- Area: Bastok Mines
-- NPC: Disjoined One
-- Made into a Custom Augment NPC
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/status");
-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if (trade:getItemCount() == 1) then
		local item = trade:getItem();
		if (item:isType(ITEM_ARMOR) and item:getSkillType() ~= SKILL_THR) then
			local npcId = npc:getID();
			player:PrintToPlayer(npc:getID());
			
			local message = "Need to check for item augments now";
			player:PrintToPlayer(message);
			
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local npcId = npc:getID();
	local message = "Do you wish to ascend? Yesss, we can help you.\n"

	if (npcId == 17736005) then
		message = message .. 'This One can make you stronger.'
		player:PrintToPlayer(npc:getID());
	elseif (npcId == 17736012) then
		message = message .. 'This One can fortify you.'
		player:PrintToPlayer(npc:getID());
	elseif (npcId == 17736007) then
		message = message .. 'This One can hone your martial skills.'
		player:PrintToPlayer(npc:getID());
	end
	player:PrintToPlayer(message);
	
	message = 'For a price and a simple rare trinket, we can enhance your equipment.'
	player:PrintToPlayer(message);
	
	message = 'Let me have a closer look at a piece of your equipment and we can discuss what I can do for you.'
	player:PrintToPlayer(message);
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

