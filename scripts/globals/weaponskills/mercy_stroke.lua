-----------------------------------	
-- Mercy Stroke	
-- Dagger weapon skill	
-- Skill level: N/A	
-- Batardeau/Mandau: Temporarily improves critical hit rate.	
-- Aftermath gives +5% critical hit rate.	
-- Must have Batardeau, Mandau, or Clement Skean equipped.	
-- Aligned with the Shadow Gorget & Soil Gorget.	
-- Aligned with the Shadow Belt & Soil Belt.	
-- Element: None	
-- Modifiers: STR:60%	
-- 100%TP    200%TP    300%TP	
-- 3.00      3.00      3.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	numHits = 4;
	ftp100 = 3; ftp200 = 3; ftp300 = 3;
	str_wsc = 0.6; dex_wsc = 0.0; vit_wsc = 0.0; agi_wsc = 0.0; int_wsc = 0.0; mnd_wsc = 0.0; chr_wsc = 0.0;
	crit100 = 0.0; crit200 = 0.0; crit300 = 0.0;
	canCrit = false;
	acc100 = 0.0; acc200= 0.0; acc300= 0.0;
	atkmulti = 1;
	damage = doPhysicalWeaponskill(player,target,numHits,str_wsc,dex_wsc,vit_wsc,agi_wsc,int_wsc,mnd_wsc,chr_wsc,canCrit,crit100,crit200,crit300,acc100,acc200,acc300,atkmulti);
	
	return damage;
	
end	
