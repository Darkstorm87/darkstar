-----------------------------------
-- Area: Lower Delkfutt's Tower
-- MOB:  Gigas Sculptor
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
   checkGoVregime(killer,mob,778,2);
end;