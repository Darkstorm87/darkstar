-----------------------------------	
-- Savage Blade	
-- Sword weapon skill	
-- Skill Level: 240	
-- Delivers a twofold attack. Damage varies with TP.	
-- In order to obtain Savage Blade, the quest Old Wounds must be completed.	
-- Will stack with Sneak Attack.	
-- Aligned with the Breeze Gorget, Thunder Gorget & Soil Gorget	
-- Aligned with the Breeze Belt, Thunder Belt & Soil Belt.	
-- Element: None	
-- Modifiers: STR:30% ; MND:50%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.75      3.50	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 2;
	ftp100 = 1; ftp200 = 1.75; ftp300 = 3.5;
	str_wsc = 0.3; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.5; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
