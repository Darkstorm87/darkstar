-----------------------------------
-- Area: Dynamis Valkurm
--  MOB: Vanguard_Ambusher
-----------------------------------
mixins = {require("scripts/mixins/dynamis_beastmen")}
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_GOBLIN)
end

function onMobDeath(mob, player, isKiller)
end