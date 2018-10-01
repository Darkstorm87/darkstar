-----------------------------------
-- Area: West Sarutabaruta
--  NPC: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_WEST_SARUTA,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
    updateFov(player,csid,option,26,27,28,29,61);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,26,27,28,29,61,FOV_MSG_WEST_SARUTA);
end;
