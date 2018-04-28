-----------------------------------
-- Area: Western Altepa Desert
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Earth Fragment)
-- !pos -108 10 -216 125
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/globals/missions");
require("scripts/zones/Western_Altepa_Desert/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(dsp.kis.EARTH_FRAGMENT) == false) then
            player:startEvent(200,dsp.kis.EARTH_FRAGMENT);
        elseif (player:hasKeyItem(239) and player:hasKeyItem(240) and player:hasKeyItem(241) and
            player:hasKeyItem(242) and player:hasKeyItem(243) and player:hasKeyItem(244) and
            player:hasKeyItem(245) and player:hasKeyItem(246)) then
            player:messageSpecial(ALREADY_HAVE_ALL_FRAGS);
        elseif (player:hasKeyItem(dsp.kis.EARTH_FRAGMENT)) then
            player:messageSpecial(ALREADY_OBTAINED_FRAG,dsp.kis.EARTH_FRAGMENT);
        end
    elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
        player:messageSpecial(ZILART_MONUMENT);
    else
        player:messageSpecial(CANNOT_REMOVE_FRAG);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 200 and option == 1) then
        player:addKeyItem(dsp.kis.EARTH_FRAGMENT);
        -- Check and see if all fragments have been found (no need to check earth and dark frag)
        if (player:hasKeyItem(dsp.kis.FIRE_FRAGMENT) and player:hasKeyItem(dsp.kis.WATER_FRAGMENT) and player:hasKeyItem(dsp.kis.ICE_FRAGMENT) and
            player:hasKeyItem(dsp.kis.WIND_FRAGMENT) and player:hasKeyItem(dsp.kis.LIGHTNING_FRAGMENT) and player:hasKeyItem(dsp.kis.LIGHT_FRAGMENT)) then
            player:messageSpecial(FOUND_ALL_FRAGS,dsp.kis.EARTH_FRAGMENT);
            player:addTitle(dsp.titles.BEARER_OF_THE_EIGHT_PRAYERS);
            player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
            player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
        else
            player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.EARTH_FRAGMENT);
        end
    end

end;