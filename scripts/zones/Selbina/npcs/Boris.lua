----------------------------------
--  Area: Selbina
--  NPC: Boris
--  Type: Item Deliverer
--  @zone: 248
--  @pos: 61.074 -14.655 -7.1
--
-----------------------------------

package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:showText(npc, BORIS_DELIVERY_DIALOG);
	player:openSendBox();
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

