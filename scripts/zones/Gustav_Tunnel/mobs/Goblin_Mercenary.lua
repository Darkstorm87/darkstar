----------------------------------
-- Area: Gustav Tunnel
--  MOB: Goblin Mercenary
-- Note: Place holder Wyvernpoacher Drachlox
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
