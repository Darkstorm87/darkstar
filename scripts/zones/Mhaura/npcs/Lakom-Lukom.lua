-----------------------------------
-- Area: Mhaura
-- NPC: Lakom-Lukom 
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Mhaura/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Mhaura/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
player:startEvent(0x258);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printff("CSID: %u",csid);
    -- printff("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printff("CSID: %u",csid);
    -- printff("RESULT: %u",option);
end;
