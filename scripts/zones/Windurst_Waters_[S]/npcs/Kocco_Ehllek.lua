-----------------------------------
-- Area: Windurst Waters (S)
--   NPC: Kocco Ehllek
-- Type: Quest Giver
-- !pos -41.465 -2.125 -163.018 94
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(140);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

