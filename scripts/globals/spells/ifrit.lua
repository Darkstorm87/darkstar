-----------------------------------------
--	
--	Spell: Ifrit
--	Summons Ifrit to fight by your side
-----------------------------------------

require("scripts/globals/pets");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	caster:spawnPet(PET_IFRIT);
	return 0;
end;