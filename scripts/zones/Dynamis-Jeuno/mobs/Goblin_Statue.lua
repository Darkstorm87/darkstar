-----------------------------------
-- Area: Dynamis Jeuno
-- NPC:  Goblin Statue
-- Map1 Position: http://images3.wikia.nocookie.net/__cb20090312005127/ffxi/images/b/bb/Jeu1.jpg
-- Map2 Position: http://images4.wikia.nocookie.net/__cb20090312005155/ffxi/images/3/31/Jeu2.jpg
-- Vanguard Position: http://faranim.livejournal.com/39860.html
-----------------------------------
package.loaded["scripts/zones/Dynamis-Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/dynamis");
require("scripts/zones/Dynamis-Jeuno/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
	
	local X = mob:getXPos();
	local Y = mob:getYPos();
	local Z = mob:getZPos();
	local spawnList = jeunoList;
	
	for nb = 1, table.getn(spawnList), 2 do
		if(mob:getID() == spawnList[nb]) then
			for nbi = 1, table.getn(spawnList[nb + 1]), 1 do
				if((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
				local mobNBR = spawnList[nb + 1][nbi];
				
				if(mobNBR <= 20) then -- Spawn normal Mob
					if(mobNBR == 0) then mobNBR = math.random(1,15);  end -- Spawn random Vanguard (TEMPORARY)
					local mobList = getListDynaMob(target,mobNBR);
					
					for nbo = 1, table.getn(mobList), 1 do
						if(GetMobAction(mobList[nbo]) == 0) then
							-- Spawn Mob
							SpawnMob(mobList[nbo]):updateEnmity(target);
							GetMobByID(mobList[nbo]):setPos(X,Y,Z);
							-- Spawn Pet for BST, DRG, and SMN
							if(mobNBR == 9 or mobNBR == 14 or mobNBR == 15) then
								SpawnMob(mobList[nbo] + 1):updateEnmity(target);
								GetMobByID(mobList[nbo] + 1):setPos(X,Y,Z);
							end
							break;
						end
					end
				elseif(mobNBR > 20) then -- Spawn NM
					SpawnMob(mobNBR);
					MJob = GetMobByID(mobNBR):getMainJob();
					if(MJob == 9 or MJob == 14 or MJob == 15) then
						-- Spawn Pet for BST, DRG, and SMN
						SpawnMob(mobNBR + 1):updateEnmity(target);
						GetMobByID(mobNBR + 1):setPos(X,Y,Z);
					end
				end
			end
		end
	end
	
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	
	mobID = mob:getID();
	
	-- HP Bonus: 005 011 016 023 026 031 040 057 063 065 068 077 079 080 082 083 084 093 102 119 | 123 126 128 
	if(mobID == 17547534 or mobID == 17547540 or mobID == 17547545 or mobID == 17547552 or mobID == 17547555 or mobID == 17547560 or mobID == 17547569 or mobID == 17547586 or
	   mobID == 17547592 or mobID == 17547594 or mobID == 17547597 or mobID == 17547606 or mobID == 17547608 or mobID == 17547609 or mobID == 17547612 or mobID == 17547613 or 
	   mobID == 17547622 or mobID == 17547631 or mobID == 17547647 or mobID == 17547651 or mobID == 17547654 or mobID == 17547656) then 
		killer:addHP(2000);
		killer:messageBasic(024,(killer:getMaxHP()-killer:getHP()));
	-- MP Bonus: 009 012 017 024 025 030 039 044 056 062 064 067 076 078 081 082 085 094 095 101 118 | 122 127 129 150
	elseif(mobID == 17547538 or mobID == 17547541 or mobID == 17547546 or mobID == 17547553 or mobID == 17547554 or mobID == 17547559 or mobID == 17547568 or mobID == 17547573 or 
		   mobID == 17547585 or mobID == 17547591 or mobID == 17547593 or mobID == 17547596 or mobID == 17547605 or mobID == 17547607 or mobID == 17547610 or mobID == 17547611 or 
		   mobID == 17547614 or mobID == 17547623 or mobID == 17547624 or mobID == 17547630 or mobID == 17547646 or mobID == 17547650 or mobID == 17547655 or mobID == 17547657 or 
		   mobID == 17547678) then 
		killer:addMP(2000);
		killer:messageBasic(025,(killer:getMaxMP()-killer:getMP()));
	end
	-- Spawn 089-097 when statue 044 is defeated
	if(mobID == 17547573 and alreadyReceived(killer,5) == false) then
		addDynamisList(killer,16);
		for nbx = 17547618, 17547626, 1 do SpawnMob(nbx); end
	end
	-- Spawn 114-120 when statue 064 is defeated
	if(mobID == 17547593 and alreadyReceived(killer,6) == false) then
		addDynamisList(killer,32);
		for nbx = 17547642, 17547648, 1 do SpawnMob(nbx); end
	end
	-- Spawn 098-100 when statue 073 074 075 are defeated
	if(alreadyReceived(killer,7) == false and GetMobAction(17547602) == 0 and GetMobAction(17547603) == 0 and GetMobAction(17547604) == 0) then
		addDynamisList(killer,64);
		SpawnMob(17547627); -- 098
		SpawnMob(17547628); -- 099
		SpawnMob(17547629); -- 100
	end
	-- Spawn 101-112 when statue 098 099 100 are defeated
	if(alreadyReceived(killer,8) == false and GetMobAction(17547627) == 0 and GetMobAction(17547628) == 0 and GetMobAction(17547629) == 0) then
		addDynamisList(killer,128);
		for nbx = 17547630, 17547641, 1 do SpawnMob(nbx); end
	end
	
end;