-----------------------------------------
--	ID: 5339
--	Item: Bloody Bolt Quiver
--	When used, you will obtain one stack of Bloody Bolts
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
	target:addItem(18151,99);
end;