-----------------------------------------
-- ID: 4315
-- Item: Lungfish
-- Food Effect: 5Min, Mithra only
-----------------------------------------
-- Dexterity -2
-- Mind 4
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    elseif (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    if (target:getMod(MOD_EAT_RAW_FISH) == 1) then
        result = 0;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,4315);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, -2);
    target:addMod(MOD_MND, 4);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, -2);
    target:delMod(MOD_MND, 4);
end;
