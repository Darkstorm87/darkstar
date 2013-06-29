-----------------------------------
--  Area: West Ronfaure (100)
--    NM: Jaggedy-Eared_Jack
-----------------------------------

require("/scripts/globals/fieldsofvalor");	

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,2,1);
    
    -- Set Jaggedy-Eared_Jack's Window Open Time, and disable respawn
    wait = math.random((3000),(21600));
    SetServerVariable("[POP]Jaggedy_Eared_Jack", os.time(t) + wait); -- 50 minutes - 6 hours
    DeterMob(mob:getID(), true);
    
    -- Set PH back to normal, then set to respawn spawn
    PH = GetServerVariable("[PH]Jaggedy_Eared_Jack");
    SetServerVariable("[PH]Jaggedy_Eared_Jack", 0);
    DeterMob(PH, false);
    SpawnMob(PH, '', GetMobRespawnTime(PH));
end;

