-----------------------------------
-- Area: Toraimarai Canal
--  NM:  Magic Sludge
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    player:setVar("***REMOVED***Problem",3);
end;