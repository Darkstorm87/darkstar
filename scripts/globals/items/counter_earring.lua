-----------------------------------------
-- ID: 14786
-- Item: Counter Earring
-- Item Effect: Counter 5%
-- Duration: 3 Minutes
-----------------------------------------
require("scripts/globals/status")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if (effect ~= nil) then
        if (effect:getSubType() == 14786) then
            target:delStatusEffect(dsp.effect.ENCHANTMENT)
        end
    end
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14786)
    else
        target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,180,14786)
    end
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.COUNTER, 5)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.COUNTER, 5)
end