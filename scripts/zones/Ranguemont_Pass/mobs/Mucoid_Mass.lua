-----------------------------------
-- Area: Ranguemont Pass
--  Mob: Mucoid Mass
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setRespawnTime(900); -- 90 to 100 minutes
end;
