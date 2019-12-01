-----------------------------------
--
--     dsp.effect.WEIGHT
--
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onEffectGain(target, effect)
    target:addMod(dsp.mod.MOVE, -effect:getPower())
	
	if target:isMob() then
		local power = math.min(10, target:getStat(dsp.mod.EVA))
		effect:setSubPower(power)
		target:delMod(dsp.mod.EVA, power)
	end
end

function onEffectTick(target, effect)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MOVE, -effect:getPower())
	
	if target:isMob() then
		local power = effect:getSubPower()
		target:addMod(dsp.mod.EVA, power)
	end
end