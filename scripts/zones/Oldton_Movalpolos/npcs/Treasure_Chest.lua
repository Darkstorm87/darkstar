-----------------------------------
-- Area: Oldton Movalpolos
--  NPC: Treasure Chest
-- @zone 11
-----------------------------------
package.loaded["scripts/zones/Oldton_Movalpolos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/treasure");
require("scripts/zones/Oldton_Movalpolos/TextIDs");

local TreasureType = "Chest";
local TreasureLvL = 43;
local TreasureMinLvL = 33;

function onTrade(player,npc,trade)

    -- trade:hasItemQty(1062,1);         -- Treasure Key
    -- trade:hasItemQty(1115,1);        -- Skeleton Key
    -- trade:hasItemQty(1023,1);        -- Living Key
    -- trade:hasItemQty(1022,1);        -- Thief's Tools
    local questItemNeeded = 0;

    -- Player traded a key.
    if ((trade:hasItemQty(1062,1) or trade:hasItemQty(1115,1) or trade:hasItemQty(1023,1) or trade:hasItemQty(1022,1)) and trade:getItemCount() == 1) then
        local zone = player:getZoneID();
        -- IMPORTANT ITEM: Map -----------
        if (player:hasKeyItem(dsp.ki.MAP_OF_OLDTON_MOVALPOLOS) == false) then
            questItemNeeded = 1;
        end
        --------------------------------------
        local pack = openChance(player,npc,trade,TreasureType,TreasureLvL,TreasureMinLvL,questItemNeeded);
        local success = 0;
        if (pack[2] ~= nil) then
            player:messageSpecial(pack[2]);
            success = pack[1];
        else
            success = pack[1];
        end

        if (success ~= -2) then
            player:tradeComplete();

            if (math.random() <= success) then
                -- Succeded to open the coffer
                player:messageSpecial(CHEST_UNLOCKED);

                if (questItemNeeded == 1) then
                    player:addKeyItem(dsp.ki.MAP_OF_OLDTON_MOVALPOLOS);
                    player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.MAP_OF_OLDTON_MOVALPOLOS); -- Map of Oldton Movalpolos
                else
                    player:setVar("["..zone.."]".."Treasure_"..TreasureType,os.time() + math.random(CHEST_MIN_ILLUSION_TIME,CHEST_MAX_ILLUSION_TIME));

                    local loot = chestLoot(zone,npc);
                    -- print("loot array: "); -- debug
                    -- print("[1]", loot[1]); -- debug
                    -- print("[2]", loot[2]); -- debug

                    if (loot[1]=="gil") then
                        player:addGil(loot[2]*GIL_RATE);
                        player:messageSpecial(GIL_OBTAINED,loot[2]*GIL_RATE);
                    else
                        -- Item
                        player:addItem(loot[2]);
                        player:messageSpecial(ITEM_OBTAINED,loot[2]);
                    end
                end

                UpdateTreasureSpawnPoint(npc:getID());
            end
        end
    end
end;

function onTrigger(player,npc)
    player:messageSpecial(CHEST_LOCKED,1062);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;