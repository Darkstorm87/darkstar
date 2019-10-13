-----------------------------------
--
-- dsp.effect.HEALING
-- Activated through the /heal command
--
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
-----------------------------------

function onEffectGain(target,effect)
    target:setAnimation(33)
end

function onEffectTick(target,effect)

    local healtime = effect:getTickCount()

    if healtime > 2 then
        -- curse II also known as "zombie"
        if not(target:hasStatusEffect(dsp.effect.DISEASE)) and target:hasStatusEffect(dsp.effect.PLAGUE) == false and target:hasStatusEffect(dsp.effect.CURSE_II) == false then
            local healHP = 0
			local baseHp = math.max(target:getMainLvl(), 10);
			local baseMp = math.max(math.floor(target:getMainLvl()/2), 10);

            if target:getContinentID() == 1 and target:hasStatusEffect(dsp.effect.SIGNET) then
                healHP = baseHp + (3 * math.floor(target:getMainLvl() / 10)) + (healtime - 2) * (1 + math.floor(target:getMaxHP() / 300)) + target:getMod(dsp.mod.HPHEAL)
            else
                target:addTP(HEALING_TP_CHANGE)
                healHP = baseHp + (healtime - 2) + target:getMod(dsp.mod.HPHEAL)
            end

            target:addHP(healHP)
            target:updateEnmityFromCure(target, healHP)
            target:addMP(baseMp + ((healtime - 2) * (1 + target:getMod(dsp.mod.CLEAR_MIND))) + target:getMod(dsp.mod.MPHEAL))
        end
    end
end

function onEffectLose(target,effect)
    target:setAnimation(0)
    target:delStatusEffect(dsp.effect.LEAVEGAME)
end
