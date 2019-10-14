-----------------------------------
--
-- dsp.effect.ARCANE_CIRCLE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(dsp.mod.ARCANA_KILLER, effect:getPower())
   target:addMod(dsp.mod.CRITHITRATE,effect:getSubPower());
   target:addMod(dsp.mod.CRIT_DMG_INCREASE,effect:getSubPower());
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
   target:delMod(dsp.mod.ARCANA_KILLER, effect:getPower())
   target:delMod(dsp.mod.CRITHITRATE, effect:getSubPower());
   target:delMod(dsp.mod.CRIT_DMG_INCREASE, effect:getSubPower());
end
