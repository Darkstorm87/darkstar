-----------------------------------------
-- ID: 5343
-- Azouph Fireflies
--  Transports the user to Azouph Isle
-----------------------------------------
require("scripts/globals/teleports")
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    if (target:getZoneID() == 69) then
        return 0
    end
    return 56
end

function onItemUse(target)
    target:addStatusEffectEx(dsp.effect.TELEPORT,0,dsp.teleport.id.AZOUPH,0,1)
end
