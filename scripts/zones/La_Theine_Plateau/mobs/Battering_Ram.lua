-----------------------------------
-- Area: La Theine Plateau
--  Mob: Battering Ram
-----------------------------------
local ID = require("scripts/zones/La_Theine_Plateau/IDs");
-----------------------------------
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    dsp.mob.phOnDespawn(mob, ID.mob.LUMBERING_LAMBERT_PH, 10, 900) -- 20 min
end