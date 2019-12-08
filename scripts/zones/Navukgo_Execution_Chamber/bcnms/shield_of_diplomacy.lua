-----------------------------------
-- Area: Navukgo Execution Chamber
-- BCNM: TOAU-22 Shield of Diplomacy
-----------------------------------
require("scripts/globals/battlefield")
require("scripts/globals/missions")
local ID = require("scripts/zones/Navukgo_Execution_Chamber/IDs")
----------------------------------------

function onBattlefieldTick(battlefield, tick)
    dsp.battlefield.onBattlefieldTick(battlefield, tick)
end

function onBattlefieldInitialise(battlefield)

    local karababa  = battlefield:insertEntity(2157, true, true)
    karababa:setSpawn(360.937,-116.5,376.937, 0)
    karababa:spawn()
end

function onBattlefieldEnter(player, battlefield)
end

function onBattlefieldLeave(player, battlefield, leavecode)
    if leavecode == dsp.battlefield.leaveCode.WON then
        local name, clearTime, partySize = battlefield:getRecord()
        local arg8 = (player:hasCompletedMission(TOAU, dsp.mission.id.toau.SHIELD_OF_DIPLOMACY)) and 1 or 0
        player:startEvent(32001, battlefield:getArea(), clearTime, partySize, battlefield:getTimeInside(), 1, battlefield:getLocalVar("[cs]bit"), arg8)
    elseif leavecode == dsp.battlefield.leaveCode.LOST then
        player:startEvent(32002)
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 32001 and player:getCurrentMission(TOAU) == dsp.mission.id.toau.SHIELD_OF_DIPLOMACY then
		addColoredDrop(player);
        player:completeMission(TOAU, dsp.mission.id.toau.SHIELD_OF_DIPLOMACY)
        player:addMission(TOAU, dsp.mission.id.toau.SOCIAL_GRACES)
        player:setCharVar("AhtUrganStatus", 0)
    end
end
