-----------------------------------	
-- Area: Yhoator Jungle	
-- MOB:  Tonberry Chopper	
-----------------------------------	
	
require("/scripts/globals/fieldsofvalor");	
	
-----------------------------------	
-- onMobDeath	
-----------------------------------	
	
function onMobDeath(mob,killer)	
	checkRegime(killer,mob,133,1);
	kills = killer:getVar("EVERYONES_GRUDGE_KILLS");
	if(kills < 24) then
		killer:setVar("EVERYONES_GRUDGE_KILLS",kills + 1);
	end
end;	

