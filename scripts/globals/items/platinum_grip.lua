-----------------------------------------
-- ID: 19019
-- Item: Platinum Grip
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_LIGHTNING,0) <= 0.5) then
        return 0,0,0;
    else
        target:addStatusEffect(dsp.effect.STUN, 1, 0, 3);
        return SUBEFFECT_STUN, msgBasic.ADD_EFFECT_STATUS, dsp.effect.STUN;
    end
end;
