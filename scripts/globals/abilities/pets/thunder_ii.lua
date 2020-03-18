---------------------------------------------------
-- Thunder 2
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local dINT = math.floor(pet:getStat(tpz.mod.INT) - target:getStat(tpz.mod.INT))
    local tp = skill:getTP()

    local damage = math.floor(45 + 0.035*(tp))
    damage = damage + math.max(0, dINT * 2.5)
    damage = MobMagicalMove(pet,target,skill,damage,tpz.magic.ele.LIGHTNING,1,TP_NO_EFFECT,0)
    damage = mobAddBonuses(pet, nil, target, damage.dmg, tpz.magic.ele.LIGHTNING)
    damage = AvatarFinalAdjustments(damage,pet,skill,target,tpz.attackType.MAGICAL,tpz.damageType.LIGHTNING,1)

    target:takeDamage(damage, pet, tpz.attackType.MAGICAL, tpz.damageType.LIGHTNING)
    target:updateEnmityFromDamage(pet,damage)

    return damage
end