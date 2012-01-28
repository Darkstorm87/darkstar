-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Explorer Moogle
-- 
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/teleports");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end; 

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc) 

accept = 0;
event  = 0x035e;
	
	if (player:getGil() < 300)then
		accept = 1;
	end
	if (player:getMainLvl() < EXPLORER_MOOGLE_LEVELCAP) then
		event = event + 1;
	end
	player:startEvent(event,player:getZone(),0,accept);	
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

	if (csid == 0x035e) then
		if (option == 1) then		
			toExplorerMoogle(player,231);
			player:delGil(300);
		elseif (option == 2) then	
			toExplorerMoogle(player,234);
			player:delGil(300);
		elseif (option == 3) then	
			toExplorerMoogle(player,240);
			player:delGil(300);
		elseif (option == 4) then	
			toExplorerMoogle(player,248);
			player:delGil(300);
		elseif (option == 5) then	
			toExplorerMoogle(player,249);
			player:delGil(300);
		end
	end
end;