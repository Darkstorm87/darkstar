-----------------------------------
-- Area: Valkurm Dunes
--  Mob: Hippomaritimus
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
	mob:setRespawnTime(900); -- 60-90min repop
end;
