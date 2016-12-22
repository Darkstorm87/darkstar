---------------------------------------------------------------------------------------------------
-- func: zone
-- desc: Teleports a player to the residential area.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = ""
};

---------------------------------------------------------------------------------------------------
-- func: onTrigger
-- desc: Called when this command is invoked.
---------------------------------------------------------------------------------------------------
function onTrigger(player)
	if(player:getZoneType() ~= ZONETYPE_CITY) then
		player:PrintToPlayer("You must be in a city zone.");
		return;
	end

    local RESIDENTIAL_AREA = 0;
    
    player:setPos(0, 0, 0, 0, RESIDENTIAL_AREA);
end
