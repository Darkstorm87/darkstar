-----------------------------------
-- Area: Temenos E T    
-- NPC: mystic Avatar

-----------------------------------
package.loaded["scripts/zones/Temenos/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/limbus");
require("scripts/zones/Temenos/TextIDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    local mobID = mob:getID();
    if (mobID==16929030) then --Carbuncle (Central Temenos 2nd Floor)
        GetMobByID(16929032):updateEnmity(target);
        GetMobByID(16929031):updateEnmity(target);
        if (GetMobByID(16929033):isDead() and GetMobByID(16929039):isDead()) then
            mob:setMod(MOD_FIREDEF,-128);    
        else
            mob:setMod(MOD_FIREDEF,256);
        end
    
        if (GetMobByID(16929034):isDead() and GetMobByID(16929040):isDead()) then
            mob:setMod(MOD_ICEDEF,-128);
        else    
            mob:setMod(MOD_ICEDEF,256);
        end

        if (GetMobByID(16929035):isDead() and GetMobByID(16929041):isDead()) then
            mob:setMod(MOD_WINDDEF,-128);
        else
            mob:setMod(MOD_WINDDEF,256);
        end

        if (GetMobByID(16929036):isDead() and GetMobByID(16929042):isDead()) then
            mob:setMod(MOD_EARTHDEF,-128);    
        else
            mob:setMod(MOD_EARTHDEF,256);
        end

        if (GetMobByID(16929037):isDead() and GetMobByID(16929043):isDead()) then
            mob:setMod(MOD_THUNDERDEF,-128);
        else    
            mob:setMod(MOD_THUNDERDEF,256);
        end

        if (GetMobByID(16929038):isDead() and GetMobByID(16929044):isDead()) then
            mob:setMod(MOD_WATERDEF,-128);
        else
            mob:setMod(MOD_WATERDEF,256);    
        end        

        mob:setMod(MOD_LIGHTDEF,256);
        mob:setMod(MOD_DARKDEF,-128);    
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local mobID = mob:getID();
    local mobX = mob:getXPos();
    local mobY = mob:getYPos();
    local mobZ = mob:getZPos();

    if (mobID==16928844) then --Ifrit
        GetNPCByID(16928768+40):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+40):setStatus(STATUS_NORMAL);
    elseif (mobID==16928853) then --Shiva
        GetNPCByID(16928768+45):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+45):setStatus(STATUS_NORMAL);
    elseif (mobID==16928862) then --Garuda
        GetNPCByID(16928768+46):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+46):setStatus(STATUS_NORMAL);
    elseif (mobID==16928871) then --Titan
        GetNPCByID(16928768+47):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+47):setStatus(STATUS_NORMAL);
    elseif (mobID==16928880) then --Ramuh
        GetNPCByID(16928768+68):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+68):setStatus(STATUS_NORMAL);
    elseif (mobID==16928889) then --Leviathan
        GetNPCByID(16928768+69):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+69):setStatus(STATUS_NORMAL);
    elseif (mobID==16928894) then --Fenrir
        GetNPCByID(16928768+70):setPos(mobX,mobY,mobZ);
        GetNPCByID(16928768+70):setStatus(STATUS_NORMAL);
    elseif (mobID==16929030) then --Carbuncle (Central Temenos 2nd Floor)
        if (GetMobByID(16929031):isDead() and GetMobByID(16929032):isDead() ) then
            GetNPCByID(16928768+77):setPos(0.5,-6,-459);
            GetNPCByID(16928768+77):setStatus(STATUS_NORMAL);
            GetNPCByID(16928768+472):setStatus(STATUS_NORMAL);
        end
    end
end;
