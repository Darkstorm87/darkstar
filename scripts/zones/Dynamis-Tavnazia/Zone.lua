-----------------------------------
--
-- Zone: Dynamis-Tavnazia
--
-----------------------------------
local ID = require("scripts/zones/Dynamis-Tavnazia/IDs")
require("scripts/globals/conquest")
require("scripts/globals/dynamis")
-----------------------------------

function onInitialize(zone)
end

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn(player, prevZone)
    return dynamis.zoneOnZoneIn(player, prevZone)
end

function onRegionEnter(player, region)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dynamis.zoneOnEventFinish(player, csid, option)
end
