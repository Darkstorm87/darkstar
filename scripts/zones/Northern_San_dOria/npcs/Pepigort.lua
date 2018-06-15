-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Pepigort
-- Type: Standard Dialogue NPC
--  @zone 231
-- !pos -126.739 11.999 262.757
--
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc,PEPIGORT_DIALOG);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

