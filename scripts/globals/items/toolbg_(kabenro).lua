-----------------------------------------
-- ID: 5863
-- Toolbag Kaben
-- When used, you will obtain one stack of kabenro
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
    if (target:getFreeSlotsCount() == 0) then
        result = 308;
    end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addItem(2642,99);
end;

