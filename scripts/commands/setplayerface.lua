---------------------------------------------------------------------------------------------------
-- func: setplayermodel <modelid> <slot> <player>
-- desc: Sets the look of the user or target player based on model id offset and slot (for testing).
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iis"
};

function error(player, msg)
    player:PrintToPlayer(msg);
    player:PrintToPlayer("!setplayerface <face> {player}");
end;

function onTrigger(player, face, target)
    -- validate model
    if (face == nil) then
        error(player, "Invalid face ID.");
        return;
    end

    -- validate target
    local targ;
    if (target == nil) then
        targ = player;
    else
        targ = GetPlayerByName(target);
        if (targ == nil) then
            error(player, string.format("Player named '%s' not found!", target));
            return;
        end
    end

    -- set model
    targ:setFace(face);
    player:PrintToPlayer(string.format("Set %s's face to %i.", targ:getName(), slotNameByNum[slot], face));
end;