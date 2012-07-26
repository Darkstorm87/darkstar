-----------------------------------	
-- Shark Bite	
-- Dagger weapon skill	
-- Skill level: 225 	
-- Delivers a twofold attack. Damage varies with TP.	
-- Will stack with Sneak Attack.	
-- Will stack with Trick Attack.	
-- Aligned with the Breeze Gorget & Thunder Gorget.	
-- Aligned with the Breeze Belt & Thunder Belt.	
-- Element: None	
-- Modifiers: DEX:50%	
-- 100%TP    200%TP    300%TP	
-- 2.00      2.50      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 2;
	ftp100 = 2; ftp200 = 2.5; ftp300 = 3;
	str_wsc = 0.0; dex_wsc = 0.5; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
