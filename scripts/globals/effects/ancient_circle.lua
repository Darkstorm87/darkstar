-----------------------------------
--
-- dsp.effect.ANCIENT_CIRCLE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(dsp.mod.DRAGON_KILLER, effect:getPower())
   target:addMod(MOD_ACC,effect:getSubPower());
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
   target:delMod(dsp.mod.DRAGON_KILLER, effect:getPower())
   target:delMod(MOD_ACC,effect:getSubPower());
end
