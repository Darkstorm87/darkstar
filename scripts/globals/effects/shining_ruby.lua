-----------------------------------
--
--
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(dsp.mod.DEFP,10)
    target:addMod(dsp.mod.MDEF,4)
	target:addMod(dsp.mod.LIGHTDEF,20);
	target:addMod(dsp.mod.DARKDEF,20);
	target:addMod(dsp.mod.QUAD_ATTACK,5);
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    target:delMod(dsp.mod.DEFP,10)
    target:delMod(dsp.mod.MDEF,4)
	target:delMod(dsp.mod.LIGHTDEF,20);
	target:delMod(dsp.mod.DARKDEF,20);
	target:delMod(dsp.mod.QUAD_ATTACK,5);
end