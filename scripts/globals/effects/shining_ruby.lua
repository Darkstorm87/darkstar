-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_DEFP,10);
    target:addMod(MOD_MDEF,4);
	target:addMod(MOD_LIGHTDEF,20);
	target:addMod(MOD_DARKDEF,20);
	target:addMod(MOD_QUAD_ATTACK,5);
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
    target:delMod(MOD_DEFP,10);
    target:delMod(MOD_MDEF,4);
	target:delMod(MOD_LIGHTDEF,20);
	target:delMod(MOD_DARKDEF,20);
	target:delMod(MOD_QUAD_ATTACK,5);
end;