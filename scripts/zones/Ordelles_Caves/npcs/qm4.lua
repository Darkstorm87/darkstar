-----------------------------------
-- Area: Ordelles Caves
-- NPC:  ???
-- Involved In Quest: Dark Puppet
-- @zone 193
-- @pos -52 27 -85
-----------------------------------
package.loaded["scripts/zones/Ordelles_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Ordelles_Caves/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if(player:getVar("darkPuppetCS") >= 2 and player:hasItem(16681) == false) then
		if(trade:hasItemQty(654,1) and trade:getItemCount() == 1) then -- Trade Darksteel Ingot
			player:tradeComplete();
			player:messageSpecial(GERWITZS_AXE_DIALOG);
			SpawnMob(17568135,180):updateEnmity(player);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(THERE_IS_NOTHING_ORDINARY);
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
end;