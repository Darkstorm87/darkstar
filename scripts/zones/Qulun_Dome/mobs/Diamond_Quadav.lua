-----------------------------------
-- Area: Qulun_Dome
--  NM:  Diamond_Quadav
-- Note: PH for Za Dha Adamantking PH
-----------------------------------

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
    mob:showText(mob,DIAMOND_QUADAV_ENGAGE);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
end;