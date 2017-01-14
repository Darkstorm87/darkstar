-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Clipper
-----------------------------------

require("scripts/zones/Korroloka_Tunnel/MobIDs");
require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,731,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;

