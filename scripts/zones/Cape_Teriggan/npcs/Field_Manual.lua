-----------------------------------
-- Area: Cape Teriggan
-- Type: Field Manual
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onTrigger(player,npc)
    startFov(FOV_EVENT_TERIGGAN,player);
end;

function onTrade(player,npc,trade)
end;

function onEventUpdate(player,csid,option)
    updateFov(player,csid,option,104,105,106,107,108);
end;

function onEventFinish(player,csid,option)
    finishFov(player,csid,option,104,105,106,107,108,FOV_MSG_TERIGGAN);
end;
