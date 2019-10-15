-----------------------------------
-- Area: Yhoator Jungle (124)
--   NM: Powderer Penny
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 90 to 120 minutes
end
