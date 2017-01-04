-----------------------------------
--
--     EFFECT_ARCANE_CIRCLE
--
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
   target:addMod(MOD_ARCANA_KILLER, effect:getPower());
   target:addMod(MOD_CRITHITRATE,effect:getSubPower());
   target:addMod(MOD_CRIT_DMG_INCREASE,effect:getSubPower());
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
   target:delMod(MOD_ARCANA_KILLER, effect:getPower());
   target:delMod(MOD_CRITHITRATE, effect:getSubPower());
   target:delMod(MOD_CRIT_DMG_INCREASE, effect:getSubPower());
end;
