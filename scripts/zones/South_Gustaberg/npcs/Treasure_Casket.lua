package.loaded["scripts/zones/South_Gustaberg/TextIDs"] = nil;
require("scripts/globals/settings");
require("scripts/zones/South_Gustaberg/TextIDs");


function onTrigger(player,npc)
    --player:messageSpecial(CHEST_LOCKED,1024);
	if (npc:getID() == 17216143) then
		local itemId = 33;
		player:addItem(itemId);
		targ:messageSpecial( ITEM_OBTAINED, itemId );
				
		UpdateTreasureSpawnPoint(npc:getID(), true);
	end
end; 