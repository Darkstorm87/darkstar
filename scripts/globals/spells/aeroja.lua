-----------------------------------------
-- Spell: Aeroja
-- Deals wind damage to enemies within area of effect.
-- successive use enhances spell potency.
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
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_4, AOE);

    return doElementalNuke(caster, spell, target, spellParams);
end;
