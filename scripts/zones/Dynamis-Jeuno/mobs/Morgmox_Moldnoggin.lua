-----------------------------------
-- Area: Dynamis Jeuno
--  MOB: Morgmox_Moldnoggin
-----------------------------------
mixins =
{
    require("scripts/mixins/dynamis_beastmen"),
    require("scripts/mixins/job_special")
}
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.ASTRAL_FLOW_MAAT)
end

function onMobDeath(mob, player, isKiller)
end