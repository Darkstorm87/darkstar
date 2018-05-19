-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Tombstone
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Chateau_dOraguille/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
player:messageSpecial(TOMBSTONE);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

