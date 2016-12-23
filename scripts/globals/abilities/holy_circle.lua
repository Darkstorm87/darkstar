-----------------------------------
-- Ability: Holy Circle
-- Grants resistance, defense, and attack against Undead to party members within the area of effect.
-- Obtained: Paladin Level 5
-- Recast Time: 5:00 minutes
-- Duration: 3:00 minutes
-----------------------------------

require("scripts/globals/settings");
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
    target:addStatusEffect(EFFECT_HOLY_CIRCLE,1,0,180);
	if (target:getMainJob() ~= JOBS.PLD) then
		target:addStatusEffect(EFFECT_ENMITY_DOWN,5,0,180);
	end
end;