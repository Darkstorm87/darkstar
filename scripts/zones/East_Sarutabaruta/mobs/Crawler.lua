-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Crawler
-- Note: PH for Spiny Spipi
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,92,2);
    checkRegime(player,mob,93,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
