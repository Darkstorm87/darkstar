-----------------------------------------
-- Spell: Water IV
-- Deals water damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0;
end;

function onSpellCast(caster, target, spell)
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_4, NOT_AOE);
	spellParams.VMob = 410;
	spellParams.MMob = 2.0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
