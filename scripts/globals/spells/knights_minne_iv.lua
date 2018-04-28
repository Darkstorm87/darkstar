-----------------------------------------
-- Spell: Knight's Minne IV
-- Grants Defense bonus to all allies.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local sLvl = caster:getSkillLevel(SKILL_SNG); -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(SLOT_RANGED);

    local power = 30 + math.floor((sLvl + iLvl)/10);

    if (power >= 97) then
        power = 97;
    end

    local iBoost = caster:getMod(MOD_MINNE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
    if (iBoost > 0) then
        power = power + 1 + (iBoost-1)*4;
    end

    power =  power + caster:getMerit(MERIT_MINNE_EFFECT);

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2;
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5;
    end
    caster:delStatusEffect(dsp.effect.MARCATO);

    local duration = 120;
    duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2;
    end

    if not (target:addBardSong(caster,dsp.effect.MINNE,power,0,duration,caster:getID(), 0, 4)) then
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effect.MINNE;
end;
