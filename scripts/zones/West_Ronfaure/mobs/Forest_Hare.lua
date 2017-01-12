-----------------------------------
-- Area: West Ronfaure
--  MOB: Forest Hare
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,2,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
