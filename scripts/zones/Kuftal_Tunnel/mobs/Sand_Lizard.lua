-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Sand Lizard
-- Note: Place Holder for Amemet
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,735,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
