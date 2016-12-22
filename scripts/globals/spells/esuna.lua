-----------------------------------------
-- Spell: Esuna
--
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_PARALYSIS, EFFECT_POISON, EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE, EFFECT_PETRIFICATION, EFFECT_SLEEP_I, EFFECT_SLEEP_II, EFFECT_SILENCE};

    if (caster:hasStatusEffect(EFFECT_AFFLATUS_MISERY)) then -- add extra statuses to the list of removables. Elegy and Requiem are specifically absent.
        removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_PARALYSIS, EFFECT_POISON, EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE, EFFECT_WEAKNESS, EFFECT_PETRIFICATION, EFFECT_SLEEP_I, EFFECT_SLEEP_II, EFFECT_SILENCE, EFFECT_WEIGHT, EFFECT_BIND, EFFECT_BIO, EFFECT_DIA, EFFECT_BURN, EFFECT_FROST, EFFECT_CHOKE, EFFECT_RASP, EFFECT_SHOCK, EFFECT_DROWN, EFFECT_STR_DOWN, EFFECT_DEX_DOWN, EFFECT_VIT_DOWN, EFFECT_AGI_DOWN, EFFECT_INT_DOWN, EFFECT_MND_DOWN, EFFECT_CHR_DOWN, EFFECT_ADDLE, EFFECT_SLOW, EFFECT_HELIX, EFFECT_ACCURACY_DOWN, EFFECT_ATTACK_DOWN, EFFECT_EVASION_DOWN, EFFECT_DEFENSE_DOWN, EFFECT_MAGIC_ACC_DOWN, EFFECT_MAGIC_ATK_DOWN, EFFECT_MAGIC_EVASION_DOWN, EFFECT_MAGIC_DEF_DOWN, EFFECT_MAX_TP_DOWN, EFFECT_MAX_MP_DOWN, EFFECT_MAX_HP_DOWN};
    end;
	
	local statusDel = 0;
	local delCount = 0;
	
	for i, effect in ipairs(removables) do
        if (target:hasStatusEffect(effect)) then
			target:delStatusEffectNoSilent(effect);
			delCount = delCount + 1;
			
			statusDel = effect;
        end;
		
		if (caster:hasStatusEffect(effect)) then
			caster:delStatusEffect(effect);
        end;
    end;
	
    if (delCount == 0) then -- this gets set to 0 if there's no status to delete.
        spell:setMsg(75); -- no effect
    end;

    return statusDel;
end;