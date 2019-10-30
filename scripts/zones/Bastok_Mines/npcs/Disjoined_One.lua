-----------------------------------
-- Area: Bastok Mines
-- NPC: Disjoined One
-- Made into a Custom Augment NPC
-----------------------------------
local ID = require("scripts/zones/Bastok_Mines/IDs");
require("scripts/globals/status");
-----------------------------------
-- onTrade Action
-----------------------------------

local augCost = {
				  [0] = 50000,
				  [1] = 100000,
				  [2] = 200000,
				  [3] = 400000,
				  [4] = 800000,
				  [5] = 1600000,
				  [6] = 3200000,
				  [7] = 6400000,
				  [8] = 12800000,
				  [9] = 25600000,
				};
				
local nmDropItem = {
					[0] = 4064,
					[1] = 4065,
					[2] = 4066,
					[3] = 4067,
					[4] = 4068,
					[5] = 4069,
					[6] = 4070,
					[7] = 4071,
					[8] = 4072,
					[9] = 4073,
					[4064] = "Rem's Tale Ch.1",
					[4065] = "Rem's Tale Ch.2",
					[4066] = "Rem's Tale Ch.3",
					[4067] = "Rem's Tale Ch.4",
					[4068] = "Rem's Tale Ch.5",
					[4069] = "Rem's Tale Ch.6",
					[4070] = "Rem's Tale Ch.7",
					[4071] = "Rem's Tale Ch.8",
					[4072] = "Rem's Tale Ch.9",
					[4073] = "Rem's Tale Ch.10"
				};

local itemMap = {[1488] = "A Egg",
				 [1489] = "B Egg",
				 [1490] = "C Egg",
				 [1491] = "D Egg",
				 [1492] = "E Egg",
				 [1493] = "F Egg",
				 [1494] = "G Egg",
				 [1495] = "H Egg",
				 [1496] = "I Egg",
				 [1497] = "J Egg",
				 [1498] = "K Egg",
				 [1499] = "L Egg",
				 [1500] = "M Egg",
				 [1501] = "N Egg",
				 [1502] = "O Egg",
				 [1503] = "P Egg",
				 [1504] = "Q Egg",
				 [1505] = "R Egg",
				 [1506] = "S Egg",
				 [1507] = "T Egg",
				 [1508] = "U Egg",
				 [1509] = "V Egg",
				 [1510] = "W Egg",
				 [1511] = "X Egg",
				 [1512] = "Y Egg",
				 [1513] = "Z Egg",
				 [474] = "Red Chip",
				 [475] = "Blue Chip",
				 [476] = "Yellow Chip",
				 [477] = "Green Chip",
				 [478] = "Clear Chip",
				 [479] = "Purple Chip",
				 [480] = "White Chip",
				 [481] = "Black Chip"
				};

local augmentTypes = { [1] = "Stats", [2] = "Defensive", [3] = "Skills" };	
				
