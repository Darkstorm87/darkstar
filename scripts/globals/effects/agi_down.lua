-----------------------------------
--
-- 	EFFECT_AGI_DOWN
-- 	
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	if((target:getMod(MOD_AGI) - effect:getPower()) < 0) then
		effect:setPower(target:getMod(MOD_AGI));
	end
	target:addMod(MOD_AGI,-effect:getPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
	-- the effect restore agility of 1 every 3 ticks.
	downAGI_effect_size = effect:getPower()
	if(downAGI_effect_size > 0) then
		effect:setPower(downAGI_effect_size - 1)
		target:delMod(MOD_AGI,-1);
	end
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	downAGI_effect_size = effect:getPower()
	if(downAGI_effect_size > 0) then
		target:delMod(MOD_AGI,-effect:getPower());
	end
end;