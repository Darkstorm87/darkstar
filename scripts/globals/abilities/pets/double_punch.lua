---------------------------------------------------
-- Double Punch M=6, 2 (still guessing here)
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/summon")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local numhits = 2
    local accmod = 1
    local dmgmod = 6
    local dmgmodsubsequent = 3

    local totaldamage = 0
    local damage = AvatarPhysicalMove(pet,target,skill,numhits,accmod,dmgmod,dmgmodsubsequent,TP_NO_EFFECT,1,2,3)
    totaldamage = AvatarFinalAdjustments(damage.dmg,pet,skill,target,dsp.attackType.PHYSICAL,dsp.damageType.BLUNT,numhits)
    target:takeDamage(totaldamage, pet, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    target:updateEnmityFromDamage(pet,totaldamage)

    return totaldamage
end