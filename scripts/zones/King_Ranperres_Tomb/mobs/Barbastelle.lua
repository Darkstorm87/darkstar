-----------------------------------
-- Area: King Ranperre's Tomb
--   NM: Barbastelle
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 30 to 90 minutes
end
