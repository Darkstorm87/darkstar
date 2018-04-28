-----------------------------------------
-- Spell: Hojo:Ichi
-- Description: Inflicts Slow on target.
-- Edited from slow.lua
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local dINT = (caster:getStat(dsp.mod.INT) - target:getStat(dsp.mod.INT));
    --Power for Hojo is a flat 14.6% reduction
    local power = 150;
    --Duration and Resistance calculation
    local duration = 180;
    local params = {};
    params.attribute = dsp.mod.INT;
    params.skillType = NINJUTSU_SKILL;
    params.bonus = 0;
    duration = duration * applyResistance(caster, target, spell, params);
    --Calculates the resist chance from Resist Blind trait
    if (math.random(0,100) >= target:getMod(dsp.mod.SLOWRES)) then
        -- Spell succeeds if a 1 or 1/2 resist check is achieved
        if (duration >= 150) then

            if (target:addStatusEffect(dsp.effect.SLOW,power,0,duration)) then
                spell:setMsg(dsp.msg.basic.MAGIC_ENFEEB_IS);
            else
                spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
            end

        else
            spell:setMsg(dsp.msg.basic.MAGIC_RESIST);
        end
    else
        spell:setMsg(dsp.msg.basic.MAGIC_RESIST_2);
    end
    return dsp.effect.SLOW;
end;
