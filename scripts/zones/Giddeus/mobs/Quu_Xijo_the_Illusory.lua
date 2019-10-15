-----------------------------------
-- Area: Giddeus (145)
--   NM: Quu Xijo the Illusory
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 60 to 70 minutes
end
