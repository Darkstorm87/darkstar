-----------------------------------
-- Area:
--  MOB: Krabkatoa
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.titles.KRABKATOA_STEAMER);
end;