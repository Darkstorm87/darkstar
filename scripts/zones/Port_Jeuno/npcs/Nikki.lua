-----------------------------------
-- Area: Port Jeuno
--  NPC: Nikki
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_Jeuno/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Port_Jeuno/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(52);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

