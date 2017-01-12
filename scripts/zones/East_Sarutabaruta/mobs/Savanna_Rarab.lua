-----------------------------------
-- Area: East Sarutabaruta
--  MOB: Savanna Rarab
-- Note: PH for Sharp Eared Ropipi
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Sarutabaruta/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,91,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
