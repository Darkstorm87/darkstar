-----------------------------------------
-- ID: 5473
-- Item: Bastore Sweeper
-- Food Effect: 5 Min, Mithra only
-----------------------------------------
-- Dexterity -5
-- Vitality +3
-- Defense +15% Cap 50
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:getRace() ~= 7) then
        result = 247;
    end
    if (target:getMod(MOD_EAT_RAW_FISH) == 1) then
        result = 0;
    end
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,300,5473);
end;

function onEffectGain(target, effect)
    target:addMod(MOD_DEX, -5);
    target:addMod(MOD_VIT, 3);
    target:addMod(MOD_FOOD_DEFP, 15);
    target:addMod(MOD_FOOD_DEF_CAP, 50);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_DEX, -5);
    target:delMod(MOD_VIT, 3);
    target:delMod(MOD_FOOD_DEFP, 15);
    target:delMod(MOD_FOOD_DEF_CAP, 50);
end;
