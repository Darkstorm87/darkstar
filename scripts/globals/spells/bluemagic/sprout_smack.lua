require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local params = {};
    -- This data should match information on http://wiki.ffxiclopedia.org/wiki/Calculating_Blue_Magic_Damage
    params.tpmod = TPMOD_DURATION; params.dmgtype = DMGTYPE_BLUNT; params.scattr = SC_REVERBERATION;
        params.numhits = 1;
        params.multiplier = 1.5; params.tp150 = 1.5; params.tp300 = 1.5; params.azuretp = 1.5; params.duppercap = 11;
        params.str_wsc = 0.0; params.dex_wsc = 0.0; params.vit_wsc = 0.3; params.agi_wsc = 0.0; params.int_wsc = 0.0; params.mnd_wsc = 0.0; params.chr_wsc = 0.0;
    damage = BluePhysicalSpell(caster, target, spell, params);
    damage = BlueFinalAdjustments(caster, target, spell, damage, params);
    -- Missing Slow
    return damage;

end;
