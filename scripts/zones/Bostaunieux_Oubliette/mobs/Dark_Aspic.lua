-----------------------------------
-- Area: Bostaunieux Oubliette (167)
--  Mob: Dark_Aspic
-----------------------------------

require("scripts/zones/Bostaunieux_Oubliette/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,610,1); -- Check GOV Page

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;

