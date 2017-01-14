----------------------------------
-- Area: Gustav Tunnel
--  MOB: Antares
-- Note: Place holder Amikiri
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,768,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
