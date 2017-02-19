-----------------------------------
-- Area: Bastok Mines
-- NPC: Disjoined One
-- Made into a Custom Augment NPC
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");
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
				  [7] = 6400000
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
					[9] = { Type = 1, Description = "MP+10" , AugItem1 = 1496, Multiplier = 10},
					[1] = { Type = 1, Description = "HP+10" , AugItem1 = 1495, Multiplier = 10},
					[31] = { Type = 2, Description = "Evasion+2" , AugItem1 = 1489, Multiplier = 2 },
					[33] = { Type = 2, Description = "DEF+10" , AugItem1 = 1488, Multiplier = 10},
					[35] = { Type = 1, Description = "Mag.Acc+1" , AugItem1 = 1497},
					[37] = { Type = 2, Description = "Mag.Evasion+1" , AugItem1 = 1490},
					[42] = { Type = 2, Description = "Enemy crit. hit rate -1%" , AugItem1 = 1491},
					[49] = { Type = 3, Description = "Haste+1" , AugItem1 = 1490},
					[54] = { Type = 2, Description = "Phys. dmg. taken -1%" , AugItem1 = 1492},
					[55] = { Type = 2, Description = "Magic dmg. taken -1%" , AugItem1 = 1493},
					[56] = { Type = 2, Description = "Breath dmg. taken -1%" , AugItem1 = 1494},
					[129] = { Type = 1, Description = "Accuracy+1 Rng.Acc.+1" , AugItem1 = 1498},
					[130] = { Type = 1, Description = "Attack+1 Rng.Atk.+1" , AugItem1 = 1499},
					[134] = { Type = 2, Description = "Mag.Def.Bns.+1" , AugItem1 = 1495},
					[141] = { Type = 2, Description = "Conserve MP+1" , AugItem1 = 1498},
					[143] = { Type = 3, Description = "Dbl.Atk.+1" , AugItem1 = 1491},
					[146] = { Type = 3, Description = "Dual Wield+1" , AugItem1 = 1492},
					[195] = { Type = 2, Description = "Subtle Blow+1" , AugItem1 = 1497},
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
					[288] = { Type = 3, Description = "Divine magic skill+1" , AugItem1 = 1508},
					[289] = { Type = 3, Description = "Healing magic skill+1" , AugItem1 = 1509},
					[290] = { Type = 3, Description = "Enha.mag. skill+1" , AugItem1 = 1510},
					[291] = { Type = 3, Description = "Enfb.mag. skill+1" , AugItem1 = 1511},
					[292] = { Type = 3, Description = "Elem. magic skill+1" , AugItem1 = 1512},
					[293] = { Type = 3, Description = "Dark magic skill+1" , AugItem1 = 1513},
					[294] = { Type = 3, Description = "Summoning magic skill+1" , AugItem1 = 474},
					[295] = { Type = 3, Description = "Ninjutsu skill+1" , AugItem1 = 475},
					[296] = { Type = 3, Description = "Singing skill+1" , AugItem1 = 476},
					[297] = { Type = 3, Description = "String instrument skill+1" , AugItem1 = 477},
					[298] = { Type = 3, Description = "Wind instrument skill+1" , AugItem1 = 478},
					[299] = { Type = 3, Description = "Blue Magic skill+1" , AugItem1 = 479},
					[300] = { Type = 3, Description = "Geomancy Skill+1" , AugItem1 = 480},
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
	if (trade:getItemCount() == 1) then
		local item = trade:getItem();
		if (item:isType(ITEM_ARMOR) and item:getSkillType() ~= SKILL_THR) then
			local message = "Need to check for item augments now";
			player:PrintSayToPlayer(npc,message);

			local itemAugments = {}
            for i = 0, 3 do
                local augmentId, augmentValue = item:getAugment(i);
				itemAugments[augmentId] = { Value = augmentValue, AugSlot = i };
				player:PrintToPlayer(string.format("%s - %s", augmentId, augmentValue));
            end

			local augmentType = npcToAugmentType[npc:getID()];
			
			local augId, augVal = findAugment(itemAugments, augmentType);
			if (augId ~= nil) then
				if (augments[augId].Multiplier ~= nil) then
					augVal = augVal / augments[augId].Multiplier;
				end
			
				if (augVal <= 7) then
					player:PrintSayToPlayer(npc,string.format("Bring me %s Gil, a rare %s, and a %s to enhance your augment.", augCost[augVal+1], "junk_item", itemMap[augments[augId].AugItem1] ));
				else
					player:PrintSayToPlayer(npc,"I cannot enhance this further.  You may begin again with another augment if you'd like.");
				end
			else
				player:PrintSayToPlayer(npc,string.format("Here's what I can do for you. Bring me %s Gil and a rare %s, and one of the following items to choose your augment.", augCost[0], "junk_item" ));
				sayAugmentOptions(augmentType, player, npc);
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
        player:PrintSayToPlayer(npc,message);
    end
	
	message = "For a price, a simple rare trinket, and a silly rabbit's Egg or colored Chip we can enhance your equipment."
	player:PrintSayToPlayer(npc,message);
	
	message = "Let me have a closer look at a piece of your equipment and we can discuss what I can do for you."
	player:PrintSayToPlayer(npc,message);
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

function findAugment(itemAugments, augmentType)
	for k, v in pairs(augments) do
		if (v.Type == augmentType and itemAugments[k] ~= nil and itemAugments[k].Value ~= nil) then
			return k, itemAugments[k].Value;
		end
	end
end;

function sayAugmentOptions(augmentType, player, npc)
	for k, v in pairs(augments) do
		if(v.Type == augmentType) then
			player:PrintSayToPlayer(npc,string.format("     %s: %s",itemMap[v.AugItem1], v.Description));
		end
	end
end;
