-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Creek Sahagin
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,127,1);
end;
