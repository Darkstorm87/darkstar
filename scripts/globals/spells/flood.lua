-----------------------------------------
-- Spell: Flood
-- Deals water damage to an enemy and lowers its resistance against lightning.
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
    local spellParams = {};
    spellParams.hasMultipleTargetReduction = false;
    spellParams.resistBonus = 1.0;
    spellParams.V0 = 700;
    spellParams.V50 = 800;
    spellParams.V100 = 900;
    spellParams.V200 = 1100;
    spellParams.M0 = 2;
    spellParams.M50 = 2;
    spellParams.M100 = 2;
    spellParams.M200 = 2;

    -- no point in making a separate function for this if the only thing they won't have in common is the name
    handleNinjutsuDebuff(caster,target,spell,30,10,dsp.mod.THUNDERRES);

    return doElementalNuke(caster, spell, target, spellParams);
end;
