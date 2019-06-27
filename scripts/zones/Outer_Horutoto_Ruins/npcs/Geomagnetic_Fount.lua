-----------------------------------
-- Area: Outer Horutoto Ruins
--  NPC: Geomagnetic Fount
-----------------------------------
local ID = require("scripts/zones/Outer_Horutoto_Ruins/IDs")
require("scripts/globals/geomagnetic_fount")
-----------------------------------

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.geomagnetic_fount.check_fount(player)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
end