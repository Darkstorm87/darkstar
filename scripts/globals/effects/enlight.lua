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
    target:addMod(MOD_ENSPELL,7);
    target:addMod(MOD_ENSPELL_DMG,effect:getPower());
	target:addMod(MOD_ACC,effect:getPower());
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
    target:setMod(MOD_ENSPELL_DMG,0);
    target:setMod(MOD_ENSPELL,0);
	
	local boostACC_effect_size = effect:getPower();
    if (boostACC_effect_size > 0) then
        target:delMod(MOD_ACC,effect:getPower());
    end
end;