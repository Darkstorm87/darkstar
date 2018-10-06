-----------------------------------------
-- ID: 5350
-- Phial of Volant Serum
-- Enchantment: 60Min, Costume - bat
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    if not target:getZone():canUseMisc(dsp.zoneMisc.COSTUME) then
        return dsp.msg.basic.CANT_BE_USED_IN_AREA
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.COSTUME,256,0,3600)
end