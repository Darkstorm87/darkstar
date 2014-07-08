-----------------------------------
--
-- 	EFFECT_DEDICATION
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
	target:addMod(MOD_DEDICATION, effect:getPower());
	target:addMod(MOD_DEDICATION_CAP, effect:getSubPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
	target:delMod(MOD_DEDICATION, effect:getPower())
	target:delMod(MOD_DEDICATION_CAP, effect:getSubPower());
end;