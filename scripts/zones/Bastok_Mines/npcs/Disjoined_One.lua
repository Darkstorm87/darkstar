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
				
local augmentMap = {
	[dsp.slot.Main] = {Aug1 = { 45,362,97,126,329 }} , --DMG+1 OR Magic Damage+1 OR Pet: Attack+1 Rng.Atk.+1 OR Cure Potency
						Aug2 = { 288,289,290,291,292,293,294,295,296,297,298,299,96,
									SubType = {dsp.skill.HAND_TO_HAND = {257}, -- Weapon or magic skills or pet acc
												dsp.skill.DAGGER = {258},
												dsp.skill.SWORD = {259},
												dsp.skill.GREAT_SWORD = {260},
												dsp.skill.AXE = {261},
												dsp.skill.GREAT_AXE = {262},
												dsp.skill.SCYTHE = {263},
												dsp.skill.POLEARM = {264},
												dsp.skill.KATANA = {265},
												dsp.skill.GREAT_KATANA = {266},
												dsp.skill.CLUB = {267},
												dsp.skill.STAFF = {268}
									}
						},
						Aug3 = { 142,115,140 }, -- Store tp, pet store tp, fastcast+1
						Aug4 = { 195,116,141 } -- SUBTLE BLOW+1 OR Pet: Subtle Blow+1 OR Conserve MP+1
	},
	[dsp.slot.SUB] = {SubType = { Shield = {Aug1 = { 153,130,362,97,126,329 }, --isShield
											Aug2 = { 363,129,35,96,100 },
											Aug3 = { 796,142,115,140 },
											Aug4 = { 42,195,116,141 }},
									Grip = {Aug1 = { 130,362,97,126,329 }, -- weapon, sub slot, with no skill type
											Aug2 = { 129,35,96,100 },
											Aug3 = { 142,115,140 },
											Aug4 = { 195,116,141 }}
								}
	},
	[dsp.slot.RANGED] = {Aug1 = { 746 }, --DMG+1
						 Aug2 = { SubType = {dsp.skill.ARCHERY = 281, -- Weapon Skill
											 dsp.skill.MARKSMANSHIP = 282}},
						 Aug3 = { 142,115,140 }, -- Store tp, pet store tp, fastcast+1
						 Aug4 = { 195,116,141 }, -- SUBTLE BLOW+1 OR Pet: Subtle Blow+1 OR Conserve MP+1
						 SubType = { Animator = { Aug1 = 278, Aug2 = 279, Aug3 = 280 }
									 Instrument = { Aug1 = {67, Max=2}, Aug2 = 322 }},
						 
	},
	[dsp.slot.AMMO] = {Aug1 = {512,513,514,515,516,517,518,1792,1793,1794,1795,1796,1797,1798, Max=5}, -- STAT+1
						Aug2 = {39,40,105, Max=5} -- Enmity+1,-1, Pet: Enmity+1
	},
	[dsp.slot.HEAD] = {Aug1 = {143,123,211,140}, -- Dbl.Atk.+1 OR Pet: Dbl.Att.+1 OR Snapshot+1 OR Fast Cast+1
						Aug2 = {129,96,35,100}, -- Accuracy+1 Rng.Acc.+1 OR Pet: Accuracy+1 Rng.Acc.+1 OR Mag.Acc.+1 OR Pet MAcc+1
						Aug3 = {195,116,141}, -- Subtle Blow+1 OR Pet: Subtle Blow+1 OR Conserve MP+1
						Aug4 = {37,117} -- Mag. Evasion+1 OR Pet: Mag. Evasion+1
	},
	[dsp.slot.BODY] = {Aug1 = {1152,99}, -- DEF+10 OR Pet: DEF+10
						Aug2 = {1,9}, -- HP+10 OR MP+10
						Aug3 = {512,513,514,515,516,517,518,1792,1793,1794,1795,1796,1797,1798}, -- STAT+1 OR Pet: STAT+1
						Aug4 = {42,102,57} -- Crit.hit rate+1 OR Pet: Crit.hit rate+1 OR Magic crit. hit rate+1
	},
	[dsp.slot.HANDS] = {Aug1 = {129,96,35,100},
						Aug2 = {},
						Aug3 = {},
						Aug4 = {}
	},
	[dsp.slot.LEGS] = {},
	[dsp.slot.FEET] = {},
	[dsp.slot.NECK] = {},
	[dsp.slot.WAIST] = {},
	[dsp.slot.EAR1] = {},
	[dsp.slot.RING1] = {},
	[dsp.slot.BACK] = {},
}
			
