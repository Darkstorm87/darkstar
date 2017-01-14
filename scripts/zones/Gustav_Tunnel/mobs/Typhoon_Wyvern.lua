----------------------------------
-- Area: Gustav Tunnel
--  MOB: Typhoon Wyvern
-- Note: Place holder Ungur
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Gustav_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,769,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
