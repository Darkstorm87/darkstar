-----------------------------------------
-- ID: 18161
-- Item: Arctic Wind
-- Additional Effect: Removes Suzaku's Fire Damage
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------

function onAdditionalEffect(player,target,damage)
    if (target:getFamily() == 280) then
        target:setMobMod(MOBMOD_ADD_EFFECT, 0);
    end
    return 0, 0, 0;
end;