----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Reaper
-- Note: Place holder Goblinsavior Heronox
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,764,3);
    checkGoVregime(player,mob,765,3);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
