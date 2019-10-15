-----------------------------------
-- Area: East Ronfaure [S]
--   NM: Melusine
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900)
end
