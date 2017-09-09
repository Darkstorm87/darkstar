---------------------------------------------
--  Flashbulb
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
	local highest = automaton:getSkillLevel(22)
	local highestskill = 22
	if automaton:getSkillLevel(23) > highest then
		highestskill = 23
		highest = automaton:getSkillLevel(23)
	end
	if automaton:getSkillLevel(24) > highest then
		highestskill = 24
	end

    local resist = applyResistanceAbility(automaton, target, 7, highestskill, 150)
    local duration = 12 * resist

    if resist > 0.0625 then
        if target:addStatusEffect(EFFECT_FLASH, 200, 0, duration) then
            skill:setMsg(MSG_ENFEEB)
        else
            skill:setMsg(MSG_NO_EFFECT)
        end
    else
        skill:setMsg(MSG_RESIST)
    end

    return EFFECT_FLASH
end
