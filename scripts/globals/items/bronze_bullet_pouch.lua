-----------------------------------------
--	ID: 5359
--	Bronze Bullet Pouch
--	When used, you will obtain one stack of Bronze Bullets
-----------------------------------------

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
result = 0;
	if (target:getFreeSlotsCount() == 0) then
		result = 356;
	end
return result;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
	target:addItem(17343,99);
end;