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
	if (target:getMainJob() ~= JOBS.DRK) then
		target:addStatusEffect(EFFECT_ARCANE_CIRCLE,8,0,180,0,5); -- Pass a sub power of 5
	else
		target:addStatusEffect(EFFECT_ARCANE_CIRCLE,8,0,180);
	end
    
end;