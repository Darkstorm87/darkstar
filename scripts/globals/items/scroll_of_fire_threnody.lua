-----------------------------------------
-- ID: 5062
-- Scroll of Fire Threnody
-- Teaches the song Fire Threnody
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return target:canLearnSpell(454);
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    target:addSpell(454);
end;