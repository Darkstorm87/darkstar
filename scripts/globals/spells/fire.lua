-----------------------------------------
-- Spell: Fire
-- Deals fire damage to an enemy.
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
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_1, NOT_AOE);
	spellParams.VMob = 35;
	spellParams.MMob = 1.0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
