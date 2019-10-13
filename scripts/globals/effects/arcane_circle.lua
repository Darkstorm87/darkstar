-----------------------------------
--
-- dsp.effect.ARCANE_CIRCLE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(dsp.mod.ARCANA_KILLER, effect:getPower())
   target:addMod(MOD_CRITHITRATE,effect:getSubPower());
   target:addMod(MOD_CRIT_DMG_INCREASE,effect:getSubPower());
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
   target:delMod(dsp.mod.ARCANA_KILLER, effect:getPower())
   target:delMod(MOD_CRITHITRATE, effect:getSubPower());
   target:delMod(MOD_CRIT_DMG_INCREASE, effect:getSubPower());
end
