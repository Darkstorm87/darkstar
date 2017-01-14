-----------------------------------
-- Area: Labyrinth of Onzozo
--  MOB: Torama
-- Note: Place holder Ose
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Labyrinth_of_Onzozo/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,775,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
