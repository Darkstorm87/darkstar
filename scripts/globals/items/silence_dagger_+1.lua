-----------------------------------------
-- ID: 16508
-- Item: Silence Dagger +1
-- Additional Effect: Silence
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 15;

    if (math.random(0,99) >= chance or applyResistanceAddEffect(player,target,ELE_WIND,0) <= 0.5) then
        return 0,0,0;
    else
        if (not target:hasStatusEffect(dsp.effect.SILENCE)) then
            target:addStatusEffect(dsp.effect.SILENCE, 1, 0, 60);
        end
        return SUBEFFECT_SILENCE, msgBasic.ADD_EFFECT_STATUS, dsp.effect.SILENCE;
    end
end;