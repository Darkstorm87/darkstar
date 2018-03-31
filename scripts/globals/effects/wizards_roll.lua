-----------------------------------
--
--
--
-----------------------------------

require("scripts/globals/status");

function onEffectGain(target,effect)
    target:addMod(MOD_MATT, effect:getPower());
end;

function onEffectTick(target,effect)
end;

function onEffectLose(target,effect)
    target:delMod(MOD_MATT, effect:getPower());
end;
