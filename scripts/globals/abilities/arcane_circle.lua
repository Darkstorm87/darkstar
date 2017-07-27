-----------------------------------
-- Ability: Arcane Circle
-- Grants resistance, defense, and attack against Arcana to party members within the area of effect.
-- Obtained: Dark Knight Level 5
-- Recast Time: 5:00 minutes
-- Duration: 3:00 minutes
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
	local duration = 180 + player:getMod(MOD_ARCANE_CIRCLE_DURATION);
	if (target:getMainJob() ~= JOBS.DRK) then
		local subPower = 5;
	
		if (player:getMainLvl() > 50 and player:getMainLvl() % 5 == 0) then
			subPower = subPower + (player:getMainLvl() - 50) / 5;
		end
		
		target:addStatusEffect(EFFECT_ARCANE_CIRCLE,8,0,duration,0,subPower);
	else
		target:addStatusEffect(EFFECT_ARCANE_CIRCLE,8,0,duration);
	end
    
end;