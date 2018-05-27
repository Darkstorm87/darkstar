-----------------------------------
-- Area: Windurst Woods
--  NPC: Gioh Ajihri
-- Starts & Finishes Repeatable Quest: Twinstone Bonding
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Woods/TextIDs");
require("scripts/globals/npc_util");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/titles");
-----------------------------------

function onTrade(player,npc,trade)
    if player:getVar("GiohAijhriSpokenTo") == 1 and not player:needToZone() and npcUtil.tradeHas(trade, 13360) then
        player:startEvent(490);
    end
end;

function onTrigger(player,npc)
    local TwinstoneBonding = player:getQuestStatus(WINDURST,TWINSTONE_BONDING);
    local Fame = player:getFameLevel(WINDURST);

    if (TwinstoneBonding == QUEST_COMPLETED) then
        if (player:needToZone()) then
            player:startEvent(491,0,13360);
        else
            player:startEvent(488,0,13360);
        end
    elseif (TwinstoneBonding == QUEST_ACCEPTED) then
        player:startEvent(488,0,13360);
    elseif (TwinstoneBonding == QUEST_AVAILABLE and Fame >= 2) then
        player:startEvent(487,0,13360);
    else
        player:startEvent(424);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 487) then
        player:addQuest(WINDURST,TWINSTONE_BONDING);
        player:setVar("GiohAijhriSpokenTo",1);
    elseif (csid == 490) then
        local TwinstoneBonding = player:getQuestStatus(WINDURST,TWINSTONE_BONDING);
        player:confirmTrade();
        player:needToZone(true);
        player:setVar("GiohAijhriSpokenTo",0);

        if (TwinstoneBonding == QUEST_ACCEPTED) then
            npcUtil.completeQuest(player, WINDURST, TWINSTONE_BONDING, {item=17154, fame=80, title=dsp.title.BOND_FIXER})
        else
            player:addFame(WINDURST,10);
            player:addGil(GIL_RATE*900);
            player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
        end
    elseif (csid == 488) then
        player:setVar("GiohAijhriSpokenTo",1);
    end
end;
