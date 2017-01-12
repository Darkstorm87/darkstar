-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Shoal Pugil
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Buburimu_Peninsula/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,62,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
