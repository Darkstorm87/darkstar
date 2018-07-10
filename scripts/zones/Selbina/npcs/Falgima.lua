-----------------------------------
-- Area: Selbina
--  NPC: Falgima
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Selbina/TextIDs");
require("scripts/globals/shop");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,FALGIMA_SHOP_DIALOG);

    local stock =
    {
        4744,5351,        -- Scroll of Invisible
     4745,2325,        -- Scroll of Sneak
     4746,1204,        -- Scroll of Deodorize
     5104,30360}        -- Scroll of Flurry

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;