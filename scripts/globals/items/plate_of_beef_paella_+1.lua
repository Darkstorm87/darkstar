-----------------------------------------
-- ID: 5973
-- Item: Plate of Beef Paella +1
-- Food Effect: 4 Hrs, All Races
-----------------------------------------
-- HP 45
-- Strength 6
-- Attack % 19 Cap 95
-- Undead Killer 6
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    local result = 0;
    if (target:hasStatusEffect(dsp.effect.FOOD) == true or target:hasStatusEffect(dsp.effect.FIELD_SUPPORT_FOOD) == true) then
        result = 246;
    end
    return result;
end;

function onItemUse(target)
    target:addStatusEffect(dsp.effect.FOOD,0,0,14400,5973);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 45);
    target:addMod(MOD_STR, 6);
    target:addMod(MOD_FOOD_ATTP, 19);
    target:addMod(MOD_FOOD_ATT_CAP, 95);
    target:addMod(MOD_UNDEAD_KILLER, 6);
end;

function onEffectLose(target, effect)
    target:delMod(MOD_HP, 45);
    target:delMod(MOD_STR, 6);
    target:delMod(MOD_FOOD_ATTP, 19);
    target:delMod(MOD_FOOD_ATT_CAP, 95);
    target:delMod(MOD_UNDEAD_KILLER, 6);
end;
