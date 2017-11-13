-----------------------------------
-- Area: Nashmau
-- NPC: Dnegan
-- Standard Info NPC
-- Involved in quest: Wayward Automation
-- !pos 29.89 -6 55.83 53
-----------------------------------
package.loaded["scripts/zones/Nashmau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Nashmau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

        local TheWaywardAutomation = player:getQuestStatus(AHT_URHGAN,THE_WAYWARD_AUTOMATION);
        local TheWaywardAutomationProgress = player:getVar("TheWaywardAutomationProgress");
        
        if (TheWaywardAutomation == 1 and TheWaywardAutomationProgress == 1) then
            player:startEvent(289); -- he tells u to go Caedarva Mire
        elseif (TheWaywardAutomationProgress == 2) then
            player:startEvent(289); -- Hint to go to Caedarva Mire
        else
            player:startEvent(0x0120);
    end;
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 289) then
        player:setVar("TheWaywardAutomationProgress",2);
    end;
end;


