-----------------------------------
-- Area: Qulun Dome
--  NM:  Za Dha Adamantking
-----------------------------------

require("scripts/globals/titles");
require("scripts/zones/Qulun_Dome/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    -- TODO: Addtionaleffect:Slow on melee attacks
    mob:showText(mob,QUADAV_KING_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    player:addTitle(ADAMANTKING_USURPER);
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;
