---------------------------------------------
--  Shock Absorber
---------------------------------------------

require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onAutomatonAbility(automaton, target, skill, tp, master, action)
    local maneuvers = master:countEffect(EFFECT_EARTH_MANEUVER)
    local pMod = math.max(automaton:getSkillLevel(22), automaton:getSkillLevel(23), automaton:getSkillLevel(24))
    local duration = 180
    local amount = 200
    local bonus = 0

    if automaton:getLocalVar("shockabsorber") >= 4 then -- Shock Absorber III
        if maneuvers == 1 then
            bonus = pMod * 0.6
        elseif maneuvers == 2 then
            bonus = pMod * 1.0
        elseif maneuvers == 3 then
            bonus = pMod * 1.4
        end
    elseif automaton:getLocalVar("shockabsorber") >= 2 then -- Shock Absorber II
        if maneuvers == 1 then
            bonus = pMod * 0.4
        elseif maneuvers == 2 then
            bonus = pMod * 0.75
        elseif maneuvers == 3 then
            bonus = pMod * 1.0
        end
    else -- Shock Absorber
        if maneuvers == 1 then
            bonus = pMod * 0.2
        elseif maneuvers == 2 then
            bonus = pMod * 0.4
        elseif maneuvers == 3 then
            bonus = pMod * 0.75
        end
    end
    amount = amount + math.floor(bonus)

    if target:addStatusEffect(EFFECT_STONESKIN, amount, 0, duration) then
        skill:setMsg(MSG_BUFF)
    else
        skill:setMsg(MSG_NO_EFFECT)
    end

    return EFFECT_STONESKIN
end
