-----------------------------------------
--  ID: 4199
--  Item: Strength Potion
-----------------------------------------
--  Strength 7
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
        if (target:hasStatusEffect(EFFECT_MEDICINE) == true) then
                result = 111;
        end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
        target:addStatusEffect(EFFECT_MEDICINE,0,0,900);
end;

-----------------------------------------
-- onEffectGain Action
-----------------------------------------

function onEffectGain(target,effect)
        target:addMod(MOD_STR, 7);
end;

-----------------------------------------
-- onEffectLose Action
-----------------------------------------

function onEffectLose(target,effect)
        target:delMod(MOD_STR, 7);
end;