-----------------------------------
-- Area: Ru'Aun Gardens
--   NM: Genbu
-----------------------------------
local ID = require("scripts/zones/RuAun_Gardens/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENWATER)
end

function onMobDeath(mob, player, isKiller)
    player:showText(mob, ID.text.SKY_GOD_OFFSET + 6)
end