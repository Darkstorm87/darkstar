-----------------------------------
-- Area: Heavens Tower
--  NPC: Nayutata
-- Type: Standard NPC
-- !pos -2.665 -26.5 -0.268 242
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local pNation = player:getNation();
    local currentMission = player:getCurrentMission(pNation);
    local MissionStatus = player:getVar("MissionStatus");
    
    if (player:getCurrentMission(WINDURST) == MOON_READING and MissionStatus >= 3) or (player:hasCompletedMission(WINDURST, MOON_READING)) then
        player:startEvent(395);
    else
        player:startEvent(64);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 395) then
        player:setVar("TimeOfPiece",0);
    end
end;

