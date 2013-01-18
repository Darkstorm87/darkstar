require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");
---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local dmgmod = 1;
	local accmod = 1;
	if(mob:getHP()~=0) then
		BOMB_TOSS_HPP = mob:getHP()/mob:getMaxHP();
	end

	local power = math.random(15,20);

	-- did I drop it in my face?
	if(math.random() < 0.4) then
		power = 3;
	end

	local info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*power*BOMB_TOSS_HPP,accmod,dmgmod,TP_MAB_BONUS,1);
	local dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_FIRE,MOBPARAM_IGNORE_SHADOWS);
	mob:setHP(0);
	target:delHP(dmg);
	return dmg;
end;
