---------------------------------------------------
-- Binary Absorption
-- Attempts to absorb one buff from a single target, or otherwise steals HP.
-- Type: Magical
-- Utsusemi/Blink absorb: 1 Shadows
-- Range: Melee
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local absEffect = target:dispelStatusEffect();
	if(absEffect > EFFECT_NONE) then
		shadowEnty = target:getStatusEffect(EFFECT_COPY_IMAGE);
		local shadowCnt = shadowEnty:getPower();
		if(shadowCnt == nil) then
			target:delStatusEffect(absEffect);
			mob:addStatusEffect(absEffect);
		else
			shadowEnty:setPower(shadowCnt - 1);
		end
	else
		-- time to drain HP. 50-100
		local power = math.random(0, 101) + 100;
		local dmg = MobFinalAdjustments(power,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_DARK,MOBPARAM_1_SHADOW);

		target:delHP(dmg);
		mob:addHP(dmg);

		skill:setMsg(MSG_DRAIN_HP);
		return dmg;
	end
end;
