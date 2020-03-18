-----------------------------------
-- Area: East Sarutabaruta (116)
--   NM: Duke Decapod
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    mob:setRespawnTime(900);
end;
