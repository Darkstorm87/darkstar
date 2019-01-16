-----------------------------------
-- Area: PsoXja
--  NPC: TOWER_C_Lift_E !pos 310 1.250 290
-----------------------------------

function onSpawn(npc)

    local elevator =
    {
        id = dsp.elevator.TIMED_AUTOMATIC,                      -- id is usually 0
        lowerDoor = npc:getID() + 1, -- lowerDoor's npcid
        upperDoor = npc:getID() + 2, -- upperDoor usually has a smaller id than lowerDoor
        elevator = npc:getID(),       -- actual elevator npc's id is usually the smallest
        started = 1,                 -- is the elevator already running
        regime = 1,                  --
        reversedAnimations = true, 
    }

    npc:setElevator(elevator.id, elevator.lowerDoor, elevator.upperDoor, elevator.elevator, elevator.started, elevator.regime, elevator.reversedAnimations);
end;