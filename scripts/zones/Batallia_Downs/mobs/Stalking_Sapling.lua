-----------------------------------
-- Area: Batallia Downs
--  MOB: Stalking Sapling
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Batallia_Downs/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,72,1);
    checkRegime(player,mob,73,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
