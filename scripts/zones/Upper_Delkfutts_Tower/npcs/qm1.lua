-----------------------------------
-- Area: Upper Delkfutt's Tower
-- NPC:  ???
-- !pos -300 -175 22 158
-----------------------------------
local ID = require("scripts/zones/Upper_Delkfutts_Tower/IDs");
require("scripts/globals/status");

function onTrade(player,npc,trade)
    -- Trade moldy buckler
    if (not GetMobByID(ID.mob.ALKYONEUS):isSpawned() and trade:hasItemQty(2385,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(ID.mob.ALKYONEUS):updateClaim(player);
        npc:setStatus(dsp.status.DISAPPEAR);
    end
end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
