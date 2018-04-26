-----------------------------------
-- Area: San d'Oria-Jeuno Airship
--  NPC: ???
-- Involved In Quest: The Stars Of Ifrit
-- @zone 223
-- !pos 77 -9 -5 -13
-----------------------------------
package.loaded["scripts/zones/San_dOria-Jeuno_Airship/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/weather");
require("scripts/zones/San_dOria-Jeuno_Airship/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local TOTD = VanadielTOTD();
    local TheStarsOfIfrit = player:getQuestStatus(BASTOK,THE_STARS_OF_IFRIT);

    if (TOTD == TIME_NIGHT and IsMoonFull()) then
        if (TheStarsOfIfrit == QUEST_ACCEPTED and player:hasKeyItem(dsp.kis.CARRIER_PIGEON_LETTER) == false) then
            player:addKeyItem(dsp.kis.CARRIER_PIGEON_LETTER);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.CARRIER_PIGEON_LETTER);
        end
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;