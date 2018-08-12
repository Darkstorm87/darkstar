-----------------------------------
-- Area: Beaucedine Glacier
--  NPC: Chopapa, W.W.
-- Type: Border Conquest Guards
-- !pos -227.956 -81.475 260.442 111
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Beaucedine_Glacier/TextIDs")
require("scripts/globals/conquest")
-----------------------------------

local guardNation = dsp.nation.WINDURST
local guardType   = dsp.conq.guard.BORDER
local guardRegion = dsp.region.FAUREGANDI
local guardEvent  = 32758

function onTrade(player,npc,trade)
    dsp.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

function onTrigger(player,npc)
    dsp.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

function onEventUpdate(player,csid,option)
    dsp.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

function onEventFinish(player,csid,option)
    dsp.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end