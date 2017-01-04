-----------------------------------
--
--     EFFECT_ANCIENT_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_DRAGON_KILLER,8);
   target:addMod(MOD_ACC,effect:getSubPower());
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
   target:delMod(MOD_DRAGON_KILLER,8);
   target:delMod(MOD_ACC,effect:getSubPower());
end;
