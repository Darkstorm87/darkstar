-----------------------------------	
-- Area: Ifrit's Cauldron
-- MOB:  Ash Lizard	
-----------------------------------	

require("scripts/globals/groundsofvalor");	

-----------------------------------	
-- onMobDeath	
-----------------------------------	

function onMobDeath(mob,killer)	
	checkRegime(killer,mob,761,1);
end;	