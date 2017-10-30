-----------------------------------
-- Area: Horlais Peak
-- Name: Saintly Invitation
-- !pos 299 -123 345 146
-----------------------------------
package.loaded["scripts/zones/Balgas_Dais/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/keyitems");
require("scripts/zones/Balgas_Dais/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/battlefield")

-----------------------------------

function onBattlefieldTick(battlefield, tick)
    g_Battlefield.onBattlefieldTick(battlefield, tick)
end

-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;

-- Physically entering the BCNM via bcnmEnter(bcnmid)
function onBattlefieldEnter(player,battlefield)
end;

-- Leaving the BCNM by every mean possible, given by the LeaveCode
-- 1=Select Exit on circle
-- 2=Winning the BC
-- 3=Disconnected or warped out
-- 4=Losing the BC
-- via bcnmLeave(1) or bcnmLeave(2). LeaveCodes 3 and 4 are called
-- from the core when a player disconnects or the time limit is up, etc

function onBattlefieldLeave(player,battlefield,leavecode)
-- print("leave code "..leavecode);

    if leavecode == 2 then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        if (player:hasCompletedMission(WINDURST,SAINTLY_INVITATION)) then
            player:startEvent(0x7d01,1,clearTime,partySize,battlefield:getTimeInside(),1,3,1);
        else
            player:startEvent(0x7d01,1,clearTime,partySize,battlefield:getTimeInside(),1,3,0);
        end
    elseif (leavecode == 4) then
        player:startEvent(0x7d02);
    end

end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);
end;

function onEventFinish(player,csid,option)
-- print("bc finish csid "..csid.." and option "..option);

    if (csid == 0x7d01) then
        if (player:getCurrentMission(WINDURST) == SAINTLY_INVITATION) then
            player:addTitle(VICTOR_OF_THE_BALGA_CONTEST);
            player:addKeyItem(BALGA_CHAMPION_CERTIFICATE);
            player:messageSpecial(KEYITEM_OBTAINED,BALGA_CHAMPION_CERTIFICATE);
            player:setVar("MissionStatus",2);
        end
    end

end;