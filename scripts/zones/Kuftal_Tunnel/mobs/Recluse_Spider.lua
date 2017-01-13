-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Recluse Spider
-- Note: Place Holder for Arachne
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,737,2);
    checkGoVregime(player,mob,739,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
