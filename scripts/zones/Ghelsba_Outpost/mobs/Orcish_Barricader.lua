-----------------------------------
-- Area: Ghelsba Outpost (140)
--  Mob: Orcish Barricader
-----------------------------------
require("scripts/globals/hunts")

function onMobDeath(mob, player, isKiller)
    tpz.hunts.checkHunt(mob, player, 171)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 70 to 95 min
end
