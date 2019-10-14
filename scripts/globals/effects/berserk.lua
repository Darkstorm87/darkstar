-----------------------------------
--
-- dsp.effect.BERSERK
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target,effect)
    local power = effect:getPower()
    target:addMod(dsp.mod.ATTP, power)
    target:addMod(dsp.mod.RATTP, power)
	
	if target:isMob() then
		target:addMod(dsp.mod.DEFP, -power)
	end
end

function onEffectTick(target,effect)
end

function onEffectLose(target,effect)
    local power = effect:getPower()
    target:delMod(dsp.mod.ATTP, power)
    target:delMod(dsp.mod.RATTP, power)
    	
	if target:isMob() then
		target:delMod(dsp.mod.DEFP, -power)
	end
end
