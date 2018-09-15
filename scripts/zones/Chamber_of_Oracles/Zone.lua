-----------------------------------
--
-- Zone: Chamber_of_Oracles (168)
--
-----------------------------------
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/zones/Chamber_of_Oracles/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/zone");
-----------------------------------

function onInitialize(zone)
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onZoneIn(player,prevZone)
    local CurrentMission = player:getCurrentMission(WINDURST);
    local MissionStatus = player:getVar("MissionStatus");
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-177.804,-2.765,-37.893,179);
    end
	
    if (prevZone == 208 and CurrentMission == MOON_READING and MissionStatus >= 1) then
        cs = 3;
    end
	
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 3) then
        player:addKeyItem(dsp.ki.ANCIENT_VERSE_OF_ALTEPA);
        player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.ANCIENT_VERSE_OF_ALTEPA);
    end
end;
