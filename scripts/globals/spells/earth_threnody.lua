-----------------------------------------
-- Spell: Threnody - MOD_EARTHRES
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	return handleThrenody(caster, target, spell, 50, 60, MOD_EARTHRES);
end;
