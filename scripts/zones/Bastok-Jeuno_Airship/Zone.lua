-----------------------------------
-- 
-- Zone: Bastok-Jeuno_Airship
-- 
-----------------------------------

-----------------------------------
--  onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
cs = -1;

return cs;
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
	player:startEvent(0x0064);
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
	if (csid == 0x0064) then
		prevzone = player:getPreviousZone();
		if (prevzone == 246) then
			player:setPos(0,0,0,0,236);
		elseif (prevzone == 236) then
			player:setPos(0,0,0,0,246);
		end
	end
end;