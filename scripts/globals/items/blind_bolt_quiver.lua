-----------------------------------------
-- ID: 5334
-- Item: Blind Bolt Quiver
-- When used, you will obtain one stack of Blind Bolts
-----------------------------------------
require("scripts/globals/msg")
-----------------------------------------

function onItemCheck(target)
    local result = 0
    if target:getFreeSlotsCount() == 0 then
        result = dsp.msg.basic.ITEM_NO_USE_INVENTORY
    end
    return result
end

function onItemUse(target)
    target:addItem(18150,99)
end