-----------------------------------
-- Area: Toraimarai Canal
--  NPC: ???
-- Involved In Quest: The Root of the Problem
-- !pos -137 16 151 169
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getCharVar("***REMOVED***Problem") == 2 then
        if player:getCharVar("***REMOVED***ProblemQ1") <= 1 then
            player:startEvent(42)
        else
            player:startEvent(42)
        end
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 42 then
        player:setCharVar("***REMOVED***ProblemQ1", 2)
    end
end
