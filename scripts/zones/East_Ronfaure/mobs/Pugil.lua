-----------------------------------
-- Area: East Ronfaure
--  MOB: Pugil
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/East_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,64,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
