-----------------------------------
--  Area: Bastok Mines
--   NPC: Hunt Registry
--  Type: Hi-jacked to do custom stuff
-- @zone 234
-- @pos 17 0 -117
--
-----------------------------------

package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

local rseItems =
{
	[1] = {18247,12761,13015,12871,12654},
	[2] = {18248,12762,13016,12872,12655},
	[3] = {18249,12763,13017,12873,12656},
	[4] = {18250,12764,13018,12874,12657},
	[5] = {18251,12765,13019,12875,12658},
	[6] = {18251,12765,13019,12875,12658},
	[7] = {18252,12766,13020,12876,12659},
	[8] = {18253,12767,13021,12877,12660}
};

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local race = player:getRace();

	for key,itemid in pairs(rseItems[race]) do --actualcode
		player:addItem(itemid, 1);
		player:messageSpecial(ITEM_OBTAINED, itemid);
	end
	--player:addItem(rseItems[race], 1);
    --player:messageSpecial(ITEM_OBTAINED, rseItems[race]);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

