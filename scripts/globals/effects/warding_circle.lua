-----------------------------------
--
--     EFFECT_WARDING_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_DEMON_KILLER,effect:getPower());
   target:addMod(MOD_STORETP,effect:getSubPower());
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
   target:delMod(MOD_DEMON_KILLER,effect:getPower());
   target:delMod(MOD_STORETP,effect:getSubPower());
end;
