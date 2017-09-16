-----------------------------------------
-- Spell: Blizzard III
-- Deals ice damage to an enemy.
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
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_3, NOT_AOE);
	spellParams.VMob = 320;
	spellParams.MMob = 1.5;

    return doElementalNuke(caster, spell, target, spellParams);
end;
