-----------------------------------
--
-- Zone: Yhoator_Jungle (124)
--
-----------------------------------
local ID = require("scripts/zones/Yhoator_Jungle/IDs")
require("scripts/globals/icanheararainbow")
require("scripts/globals/chocobo_digging")
require("scripts/globals/conquest")
require("scripts/globals/chocobo")
require("scripts/globals/helm")
require("scripts/globals/zone")
require("scripts/globals/beastmentreasure")
-----------------------------------

function onChocoboDig(player, precheck)
    return tpz.chocoboDig.start(player, precheck)
end

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.WOODLAND_SAGE)
    GetMobByID(ID.mob.WOODLAND_SAGE):setRespawnTime(900)

    UpdateNMSpawnPoint(ID.mob.POWDERER_PENNY)
    GetMobByID(ID.mob.POWDERER_PENNY):setRespawnTime(900)

    UpdateNMSpawnPoint(ID.mob.BISQUE_HEELED_SUNBERRY)
    GetMobByID(ID.mob.BISQUE_HEELED_SUNBERRY):setRespawnTime(900)

    UpdateNMSpawnPoint(ID.mob.BRIGHT_HANDED_KUNBERRY)
    GetMobByID(ID.mob.BRIGHT_HANDED_KUNBERRY):setRespawnTime(900)

    tpz.conq.setRegionalConquestOverseers(zone:getRegionID())

    tpz.helm.initZone(zone, tpz.helm.type.HARVESTING)
    tpz.helm.initZone(zone, tpz.helm.type.LOGGING)
    tpz.chocobo.initZone(zone)

    tpz.bmt.updatePeddlestox(tpz.zone.YUHTUNGA_JUNGLE, ID.npc.PEDDLESTOX)
end

function onGameDay()
    tpz.bmt.updatePeddlestox(tpz.zone.YHOATOR_JUNGLE, ID.npc.PEDDLESTOX)
end

function onConquestUpdate(zone, updatetype)
    tpz.conq.onConquestUpdate(zone, updatetype)
end

function onZoneIn( player, prevZone)
    local cs = -1

    if player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
        player:setPos( 299.997, -5.838, -622.998, 190)
    end

    if triggerLightCutscene(player) then -- Quest: I Can Hear A Rainbow
        cs = 2
    end

    return cs
end

function onRegionEnter( player, region)
end

function onEventUpdate( player, csid, option)
    if csid == 2 then
        lightCutsceneUpdate(player) -- Quest: I Can Hear A Rainbow
    end
end

function onEventFinish( player, csid, option)
    if csid == 2 then
        lightCutsceneFinish(player) -- Quest: I Can Hear A Rainbow
    end
end
