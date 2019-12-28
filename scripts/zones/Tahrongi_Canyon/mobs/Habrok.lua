-----------------------------------
-- Area: Tahrongi Canyon
--  Mob: Habrok
-----------------------------------

function onMobInitialize(mob)
    mob:setLocalVar("pop", os.time() + 900)
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setLocalVar("pop", os.time() + 900)
end
