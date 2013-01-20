---------------------------------------------
--  Petro Eyes
--  Description: Petrifies opponents with a gaze attack.
--  Type: Gaze
--  Utsusemi/Blink absorb: Ignores shadows
--  Range: Single gaze
---------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------

function OnMobSkillCheck(target,mob,skill)
    return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_PETRIFICATION;
    if(target:hasStatusEffect(typeEffect) == false and target:isFacing(mob)) then
        local statmod = MOD_INT;
        local resist = applyPlayerResistance(mob,skill,target,mob:getMod(statmod)-target:getMod(statmod),0,2);
        if(resist > 0.2) then
            skill:setMsg(MSG_ENFEEB_IS);
            target:addStatusEffect(typeEffect,1,0,math.random(60,360));--power=1;tic=0;duration=180;
        else
            skill:setMsg(MSG_MISS); -- resist !
        end
    else
        skill:setMsg(MSG_NO_EFFECT); -- no effect
    end
    return typeEffect;
end;
