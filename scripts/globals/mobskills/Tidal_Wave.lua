---------------------------------------------------
-- Tidal Wave
-- Deals water elemental damage to enemies within area of effect.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	
	dmgmod = 1;
	accmod = 3;
	info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg() * 6,accmod,dmgmod,TP_NO_EFFECT,1);
	dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_WATER,MOBPARAM_IGNORE_SHADOWS);
	target:delHP(dmg);
	return dmg;
	
end