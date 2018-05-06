-----------------------------------
-- Area: Bhaflau Thickets
--  NPC: ??? (Spawn Livid***REMOVED*** Amooshah(ZNM T2))
-- !pos 334 -10 184 52
-----------------------------------
package.loaded["scripts/zones/Bhaflau_Thickets/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/TextIDs");
require("scripts/globals/status");
-----------------------------------

function onTrade(player,npc,trade)
    local mobID = 16990473;
    if (trade:hasItemQty(2578,1) and trade:getItemCount() == 1) then -- Trade Oily Blood
        if (GetMobAction(mobID) == dsp.act.NONE) then
            player:tradeComplete();
            SpawnMob(mobID):updateClaim(player);
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_HAPPENS);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;