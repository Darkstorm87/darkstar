---------------------------------------------------
-- Sonic Boom
-- Reduces attack of targets in area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	local typeEffect = EFFECT_ATTACK_DOWN;
	if(target:hasStatusEffect(typeEffect) == false) then
		local statmod = MOD_INT;
		local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,3);
		if(resist > 0.2) then
			skill:setMsg(MSG_ENFEEB_IS);
			target:addStatusEffect(typeEffect,50,0,180);--power=50;tic=0;duration=180;
		else
			skill:setMsg(MSG_MISS);
		end
	else
		skill:setMsg(MSG_NO_EFFECT);
	end
	return typeEffect;
end;
