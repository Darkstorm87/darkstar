-----------------------------------	
-- Area: Kuftal Tunnel
-- MOB:  Cave Worm	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,737,1);
end;	