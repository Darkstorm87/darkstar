-----------------------------------
-- Area: Inner Horutoto Ruins
--   NM: Maltha
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 1 to 2 hours
end