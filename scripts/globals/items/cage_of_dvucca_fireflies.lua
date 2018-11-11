-----------------------------------------
-- ID: 5346
-- Dvucca Fireflies
-- Transports the user to Dvucca Isle Staging Point
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    if target:getZoneID() == 56 then
        return 0
    end
    return 56
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.DVUCCA,0,1)
end