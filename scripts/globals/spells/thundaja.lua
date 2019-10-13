-----------------------------------------
-- Spell: Thundaja
-- Deals lightning damage to enemies within area of effect.
-- Successive use enhances spell potency.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = true
    spellParams.resistBonus = 1.0
    spellParams.V0 = 1000
    spellParams.V50 = 1200
    spellParams.V100 = 1387
    spellParams.V200 = 1762
    spellParams.M0 = 4
    spellParams.M50 = 3.75
    spellParams.M100 = 3.75
    spellParams.M200 = 3
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_4, AOE);
	spellParams.VMob = 1005;
	spellParams.MMob = 2.3;

    return doElementalNuke(caster, spell, target, spellParams)
end
