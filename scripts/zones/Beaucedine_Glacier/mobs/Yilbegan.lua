-----------------------------------
-- Area: Beaucedine Glacier
--  MOB: Yilbegan
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.YILBEGAN_HIDEFLAYER);
end;