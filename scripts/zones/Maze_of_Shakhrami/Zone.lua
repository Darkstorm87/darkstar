-----------------------------------
--
-- Zone: Maze_of_Shakhrami (198)
--
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/zone");
require("scripts/zones/Maze_of_Shakhrami/TextIDs");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    local tomes = {17588783,17588784,17588785,17588786};
    
    SetGroundsTome(tomes);

    UpdateTreasureSpawnPoint(17588768);
    
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	local cs = -1;	
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then	
		player:setPos(-140.246,-12.738,160.709,63);
	end	
	return cs;	
end;		

-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)	
end;	

-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	