local augments = {
					[9] = { Type = 1, StartTier = true, EndTier = 3, NextAugId = 10, Description = "MP+10", AugItem1 = 1496, Multiplier = 10},
					[10] = { Type = 1, StartTier = false, EndTier = 6, NextAugId = 11, Description = "MP+10", AugItem1 = 1496, Multiplier = 10, BaseValue = 33},
					[11] = { Type = 1, StartTier = false, Description = "MP+10", AugItem1 = 1496, Multiplier = 10, BaseValue = 65},
					[1] = { Type = 1, StartTier = true, EndTier = 3, NextAugId = 2, Description = "HP+10", AugItem1 = 1495, Multiplier = 10},
					[2] = { Type = 1, StartTier = false, EndTier = 6, NextAugId = 3, Description = "HP+10", AugItem1 = 1495, Multiplier = 10, BaseValue = 33},
					[3] = { Type = 1, StartTier = false, Description = "HP+10", AugItem1 = 1495, Multiplier = 10, BaseValue = 65},
					[31] = { Type = 2, Description = "Evasion+2" , AugItem1 = 1489, Multiplier = 2 },
					[33] = { Type = 2, Description = "DEF+4" , AugItem1 = 1488, Multiplier = 4},
					[35] = { Type = 1, Description = "Mag.Acc+1" , AugItem1 = 1497},
					[37] = { Type = 2, Description = "Mag.Evasion+1" , AugItem1 = 1490},
					[39] = { Type = 2, Description = "Enmity+1" , AugItem1 = 1500},
					[40] = { Type = 2, Description = "Enmity-1" , AugItem1 = 1501},
					[42] = { Type = 3, Description = "Crit.hit rate+1" , AugItem1 = 1508},
					[42] = { Type = 2, Description = "Enemy crit. hit rate -1%" , AugItem1 = 1491},
					[49] = { Type = 3, Description = "Haste+1" , AugItem1 = 1490},
					[54] = { Type = 2, Description = "Phys. dmg. taken -1%" , AugItem1 = 1492},
					[55] = { Type = 2, Description = "Magic dmg. taken -1%" , AugItem1 = 1493},
					[56] = { Type = 2, Description = "Breath dmg. taken -1%" , AugItem1 = 1494},
					[129] = { Type = 1, Description = "Accuracy+1 Rng.Acc.+1" , AugItem1 = 1498},
					[130] = { Type = 1, Description = "Attack+1 Rng.Atk.+1" , AugItem1 = 1499},
					[134] = { Type = 2, Description = "Mag.Def.Bns.+1" , AugItem1 = 1495},
					[139] = { Type = 3, Description = "Rapid Shot+1" , AugItem1 = 1489},
					[140] = { Type = 3, Description = "Fastcast+1" , AugItem1 = 1488},
					[141] = { Type = 2, Description = "Conserve MP+1" , AugItem1 = 1498},
					[142] = { Type = 2, Description = "Store TP+1" , AugItem1 = 1497},
					[143] = { Type = 3, Description = "Dbl.Atk.+1" , AugItem1 = 1491},
					[146] = { Type = 3, Description = "Dual Wield+1" , AugItem1 = 1492},
					[195] = { Type = 2, Description = "Subtle Blow+1" , AugItem1 = 1503},
					[257] = { Type = 3, Description = "Hand-to-Hand skill+1" , AugItem1 = 1493},
					[258] = { Type = 3, Description = "Dagger skill+1" , AugItem1 = 1494},
					[259] = { Type = 3, Description = "Sword skill+1" , AugItem1 = 1495},
					[260] = { Type = 3, Description = "Great Sword skill+1" , AugItem1 = 1496},
					[261] = { Type = 3, Description = "Axe skill+1" , AugItem1 = 1497},
					[262] = { Type = 3, Description = "Great Axe skill+1" , AugItem1 = 1498},
					[263] = { Type = 3, Description = "Scythe skill+1" , AugItem1 = 1499},
					[264] = { Type = 3, Description = "Polearm skill+1" , AugItem1 = 1500},
					[265] = { Type = 3, Description = "Katana skill+1" , AugItem1 = 1501},
					[266] = { Type = 3, Description = "Great Katana skill+1" , AugItem1 = 1502},
					[267] = { Type = 3, Description = "Club skill+1" , AugItem1 = 1503},
					[268] = { Type = 3, Description = "Staff skill+1" , AugItem1 = 1504},
					[281] = { Type = 3, Description = "Archery skill+1" , AugItem1 = 1505},
					[282] = { Type = 3, Description = "Marksmanship skill+1" , AugItem1 = 1506},
					[283] = { Type = 3, Description = "Throwing skill+1" , AugItem1 = 1507},
					[286] = { Type = 2, Description = "Shield skill+1" , AugItem1 = 1499},
					[288] = { Type = 1, Description = "Divine magic skill+1" , AugItem1 = 1500},
					[289] = { Type = 1, Description = "Healing magic skill+1" , AugItem1 = 1501},
					[290] = { Type = 1, Description = "Enha.mag. skill+1" , AugItem1 = 1502},
					[291] = { Type = 1, Description = "Enfb.mag. skill+1" , AugItem1 = 1503},
					[292] = { Type = 1, Description = "Elem. magic skill+1" , AugItem1 = 1504},
					[293] = { Type = 1, Description = "Dark magic skill+1" , AugItem1 = 1505},
					[294] = { Type = 1, Description = "Summoning magic skill+1" , AugItem1 = 1506},
					[295] = { Type = 1, Description = "Ninjutsu skill+1" , AugItem1 = 1507},
					[296] = { Type = 1, Description = "Singing skill+1" , AugItem1 = 1508},
					[297] = { Type = 1, Description = "String instrument skill+1" , AugItem1 = 1509},
					[298] = { Type = 1, Description = "Wind instrument skill+1" , AugItem1 = 1510},
					[299] = { Type = 1, Description = "Blue Magic skill+1" , AugItem1 = 1511},
					[300] = { Type = 1, Description = "Geomancy Skill+1" , AugItem1 = 1512},
					[328] = { Type = 3, Description = "Crit. hit damage+1%" , AugItem1 = 1509},
					[329] = { Type = 2, Description = "Cure Potency+1%" , AugItem1 = 1502},
					[512] = { Type = 1, Description = "STR+1" , AugItem1 = 1488},
					[513] = { Type = 1, Description = "DEX+1" , AugItem1 = 1489},
					[514] = { Type = 1, Description = "VIT+1" , AugItem1 = 1490},
					[515] = { Type = 1, Description = "AGI+1" , AugItem1 = 1491},
					[516] = { Type = 1, Description = "INT+1" , AugItem1 = 1492},
					[517] = { Type = 1, Description = "MND+1" , AugItem1 = 1493},
					[518] = { Type = 1, Description = "CHR+1" , AugItem1 = 1494},
					[796] = { Type = 2, Description = "All elemental resists+1", AugItem1 = 1496}
					}
					
