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
			player:PrintSayToPlayer(npc,npc:getID());
			
			local message = "Need to check for item augments now";
			player:PrintSayToPlayer(npc,message);
			
		end
	end

end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local npcid = npc:getID();
	local message = "Do you wish to ascend? Yesss, we can help you.\n"

	if (npcid == 17736005) then
		message = message .. 'This one can make you stronger.'
		player:PrintSayToPlayer(npc,npcid);
	elseif (npcid == 17736012) then
		message = message .. 'This one can fortify you.'
		player:PrintSayToPlayer(npc,npcid);
	elseif (npcid == 17736007) then
		message = message .. 'This one can hone your martial skills.'
		player:PrintSayToPlayer(npc,npcid);
	end
	player:PrintSayToPlayer(npc,message);
	
	message = 'For a price and a simple rare trinket, we can enhance your equipment.'
	player:PrintSayToPlayer(npc,message);
	
	message = 'Let me have a closer look at a piece of your equipment and we can discuss what i can do for you.'
	player:PrintSayToPlayer(npc,message);
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

