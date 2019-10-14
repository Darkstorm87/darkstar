-----------------------------------
-- Ability: Warding Circle
-- Grants resistance, defense, and attack against Demons to party members within the area of effect.
-- Obtained: Samurai Level 5
-- Recast Time: 5:00
-- Duration: 3:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    local duration = 180 + player:getMod(dsp.mod.WARDING_CIRCLE_DURATION)

	if (target:getMainJob() ~= JOBS.SAM) then
		local merits = player:getMerit(dsp.merit.STORE_TP_EFFECT);
		local storeTPTraitValue = player:getTraitValue(TRAIT_STORE_TP);
		
		target:addStatusEffect(dsp.effect.WARDING_CIRCLE,15,0,duration,0,(merits + storeTPTraitValue)/2)
	else
		target:addStatusEffect(dsp.effect.WARDING_CIRCLE,15,0,duration)
	end
end