--[[
dsp.slot.HANDS
Accuracy+1 Rng.Acc.+1 OR Pet: Accuracy+1 Rng.Acc.+1 OR Mag.Acc.+1 OR Pet: Mag.Acc.+1
Attack+1 Rng.Atk.+1 OR Pet: Attack+1 Rng.Atk.+1 OR Mag.Atk.Bns+1 OR Pet: Mag.Atk.Bns.+1
Dbl.Atk.+1 OR Pet: Dbl.Att.+1 OR Snapshot+1 OR Magic crit. hit rate+1 OR Pet: Magic Damage +1
STAT+1 OR Pet: STAT+1

dsp.slot.LEGS
Store TP+1 OR Pet: Store TP+1 OR Conserve MP+1
Crit.hit rate+1 OR Pet: Crit.hit rate+1 OR Magic crit. hit rate+1
Evasion+3 OR Pet: Evasion+3
HP+5 OR MP+5

dsp.slot.FEET
HASTE+1 OR Pet: Haste+1
Attack+1 Rng.Atk.+1 OR Pet: Attack+1 Rng.Atk.+1 OR Mag.Atk.Bns+1 OR Pet: Mag.Atk.Bns.+1
Dual Wield+1 OR Triple Atk.+1 OR Pet: Dbl.Att.+1 OR Mag. crit. hit dmg.+1% OR Rapidshot+1
Evasion+1 OR Pet: Evasion+1

dsp.slot.NECK
Enmity+1 OR Enmity-1 OR Pet: Enmity-1 MAX 5
HP+5 OR MP+5

dsp.slot.WAIST
HASTE+1 OR Pet: Haste+1 MAX 5
Attack+1 Rng.Atk.+1 OR Accuracy+1 Rng.Acc.+1 OR Pet: Accuracy+1 Rng.Acc+1 OR Pet: Attack+1 Rng.Atk.+1 MAX 5

dsp.slot.EAR1
Weapon or Magic Skill +1 OR automaton skill+1 MAX 5
ENMITY+1 OR Enmity-1 OR Subtle Blow+1 MAX 2

dsp.slot.RING1
STAT+1 OR Pet: STAT+1 MAX 5
All elemental resists+1 MAX 5

dsp.slot.BACK
DEF+10 OR Pet: DEF+10 MAX 5
Enemy crit. hit rate-1 OR Pet: Enemy crit. hit rate -1 MAX 5
]]--
				
