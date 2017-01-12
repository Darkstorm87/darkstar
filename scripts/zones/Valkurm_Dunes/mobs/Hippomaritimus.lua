-----------------------------------
-- Area: Valkurm Dunes
--  MOB: Hippomaritimus
-----------------------------------

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID());
end;
