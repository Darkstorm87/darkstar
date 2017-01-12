-----------------------------------
-- Area: West Ronfaure(100)
--  MOB: Scarab Beetle
-- Note: Place holder for Fungus Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/West_Ronfaure/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,3,1);
    checkRegime(player,mob,4,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
