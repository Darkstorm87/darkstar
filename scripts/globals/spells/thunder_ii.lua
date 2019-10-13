-----------------------------------------
-- Spell: Thunder II
-- Deals lightning damage to an enemy.
-----------------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------------

function onMagicCastingCheck(caster, target, spell)
    return 0
end

function onSpellCast(caster, target, spell)
    local spellParams = {}
    spellParams.hasMultipleTargetReduction = false
    spellParams.resistBonus = 1.0
    spellParams.V = 178
    spellParams.V0 = 200
    spellParams.V50 = 300
    spellParams.V100 = 375
    spellParams.V200 = 475
    spellParams.M = 1
    spellParams.M0 = 2
    spellParams.M50 = 1.5
    spellParams.M100 = 1
    spellParams.M200 = 0
    spellParams.I = 210
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_2, NOT_AOE);
	spellParams.VMob = 178;
	spellParams.MMob = 1.0;

    return doElementalNuke(caster, spell, target, spellParams)
end
