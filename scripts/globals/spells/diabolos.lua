-----------------------------------------
--	
--	Spell: Diabolos
--	Summons Diabolos to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_DIABOLOS);
	return 0;
end;