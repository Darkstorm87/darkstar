-----------------------------------
-- Area: Caedarva Mire
--  MOB: Khimaira
-----------------------------------
require("scripts/globals/titles");

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.titles.KHIMAIRA_CARVER);
end;

function onMobDespawn(mob)
    mob:setRespawnTime(math.random(48,72) * 3600); -- 48 to 72 hours, in 1-hour increments
end;
