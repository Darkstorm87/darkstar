-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  NPC: Cermet Headstone
-- Involved in Mission: ZM5 Headstone Pilgrimage (Light Headstone)
-- !pos 235 0 280 121
-----------------------------------
package.loaded["scripts/zones/The_Sanctuary_of_ZiTah/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Sanctuary_of_ZiTah/TextIDs");
require("scripts/zones/The_Sanctuary_of_ZiTah/MobIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    -- HEADSTONE PILGRIMAGE
    if (player:getCurrentMission(ZILART) == HEADSTONE_PILGRIMAGE) then
        if (player:hasKeyItem(dsp.kis.LIGHT_FRAGMENT)) then
            player:messageSpecial(ALREADY_OBTAINED_FRAG,dsp.kis.LIGHT_FRAGMENT);
        elseif (os.time() >= npc:getLocalVar("cooldown")) then
            if (not GetMobByID(DOOMED_PILGRIMS):isSpawned()) then
                player:startEvent(200,dsp.kis.LIGHT_FRAGMENT);
            else
                player:messageSpecial(SOMETHING_BETTER);
            end
        else
            player:addKeyItem(dsp.kis.LIGHT_FRAGMENT);
            if (
                player:hasKeyItem(dsp.kis.ICE_FRAGMENT) and
                player:hasKeyItem(dsp.kis.EARTH_FRAGMENT) and
                player:hasKeyItem(dsp.kis.WATER_FRAGMENT) and
                player:hasKeyItem(dsp.kis.FIRE_FRAGMENT) and
                player:hasKeyItem(dsp.kis.LIGHTNING_FRAGMENT) and
                player:hasKeyItem(dsp.kis.WIND_FRAGMENT)
            ) then
                player:messageSpecial(FOUND_ALL_FRAGS,dsp.kis.LIGHT_FRAGMENT);
                player:addTitle(dsp.titles.BEARER_OF_THE_EIGHT_PRAYERS);
                player:completeMission(ZILART,HEADSTONE_PILGRIMAGE);
                player:addMission(ZILART,THROUGH_THE_QUICKSAND_CAVES);
            else
                player:messageSpecial(KEYITEM_OBTAINED,dsp.kis.LIGHT_FRAGMENT);
            end
        end

    -- SOUL SEARCHING
    elseif (player:hasCompletedMission(ZILART,THE_CHAMBER_OF_ORACLES) and not player:hasCompleteQuest(OUTLANDS,SOUL_SEARCHING)) then
        player:addQuest(OUTLANDS,SOUL_SEARCHING);
        player:startEvent(202,dsp.kis.PRISMATIC_FRAGMENT);

    -- DEFAULT DIALOGS
    elseif (player:hasCompletedMission(ZILART,HEADSTONE_PILGRIMAGE)) then
        player:messageSpecial(ZILART_MONUMENT);
    else
        player:messageSpecial(CANNOT_REMOVE_FRAG);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    -- HEADSTONE PILGRIMAGE
    if (csid == 200 and option == 1) then
        SpawnMob(DOOMED_PILGRIMS):updateClaim(player);

    -- SOUL SEARCHING
    elseif (csid == 202) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13416);
        else
            player:tradeComplete();
            player:addItem(13416); -- Bat Earring
            player:messageSpecial(ITEM_OBTAINED,13416);
            player:completeQuest(OUTLANDS,SOUL_SEARCHING);
            player:addTitle(dsp.titles.GUIDER_OF_SOULS_TO_THE_SANCTUARY);
        end
    end
end;
