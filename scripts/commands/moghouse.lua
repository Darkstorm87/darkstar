---------------------------------------------------------------------------------------------------
-- func: zone
-- desc: Teleports a player to the given zone.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

---------------------------------------------------------------------------------------------------
-- func: onTrigger
-- desc: Called when this command is invoked.
---------------------------------------------------------------------------------------------------
function onTrigger(player)
    local RESIDENTIAL_AREA = 0;
    
    player:setPos(0, 0, 0, 0, RESIDENTIAL_AREA);
end
