---------------------------------------------
--  Battle Dance
--
--  Description: Delivers an area attack. Additional effect: DEX Down. Duration of effect varies with TP.
--  Type: Physical (Slashing)
--
--
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------
function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)

	local numhits = 1;
	local accmod = 1;
	local dmgmod = 1.6;
	local info = MobPhysicalMove(mob,target,skill,numhits,accmod,dmgmod,TP_NO_EFFECT);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_PHYSICAL,MOBPARAM_SLASH,MOBPARAM_3_SHADOW);
	target:delHP(dmg);

	local typeEffect = EFFECT_DEX_DOWN;

	MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 10, 3, 120);

	return dmg;
end;
