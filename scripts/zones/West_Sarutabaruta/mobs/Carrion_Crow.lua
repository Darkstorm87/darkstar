-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Carrion Crow
-- Note: PH for Nunyenunc
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,28,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
