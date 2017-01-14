-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Garm
-----------------------------------

require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,612,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;

