-----------------------------------------
-- Spell: Huton: Ichi
-- Deals wind damage to an enemy and lowers its resistance against ice.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

	dmg = calculateMagicDamage(10,1,caster,spell,target,NINJUTSU_SKILL,MOD_INT,false);
	--get resist multiplier (1x if no resist)
	resist = applyResistance(caster,spell,target,caster:getMod(MOD_INT)-target:getMod(MOD_INT),NINJUTSU_SKILL,1.0);
	--get the resisted damage
	dmg = dmg*resist;
	--add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    -- boost ninjitsu damage
    -- 5% ninjitsu damage
    local head = caster:getEquipID(SLOT_HEAD);
    if(head == 15084) then
        dmg = math.floor(dmg * 1.05);
    end

	dmg = addBonuses(caster,spell,target,dmg);
	--add in target adjustment
	dmg = adjustForTarget(target,dmg);
	--add in final adjustments including the actual damage dealt
	final = finalMagicAdjustments(caster,target,spell,dmg);

	handleNinjutsuDebuff(caster, target, spell, 30, 15, MOD_ICERES);

	return final;

end;
