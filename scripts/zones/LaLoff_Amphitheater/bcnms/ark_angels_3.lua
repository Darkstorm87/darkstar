-----------------------------------
-- Area: LaLoff Amphitheater
-- Name: Ark Angels 3 (Mithra)
-----------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/LaLoff_Amphitheater/TextIDs");
require("scripts/globals/battlefield")
require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------

-- Death cutscenes:

-- player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0); -- Hume
-- player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0); -- taru
-- player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0); -- mithra
-- player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0); -- elvan
-- player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0); -- galka
-- player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0); -- divine might
-- player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),1,battlefield:getLocalVar("[cs]bit"),0); -- skip ending cs


-- After registering the BCNM via bcnmRegister(bcnmid)
function onBattlefieldRegister(player,battlefield)
end;
function onBattlefieldTick(battlefield, tick)
    g_Battlefield.onBattlefieldTick(battlefield, tick)
end

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
--print("leave code "..leavecode);

    if leavecode == 2 then -- play end CS. Need time and battle id for record keeping + storage
        local name, clearTime, partySize = battlefield:getRecord()
        local record = battlefield:getRecord();
        local clearTime = record.clearTime;

        if (player:hasCompletedMission(ZILART,ARK_ANGELS)) then
            player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),180,2,1);        -- winning CS (allow player to skip)
        else
            player:startEvent(32001,battlefield:getArea(),clearTime,partySize,battlefield:getTimeInside(),180,2,0);        -- winning CS (allow player to skip)
        end

    elseif (leavecode == 4) then
        player:startEvent(32002, 0, 0, 0, 0, 0, battlefield:getArea(), 180);    -- player lost
    end
end;

function onEventUpdate(player,csid,option)
-- print("bc update csid "..csid.." and option "..option);

end;

function onEventFinish(player,csid,option)
 -- print("bc finish csid "..csid.." and option "..option);

   local AAKeyitems = (player:hasKeyItem(SHARD_OF_APATHY) and player:hasKeyItem(SHARD_OF_ARROGANCE)
         and player:hasKeyItem(SHARD_OF_COWARDICE) and player:hasKeyItem(SHARD_OF_RAGE));

   if (csid == 32001) then
      if (player:getCurrentMission(ZILART) == ARK_ANGELS  and player:getVar("ZilartStatus") == 1) then
         player:addKeyItem(SHARD_OF_ENVY);
         player:messageSpecial(KEYITEM_OBTAINED,SHARD_OF_ENVY);
         if (AAKeyitems == true) then
            player:completeMission(ZILART,ARK_ANGELS);
            player:addMission(ZILART,THE_SEALED_SHRINE);
            player:setVar("ZilartStatus",0);
         end
      end
   end
end;