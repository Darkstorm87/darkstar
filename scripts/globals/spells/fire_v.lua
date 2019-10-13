-----------------------------------------
-- Spell: Fire V
-- Deals fire damage to an enemy.
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
    spellParams.V0 = 800
    spellParams.V50 = 1040
    spellParams.V100 = 1252
    spellParams.V200 = 1637
    spellParams.M0 = 4.8
    spellParams.M50 = 4.24
    spellParams.M100 = 3.85
    spellParams.M200 = 3
    local spellParams = calculateElementalNukeSpellParams(caster, ELEMENTAL_TIER_5, NOT_AOE);
	spellParams.VMob = 785;
	spellParams.MMob = 2.3;

    return doElementalNuke(caster, spell, target, spellParams)
end
