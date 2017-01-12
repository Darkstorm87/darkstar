-----------------------------------
-- Area: North Gustaberg
--  MOB: Walking Sapling
-- Note: Place Holder For Maighdean Uaine
-----------------------------------

require("scripts/zones/North_Gustaberg/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,18,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
