-----------------------------------
-- Area: Yuhtunga Jungle
--  MOB: Young Opo-opo
-- Note: PH for Mischievous Micholas
-----------------------------------
local ID = require("scripts/zones/Yuhtunga_Jungle/IDs");
require("scripts/globals/fieldsofvalor");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,126,1);
    checkRegime(player,mob,128,1);
end;

function onMobDespawn(mob)
    phOnDespawn(mob,ID.mob.MISCHIEVOUS_MICHOLAS_PH,20,3600); -- 1 hour
end;
