-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Naguipeillont, R.K.
-- Type: Outpost Conquest Guards
-- !pos -11.322 -13.459 317.696 115
-----------------------------------
package.loaded["scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/conquest");
require("scripts/zones/West_Sarutabaruta/TextIDs");

local guardnation = NATION_SANDORIA; -- SANDORIA, BASTOK, WINDURST, 4 = jeuno
local guardtype   = 3;        -- 1: city, 2: foreign, 3: outpost, 4: border
local region      = SARUTABARUTA;
local csid        = 0x7ffb;

function onTrade(player,npc,trade)
    tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end;

function onTrigger(player,npc)

    if (player:hasKeyItem(getSupplyKey(region)) and player:getNation() == guardnation) then
        if (supplyRunFresh(player) == 1) then
            player:startEvent(csid,16,0,0,0,1,0,0,255); -- you have brought us supplies !
        else
            player:showText(npc, CONQUEST - 1); -- "Hmm... These supplies you have brought us are too old to be of any use."
            player:delKeyItem(getSupplyKey(region));
            player:messageSpecial(KEYITEM_OBTAINED + 1, getSupplyKey(region));
            player:setVar("supplyQuest_region",0);
        end
    else
        local arg1 = getArg1(guardnation, player) - 1;
        if (arg1 >= 1792) then -- foreign, non-allied
            player:startEvent(csid,1808,0,0,0,0,player:getRank(),0,0);
        else -- citizen or allied
            player:startEvent(csid,arg1,0,0x3F0000,0,0,getArg6(player),0,0);
        end
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("OPTION: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("OPTION: %u",option);

    if (option == 1) then
        local duration = (player:getRank() + getNationRank(player:getNation()) + 3) * 3600;
        player:delStatusEffect(dsp.effect.SIGIL);
        player:delStatusEffect(dsp.effect.SANCTION);
        player:delStatusEffect(dsp.effect.SIGNET);
        player:addStatusEffect(dsp.effect.SIGNET,0,0,duration); -- Grant Signet
    elseif (option == 2) then
        player:delKeyItem(getSupplyKey(region));
        player:addCP(supplyReward[region + 1])
        player:messageSpecial(CONQUEST); -- "You've earned conquest points!"
        if (hasOutpost(player, region+5) == 0) then
            local supply_quests = 2^(region+5);
            player:addNationTeleport(guardnation,supply_quests);
            player:setVar("supplyQuest_region",0);
        end
    elseif (option == 4) then
        if (player:delGil(giltosetHP(guardnation,player))) then
            player:setHomePoint();
            player:messageSpecial(CONQUEST + 94); -- "Your home point has been set."
        else
            player:messageSpecial(CONQUEST + 95); -- "You do not have enough gil to set your home point here."
        end
    end

end;