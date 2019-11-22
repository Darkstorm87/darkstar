-----------------------------------------
--  ID: 4265
--  Item: Black Drop
--  Transports the user to their Home Point
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/msg")

function onItemCheck(target)
    if (target:hasStatusEffect(dsp.effect.MEDICINE)) then
        return dsp.msg.basic.ITEM_NO_USE_MEDICATED
    end
    return 0
end

function onItemUse(target)
    target:addStatusEffect(dsp.effect.MEDICINE,0,0,3600)
	
	if (target:getCharMod(dsp.mod.HP) < 100) then
		target:addCharMod(dsp.mod.HP,5)
    end
	if (target:getCharMod(dsp.mod.MP) < 100) then
		target:addCharMod(dsp.mod.MP,5)
    end
    --target:warp()
end
