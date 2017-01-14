-----------------------------------
-- Area: Kuftal Tunnel
--  MOB: Goblin Mercenary
-- Note: Place Holder for Bloodthirster Madkix
-----------------------------------

require("scripts/globals/groundsofvalor");
require("scripts/zones/Kuftal_Tunnel/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkGoVregime(player,mob,740,2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
