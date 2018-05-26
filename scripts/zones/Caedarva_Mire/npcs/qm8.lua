-----------------------------------
-- Area: Caedarva Mire
-- NPC:  qm8
-- Gives Lamian Fang Key
-----------------------------------
package.loaded["scripts/zones/Caedarva_Mire/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Caedarva_Mire/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    if player:getVar("[TIMER]Lamian_Fang_Key") ~= VanadielDayOfTheYear() then 
        if npcUtil.giveItem(player, 2219) then
            player:setVar("[TIMER]Lamian_Fang_Key", VanadielDayOfTheYear()) -- Can obtain key once per vanadiel day
        end
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
end