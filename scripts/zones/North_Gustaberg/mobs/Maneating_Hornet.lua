-----------------------------------
-- Area: North Gustaberg
--  MOB: Maneating Hornet
-- Note: Place Holder For Stinging Sophie
-----------------------------------

require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,17,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
