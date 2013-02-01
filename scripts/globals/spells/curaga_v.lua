-----------------------------------------
-- Spell: Curaga V
-- Restores HP of all party members within area of effect.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	local minCure = 600;
	
	local divisor = 1;
	local constant = 570;
	local power = getCurePowerOld(caster);
	if(power > 780) then
		divisor = 2.667;
		constant = 814;--this is too powerful and needs to be fixed when the rest of the curaga 5 numbers are determined
	end
	
	local final = getCureFinal(caster,spell,getBaseCureOld(power,divisor,constant),minCure,false);

	final = final + (final * target:getMod(MOD_CURE_POTENCY_RCVD));
	local diff = (target:getMaxHP() - target:getHP());
	if(final > diff) then
		final = diff;
	end
	target:restoreHP(final);
	target:delStatusEffect(EFFECT_SLEEP_I);
	target:delStatusEffect(EFFECT_SLEEP_II);
	caster:updateEnmityFromCure(target,final);
	return final;
end;