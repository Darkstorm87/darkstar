-----------------------------------
-- Area: Metalworks
--  NPC: Fariel
-- Type: Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Metalworks/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Metalworks/TextIDs");
require("scripts/globals/pathfind");
-----------------------------------

local path =
{
53.551208, -14.000000, -7.162227,
54.111534, -14.000000, -6.227105,
54.075279, -14.000000, -5.139729,
53.565350, -14.000000, 6.000605,
52.636345, -14.000000, 6.521872,
51.561535, -14.000000, 6.710593,
50.436523, -14.000000, 6.835652,
41.754219, -14.000000, 7.686310,
41.409531, -14.000000, 6.635177,
41.351002, -14.000000, 5.549131,
41.341057, -14.000000, 4.461191,
41.338020, -14.000000, -9.138797,
42.356136, -14.000000, -9.449953,
43.442558, -14.000000, -9.409095,
44.524868, -14.000000, -9.298069,
53.718494, -14.000000, -8.260445,
54.082706, -14.000000, -7.257769,
54.110283, -14.000000, -6.170790,
54.073116, -14.000000, -5.083439,
53.556625, -14.000000, 6.192736,
52.545383, -14.000000, 6.570893,
51.441212, -14.000000, 6.730487,
50.430820, -14.000000, 6.836911,
41.680725, -14.000000, 7.693455,
41.396103, -14.000000, 6.599321,
41.349224, -14.000000, 5.512603,
41.340771, -14.000000, 4.424644
};

function onSpawn(npc)
    npc:initNpcAi();
    npc:setPos(pathfind.first(path));
    onPath(npc);
end;

function onPath(npc)
    pathfind.patrol(npc, path);
end;

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(706);
    npc:wait();
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option,npc)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    npc:wait(0);
end;

