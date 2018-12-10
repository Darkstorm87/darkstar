-----------------------------------
-- Area: Lufaise_Meadows
--  MOB: Gigantobugard
-- Note: PH for Megalobugard
-----------------------------------
local ID = require("scripts/zones/Lufaise_Meadows/IDs")
require("scripts/globals/mobs")
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    phOnDespawn(mob, ID.mob.MEGALOBUGARD_PH, 10, 3600) -- 1 hour
end