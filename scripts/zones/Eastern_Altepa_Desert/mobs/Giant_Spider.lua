-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Giant Spider
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Eastern_Altepa_Desert/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,109,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

end;
