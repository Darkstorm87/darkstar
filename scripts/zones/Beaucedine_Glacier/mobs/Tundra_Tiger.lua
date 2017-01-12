-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Tundra Tiger
-- Note: PH for Nue, Kirata
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Beaucedine_Glacier/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,46,1);
    checkRegime(player,mob,47,1);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
