-----------------------------------------
-- Spell: Valor Minuet III
-- Grants Attack bonus to all allies.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0
end

function onSpellCast(caster,target,spell)
    local sLvl = caster:getSkillLevel(dsp.skill.SINGING) -- Gets skill level of Singing
    local iLvl = caster:getWeaponSkillLevel(dsp.slot.RANGED)

    local power = 24 + math.floor((sLvl+iLvl) / 5.5)

    if (power >= 105) then
        power = 105
    end
	
	local lvl = 0
	if caster:getMainJob() == dsp.job.BRD then
		lvl = caster:getMainLvl()
	else
		lvl = caster:getSubLvl()
	end
	
	local sBonus = math.max(sLvl - caster:getMaxSkillLevel(dsp.skill.SINGING,dsp.job.BRD,lvl), 0)
	local iBonus = math.max(iLvl - caster:getMaxSkillLevel(caster:getWeaponSkillType(dsp.slot.RANGED),dsp.job.BRD,lvl), 0)
	
	if sBonus+iBonus > 0 then
		power = power + math.floor((sBonus+iBonus) / 5)
	end

    local iBoost = caster:getMod(dsp.mod.MINUET_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    if (iBoost > 0) then
        power = power + iBoost*9
    end

    power =  power + caster:getMerit(dsp.merit.MINUET_EFFECT)

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    local duration = 120
    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster,dsp.effect.MINUET,power,0,duration,caster:getID(), 0, 3)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.MINUET
end
