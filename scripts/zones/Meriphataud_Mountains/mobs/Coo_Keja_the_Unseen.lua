-----------------------------------
--  Area: Meriphataud Mountains (119)
--   Mob: Coo_Keja_the_Unseen
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    -- Set Coo_Keja_the_Unseen's spawnpoint and respawn time (21-24 hours)
    UpdateNMSpawnPoint(mob:getID());
    mob:setRespawnTime(math.random((75600),(86400)));

end;

