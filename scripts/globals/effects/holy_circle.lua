-----------------------------------
--
--     dsp.effect.HOLY_CIRCLE
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(dsp.mod.UNDEAD_KILLER, effect:getPower())
   target:addMod(dsp.mod.ENMITY,-effect:getSubPower());
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
   target:delMod(dsp.mod.UNDEAD_KILLER, effect:getPower())
   target:delMod(dsp.mod.ENMITY,-effect:getSubPower());
end
