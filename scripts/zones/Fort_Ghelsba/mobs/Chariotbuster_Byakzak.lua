-----------------------------------
-- Area: Fort Ghelsba
--   NM: Chariotbuster Byakzak
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
local ID = require("scripts/zones/Fort_Ghelsba/IDs");
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    DisallowRespawn(ID.mob.ORCISH_PANZER, false);
    GetMobByID(ID.mob.ORCISH_PANZER):setRespawnTime(900); -- 60 to 70 min
    mob:setLocalVar("pop", os.time() + 900) -- 21 to 24 hours
end;
