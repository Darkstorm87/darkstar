-----------------------------------
-- Area: Carpenters' Landing
--   NM: Tempest Tigon
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 1 to 2 hours
end
