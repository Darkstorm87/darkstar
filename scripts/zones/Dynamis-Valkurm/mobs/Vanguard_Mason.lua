-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Vanguard_Mason
-----------------------------------
mixins = {require("scripts/mixins/dynamis_beastmen")}
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_QUADAV)
    mob:setLocalVar("dynamis_currency", 1455)
end

function onMobDeath(mob, player, isKiller)
end