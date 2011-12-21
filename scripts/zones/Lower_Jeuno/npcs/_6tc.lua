-----------------------------------
-- Area: Lower Jeuno
-- NPC:  Door: "Neptune's Spire"
-- @zone 245
-- @pos 35 0 -15
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:hasKeyItem(TENSHODO_MEMBERS_CARD) == true) then 
		player:startEvent(0x0069);
	else
		player:messageSpecial(DOOR_IS_LOCKED);
		return 1;
	end
end; 

-- 0x2726  0x2741  0x2742  0x2743  0x2753  0x276e  0x0054
-- 0x0009  0x000a  0x0056  0x0069  0x0014  0x009b  0x009c  0x009d  0x009e  0x009f

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



