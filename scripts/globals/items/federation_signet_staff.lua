-----------------------------------------
-- ID: 17585
-- Item: Federation Signet Staff
-- Effect: Signet
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (player:getNation() == WINDURST)
        if (target:getNation() == WINDURST)
        target:delStatusEffect(EFFECT_SIGIL);
        target:delStatusEffect(EFFECT_SANCTION);
        target:delStatusEffect(EFFECT_SIGNET);
        target:addStatusEffect(EFFECT_SIGNET,0,0,18000);
        end;
    end;
end;