npcToAugmentType = {
					[17736005] = 1,
					[17736012] = 2,
					[17736007] = 3
				   }

function onTrade(player,npc,trade)
	local augmentType = npcToAugmentType[npc:getID()];
	if (trade:getSlotCount() == 1) then
		local item = trade:getItem();
		if (item:isType(dsp.itemType.ARMOR)) then
			local itemAugments = {}
			local augId, augVal;
            for i = 0, 4 do
                local augmentId, augmentValue = item:getAugment(i);
				if (augmentId > 0) then
					if (augments[augmentId].BaseValue ~= nil) then
						augmentValue = augmentValue + augments[augmentId].BaseValue;
					end
					
					if (itemAugments[augmentId] == nil) then
						itemAugments[augmentId] = { Value = augmentValue, AugSlot = i };
					else
						itemAugments[augmentId].Value = itemAugments[augmentId].Value + augmentValue;
					end
					
					if (augments[augmentId].Type == augmentType) then
						augId = augmentId;
						augVal = itemAugments[augmentId].Value;
					end
				end
            end

			if (augId ~= nil) then
				augVal = augVal + 1;
				if (augments[augId].Multiplier ~= nil) then
					augVal = math.floor(augVal / augments[augId].Multiplier);
				end
			
				if (augVal < 10) then
					player:PrintToPlayer(string.format("Bring me %s Gil, a %s, and a rare %s to enhance your augment.", augCost[augVal], itemMap[augments[augId].AugItem1], nmDropItem[nmDropItem[augVal]]), 0, npc:getName():gsub("_"," "));
				else
					player:PrintToPlayer("I cannot enhance this further.  You may begin again with another augment if you'd like.", 0, npc:getName():gsub("_"," "));
				end
			else
				player:PrintToPlayer(string.format("Here's what I can do for you. Bring me %s Gil and a rare %s, and one of the following items to choose your augment.", augCost[0], nmDropItem[nmDropItem[0]] ), 0, npc:getName():gsub("_"," "));
				sayAugmentOptions(augmentType, player, npc);
			end
		else
			player:PrintToPlayer("I cannot do anything with this.", 0, npc:getName():gsub("_"," "));
		end
	elseif (trade:getSlotCount() == 4) then
		local tradeGil = trade:getGil();
		if (tradeGil > 0) then
			local gearItem, augItemId, nmItemId;
			for i = 1, 8 do
				local itemId = trade:getItemId(i);
				if (itemId > 0) then
					local item = trade:getItem(i);
					if (item:isType(dsp.itemType.ARMOR) and gearItem == nil) then
						gearItem  = item;
					elseif(itemMap[itemId] ~= nil)  then
						augItemId = itemId;
					elseif(nmDropItem[itemId] ~= nil) then
						nmItemId = itemId;
					end
				end
			end
			
			if (gearItem ~= nil and augItemId ~= nil and nmItemId ~= nil) then
				local itemAugments = {};
				local augCount = 0;
				for i = 0, 4 do
					local augmentId, augmentValue = gearItem:getAugment(i);
					
					if (augmentId > 0 and augments[augmentId].BaseValue ~= nil) then
						augmentValue = augmentValue + augments[augmentId].BaseValue;
					end
					
					augmentValue = augmentValue + 1; -- want to work with index starting at 1 because math is easier
					
					if (augmentId > 0 and augments[augmentId] ~= nil) then
						if (itemAugments[augments[augmentId].Type] == nil) then
							itemAugments[augments[augmentId].Type] = {Value = augmentValue, AugId = augmentId, AugSlot = i};
							augCount = augCount + 1;
						elseif (itemAugments[augments[augmentId].Type].AugId == augmentId) then
							itemAugments[augments[augmentId].Type].Value = itemAugments[augments[augmentId].Type].Value + augmentValue;
						end
					end
				end
												
				local augId, augVal = getAugmentId(augItemId, augmentType, itemAugments, nmItemId);
				--player:PrintToPlayer(string.format("augid: %s, augval: %s", augId, augVal), 0, npc:getName():gsub("_"," "));
				if (augId ~= nil and itemAugments[augmentType] ~= nil and (itemAugments[augmentType].AugId == augId or augments[itemAugments[augmentType].AugId].NextAugId == augId)) then	
					if (augVal < 10) then
						if (augCost[augVal] == tradeGil and nmDropItem[augVal] == nmItemId and augments[augId].AugItem1 == augItemId) then
							augVal = augVal+1;
							if (augments[augId].Multiplier ~= nil) then
								augVal = (augVal * augments[augId].Multiplier);
							end
							itemAugments[augmentType].AugId = augId;
							itemAugments[augmentType].Value = augVal;
						else
							player:PrintToPlayer("These are not what I asked for.  I can do nothing with these.", 0, npc:getName():gsub("_"," "));
							return;
						end
					else
						player:PrintToPlayer("I cannot enhance this further.  You may begin again with another augment if you'd like.", 0, npc:getName():gsub("_"," "));
						return;
					end
				elseif (nmDropItem[0] == nmItemId and tradeGil == augCost[0] and augId ~= nil) then
					if (augments[augId].Multiplier ~= nil) then
						augVal = augments[augId].Multiplier;
					end
					
					if (itemAugments[augmentType] ~= nil) then
						itemAugments[augmentType].AugId = augId;
						itemAugments[augmentType].Value = augVal;
					else
						itemAugments[augmentType] = {AugId = augId, Value = augVal, AugSlot = augCount}; -- this is a new augment of this type
					end
				else
					player:PrintToPlayer("These are not what I asked for.  I can do nothing with these.", 0, npc:getName():gsub("_"," "));
					return;
				end
				
				local aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val;
				for k, v in pairs(itemAugments) do
					--player:PrintToPlayer(string.format("augid: %s, augslot: %s, augval: %s", v.AugId, v.AugSlot, v.Value), 0, npc:getName():gsub("_"," "));
					
					if (augments[v.AugId].BaseValue ~= nil and augments[v.AugId].BaseValue <= v.Value) then
						v.Value = v.Value - augments[v.AugId].BaseValue;
					elseif (v.Value > 0) then --handle all cases where we have an existing augment, get it back to zero index
						v.Value = v.Value - 1;
					end

					if (v.AugSlot == 0) then
						aug0 = v.AugId;
						aug0val = v.Value;
					elseif (v.AugSlot == 1) then
						aug1 = v.AugId;
						aug1val = v.Value;
					elseif (v.AugSlot == 2) then
						aug2 = v.AugId;
						aug2val = v.Value;
					end
				end
				
				local gearItemId = gearItem:getID();
				
				player:tradeComplete();
				player:addItem(gearItemId, 1, aug0, aug0val, aug1, aug1val, aug2, aug2val, aug3, aug3val);
				player:PrintToPlayer("Pleasure doing buisiness with you.", 0, npc:getName():gsub("_"," "));
				player:messageSpecial(ITEM_OBTAINED, gearItemId);
			else
				player:PrintToPlayer("These are not what I asked for.  I can do nothing with these.", 0, npc:getName():gsub("_"," "));
			end
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local npcId = npc:getID();
	local message = "";

	if (npcId == 17736005) then
		message = message .. "This one can make you stronger."
	elseif (npcId == 17736012) then
		message = message .. "This one can fortify you."
	elseif (npcId == 17736007) then
		message = message .. "This one can hone your martial skills."
	end

    if (message ~= "") then
        player:PrintToPlayer(message, 0, npc:getName():gsub("_"," "));
    end
	
	message = "For a price, a simple rare trinket, and a silly rabbit's Egg or colored Chip we can enhance your equipment."
	player:PrintToPlayer(message, 0, npc:getName():gsub("_"," "));
	
	message = "Let me have a closer look at a piece of your equipment and we can discuss what I can do for you."
	player:PrintToPlayer(message, 0, npc:getName():gsub("_"," "));
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

function getAugmentId(augItemId, augmentType, itemAugments, nmItemId)
	local augId;
	local augTier = 0;
		
	if (itemAugments[augmentType] ~= nil and nmDropItem[0] ~= nmItemId) then
		augTier = itemAugments[augmentType].Value;
		augId = itemAugments[augmentType].AugId;
				
		if (augments[augId].Multiplier ~= nil) then
			augTier = math.floor(augTier / augments[augId].Multiplier);
		end
		
		if (augments[augId].EndTier ~= nil and augments[augId].EndTier == augTier) then
			augId = augments[augId].NextAugId;
		end
	else 
		for k, v in pairs(augments) do
			if (v.Type == augmentType and v.AugItem1 == augItemId and (v.StartTier == nil or v.StartTier == true)) then
				augId = k;
				break;
			end
		end
	end
	
	return augId, augTier;
end;

function sayAugmentOptions(augmentType, player, npc)
	for k, v in pairs(augments) do
		if(v.Type == augmentType and v.EndTier == nil) then
			player:PrintToPlayer(string.format("     %s: %s",itemMap[v.AugItem1], v.Description), 0, npc:getName():gsub("_"," "));
		end
	end
end;
