-----------------------------------
--
--     dsp.effect.WARDING_CIRCLE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(dsp.mod.DEMON_KILLER, effect:getPower())
   target:addMod(dsp.mod.STORETP,effect:getSubPower());
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
   target:delMod(dsp.mod.DEMON_KILLER, effect:getPower())
   target:delMod(dsp.mod.STORETP,effect:getSubPower());
end
