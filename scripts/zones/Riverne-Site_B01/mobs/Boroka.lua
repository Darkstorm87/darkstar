-----------------------------------
-- Area: Riverne - Site B01
--   NM: Boroka
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.BOROKA_BELEAGUERER);
    mob:setRespawnTime(900); -- 21-24 hour respawn
end;