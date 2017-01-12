-----------------------------------
-- Area: Rolanberry Fields
--  MOB: Ochu
-- Note: PH for Drooling Daisy
-----------------------------------

require("scripts/globals/fieldsofvalor");
require("scripts/zones/Rolanberry_Fields/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player,mob,88,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
