-----------------------------------
-- Area: Caedarva Mire
--   NM: Aynu-kaysey
-----------------------------------
mixins = {require("scripts/mixins/families/qutrub")}
-----------------------------------

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    mob:setRespawnTime(900) -- 2 to 4 hours
end