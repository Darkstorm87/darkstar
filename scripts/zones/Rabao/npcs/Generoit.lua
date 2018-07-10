-----------------------------------
-- Area: Rabao
--  NPC: Generoit
-- Standard Merchant NPC
-----------------------------------
require("scripts/globals/shop");
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Rabao/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    player:showText(npc,GENEROIT_SHOP_DIALOG);

    local stock =
    {
        4545,61,    -- Gysahl Greens
     840,7,    -- Chocobo Feather
     17016,10,    -- Pet Food Alpha Biscuit
     17017,81,    -- Pet Food Beta Biscuit
     17860,81,    -- Carrot Broth
     17862,687,    -- Bug Broth
     17864,125,    -- Herbal Broth
     17866,687,    -- Carrion Broth
     5073,50784}    -- Scroll of Chocobo Mazurka

    dsp.shop.general(player, stock);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

