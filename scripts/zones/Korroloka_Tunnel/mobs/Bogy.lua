-----------------------------------
-- Area: Korroloka Tunnel (173)
--  Mob: Bogy
-----------------------------------

require("scripts/zones/Korroloka_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,732,1);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

end;

