-----------------------------------------
-- ID: 5400
-- B. Rem. Fireflies
-- Transports the user out of Bhaflau Remnants
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    if target:getZoneID() == 75 then
        return 0
    end
    return 56
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.B_REM,0,1)
end