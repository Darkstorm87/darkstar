---------------------------------------------
--  Slumber Powder
--
--  Description: Puts all enemies in an area of effect to sleep.
--  Type: Magical
--  Utsusemi/Blink absorb: Goes through Utsusemi, does not wipe Effect.
--  Range: 15' radial
--  Notes:
---------------------------------------------
require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------
function OnMobWeaponSkill(target, mob, skill)

    dmgmod = 1;
    accmod = 1;
    info = MobMagicalMove(mob,target,skill,mob:getWeaponDmg()*3,accmod,dmgmod,TP_NO_EFFECT);
    dmg = MobFinalAdjustments(info.dmg,mob,skill,target,MOBSKILL_MAGICAL,MOBPARAM_ICE,MOBPARAM_1_SHADOW);
    target:delHP(dmg);
    return dmg;
end