-----------------------------------------
-- Spell: Valor Minuet II
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

    local power = 10 + math.floor((sLvl+iLvl) / 5.5)

    if (power >= 64) then
        power = 64
    end
	
	local lvl = 0
	if caster:getMainJob() == dsp.job.BRD then
		lvl = caster:getMainLvl()
	else
		lvl = caster:getSubLvl()
	end
	
	if caster:isPC() then
		local sBonus = math.max(sLvl - caster:getMaxSkillLevel(lvl,dsp.job.BRD,dsp.skill.SINGING), 0)
		local iBonus = math.max(iLvl - caster:getMaxSkillLevel(lvl,dsp.job.BRD,caster:getWeaponSkillType(dsp.slot.RANGED)), 0)
		
		if sBonus+iBonus > 0 then
			power = power + math.floor((sBonus+iBonus) / 5)
		end
	end

    local iBoost = caster:getMod(dsp.mod.MINUET_EFFECT) + caster:getMod(dsp.mod.ALL_SONGS_EFFECT)
    if (iBoost > 0) then
        power = power + iBoost*6
    end

    power =  power + caster:getMerit(dsp.merit.MINUET_EFFECT)

    if (caster:hasStatusEffect(dsp.effect.SOUL_VOICE)) then
        power = power * 2
    elseif (caster:hasStatusEffect(dsp.effect.MARCATO)) then
        power = power * 1.5
    end
    caster:delStatusEffect(dsp.effect.MARCATO)

    local duration = 300
    duration = duration * ((iBoost * 0.1) + (caster:getMod(dsp.mod.SONG_DURATION_BONUS)/100) + 1)

    if (caster:hasStatusEffect(dsp.effect.TROUBADOUR)) then
        duration = duration * 2
    end

    if not (target:addBardSong(caster,dsp.effect.MINUET,power,0,duration,caster:getID(), 0, 2)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT)
    end

    return dsp.effect.MINUET
end
