-----------------------------------	
-- Penta Thrust	
-- Polearm weapon skill	
-- Skill Level: 150	
-- Delivers a five-hit attack. params.accuracy varies with TP.	
-- PDIF calculates lower, with an approximate 0.3 mitigation, resulting in Penta Thrust's lower damage. Verification Needed	
-- Will stack with Sneak Attack.	
-- Aligned with the Shadow Gorget.	
-- Aligned with the Shadow Belt.	
-- Element: None	
-- Modifiers: STR:20% ; DEX:20%	
-- 100%TP    200%TP    300%TP	
-- 1.00      1.00      1.00	
-----------------------------------	
	
require("scripts/globals/status");	
require("scripts/globals/settings");	
require("scripts/globals/weaponskills");	
-----------------------------------	
	
function OnUseWeaponSkill(player, target, wsID)	
	
	local params = {};
	params.numHits = 5;
	params.ftp100 = 1; params.ftp200 = 1; params.ftp300 = 1;
	params.str_wsc = 0.2; params.dex_wsc = 0.2; params.vit_wsc = 0.0; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
	params.crit100 = 0.0; params.crit200 = 0.0; params.crit300 = 0.0;
	params.canCrit = false;
	params.acc100 = 0.8; params.acc200= 0.9; params.acc300= 1;
	params.atkmulti = 1;
	local damage, tpHits, extraHits = doPhysicalWeaponskill(player, target, params);
	
	return tpHits, extraHits, damage;
	
end	
