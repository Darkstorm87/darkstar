-----------------------------------
-- Area: Castle Oztroja [S]
--   NM: Fleshgnasher
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(900) -- 2 to 4 hours
end
