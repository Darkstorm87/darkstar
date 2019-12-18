-----------------------------------
-- Area: South San d'Oria
--  NPC: Alivatand
-- Type: Guildworker's Union Representative
-- !pos -179.458 -1 15.857 230
-----------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs");
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/globals/quests");

local keyitems = {
    [0] = {
        id = dsp.ki.LEATHER_PURIFICATION,
        rank = 3,
        cost = 1
    },
    [1] = {
        id = dsp.ki.LEATHER_ENSORCELLMENT,
        rank = 3,
        cost = 1
    },
    [2] = {
        id = dsp.ki.TANNING,
        rank = 3,
        cost = 1
    },
    [3] = {
        id = dsp.ki.WAY_OF_THE_TANNER,
        rank = 9,
        cost = 1
    }
};

local items = {
    [0] = {
        id = 15448, -- Tanner's Belt
        rank = 3,
        cost = 1
    },
    [1] = {
        id = 14832, -- Tanner's Gloves
        rank = 5,
        cost = 1
    },
    [2] = {
        id = 14396, -- Tanner's Apron
        rank = 7,
        cost = 1
    },
    [3] = {
        id = 202, -- Golden Fleece
        rank = 9,
        cost = 1
    },
    [4] = {
        id = 339, -- Tanner's Signboard
        rank = 9,
        cost = 1
    },
    [5] = {
        id = 15823, -- Tanner's Ring
        rank = 1,
        cost = 1
    },
    [6] = {
        id = 3668, -- Hide Stretcher
        rank = 7,
        cost = 1
    },
    [7] = {
        id = 3329, -- Tanners' Emblem
        rank = 9,
        cost = 1
    }
};

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,dsp.quest.id.sandoria.FLYERS_FOR_REGINE);
    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(ID.text.FLYER_REFUSED);
        end
    else
        unionRepresentativeTrade(player, npc, trade, 691, 5);
    end
end;

function onTrigger(player,npc)
    unionRepresentativeTrigger(player, 5, 690, "guild_leathercraft", keyitems);
end;

function onEventUpdate(player,csid,option,target)
    if (csid == 690) then
        unionRepresentativeTriggerFinish(player, option, target, 5, "guild_leathercraft", keyitems, items);
    end
end;

function onEventFinish(player,csid,option,target)
    if (csid == 690) then
        unionRepresentativeTriggerFinish(player, option, target, 5, "guild_leathercraft", keyitems, items);
    elseif (csid == 691) then
        player:messageSpecial(ID.text.GP_OBTAINED, option);
    end
end;
