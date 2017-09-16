-----------------------------------------
-- Spell: Firaga II
-- Deals fire damage to enemies within area of effect.
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
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_2, AOE);
	spellParams.VMob = 312;
	spellParams.MMob = 1.0;

    return doElementalNuke(caster, spell, target, spellParams);
end;