local augments = {
					[1] =   { Type = 1, StartTier = true, EndTier = 3, NextAugId = 2, Description = "HP+10", AugItem1 = 1495, Multiplier = 10},
					[2] =   { Type = 1, StartTier = false, EndTier = 6, NextAugId = 3, Description = "HP+10", AugItem1 = 1495, Multiplier = 10, BaseValue = 33},
					[3] =   { Type = 1, StartTier = false, EndTier = 9, NextAugId = 4, Description = "HP+10", AugItem1 = 1495, Multiplier = 10, BaseValue = 65},
					[4] =   { Type = 1, StartTier = false, Description = "HP+10", AugItem1 = 1495, Multiplier = 10, BaseValue = 97},
					[9] =   { Type = 1, StartTier = true, EndTier = 3, NextAugId = 10, Description = "MP+10", AugItem1 = 1496, Multiplier = 10},
					[10] =  { Type = 1, StartTier = false, EndTier = 6, NextAugId = 11, Description = "MP+10", AugItem1 = 1496, Multiplier = 10, BaseValue = 33},
					[11] =  { Type = 1, StartTier = false, EndTier = 9, NextAugId = 12, Description = "MP+10", AugItem1 = 1496, Multiplier = 10, BaseValue = 65},
					[12] =  { Type = 1, StartTier = false, Description = "MP+10", AugItem1 = 1496, Multiplier = 10, BaseValue = 97},

					[1153] =  { Type = 2, Description = "Evasion+3" , AugItem1 = 1489 },
					
					[1152] =  { Type = 2, Description = "DEF+10" , AugItem1 = 1488},
					
					[35] =  { Type = 1, Description = "Mag.Acc+1" , AugItem1 = 1497},
					
					[37] =  { Type = 2, Description = "Mag.Evasion+1" , AugItem1 = 1490},
					[1154] =  { Type = 2, Description = "Mag.Evasion+3" , AugItem1 = XXX},
					
					[45] =  { Type = 1, Description = "DMG+1" , AugItem1 = XXX}, -- MELEE
					[57] =  { Type = 1, Description = "Magic crit. hit rate+1" , AugItem1 = XXX}, -- MELEE
					[129] =  { Type = 1, Description = "Accuracy+1 Rng.Acc.+1" , AugItem1 = XXX},
					[130] =  { Type = 1, Description = "Attack+1 Rng.Atk.+1" , AugItem1 = XXX},
					
					
					[746] =  { Type = 1, Description = "DMG+1" , AugItem1 = XXX}, -- RANGED
					
					[362] = {Description = "Magic Damage+1", AugItem1 = XXX},
					
					[153] = {Description = "Shield Mastery+1", AugItem1 = XXX},					
					[363] = {Description = "Chance of successful block+1", AugItem1 = XXX},
					
					[96] = {Description = "Pet: Accuracy+1 Rng.Acc+1", AugItem1 = XXX},
					[97] = {Description = "Pet: Attack+1 Rng.Atk.+1", AugItem1 = XXX},
					[99] = {Description = "Pet: DEF+1", Multiplier = 10, AugItem1 = XXX},
					[100] = {Description = "Pet: Mag.Acc.+1", AugItem1 = XXX},
					[101] = {Description = "Pet: Mag.Atk.Bns.+1", AugItem1 = XXX},
					[102] = {Description = "Pet: Crit.hit rate+1", AugItem1 = XXX},
					[105] = {Description = "Pet: Enmity-1", AugItem1 = XXX},
					[115] = {Description = "Pet: Store TP+1", AugItem1 = XXX},
					[116] = {Description = "Pet: Subtle Blow+1", AugItem1 = XXX},
					[117] = {Description = "Pet: Mag. Evasion+1", AugItem1 = XXX},
					[123] = {Description = "Pet: Dbl.Att.+1", AugItem1 = XXX},
					[126] = {Description = "Pet: Magic Damage +1", AugItem1 = XXX},
					[329] = {Description = "Cure potency+1%", AugItem1 = XXX},
					
					[1792] = { Type = 1, Description = "Pet: STR+1" , AugItem1 = XXX},
					[1793] = { Type = 1, Description = "Pet: DEX+1" , AugItem1 = XXX},
					[1794] = { Type = 1, Description = "Pet: VIT+1" , AugItem1 = XXX},
					[1795] = { Type = 1, Description = "Pet: AGI+1" , AugItem1 = XXX},
					[1796] = { Type = 1, Description = "Pet: INT+1" , AugItem1 = XXX},
					[1797] = { Type = 1, Description = "Pet: MND+1" , AugItem1 = XXX},
					[1798] = { Type = 1, Description = "Pet: CHR+1" , AugItem1 = XXX},
					
					[278] = {Description = "Automaton Melee skill+1", AugItem1 = XXX},
					[279] = {Description = "Automaton Ranged skill+1", AugItem1 = XXX},
					[280] = {Description = "Automaton Magic skill+1", AugItem1 = XXX},
					
					[67] = {Description = "All songs+1", AugItem1 = XXX},
					[322] = {Description = "Song spellcasting time -1%", AugItem1 = XXX},
					
					[39] =  { Type = 2, Description = "Enmity+1" , AugItem1 = 1500},
					[40] =  { Type = 2, Description = "Enmity-1" , AugItem1 = 1501},
					[42] =  { Type = 3, Description = "Crit.hit rate+1" , AugItem1 = 1508},
					[42] =  { Type = 2, Description = "Enemy crit. hit rate -1%" , AugItem1 = 1491},
					[49] =  { Type = 3, Description = "Haste+1" , AugItem1 = 1490},
					[54] =  { Type = 2, Description = "Phys. dmg. taken -1%" , AugItem1 = 1492},
					[55] =  { Type = 2, Description = "Magic dmg. taken -1%" , AugItem1 = 1493},
					[56] =  { Type = 2, Description = "Breath dmg. taken -1%" , AugItem1 = 1494},
					[134] = { Type = 2, Description = "Mag.Def.Bns.+1" , AugItem1 = 1495},
					[139] = { Type = 3, Description = "Rapid Shot+1" , AugItem1 = 1489},
					[140] = { Type = 3, Description = "Fastcast+1" , AugItem1 = 1488},
					[141] = { Type = 2, Description = "Conserve MP+1" , AugItem1 = 1498},
					[142] = { Type = 2, Description = "Store TP+1" , AugItem1 = 1497},
					[143] = { Type = 3, Description = "Dbl.Atk.+1" , AugItem1 = 1491},
					[146] = { Type = 3, Description = "Dual Wield+1" , AugItem1 = 1492},
					[195] = { Type = 2, Description = "Subtle Blow+1" , AugItem1 = 1503},
					[211] = { Type = 2, Description = "Snapshot+1" , AugItem1 = 1503},
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

function onTrade(player,npc,trade)
	if (trade:getSlotCount() == 1) then
		local item = trade:getItem();
		if (item:isType(dsp.itemType.ARMOR)) then
			local slotType = item:getSlotType()
			local skillType = item:getSkillType()
			
			
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

