-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Tabar Beak
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Sauromugue_Champaign/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,100,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
