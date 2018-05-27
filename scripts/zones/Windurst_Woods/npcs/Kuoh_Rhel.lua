-----------------------------------
-- Area: Windurst Woods
--  NPC: Kuoh Rhel
-- Type: Standard NPC
-- Starts quests: Chocobilious, In a Stew
-- !pos 131.437 -6 -102.723 241
--  Note: In a Stew should only repeat once per conquest tally. The tally is not implemented at time of
--        writing this quest. Once it is working please feel free to add it in ^^
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local chocobilious = player:getQuestStatus(WINDURST,CHOCOBILIOUS);
    local IAS = player:getQuestStatus(WINDURST,IN_A_STEW);
    local IASvar = player:getVar("IASvar");

    -- In a Stew
    if (IAS == QUEST_AVAILABLE and chocobilious == QUEST_COMPLETED and player:getFameLevel(WINDURST) >= 3) then
        if (player:needToZone()) then
            player:startEvent(232); -- Post quest dialog from Chocobilious
        else
            player:startEvent(235); -- IAS start
        end

    elseif (IASvar == 4 and player:hasKeyItem(dsp.ki.RANPIMONPIS_SPECIAL_STEW)) then
        player:startEvent(239);    -- IAS turn in

    elseif (IAS == QUEST_ACCEPTED) then
        player:startEvent(236); -- reminder dialog


    -- Uncomment once conquest tally in place
    --elseif (IAS == QUEST_COMPLETED) then
        --player:startEvent(240); -- new dialog between repeats

    elseif (IAS == QUEST_COMPLETED) then
        player:startEvent(234);    -- start repeat

    -- Chocobilious
    elseif (chocobilious == QUEST_AVAILABLE and player:getFameLevel(WINDURST) >= 2) then
        player:startEvent(224); -- Start quest
    elseif (chocobilious == QUEST_COMPLETED and player:needToZone() == true) then
        player:startEvent(232); -- Quest complete
    elseif (chocobilious == QUEST_ACCEPTED and player:getVar("ChocobiliousQuest") == 2) then
        player:startEvent(231); -- Talked to Tapoh
    elseif (chocobilious == QUEST_ACCEPTED) then
        player:startEvent(225); -- Post quest accepted
    else
        -- Standard dialog
        player:startEvent(222);
    end

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    --Chocobilious
    if (csid == 224 and option == 1) then            -- Quest start
        player:addQuest(WINDURST,CHOCOBILIOUS);
    elseif (csid == 231 and npcUtil.completeQuest(player, WINDURST, CHOCOBILIOUS, {fame=220, gil=1500, var="ChocobiliousQuest"})) then
        player:needToZone(true);

    -- In a Stew
    elseif (csid == 235) then
        player:addQuest(WINDURST,IN_A_STEW);    -- Quest start
        player:setVar("IASvar",1);
    elseif (csid == 239 and npcUtil.completeQuest(player, WINDURST, IN_A_STEW, {fame=50, gil=900, var="IASvar"})) then
        player:delKeyItem(dsp.ki.RANPIMONPIS_SPECIAL_STEW);
    elseif (csid == 234 and option == 1) then        -- start repeat
        player:setVar("IASvar",3);

    end
end;
