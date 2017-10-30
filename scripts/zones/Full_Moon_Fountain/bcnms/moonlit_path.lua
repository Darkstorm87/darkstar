-----------------------------------
-- Area: Full Moon Fountain
-- Name: The Moonlit Path
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Full_Moon_Fountain/TextIDs");

-----------------------------------

-- What should go here:
-- giving key items, playing ENDING cutscenes
--
-- What should NOT go here:
-- Handling of "battlefield" status, spawning of monsters,
-- putting loot into treasure pool, 
-- enforcing ANY rules (SJ/number of people/etc), moving
-- chars around, playing entrance CSes (entrance CSes go in bcnm.lua)

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
    moonlitPath = player:getQuestStatus(WINDURST,THE_MOONLIT_PATH)
    
    if leavecode == 2 then -- play end CS. Need time and battle id for record keeping + storage
    
        local name, clearTime, partySize = battlefield:getRecord()

        if (moonlitPath == QUEST_COMPLETED) then
            player:startEvent(0x7d01,1,clearTime,partySize,battlefield:getTimeInside(),1,0,1);
        else
            player:startEvent(0x7d01,1,clearTime,partySize,battlefield:getTimeInside(),1,0,0);
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
        player:delKeyItem(MOON_BAUBLE);
        player:addKeyItem(WHISPER_OF_THE_MOON);
        player:messageSpecial(KEYITEM_OBTAINED,WHISPER_OF_THE_MOON);
    end
end;