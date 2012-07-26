-----------------------------------	
-- Vorpal Thrust	
-- Polearm weapon skill	
-- Skill Level: 175	
-- Delivers a single-hit attack. Chance of critical varies with TP.	
-- Will stack with Sneak Attack.	
-- Aligned with the Aqua Gorget & Light Gorget.	
-- Aligned with the Aqua Belt & Light Belt.	
-- Element: None	
-- Modifiers: STR:20% ; AGI:20%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 1;
	ftp100 = 1; ftp200 = 1; ftp300 = 1;
	str_wsc = 0.2; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.2; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.3; crit200 = 0.6; crit300 = 0.9;
	canCrit = true;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage, tpHits, extraHits = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return tpHits, extraHits, damage;
	
end	
