----------------------------------
-- Area: Labyrinth of Onzozo
--   NM: Soulstealer Skullnix
-----------------------------------

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,771,2);
    checkGoVregime(player,mob,772,2);
    checkGoVregime(player,mob,774,2);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
