---------------------------------------------
--
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/utils")
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill, summoner)
    local bonusTime = utils.clamp(summoner:getSkillLevel(dsp.skill.SUMMONING_MAGIC) - 300, 0, 200)
    local duration = 300 + bonusTime

    local magicskill = utils.getSkillLvl(1, target:getMainLvl())

    local potency = 3 + ((6*magicskill)/100)
    if (magicskill>200) then
        potency = 5 + ((6*magicskill)/100)
    end

    local typeEffect = dsp.effect.ENTHUNDER

    skill:setMsg(MobBuffMove(target, typeEffect, potency, 0, duration))

    return typeEffect
end
