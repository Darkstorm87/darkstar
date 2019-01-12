-----------------------------------
-- Area: Temple of Uggalepih
--  MOB: Iron Maiden
-----------------------------------
require("scripts/globals/regimes")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    dsp.regime.checkRegime(player, mob, 795, 2, dsp.regime.type.GROUNDS)
end