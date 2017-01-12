-----------------------------------
-- Area: La Theine Plateau
--  MOB: Poison Funguar
-----------------------------------

require("scripts/zones/La_Theine_Plateau/MobIDs");
require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,71,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;

