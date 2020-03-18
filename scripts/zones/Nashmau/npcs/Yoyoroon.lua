-----------------------------------
-- Area: Nashmau
--  NPC: Yoyoroon
-- Standard Merchant NPC
-----------------------------------
local ID = require("scripts/zones/Nashmau/IDs")
require("scripts/globals/shop")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local stock =
    {
        2239,  4940,    -- Tension Spring
        2243,  4940,    -- Loudspeaker
        2246,  4940,    -- Accelerator
        2251,  4940,    -- Armor Plate
        2254,  4940,    -- Stabilizer
        2258,  4940,    -- Mana Jammer
        2262,  4940,    -- Auto-Repair Kit
        2266,  4940,    -- Mana Tank
        2240,  9925,    -- Inhibitor
        9229,  9925,    -- Speedloader
        2242,  9925,    -- Mana Booster
        2247,  9925,    -- Scope
        2250,  9925,    -- Shock Absorber
        2255,  9925,    -- Volt Gun
        2260,  9925,    -- Stealth Screen
        2264,  9925,    -- Damage Gauge
        2268,  9925,    -- Mana Conserver
        2238, 19890,    -- Strobe
        2409, 19890,    -- Flame Holder
        2410, 19890,    -- Ice Maker
        2248, 19890,    -- Pattern Reader
        2411, 19890,    -- Replicator
        2252, 19890,    -- Analyzer
        2256, 19890,    -- Heat Seeker
        2259, 19890,    -- Heatsink
        2263, 19890,    -- Flashbulb
        2267, 19890,    -- Mana Converter
        2322, 1000000,  -- attuner
        2323, 1000000,  -- tactical_processor
        2324, 1000000,  -- drum_magazine
        2325, 1000000,  -- equalizer
        2326, 1000000,  -- target_marker
        2327, 1000000,  -- mana_channeler
        2328, 1000000,  -- eraser
        2329, 1000000,  -- smoke_screen
        3307, 1000000,  -- heat_capacitor
        3309, 1000000,  -- barrage_turbine
        3312, 1000000,  -- percolator
        3313, 1000000,  -- vivi-valve
        3314, 1000000,  -- disruptor
        2353, 1000000,  -- optic fiber
        9234, 100000000,  -- optic fiber II
    }

    player:showText(npc, ID.text.YOYOROON_SHOP_DIALOG)
    tpz.shop.general(player, stock)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end
