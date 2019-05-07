-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: ??? (Beastmen Treasure qm7/chest4)
--   ID: 17281646
-- !pos -577.734 -0.706 -82.563 123
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs")

function onTrigger(player,npc)
    dsp.bmt.handleQmOnTrigger(player, npc, ID.text.SOMETHING_IS_BURIED_HERE, ID.text.NOTHING_OUT_OF_ORDINARY)
end

function onTrade(player,npc,trade)
    dsp.bmt.handleQmOnTrade(player,npc,trade)
end

function onEventFinish(player,csid)
    dsp.bmt.handleQmOnEventFinish(player,csid)
end
