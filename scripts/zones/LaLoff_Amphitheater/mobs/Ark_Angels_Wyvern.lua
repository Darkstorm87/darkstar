-----------------------------------
-- Area: LaLoff Amphitheater
--  MOB: Ark Angel's Wyvern
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)
    local mobid = mob:getID()

    for member = mobid-7, mobid do
        if (GetMobAction(member) == 16) then
            GetMobByID(member):updateEnmity(target);
        end
    end
end;

function onMobFight(mob,target)

end;

function onMobDeath(mob, player, isKiller)
end;
