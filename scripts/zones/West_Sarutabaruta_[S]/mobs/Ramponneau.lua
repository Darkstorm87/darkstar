-----------------------------------
-- Area: West Sarutabaruta (S)
--   NM: Ramponneau
-----------------------------------
 
require("scripts/globals/status");
require("scripts/globals/magic");
 
-----------------------------------
-- onMobInitialize Action
-----------------------------------
 
function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_ADD_EFFECT, mob:getShortID());
    mob:addStatusEffect(EFFECT_SHOCK_SPIKES, 10, 0, 0);
    mob:getStatusEffect(EFFECT_SHOCK_SPIKES):setFlag(32);
end;
 
-----------------------------------
-- onMobFight Action
-----------------------------------
 
function onMobFight(mob,target)
    mob:SetMobAbilityEnabled(false);
end;
 
-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
 
function onAdditionalEffect(mob,target,damage)
    local power = math.random(4,15);
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    power = addBonusesAbility(mob, ELE_ICE, target, power, params);
    power = power * applyResistanceAddEffect(mob, target, ELE_ICE, 0);
    power = adjustForTarget(target, power, ELE_ICE);
    power = finalMagicNonSpellAdjustments(mob, target, ELE_ICE, power);
 
    local message = MSGBASIC_ADD_EFFECT_DMG;
    if (power < 0) then
        message = MSGBASIC_ADD_EFFECT_HEAL;
    end
 
    return SUBEFFECT_ICE_DAMAGE, message, power;
end;
 
-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------
 
function onMobDespawn(mob)
end;