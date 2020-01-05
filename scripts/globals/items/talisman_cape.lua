-----------------------------------------
-- ID: 15485
-- Item: Talisman Cape
-- Item Effect: Enchantment MP+12 Enmity-2
-----------------------------------------
require("scripts/globals/msg")

function onItemCheck(target)
    local effect = target:getStatusEffect(dsp.effect.ENCHANTMENT)
    if effect ~= nil and effect:getSubType() == 15485 then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    return 0
end

function onItemUse(target)
    if (target:hasStatusEffect(dsp.effect.ENCHANTMENT) == true) then
        target:delStatusEffect(dsp.effect.ENCHANTMENT)
    end
    
    target:addStatusEffect(dsp.effect.ENCHANTMENT,0,0,1800,15485)
end

function onEffectGain(target,effect)
    target:addMod(dsp.mod.MP, 12)
    target:addMod(dsp.mod.ENMITY, -2)
end

function onEffectLose(target, effect)
    target:delMod(dsp.mod.MP, 12)
    target:delMod(dsp.mod.ENMITY, -2)
end