----------------------------------	
-- Area: Gustav Tunnel	
--  MOB: Doom Warlock
-- Note: Place holder Taxim
-----------------------------------	

require("/scripts/zones/Gustav_Tunnel/MobIDs");
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
  
	checkRegime(killer,mob,765,2);
	checkRegime(killer,mob,766,1);
	checkRegime(killer,mob,769,1);
  
    local mob = mob:getID();
    if (Taxim_PH[mob] ~= nil) then

        local ToD = GetServerVariable("[POP]Taxim");
        if (ToD <= os.time(t) and GetMobAction(Taxim) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Taxim);
                GetMobByID(Taxim):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Taxim", mob);
                DeterMob(mob, true);
            end
        end
    end
  
end;	
