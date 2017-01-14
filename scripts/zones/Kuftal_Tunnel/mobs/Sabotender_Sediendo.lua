-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Sabotender Sediendo
-- Note: Place Holder for Sabotender Mariachi
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,738,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
