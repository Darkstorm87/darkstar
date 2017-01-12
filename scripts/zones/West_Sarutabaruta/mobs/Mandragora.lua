-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Mandragora
-- Note: PH for Tom Tit Tat
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,26,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
