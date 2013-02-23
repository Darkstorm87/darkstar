-----------------------------------------
-- Spell: BARBLIZZARD
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	enchanceSkill = caster:getSkillLevel(34);

	power = 40 + 0.2 * enchanceSkill;

	duration = 150;

	if(enchanceSkill >180)then
		duration = 150 + 0.8 * (enchanceSkill - 180);
	end

	if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
		duration = duration * 3;
	end

	target:addStatusEffect(EFFECT_BARBLIZZARD,power,0,duration,0,1);

	return EFFECT_BARBLIZZARD;
end;
