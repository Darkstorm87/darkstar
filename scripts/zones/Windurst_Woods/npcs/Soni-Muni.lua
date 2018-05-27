-----------------------------------
-- Area: Windurst Woods
--  NPC: Soni-Muni
-- Starts & Finishes Quest: The Amazin' Scorpio
-- !pos -17.073 1.749 -59.327 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/npc_util");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(WINDURST, THE_AMAZIN_SCORPIO) == QUEST_ACCEPTED and npcUtil.tradeHas(trade, 1017)) then
        player:startEvent(484);
    end
end;

function onTrigger(player,npc)
    local AmazinScorpio = player:getQuestStatus(WINDURST,THE_AMAZIN_SCORPIO);
    local Fame = player:getFameLevel(WINDURST);
    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,0) == false) then
        player:startEvent(735);
    elseif (AmazinScorpio == QUEST_COMPLETED) then
        player:startEvent(485);
    elseif (AmazinScorpio == QUEST_ACCEPTED) then
        player:startEvent(482,0,0,1017);
    elseif (AmazinScorpio == QUEST_AVAILABLE and Fame >= 2) then
        player:startEvent(481,0,0,1017);
    else
        player:startEvent(421);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 481) then
        player:addQuest(WINDURST,THE_AMAZIN_SCORPIO);
    elseif (csid == 484 and npcUtil.completeQuest(player, WINDURST, THE_AMAZIN_SCORPIO, {fame=80, title=dsp.title.GREAT_GRAPPLER_SCORPIO, gil=1500})) then
        player:confirmTrade();
    elseif (csid == 735) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",0,true);
    end
end;
