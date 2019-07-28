require("scripts/globals/battlefield")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/npc_util")
require("scripts/globals/status")
require("scripts/globals/zone")
require("scripts/globals/msg")
-----------------------------------

dynamis = {}

--[[
[zone] =
{
    csBit    = the bit in the Dynamis_Status player variable that records whether player has beaten this dynamis
               this bit number is also given to the start Dynamis event and message.
    csSand   = event ID for cutscene where Cornelia gives you the vial of shrouded sand
    csWin    = event ID for cutscene after you have beaten this Dynamis
    csDyna   = event ID for entering Dynamis
    winVar   = variable used to denote players who have beaten this Dynamis, but not yet viewed the cutscene
    winKI    = key item given as reward for this Dynamis
    enterPos = coordinates where player will be placed when entering this Dynamis
    reqs     = function that returns true if player meets requirements for entering this Dynamis
               minimum level and timer are checked separately
}
--]]

local entryInfo =
{
    [dsp.zone.SOUTHERN_SAN_DORIA] =
    {
        csBit = 1,
        csSand = 686,
        csWin = 698,
        csDyna = 685,
        winVar = "DynaSandoria_Win",
        winKI = dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER,
        enterPos = {161.838, -2.000, 161.673, 93, 185},
        reqs = function(player) return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [dsp.zone.BASTOK_MINES] =
    {
        csBit = 2,
        csSand = 203,
        csWin = 215,
        csDyna = 201,
        winVar = "DynaBastok_Win",
        winKI = dsp.ki.HYDRA_CORPS_EYEGLASS,
        enterPos = {116.482, 0.994, -72.121, 128, 186},
        reqs = function(player) return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [dsp.zone.WINDURST_WALLS] =
    {
        csBit = 3,
        csSand = 455,
        csWin = 465,
        csDyna = 452,
        winVar = "DynaWindurst_Win",
        winKI = dsp.ki.HYDRA_CORPS_LANTERN,
        enterPos = {-221.988, 1.000, -120.184, 0, 187},
        reqs = function(player) return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [dsp.zone.RULUDE_GARDENS] =
    {
        csBit = 4,
        csSand = 10016,
        csWin = 10026,
        csDyna = 10012,
        winVar = "DynaJeuno_Win",
        winKI = dsp.ki.HYDRA_CORPS_TACTICAL_MAP,
        enterPos = {48.930, 10.002, -71.032, 195, 188},
        reqs = function(player) return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) end,
    },
    [dsp.zone.BEAUCEDINE_GLACIER] =
    {
        csBit = 5,
        csWin = 134,
        csDyna = 119,
        winVar = "DynaBeaucedine_Win",
        winKI = dsp.ki.HYDRA_CORPS_INSIGNIA,
        enterPos = {-284.751, -39.923, -422.948, 235, 134},
        reqs = function(player)
            return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and
                   player:hasKeyItem(dsp.ki.HYDRA_CORPS_COMMAND_SCEPTER) and
                   player:hasKeyItem(dsp.ki.HYDRA_CORPS_EYEGLASS) and
                   player:hasKeyItem(dsp.ki.HYDRA_CORPS_LANTERN) and
                   player:hasKeyItem(dsp.ki.HYDRA_CORPS_TACTICAL_MAP)
        end,
    },
    [dsp.zone.XARCABARD] =
    {
        csBit = 6,
        csWin = 32,
        csDyna = 16,
        winVar = "DynaXarcabard_Win",
        winKI = dsp.ki.HYDRA_CORPS_BATTLE_STANDARD,
        enterPos = {569.312, -0.098, -270.158, 90, 135},
        reqs = function(player)
            return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and
                   player:hasKeyItem(dsp.ki.HYDRA_CORPS_INSIGNIA)
        end,
    },
    [dsp.zone.VALKURM_DUNES] =
    {
        csBit = 7,
        csFirst = 33,
        csWin = 39,
        csDyna = 58,
        winVar = "DynaValkurm_Win",
        winKI = dsp.ki.DYNAMIS_VALKURM_SLIVER,
        enterPos = {100, -8, 131, 47, 39},
        reqs = function(player)
            return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and
                  (player:hasCompletedMission(COP, dsp.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
    [dsp.zone.BUBURIMU_PENINSULA] =
    {
        csBit = 8,
        csFirst = 40,
        csWin = 46,
        csDyna = 22,
        winVar = "DynaBuburimu_Win",
        winKI = dsp.ki.DYNAMIS_BUBURIMU_SLIVER,
        enterPos = {155, -1, -169, 170, 40},
        reqs = function(player)
            return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and
                  (player:hasCompletedMission(COP, dsp.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
    [dsp.zone.QUFIM_ISLAND] =
    {
        csBit = 9,
        csFirst = 22,
        csWin = 28,
        csDyna = 3,
        winVar = "DynaQufim_Win",
        winKI = dsp.ki.DYNAMIS_QUFIM_SLIVER,
        enterPos = {-19, -17, 104, 253, 41},
        reqs = function(player)
            return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and
                  (player:hasCompletedMission(COP, dsp.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
    [dsp.zone.TAVNAZIAN_SAFEHOLD] =
    {
        csBit = 10,
        csFirst = 614,
        csWin = 615,
        csDyna = 588,
        winVar = "DynaTavnazia_Win",
        winKI = dsp.ki.DYNAMIS_TAVNAZIA_SLIVER,
        enterPos = {0.1, -7, -21, 190, 42},
        reqs = function(player)
            return player:hasKeyItem(dsp.ki.VIAL_OF_SHROUDED_SAND) and
                   player:hasKeyItem(dsp.ki.DYNAMIS_BUBURIMU_SLIVER) and
                   player:hasKeyItem(dsp.ki.DYNAMIS_QUFIM_SLIVER) and
                   player:hasKeyItem(dsp.ki.DYNAMIS_VALKURM_SLIVER) and
                  (player:hasCompletedMission(COP,dsp.mission.id.cop.DARKNESS_NAMED) or FREE_COP_DYNAMIS == 1)
        end,
    },
}

--[[
[zone] =
{
    entryPos = default entry coordinates (used for GMs warping to zone, for example)
    ejectPos = coordinates outside, where players will be sent when running out of time or using Somnial Threshold
}
--]]

local dynaInfo =
{
    [dsp.zone.DYNAMIS_SAN_DORIA] =
    {
        entryPos = {161.838, -2.000, 161.673, 93},
        ejectPos = {161.000, -2.000, 161.000, 94, 230},
    },
    [dsp.zone.DYNAMIS_BASTOK] =
    {
        entryPos = {116.482, 0.994, -72.121, 128},
        ejectPos = {112.000, 0.994, -72.000, 127, 234},
    },
    [dsp.zone.DYNAMIS_WINDURST] =
    {
        entryPos = {-221.988, 1.000, -120.184, 0},
        ejectPos = {-217.000, 1.000, -119.000, 94, 239},
    },
    [dsp.zone.DYNAMIS_JEUNO] =
    {
        entryPos = {48.930, 10.002, -71.032, 195},
        ejectPos = {48.930, 10.002, -71.032, 195, 243},
    },
    [dsp.zone.DYNAMIS_BEAUCEDINE] =
    {
        entryPos = {-284.751, -39.923, -422.948, 235},
        ejectPos = {-284.751, -39.923, -422.948, 235, 111},
    },
    [dsp.zone.DYNAMIS_XARCABARD] =
    {
        entryPos = {569.312, -0.098, -270.158, 90},
        ejectPos = {569.312, -0.098, -270.158, 90, 112},
    },
    [dsp.zone.DYNAMIS_VALKURM] =
    {
        entryPos = {100, -8, 131, 47},
        ejectPos = {119, -9, 131, 52, 103},
    },
    [dsp.zone.DYNAMIS_BUBURIMU] =
    {
        entryPos = {155, -1, -169, 170},
        ejectPos = {154, -1, -170, 190, 118},
    },
    [dsp.zone.DYNAMIS_QUFIM] =
    {
        entryPos = {-19, -17, 104, 253},
        ejectPos = {18, -19, 162, 240, 126},
    },
    [dsp.zone.DYNAMIS_TAVNAZIA] =
    {
        entryPos = {0.1, -7, -21, 190},
        ejectPos = {0, -7, -23, 195, 26},
    },
}

-------------------------------------------------
-- local functions
-------------------------------------------------

local function arg3(player, bit)
    local csVar = player:getVar("Dynamis_Status")
    local timeKI = player:hasKeyItem(dsp.ki.RHAPSODY_IN_AZURE) and 65536 or 0

    if csVar == 0 then
        return 1 + timeKI -- first time visiting any dynamis zone
    elseif not player:getMaskBit(csVar, bit) then
        return 2 + timeKI -- first time visiting this dynamis zone
    else
        return 3 + timeKI -- have visited this dynamis zone more than once
    end
end

-------------------------------------------------
-- global functions
-------------------------------------------------

dynamis.entryNpcOnTrigger = function(player, npc)
    local zoneId = player:getZoneID()
    local info = entryInfo[zoneId]
    local ID = zones[zoneId]

    -- shrouded sand cutscene
    if info.csSand and player:getMaskBit(player:getVar("Dynamis_Status"), 0) then
        player:startEvent(info.csSand)

    -- first visit cutscene
    elseif info.csFirst and not player:getMaskBit(player:getVar("Dynamis_Status"), info.csBit) then
        player:startEvent(info.csFirst)

    -- victory cutscene
    elseif player:getVar(info.winVar) == 1 then
        player:startEvent(info.csWin, info.winKI)

    -- dynamis entry
    elseif not info.reqs or info.reqs(player) then
        local realDay = os.time()
        local dynaWaitxDay = player:getVar("dynaWaitxDay")

        if player:getMainLvl() < DYNA_LEVEL_MIN then
            player:messageSpecial(ID.text.PLAYERS_HAVE_NOT_REACHED_LEVEL, DYNA_LEVEL_MIN)
        elseif (dynaWaitxDay + BETWEEN_2DYNA_WAIT_TIME * 60 * 60) < realDay then
            -- params: bit, cutscene option, Prismatic Hourglass KI, sJob option, junk, Shrouded Sand KI, Timeless Hourglass item ID, Perpetual Hourglass item ID
            player:startEvent(info.csDyna, info.csBit, arg3(player, info.csBit), dsp.ki.PRISMATIC_HOURGLASS, 1, 0, dsp.ki.VIAL_OF_SHROUDED_SAND, 4236, 4237)
        else
            local dayRemaining = math.floor(((dynaWaitxDay + BETWEEN_2DYNA_WAIT_TIME * 60 * 60) - realDay) / 3456)
            player:messageSpecial(ID.text.YOU_CANNOT_ENTER_DYNAMIS, dayRemaining, info.csBit)
        end

    -- standard dialog
    else
        player:messageSpecial(ID.text.DYNA_NPC_DEFAULT_MESSAGE)
    end
end

dynamis.entryNpcOnEventFinish = function(player, csid, option)
    local info = entryInfo[player:getZoneID()]

    -- shrouded sand cutscene
    if info.csSand and csid == info.csSand then
        npcUtil.giveKeyItem(player, dsp.ki.VIAL_OF_SHROUDED_SAND)
        player:setMaskBit("Dynamis_Status", 0, false)

    -- first visit cutscene
    elseif info.csFirst and csid == info.csFirst then
        player:setMaskBit("Dynamis_Status", info.csBit, true)

    -- victory cutscene
    elseif csid == info.csWin then
        player:setVar(info.winVar, 0)

    -- dynamis entry
    elseif csid == info.csDyna then
        player:setMaskBit("Dynamis_Status", info.csBit, true)

        if option == 0 or option == 1 then
            player:setVar("Dynamis_subjob", option)
            player:setVar("Dynamis_Entry", 1)

            local realDay = os.time()
            if DYNA_MIDNIGHT_RESET then
                realDay = getMidnight() - 86400
            end
            local dynaWaitxDay = player:getVar("dynaWaitxDay")

            if
                (dynaWaitxDay + BETWEEN_2DYNA_WAIT_TIME * 60 * 60) < realDay and
                not player:hasKeyItem(dsp.ki.RHAPSODY_IN_AZURE)
            then
                player:setVar("dynaWaitxDay", realDay)
            end

            player:setPos(unpack(info.enterPos))
        end
    end
end

dynamis.zoneOnZoneIn = function(player, prevZone)
    local zoneId = player:getZoneID()
    local info = dynaInfo[zoneId]
    local ID = zones[zoneId]

    local cs = -1

    if player:getVar("Dynamis_Entry") == 1 or player:getGMLevel() > 0 then
        if player:getVar("Dynamis_subjob") == 1 then
            player:timer(5000, function(player) player:messageBasic(dsp.msg.basic.UNABLE_TO_ACCESS_SJ) end)
            player:addStatusEffect(dsp.effect.SJ_RESTRICTION, 0, 0, 0, 7200)
        end
        player:addStatusEffectEx(dsp.effect.DYNAMIS, 0, 0, 3, 3600)
        player:timer(5500, function(player) player:messageSpecial(ID.text.DYNAMIS_TIME_BEGIN, 60, dsp.ki.PRISMATIC_HOURGLASS) end)
        player:setVar("Dynamis_Entry", 0)
        player:setVar("Dynamis_subjob", 0)
    else
        if not player:hasStatusEffect(dsp.effect.DYNAMIS) then
            cs = 100 -- eject event (same event in all dynamis zones)
        elseif player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0 then
            player:setPos(unpack(info.entryPos))
        end
    end

    return cs
end

dynamis.zoneOnEventFinish = function(player, csid, option)
    local zoneId = player:getZoneID()
    local info = dynaInfo[zoneId]

    if csid == 100 then
        player:setPos(unpack(info.ejectPos))
    end
end

dynamis.somnialThresholdOnTrigger = function(player, npc)
    -- ability to unlock SJ message
    local canUnlockSJ = player:hasStatusEffect(dsp.effect.SJ_RESTRICTION) and 1 or 0

    -- bitmask controls options in the menu. 1 = Leave Dynamis.  2 = Unlock support jobs.  4 = Nothing (quit menu)
    local menuBits = 5 + (canUnlockSJ * 2)

    player:startEvent(101, 0x27, canUnlockSJ, menuBits)
end

dynamis.somnialThresholdOnEventFinish = function(player, csid, option)
    local zoneId = player:getZoneID()
    local info = dynaInfo[zoneId]

    if csid == 101 then
        if option == 1 then
            player:setPos(unpack(info.ejectPos))
        elseif option == 2 then
            player:delStatusEffectSilent(dsp.effect.SJ_RESTRICTION)
        end
    end
end

-----------------------------------
-- Dynamis-Bastok
-----------------------------------

--  1: WAR Vanguard Vindicator
--  2: MNK Vanguard Militant
--  3: WHM Vanguard Constable
--  4: BLM Vanguard Thaumaturge
--  5: RDM Vanguard Protector
--  6: THF Vanguard Purloiner
--  7: PLD Vanguard Defender
--  8: DRK Vanguard Vigilante
--  9: BST Vanguard Beasttender + Vanguard's Scorpion
-- 10: BRD Vanguard Minstrel
-- 11: RNG Vanguard Mason
-- 12: SAM Vanguard Hatamoto
-- 13: NIN Vanguard Kusa
-- 14: DRG Vanguard Drakekeeper + Vanguard's Wyvern
-- 15: SMN Vanguard Undertaker + Vanguard's Avatar

-- [Position on the map] Adamantking mobid, {spawnlist: mob1, mob2,...}
bastyList = {
    --[[001]] 17539350,{13,4}, -- 17539452
    --[[002]] 17539351,{12,10},
    --[[003]] 17539352,{5,1},
    --[[004]] 17539353,{6,1},
    --[[005]] 17539354,{14,10},
    --[[006]] 17539355,{9,9},
    --[[007]] 17539356,{9,9},
    --[[008]] 17539357,{9,9},
    --[[009]] 17539358,{12,10},
    --[[010]] 17539359,{12,10},
    --[[011]] 17539360,{13,4,1},
    --[[012]] 17539361,{14,12,10},
    --[[013]] 17539362,{3,13},
    --[[014]] 17539363,{4,8},
    --[[016]] 17539364,{5},
    --[[018]] 17539367,{6},
    --[[020]] 17539369,{8,13,4},
    --[[021]] 17539370,{14,5},
    --[[022]] 17539371,{4,12},
    --[[023]] 17539372,{8,10},
    --[[024]] 17539373,{11,2},
    --[[025]] 17539374,{3,1,17539118},
    --[[027]] 17539375,{5,6},
    --[[028]] 17539376,{13,7,12,1,4,10,17539119,17539120,17539161},
    --[[032]] 17539377,{13,8,3},
    --[[033]] 17539378,{6,1},
    --[[034]] 17539379,{3,12},
    --[[035]] 17539380,{7,2,10},
    --[[036]] 17539381,{7,2,5},
    --[[037]] 17539382,{7,13,5},
    --[[039]] 17539383,{9,9,9},
    --[[040]] 17539384,{15},
    --[[042]] 17539387,{9,9,9},
    --[[043]] 17539388,{12,4},
    --[[044]] 17539389,{6,1,8},
    --[[045]] 17539390,{1,2,5},
    --[[046]] 17539391,{1,12,5},
    --[[047]] 17539392,{8,2,5},
    --[[048]] 17539393,{7,6,5},
    --[[049]] 17539394,{13},
    --[[050]] 17539395,{1,10},
    --[[051]] 17539396,{14,13,5},
    --[[052]] 17539397,{8,12,10},
    --[[053]] 17539398,{3,17539162,17539188},
    --[[055]] 17539399,{3,17539143},
    --[[056]] 17539400,{15},
    --[[057]] 17539401,{15},
    --[[058]] 17539402,{1,2,3},
    --[[059]] 17539403,{1,6},
    --[[060]] 17539404,{8,2,3},
    --[[061]] 17539405,{7,2,3},
    --[[062]] 17539406,{3},
    --[[063]] 17539407,{8,2,3},
    --[[064]] 17539408,{7,8,9},
    --[[065]] 17539409,{8,2,10},
    --[[066]] 17539410,{1,6,5},
    --[[068]] 17539412,{7,12,4},
    --[[069]] 17539413,{3,17539190},
    --[[070]] 17539414,{11,11},
    --[[071]] 17539415,{11},
    --[[072]] 17539416,{14,6},
    --[[073]] 17539417,{8,12},
    --[[075]] 17539419,{7,13},
    --[[076]] 17539420,{1,10},
    --[[077]] 17539421,{14,4},
    --[[078]] 17539422,{7,2,4},
    --[[079]] 17539423,{8,2,4},
    --[[082]] 17539426,{13},
    --[[083]] 17539427,{7,13},
    --[[086]] 17539430,{1,13},
    --[[087]] 17539431,{8,12,10},
    --[[088]] 17539432,{2,2,8,17539163,4,11,11},
    --[[089]] 17539163,{17539300,17539301,17539304},
    --[[090]] 17539433,{7,3},
    --[[091]] 17539434,{3,17539147},
    --[[093]] 17539435,{14,6,3},
    --[[095]] 17539437,{7,6},
    --[[096]] 17539438,{13,5},
    --[[097]] 17539439,{6,4},
    --[[098]] 17539440,{13,10},
    --[[099]] 17539441,{8,10},
    --[[100]] 17539442,{7,5},
    --[[101]] 17539443,{14,12},
    --[[102]] 17539444,{6},
    --[[105]] 17539447,{12,5},
    --[[106]] 17539448,{13,4},
    --[[107]] 17539449,{14,2},
    --[[108]] 17539450,{14,5},
    --[[109]] 17539451,{7,12}
};
----[[011]] 00000000,{},--[[012]] 00000000,{},--[[013]] 00000000,{},--[[014]] 00000000,{},--[[015]] 00000000,{},
-- Need to add :
-- 39/42 random nm spawn with 3 BST

-----------------------------------
-- Dynamis-San d'Oria
-----------------------------------

--  1: WAR Vanguard Footsoldier
--  2: MNK Vanguard Grappler
--  3: WHM Vanguard Amputator
--  4: BLM Vanguard Mesmerizer
--  5: RDM Vanguard Vexer
--  6: THF Vanguard Pillager
--  7: PLD Vanguard Trooper
--  8: DRK Vanguard Neckchopper
--  9: BST Vanguard Hawker + Vanguard's Hecteyes
-- 10: BRD Vanguard Bugler
-- 11: RNG Vanguard Predator
-- 12: SAM Vanguard Gutslasher
-- 13: NIN Vanguard Backstabber
-- 14: DRG Vanguard Impaler + Vanguard's Wyvern
-- 15: SMN Vanguard Dollmaster + Vanguard's Avatar

-- [Position on the map] Adamantking mobid, {spawnlist: mob1, mob2,...}
sandyList = {--[[001]] 17535250,{1,1},            --[[002]] 17535251,{2},                --[[003]] 17535252,{2},            --[[004]] 17535253,{5},
             --[[005]] 17535254,{5},            --[[006]] 17535255,{2,2,2},            --[[008]] 17535257,{7,8},        --[[009]] 17535258,{1,1},
             --[[010]] 17535259,{5,5},            --[[011]] 17535260,{14,14},            --[[012]] 17535261,{3,3},        --[[013]] 17535262,{6,6},
             --[[014]] 17535263,{13,13},        --[[015]] 17535264,{12,12},            --[[017]] 17535266,{2,4,4},        --[[018]] 17535267,{17535026},
             --[[019]] 17535026,{9,4,4},        --[[020]] 17535268,{17535057},        --[[021]] 17535057,{7,11,11},    --[[022]] 17535269,{6},
             --[[023]] 17535270,{3,4},            --[[024]] 17535271,{6},                --[[025]] 17535272,{6,10},        --[[026]] 17535273,{6,10},
             --[[027]] 17535274,{6,10},            --[[029]] 17535276,{11,11},            --[[030]] 17535277,{3,3},        --[[032]] 17535279,{8,8,17535032},
             --[[036]] 17535003,{6,6,10},        --[[037]] 17535283,{12,12},            --[[038]] 17535284,{9,9},        --[[039]] 17535285,{11,11},
             --[[040]] 17535286,{13,13},        --[[041]] 17535287,{15,15},            --[[042]] 17535288,{15,15},        --[[043]] 17535289,{15,15},
             --[[044]] 17535290,{15,15},        --[[045]] 17535291,{11,11},            --[[046]] 17535292,{13,13},        --[[047]] 17535293,{9,9},
             --[[048]] 17535294,{12,12},        --[[049]] 17535295,{2,1},            --[[050]] 17535296,{3},            --[[051]] 17535297,{7,1,1},
             --[[052]] 17535298,{11,11},        --[[053]] 17535299,{2,1},            --[[054]] 17535300,{3},            --[[055]] 17535301,{3},
             --[[056]] 17535302,{6,6},            --[[057]] 17535303,{3},                --[[058]] 17535304,{7,7},        --[[061]] 17535004,{2,2,10},
             --[[063]] 17535308,{8,8},            --[[064]] 17535309,{14,14},            --[[065]] 17535310,{9,9},        --[[069]] 17535314,{5,5},
             --[[070]] 17535315,{2,2,17535006},    --[[071]] 17535316,{4,4},            --[[073]] 17535318,{12,12},        --[[074]] 17535319,{12,13},
             --[[075]] 17535320,{13,13},        --[[076]] 17535321,{3,3,11,11,11},    --[[077]] 17535322,{8,8},        --[[078]] 17535323,{4,4},
             --[[079]] 17535324,{3,3},            --[[080]] 17535325,{5,5},            --[[081]] 17535326,{9,9},        --[[082]] 17535327,{9},
             --[[083]] 17535328,{9,9},            --[[085]] 17535331,{9,9},            --[[087]] 17535332,{5,5,4,4},    --[[088]] 17535333,{7,7},
             --[[089]] 17535334,{11,11,11},        --[[090]] 17535335,{8,8},            --[[091]] 17535336,{5,1,1},        --[[092]] 17535337,{10,10},
             --[[093]] 17535338,{17535044,17535005,17535113},                        --[[094]] 17535005,{13,13},        --[[095]] 17535113,{13,13},--[[096]] 17535339,{14,14},
             --[[097]] 17535340,{11,11},        --[[098]] 17535341,{14,14},            --[[099]] 17535342,{17535114,17535115},--[[100]] 17535114,{10},
             --[[101]] 17535115,{10},            --[[102]] 17535343,{14,14,1,1},        --[[104]] 17535345,{7,7},        --[[105]] 17535346,{8,8,5,5},
             --[[106]] 17535347,{1,1,7,7},        --[[107]] 17535348,{13,13},            --[[108]] 17535349,{12,12},        --[[110]] 17535350,{15,15,15},
             --[[111]] 17535355,{14,14,14},        --[[116]] 17535356,{8,8,8,4,4},        --[[117]] 17535357,{9,9,9},        --[[118]] 17535358,{12,12,5,5,10,10},
             --[[119]] 17535359,{7,7,7,6,6},    --[[120]] 17535360,{14,14,14},        --[[121]] 17535361,{1,1,3,3},    --[[122]] 17535362,{2,2,2,3,3},
             --[[123]] 17535363,{15,15,10,10},    --[[124]] 17535364,{14,14,14},        --[[125]] 17535365,{15,15},        --[[126]] 17535366,{13,13,13,13},
             --[[127]] 17535367,{12,12,12},        --[[128]] 17535368,{11,11,11},        --[[129]] 17535369,{10,10,10},    --[[130]] 17535370,{6,6,6,10,10},
             --[[131]] 17535371,{12,12,5,5,4,4},--[[132]] 17535372,{6,6,6},            --[[133]] 17535373,{9,9,9},        --[[134]] 17535374,{8,8,8},
             --[[135]] 17535375,{7,7,7},        --[[136]] 17535376,{5,5,5},            --[[137]] 17535377,{3,3,3},        --[[138]] 17535378,{2,2,2},
             --[[139]] 17535379,{1,1,1},        --[[140]] 17535380,{4,4,4},            --[[141]] 17535381,{12},        --[[142]] 17535382,{12},
             --[[143]] 17535383,{2},            --[[144]] 17535384,{2},                --[[145]] 17535385,{8,8,8},        --[[146]] 17535386,{7,7,7},
             --[[147]] 17535387,{15,15,17535390},--[[149]] 17535389,{15,15,17535388}};

-----------------------------------
-- Dynamis-Windurst
-----------------------------------

--  1: WAR Vanguard Skirmisher
--  2: MNK Vanguard Sentinel
--  3: WHM Vanguard Priest
--  4: BLM Vanguard Prelate
--  5: RDM Vanguard Visionary
--  6: THF Vanguard Liberator
--  7: PLD Vanguard Exemplar
--  8: DRK Vanguard Inciter
--  9: BST Vanguard Ogresoother + Vanguard's Crow
-- 10: BRD Vanguard Chanter
-- 11: RNG Vanguard Salvager
-- 12: SAM Vanguard Persecutor
-- 13: NIN Vanguard Assassin
-- 14: DRG Vanguard Partisan + Vanguard's Wyvern
-- 15: SMN Vanguard Oracle + Vanguard's Avatar

-- [Position on the map] Avatar Icon mobid, {spawnlist: mob1, mob2,...}
windyList = {--[[001]] 17543461,{0,0}, --[[002]] 17543462,{0,0}, --[[003]] 17543463,{0,0}, --[[004]] 17543490,{0,0},
             --[[005]] 17543491,{0,0}, --[[006]] 17543492,{0,0}, --[[007]] 17543493,{0,0}, --[[008]] 17543494,{0,0},
             --[[009]] 17543495,{0,0}, --[[010]] 17543496,{0,0}, --[[011]] 17543497,{0,0}, --[[012]] 17543498,{0,0},
             --[[013]] 17543499,{0,0}, --[[014]] 17543500,{0,0}, --[[015]] 17543501,{0,0}, --[[016]] 17543502,{0,0},
             --[[017]] 17543503,{0,0}, --[[018]] 17543504,{0,0}, --[[019]] 17543505,{0,0}, --[[020]] 17543506,{0,0},
             --[[021]] 17543507,{0,0,17543268,17543269}, --[[022]] 17543268,{0,0}, --[[023]] 17543269,{0,0}, --[[024]] 17543508,{0,0,17543305},
             --[[025]] 17543305,{0,0}, --[[026]] 17543509,{0,0}, --[[027]] 17543510,{0,0}, --[[028]] 17543511,{0,0},
             --[[029]] 17543512,{0,0}, --[[030]] 17543513,{0,0}, --[[031]] 17543514,{0,0}, --[[032]] 17543515,{0,0,17543306},
             --[[033]] 17543306,{0,0}, --[[034]] 17543516,{0,0}, --[[035]] 17543517,{0,0,17543353,17543354}, --[[036]] 17543353,{0,0},
             --[[037]] 17543354,{0,0}, --[[038]] 17543362,{0,0}, --[[039]] 17543363,{0,0}, --[[040]] 17543392,{0,0},
             --[[041]] 17543518,{0,0,17543393}, --[[042]] 17543393,{0,0}, --[[043]] 17543519,{0,0}, --[[044]] 17543520,{0,0},
             --[[045]] 17543521,{0,0}, --[[046]] 17543522,{0,0,17543523,17543524,17543525,17543526,17543357}, --[[047]] 17543523,{0,0}, --[[048]] 17543524,{0,0},
             --[[049]] 17543525,{0,0}, --[[050]] 17543526,{0,0}, --[[051]] 17543527,{0,0}, --[[052]] 17543528,{0,0},
             --[[053]] 17543529,{0,0}, --[[054]] 17543530,{0,0}, --[[055]] 17543531,{0,0}, --[[056]] 17543532,{0,0},
             --[[057]] 17543533,{0,0,17543530,17543531}, --[[058]] 17543534,{0,0,17543535,17543536,17543537}, --[[059]] 17543535,{0,0}, --[[060]] 17543536,{0,0},
             --[[061]] 17543537,{0,0}, --[[062]] 17543538,{0,0}, --[[063]] 17543539,{0,0}, --[[064]] 17543540,{0,0},
             --[[065]] 17543541,{0,0}, --[[066]] 17543542,{0,0,17543543,17543544}, --[[067]] 17543543,{0,0}, --[[068]] 17543544,{0,0},
             --[[069]] 17543545,{0,0,17543546}, --[[070]] 17543546,{0,0}, --[[071]] 17543547,{0,0}, --[[072]] 17543548,{0,0,17543549},
             --[[073]] 17543549,{0,0}, --[[074]] 17543550,{0,0,17543551,17543552}, --[[075]] 17543551,{0,0}, --[[076]] 17543552,{0,0},
             --[[077]] 17543553,{0,0,17543554,17543555}, --[[078]] 17543554,{0,0}, --[[079]] 17543555,{0,0}, --[[080]] 17543556,{0,0,17543557,17543558,17543559},
             --[[081]] 17543557,{0,0}, --[[082]] 17543558,{0,0}, --[[083]] 17543559,{0,0}, --[[084]] 17543560,{0,0,17543561,17543562,17543563,17543375},
             --[[085]] 17543561,{0,0}, --[[086]] 17543562,{0,0}, --[[087]] 17543563,{0,0}, --[[088]] 17543564,{0,0},
             --[[089]] 17543565,{0,0,17543566}, --[[090]] 17543566,{0,0}, --[[091]] 17543567,{0,0,17543568}, --[[092]] 17543568,{0,0},
             --[[093]] 17543569,{0,0,17543294}, --[[094]] 17543570,{0,0}, --[[095]] 17543571,{0,0}, --[[096]] 17543572,{0,0},
             --[[097]] 17543573,{0,0,17543574}, --[[098]] 17543574,{0,0,17543575}, --[[099]] 17543575,{0,0,17543576}, --[[100]] 17543576,{0,0},
             --[[101]] 17543577,{0,0,17543578,17543579}, --[[102]] 17543578,{0,0}, --[[103]] 17543579,{0,0}, --[[104]] 17543580,{0,0},
             --[[105]] 17543581,{0,0}, --[[106]] 17543582,{0,0}, --[[107]] 17543583,{0,0}, --[[108]] 17543584,{0,0}, --[[109]] 17543585,{0,0},
             --[[110]] 17543586,{0,0}, --[[111]] 17543587,{0,0}, --[[112]] 17543588,{0,0}, --[[113]] 17543589,{0,0}, --[[114]] 17543590,{0,0},
             --[[115]] 17543591,{0,0}, --[[116]] 17543592,{0,0,17543593,17543594,17543595,17543596,17543345}, --[[117]] 17543593,{0,0}, --[[118]] 17543594,{0,0}, --[[119]] 17543595,{0,0},
             --[[120]] 17543596,{0,0}, --[[122]] 17543597,{0,0}, --[[123]] 17543598,{0,0}, --[[124]] 17543599,{0,0}, --[[125]] 17543600,{0,0}
             };

-----------------------------------
-- Dynamis-Jeuno
-----------------------------------

--  1: WAR Vanguard Smithy
--  2: MNK Vanguard Pitfighter
--  3: WHM Vanguard Alchemist
--  4: BLM Vanguard Shaman
--  5: RDM Vanguard Enchanter
--  6: THF Vanguard Welldigger
--  7: PLD Vanguard Armorer
--  8: DRK Vanguard Tinkerer
--  9: BST Vanguard Pathfinder + Vanguard's Slime
-- 10: BRD Vanguard Maestro
-- 11: RNG Vanguard Ambusher
-- 12: SAM Vanguard Ronin
-- 13: NIN Vanguard Hitman
-- 14: DRG Vanguard Dragontamer + Vanguard's Wyvern
-- 15: SMN Vanguard Necromancer + Vanguard's Avatar

-- [Position on the map] Avatar Icon mobid, {spawnlist: mob1, mob2,...}
jeunoList = {--[[001]] 17547530,{0,0},         --[[002]] 17547531,{5,10},         --[[003]] 17547532,{17547312,7,8},
             --[[006]] 17547535,{13,6},     --[[007]] 17547536,{13,6},         --[[008]] 17547537,{13,6},
             --[[009]] 17547538,{9,2},         --[[010]] 17547539,{17547311,4,15,3}, --[[012]] 17547541,{12,5,3},
             --[[013]] 17547542,{2,2},         --[[014]] 17547543,{13},         --[[015]] 17547544,{9,5},         --[[016]] 17547545,{7,8},
             --[[017]] 17547546,{11,11},     --[[018]] 17547547,{17547322,4,3}, --[[019]] 17547548,{14,6},     --[[020]] 17547549,{10,1},
             --[[021]] 17547550,{0,0},         --[[022]] 17547551,{15},         --[[023]] 17547552,{17547378},     --[[024]] 17547553,{1,3},
             --[[025]] 17547554,{9,6},        --[[026]] 17547555,{17547377,8}, --[[027]] 17547556,{13},         --[[028]] 17547557,{12},
             --[[029]] 17547558,{17547324,2,6,4,5,3}, --[[030]] 17547559,{9}, --[[031]] 17547560,{10},         --[[032]] 17547561,{13},
             --[[033]] 17547562,{15},         --[[034]] 17547563,{12,14},     --[[035]] 17547564,{1,6},         --[[036]] 17547565,{4},
             --[[037]] 17547566,{10},         --[[038]] 17547567,{7,8},         --[[039]] 17547568,{15,15,15},     --[[040]] 17547569,{17547355},
             --[[042]] 17547571,{5,2},         --[[043]] 17547572,{17547396,13,13},                             --[[045]] 17547574,{17547356,5,10,8,7,3},
             --[[046]] 17547575,{9},         --[[047]] 17547576,{9},         --[[048]] 17547577,{12},         --[[049]] 17547578,{17547395,7},
             --[[050]] 17547579,{1},         --[[051]] 17547580,{14},         --[[052]] 17547581,{4},
             --[[053]] 17547582,{2},         --[[054]] 17547583,{15},         --[[055]] 17547584,{4},
             --[[058]] 17547587,{13},         --[[059]] 17547588,{14,14},     --[[060]] 17547589,{5},
             --[[061]] 17547590,{7},         --[[062]] 17547591,{17547394,12,10}, --[[063]] 17547592,{1,6,3},
             --[[064]] 17547593,{},
             --[[065]] 17547594,{11,11},     --[[066]] 17547595,{4,3},         --[[067]] 17547596,{4,2},         --[[068]] 17547597,{1,3},
             --[[069]] 17547598,{15},         --[[070]] 17547599,{4},         --[[071]] 17547600,{9},         --[[072]] 17547601,{14},
             --[[073]] 17547602,{17547277,11,15}, --[[074]] 17547603,{17547291,6,14}, --[[075]] 17547604,{17547294,13,3}, --[[076]] 17547605,{13,12},
             --[[077]] 17547606,{11,8},     --[[078]] 17547607,{8},         --[[079]] 17547608,{7},         --[[080]] 17547609,{11},
             --[[081]] 17547610,{13},         --[[082]] 17547611,{10},         --[[083]] 17547612,{3},         --[[084]] 17547613,{1},
             --[[085]] 17547614,{12},         --[[086]] 17547615,{17547440,6,4,4}, --[[087]] 17547616,{17547454,7,10,11,8}, --[[088]] 17547617,{17547468,15,12,14},
             --[[089]] 17547618,{5},         --[[090]] 17547619,{5},         --[[091]] 17547620,{5},         --[[092]] 17547621,{12},
             --[[093]] 17547622,{1},         --[[094]] 17547623,{2},         --[[095]] 17547624,{17547438,15,15}, --[[096]] 17547625,{14},
             --[[097]] 17547626,{4},         --[[098]] 17547627,{0,0},         --[[099]] 17547628,{0,0},         --[[100]] 17547629,{0,0},
             --[[101]] 17547630,{10,10},     --[[102]] 17547631,{10,10},     --[[103]] 17547632,{6,11},         --[[104]] 17547633,{6,11},
             --[[105]] 17547634,{17547299,4,14}, --[[106]] 17547635,{17547300,15,5}, --[[107]] 17547636,{17547298,9,3}, --[[108]] 17547637,{12},
             --[[109]] 17547638,{7},         --[[110]] 17547639,{8},         --[[111]] 17547640,{4,11},         --[[112]] 17547641,{7,5},
             --[[114]] 17547642,{1,2,3,4},     --[[115]] 17547643,{5,6,7,8},     --[[116]] 17547644,{9,10,11,12}, --[[117]] 17547645,{13,14,15},
             --[[118]] 17547646,{6,4},         --[[119]] 17547647,{5,3},         --[[120]] 17547648,{17547402,1}, --[[121]] 17547649,{4,14,1},
             --[[122]] 17547650,{2,6,15},     --[[123]] 17547651,{9,12},         --[[124]] 17547652,{17547486,7,11,10,9}, --[[125]] 17547653,{--[[Slystix]]13,13,13,11,11},
             --[[126]] 17547654,{14,15},     --[[127]] 17547655,{8,8},         --[[128]] 17547656,{5,5},         --[[129]] 17547657,{3,3},
             --[[130]] 17547658,{12,9},     --[[131]] 17547659,{4,9},         --[[132]] 17547660,{2,9},         --[[133]] 17547661,{0,0,17547473},
             --[[134]] 17547662,{17547472,6,10,14,12,12}, --[[135]] 17547663,{0,0,17547474}, --[[136]] 17547664,{0,0}, --[[137]] 17547665,{0,0},
             --[[138]] 17547666,{0,0},         --[[139]] 17547667,{0,0},         --[[140]] 17547668,{0,0},         --[[141]] 17547669,{0,0},
             --[[142]] 17547670,{0,0,17547485}, --[[143]] 17547671,{0,0},     --[[144]] 17547672,{0,0},         --[[145]] 17547673,{0,0,17547487},
             --[[146]] 17547674,{0,0,17547479}, --[[147]] 17547675,{0,0},     --[[148]] 17547676,{0,0,17547480}, --[[149]] 17547677,{0,0,17547490},
             --[[150]] 17547678,{17547478,7,6,10,5,13}
             };

-----------------------------------
-- Dynamis-Beaucedine
-----------------------------------

-- [Position on the map] Avatar Icon mobid, {spawnlist: mob1, mob2,...}
beaucedineYagudoList = {--[[001]] 17326830,{0,0},            --[[005]] 17326834,{0,0},            --[[009]] 17326838,{0,0},            --[[010]] 17326839,{0,17326289},
                        --[[011]] 17326840,{0,0},            --[[012]] 17326841,{0,0},            --[[013]] 17326842,{0,0},            --[[014]] 17326843,{0,17326307},
                        --[[015]] 17326844,{0,0,17326328},    --[[016]] 17326845,{0,0},            --[[017]] 17326846,{0,0,17326340},    --[[018]] 17326847,{0,0},
                        --[[019]] 17326848,{0,0,17326335},    --[[020]] 17326849,{0,0,17326347},    --[[021]] 17326850,{0,0,17326284},    --[[022]] 17326851,{0,0},
                        --[[023]] 17326852,{0,0},            --[[024]] 17326853,{0,0},            --[[025]] 17326854,{0,0},
                        --[[026]] 17326855,{0,0,17326304},    --[[027]] 17326856,{0,0},            --[[028]] 17326857,{0,0},            --[[029]] 17326858,{0,0,17326300},
                        --[[030]] 17326859,{0,0},            --[[102]] 17326931,{0,0},            --[[106]] 17326935,{0,0,17326313,17326344}};

-- [Position on the map] Goblin Statue mobid, {spawnlist: mob1, mob2,...}
beaucedineGoblinList = {--[[002]] 17326831,{0,0},            --[[006]] 17326835,{0,0},            --[[031]] 17326860,{0,0,17326379},    --[[032]] 17326861,{0,0},
                        --[[033]] 17326862,{0,0},            --[[034]] 17326863,{0,0,17326397},    --[[035]] 17326864,{0,0,17326410},    --[[036]] 17326865,{0,0},
                        --[[037]] 17326866,{0,0},            --[[038]] 17326867,{0,0},            --[[039]] 17326868,{0,0},            --[[040]] 17326869,{0,0,17326421},
                        --[[041]] 17326870,{0,0,17326405},    --[[042]] 17326871,{0,0,17326463},    --[[043]] 17326872,{0,0},            --[[044]] 17326873,{0,0},
                        --[[045]] 17326874,{0,0},            --[[046]] 17326875,{0,0,17326401},    --[[047]] 17326876,{0,0},
                        --[[048]] 17326877,{0,0},            --[[049]] 17326878,{0,0},            --[[050]] 17326879,{0,0},            --[[051]] 17326880,{0,0},
                        --[[052]] 17326881,{0,0,17326439},    --[[053]] 17326882,{0,0,17326452},    --[[100]] 17326929,{0,0},            --[[104]] 17326933,{0,0,17326387,17326427}};

-- [Position on the map] Adamantking Effigy mobid, {spawnlist: mob1, mob2,...}
beaucedineQuadavList = {--[[004]] 17326833,{0,0},            --[[008]] 17326837,{0,0},            --[[054]] 17326883,{0,0,17326126},    --[[055]] 17326884,{0,0,17326145},
                        --[[056]] 17326885,{0,0},            --[[057]] 17326886,{0,0},            --[[058]] 17326887,{0,0,17326173},    --[[059]] 17326888,{0,0},
                        --[[060]] 17326889,{0,0,17326195},    --[[061]] 17326890,{0,0},            --[[062]] 17326891,{0,0,17326151},    --[[063]] 17326892,{0,0,17326201},
                        --[[064]] 17326893,{0,0},            --[[065]] 17326894,{0,0},            --[[066]] 17326895,{0,0,17326114},    --[[067]] 17326896,{0,0},
                        --[[068]] 17326897,{0,0},            --[[069]] 17326898,{0,0},            --[[070]] 17326899,{0,0},
                        --[[071]] 17326900,{0,0},            --[[072]] 17326901,{0,0,17326162},    --[[073]] 17326902,{0,0},            --[[074]] 17326903,{0,0},
                        --[[075]] 17326904,{0,0},            --[[076]] 17326905,{0,0,17326190},    --[[099]] 17326928,{0,0},            --[[103]] 17326932,{0,0,17326106,17326185}};

-- [Position on the map] Serjeant Tombstone mobid, {spawnlist: mob1, mob2,...}
beaucedineOrcishList = {--[[003]] 17326832,{0,0},            --[[007]] 17326836,{0,0},            --[[077]] 17326906,{0,0},            --[[078]] 17326907,{0,0},
                        --[[079]] 17326908,{0,0,17326233},    --[[080]] 17326909,{0,0},            --[[081]] 17326910,{0,0},            --[[082]] 17326911,{0,0,17326262},
                        --[[083]] 17326912,{0,0,17326248},    --[[084]] 17326913,{0,0,17326258},    --[[085]] 17326914,{0,0},            --[[086]] 17326915,{0,0,17326243},
                        --[[087]] 17326916,{0,0,17326218},    --[[088]] 17326917,{0,0,17326229},    --[[089]] 17326918,{0,0},            --[[090]] 17326919,{0,0},
                        --[[091]] 17326920,{0,0,17326223},    --[[092]] 17326921,{0,0},            --[[093]] 17326922,{0,0},            --[[094]] 17326923,{0,0},
                        --[[095]] 17326924,{0,0},            --[[096]] 17326925,{0,0},            --[[097]] 17326926,{0,0},            --[[098]] 17326927,{0,0,17326265},
                        --[[101]] 17326930,{0,0},            --[[105]] 17326934,{0,0,17326216,17326270}};

-- [Position on the map] Vanguard Eye mobid, {spawnlist}
beaucedineHydraList = {--[[107]] 17326473,{2,10,11},    --[[108]] 17326478,{8},      --[[109]] 17326484,{2},    --[[110]] 17326494,{6},          --[[111]] 17326501,{5},
                       --[[112]] 17326507,{9},            --[[113]] 17326514,{9,1}, --[[114]] 17326519,{5,12},--[[115]] 17326525,{1,11},      --[[116]] 17326530,{7,14},
                       --[[117]] 17326536,{17326625,13},--[[118]] 17326542,{3},      --[[119]] 17326547,{7,15},--[[120]] 17326553,{3,15},      --[[121]] 17326558,{17326564},
                       --[[122]] 17326565,{14},            --[[123]] 17326572,{8},      --[[124]] 17326579,{7},    --[[125]] 17326586,{10,1},      --[[126]] 17326593,{3},
                       --[[127]] 17326600,{9},            --[[128]] 17326607,{15,7},--[[129]] 17326612,{10},    --[[130]] 17326617,{11},      --[[131]] 17326623,{17326574,13},
                       --[[132]] 17326629,{2},            --[[133]] 17326634,{5},      --[[134]] 17326639,{12},    --[[135]] 17326646,{8},          --[[136]] 17326651,{6,14},
                       --[[137]] 17326656,{2,3},        --[[138]] 17326661,{9},      --[[139]] 17326668,{13},    --[[140]] 17326673,{17326624},--[[141]] 17326678,{15},
                       --[[142]] 17326683,{14},            --[[143]] 17326688,{12},  --[[144]] 17326692,{11},    --[[145]] 17326696,{7},          --[[146]] 17326701,{11},
                       --[[147]] 17326706,{6,7},        --[[148]] 17326721,{10,7},--[[149]] 17326727,{14},    --[[150]] 17326732,{10,12},      --[[151]] 17326737,{17326577},
                       --[[152]] 17326742,{14},            --[[153]] 17326748,{0},      --[[154]] 17326754,{9},    --[[155]] 17326781,{15},      --[[156]] 17326786,{3,8},
                       --[[157]] 17326790,{6,12,3,7,13}};

-----------------------------------
-- Dynamis-Xarcabard
-----------------------------------

--  1: WAR   2: MNK   3: WHM   4: BLM   5: RDM   6: THF   7: PLD   8: DRK
--  9: BST  10: BRD  11: RNG  12: SAM  13: NIN  14: DRG  15: SMN

-- [Position on the map] Vanguard Eye mobid, {spawnlist: mob1, mob2,...}
xarcabardList = {--[[001]] 17330293,{12,12},         --[[002]] 17330302,{15,15},         --[[003]] 17330312,{14,14},         --[[004]] 17330322,{13,13},
                 --[[006]] 17330340,{9,9,9},         --[[007]] 17330350,{7,14,14},         --[[008]] 17330358,{8,8,7},         --[[009]] 17330368,{8,8,7},
                 --[[011]] 17330375,{1,2,6,5,4,3},     --[[013]] 17330386,{1,2,6,5,4,3},     --[[014]] 17330398,{7,5},             --[[015]] 17330426,{2,3},
                 --[[016]] 17330438,{7,5},             --[[017]] 17330448,{13,13,13,10},     --[[018]] 17330460,{1,1,1,10},         --[[019]] 17330498,{12,12,12,10},
                 --[[020]] 17330506,{12,12,11},     --[[021]] 17330542,{13,6},             --[[022]] 17330549,{12,12,11},         --[[023]] 17330562,{13,6,6},
                 --[[024]] 17330567,{13,6},         --[[025]] 17330581,{13,6,6},         --[[026]] 17330586,{14,14},         --[[027]] 17330610,{9,9},
                 --[[028]] 17330617,{15,15},         --[[029]] 17330631,{1,1},             --[[030]] 17330636,{2,2},             --[[031]] 17330662,{3,3},
                 --[[032]] 17330668,{4,4},             --[[033]] 17330685,{5,5},             --[[034]] 17330690,{6,6},             --[[035]] 17330718,{17330731,17330746,17330749},
                 --[[039]] 17330756,{17330762,17330770,17330813},                         --[[044]] 17330815,{4,11},             --[[045]] 17330816,{4,11},
                 --[[046]] 17330817,{4,11},         --[[047]] 17330818,{4,11},             --[[048]] 17330819,{9,9,3,10},         --[[049]] 17330820,{2,13,15},
                 --[[050]] 17330821,{9,9,3,10},     --[[051]] 17330822,{2,13,15},         --[[053]] 17330823,{12,14,13,15},     --[[054]] 17330824,{7,8,9,11,10},
                 --[[055]] 17330825,{12,14,13,15},     --[[056]] 17330826,{7,8,9,11,10},     --[[057]] 17330827,{12,14,11},         --[[058]] 17330828,{7,6,15},
                 --[[059]] 17330829,{8,13,4},         --[[061]] 17330831,{1,2,3},         --[[062]] 17330832,{6,6,4},         --[[063]] 17330833,{5,5,5},
                 --[[064]] 17330834,{6,6,4},         --[[065]] 17330835,{1,2,3},         --[[066]] 17330836,{8,8,8,4},         --[[067]] 17330837,{12,12,12,4},
                 --[[068]] 17330838,{4,3},             --[[069]] 17330839,{7,7},             --[[070]] 17330840,{7,7},             --[[071]] 17330841,{2,2,2},
                 --[[072]] 17330842,{4,3},             --[[074]] 17330844,{14,14},         --[[075]] 17330845,{9,9},             --[[076]] 17330846,{15,15,15},
                 --[[078]] 17330848,{9,9},             --[[079]] 17330849,{8,8},             --[[080]] 17330850,{11,11},         --[[081]] 17330851,{7,7},
                 --[[082]] 17330852,{10,10},         --[[083]] 17330853,{1,1,5},         --[[084]] 17330854,{4,4},             --[[085]] 17330855,{1,1,5},
                 --[[086]] 17330856,{2,6},             --[[087]] 17330857,{2,6},             --[[088]] 17330858,{3,3},             --[[089]] 17330859,{1,1,10},
                 --[[090]] 17330860,{2,2,10},         --[[091]] 17330861,{1,1,10},         --[[092]] 17330862,{2,2,10},         --[[093]] 17330863,{11,11},
                 --[[094]] 17330864,{12,12,12},     --[[095]] 17330865,{11,11},         --[[096]] 17330866,{6,6,6},         --[[097]] 17330867,{1,5,10},
                 --[[098]] 17330868,{2,9,3},         --[[099]] 17330869,{2,10},             --[[100]] 17330870,{1,10},             --[[101]] 17330871,{1,3},
                 --[[102]] 17330872,{5,3,10},         --[[103]] 17330873,{5,3,10},         --[[104]] 17330874,{8,8,10},        --[[105]] 17330875,{8,8,10},
                 --[[106]] 17330876,{7,7},             --[[107]] 17330877,{13,13,5},         --[[108]] 17330878,{13,13,5},         --[[109]] 17330879,{14,14,14},
                 --[[110]] 17330880,{9,9},             --[[111]] 17330881,{15,15},         --[[113]] 17330882,{9,9},             --[[114]] 17330883,{15,15,15},
                 --[[115]] 17330884,{14,11},         --[[116]] 17330885,{14,11},         --[[117]] 17330886,{7,15},             --[[118]] 17330887,{7,15},
                 --[[119]] 17330888,{11,11,11},     --[[120]] 17330889,{7,15},             --[[121]] 17330890,{5},             --[[122]] 17330891,{13,13},
                 --[[123]] 17330892,{5},             --[[124]] 17330893,{14,14,5},         --[[125]] 17330894,{12,12,5},         --[[126]] 17330895,{8,8},
                 --[[127]] 17330896,{17330223},     --[[128]] 17330897,{17330377},         --[[129]] 17330898,{17330353},         --[[130]] 17330899,{17330332},
                 --[[131]] 17330900,{17330304},     --[[132]] 17330901,{17330390},         --[[133]] 17330902,{17330451},         --[[134]] 17330903,{17330417},
                 --[[135]] 17330904,{17330343},     --[[136]] 17330905,{17330315},         --[[137]] 17330906,{17330360},         --[[138]] 17330907,{17330481},
                 --[[139]] 17330908,{17330430},     --[[140]] 17330909,{17330440},         --[[141]] 17330910,{17330415},         --[[144]] 17330913,{4,3},
                 --[[145]] 17330914,{4,3},             --[[146]] 17330915,{4,3},             --[[147]] 17330916,{14,14},         --[[148]] 17330917,{8,8},
                 --[[149]] 17330918,{7,7}};
-----------------------------------
-- Dynamis-Valkurm
-----------------------------------

--                   Manifest_Icon    mobid, {spawnlist: mob1, mob2,...}
ValkurmYagudoList = {
                 16937258,{16937240,16937241,16937242},-- sp
                 16937259,{16937244,16937245,16937246,16937254},-- sp
                 16937260,{16937248,16937249,16937250,16937255},-- sp
                 16937261,{16937251,16937252,16937253,16937256},-- sp
                 16937544,{16937526,16937527,16937528},--
                 16937545,{16937531,16937532,16937533},--
                 16937546,{16937534,16937535,16937536},--
                 16937547,{16937529,16937539},--
                 16937548,{16937537,16937540},--
                 16937549,{16937542,16937541}--
              };
--                   Goblin_Replica mobid, {spawnlist: mob1, mob2,...}
ValkurmGoblinList = {
                 16937283,{16937265,16937266,16937268},-- HP
                 16937284,{16937270,16937271,16937278,16937279},-- MP
                 16937285,{16937272,16937273,16937274,16937280},-- sp
                 16937286,{16937275,16937276,16937277,16937281},-- sp
                 16937569,{16937551,16937552,16937553},--
                 16937570,{16937554,16937555,16937557},--
                 16937571,{16937558,16937559,16937560},--
                 16937572,{16937561,16937563},--
                 16937573,{16937564,16937565},--
                 16937574,{16937566,16937567}--
              };
--                     Serjeant_Tombstone mobid, {spawnlist: mob1, mob2,...}
ValkurmOrcishList = {
                 16937208,{16937190,16937191,16937192,16937204},-- sp
                 16937209,{16937193,16937194,16937195,16937205},-- sp
                 16937210,{16937196,16937197,16937198,16937206},-- sp
                 16937211,{16937200,16937201,16937202},-- sp
                 16937494,{16937476,16937477,16937478},--
                 16937495,{16937479,16937482,16937484},--
                 16937496,{16937484,16937485,16937488},--
                 16937497,{16937480,16937489},--
                 16937498,{16937486,16937490},--
                 16937499,{16937492,16937491}--
              };
--                   Adamantking_Effigy  mobid, {spawnlist: mob1, mob2,...}
ValkurmQuadavList = {
                 16937233,{16937215,16937216,16937217},-- HP
                 16937234,{16937218,16937219,16937221,16937229},-- sp
                 16937235,{16937222,16937223,16937224,16937230},-- sp
                 16937236,{16937225,16937227,16937228,16937231},-- sp
                 16937519,{16937501,16937502,16937503},--
                 16937520,{16937504,16937505,16937508},--
                 16937521,{16937509,16937512,16937513},--
                 16937522,{16937506,16937514},--
                 16937523,{16937510,16937515},--
                 16937524,{16937517,16937516}--
              };

TimerStatueRandomPos = {
                        1,{-363,-7,235},
                        2,{-255,-7,85},
                        3,{-286,0.1,-31},
                        4,{-68,0.1,19}
                       };
-----------------------------------
-- Dynamis-Buburimu
-----------------------------------
--***********************************************************************************************
    --                   Manifest_Icon    mobid, {spawnlist: mob1, mob2,...}
BuburimuYagudoList = {
                        16941190,{16941186,16941182,16941181,16941176,16941178}, -- 38 mp
                        16941191,{16941188,16941185,16941180,16941175}, -- Ree_Nata_the_Melomanic 50
                        16941192,{16941189,16941184,16941179,16941177}, -- Koo_Rahi_the_Levinblade    45    mp
                        16941208,{16941203,16941194,16941197,16941200}, -- 039 hp
                        16941209,{16941205,16941195,16941198,16941201}, -- Doo_Peku_the_Fleetfoot
                        16941210,{16941206,16941196,16941199,16941202}, -- Baa_Dava_the_Bibliophage  43
                        16941471,{16941167,16941163,16941161,16941158,16941157},  -- ++
                        16941472,{16941169,16941165,16941164,16941160}, -- Va_Rhu_Bodysnatcher 37 ++
                        16941473,{16941170,16941166,16941162,16941159}, -- Te_Zha_Ironclad 41
                        16941485,{16941475,16941478,16941481},-- 041 hp  ++
                        16941486,{16941476,16941479,16941482}, -- 044 mp
                        16941487,{16941477,16941480,16941483,16941484}    -- 049
              };
--                   Goblin_Replica mobid, {spawnlist: mob1, mob2,...}
BuburimuGoblinList = {
                        16941068,{16941058,16941060},
                        16941069,{16941062,16941063,16941064},
                        16941070,{16941066,16941065}, -- Woodnix_Shrillwhistle 15
                        16941083,{16941072,16941073,16941074,16941078},
                        16941084,{16941075,16941076,16941077},
                        16941085,{16941079,16941082}, -- Shamblix_Rottenheart 18
                        16941098,{16941087,16941089,16941095},
                        16941099,{16941088,16941090,16941094},
                        16941100,{16941091,16941092,16941097}, -- Gosspix_Blabberlips 21
                        16941381,{16941369,16941372,16941375,16941379},
                        16941382,{16941370,16941373,16941377},
                        16941383,{16941371,16941374,16941378},  --hp
                        16941395,{16941385,16941387,16941391}, --hp
                        16941396,{16941386,16941390,16941392}, -- 22 mp
                        16941397,{16941388,16941389,16941393}   -- 23 mp
              };
--                     Serjeant_Tombstone mobid, {spawnlist: mob1, mob2,...}
BuburimuOrcishList = {
                        16941118,{16941102,16941104,16941106,16941109,16941113}, --
                        16941119,{16941115,16941103,16941107,16941111}, -- Flamecaller_Zoeqdoq    ++
                        16941120,{16941117,16941105,16941108,16941112}, -- Elvaansticker_Bxafraff
                        16941135,{16941131,16941122,16941127,16941128,16941129}, --     stat  HP
                        16941136,{16941133,16941123,16941125,16941130}, -- Hamfist_Gukhbuk
                        16941137,{16941134,16941124,16941126,}, -- Lyncean_Juwgneg       MP
                        16941411,{16941399,16941403,16941405,16941409}, --   HP
                        16941412,{16941400,16941402,16941407}, --      MP
                        16941413,{16941401,16941404,16941408}, -- ++
                        16941425,{16941415,16941418,16941421}, -- ++
                        16941426,{16941416,16941419,16941422}, -- ++
                        16941427,{16941417,16941420,16941423}, --  ++
              };
--                   Adamantking_Effigy  mobid, {spawnlist: mob1, mob2,...}
BuburimuQuadavList = {
                        16941153,{16941149,16941139,16941142,16941146},
                        16941154,{16941151,16941140,16941143,16941147,16941148}, -- Qu_Pho_Bloodspiller
                        16941155,{16941152,16941141,16941144}, -- Gi_Bhe_Fleshfeaster
                        16941171,{16941167,16941165,16941163,16941159},  --
                        16941172,{16941169,16941166,16941162,16941160,16941158},
                        16941173,{16941170,16941164,16941161,16941157},
                        16941440,{16941436,16941432,16941429},
                        16941441,{16941437,16941434,16941430},
                        16941442,{16941438,16941435,16941431},
                        16941455,{16941451,16941448,16941444}, --
                        16941456,{16941452,16941450,16941445,16941447},
                        16941457,{16941453,16941449,16941446}  -- stat MP
              };
-----------------------------------
-- Dynamis-Qufim
-----------------------------------
--**********************************************************************************************
        --           Manifest_Icon    mobid, {spawnlist: mob1, mob2,...}
QufimYagudoList = {
                        16945605,{16945599,16945600,16945234,16945236},
                        16945606,{16945601,16945602,16945229,16945225},
                        16945607,{16945603,16945238,16945226,16945224},
                        16945615,{16945609,16945611,16945217,16945215},
                        16945616,{16945610,16945614,16945218,16945227},
                        16945617,{16945612,16945235,16945237},
                        16945625,{16945621,16945619,16945216,16945214},
                        16945626,{16945622,16945620,16945623}
              };
--                   Goblin_Replica mobid, {spawnlist: mob1, mob2,...}
QufimGoblinList = {
                        16945250,{16945246,16945245},
                        16945251,{16945247,16945244},
                        16945252,{16945248,16945256,16945254},
                        16945506,{16945502,16945501},
                        16945507,{16945505},
                        16945508,{16945503,16945257,16945255},
                        16945527,{16945523,16945522},
                        16945528,{16945524,16945266,16945265},        -- HP
                        16945529,{16945525,16945269,16945264},        -- MP
                        16945536,{16945532,16945531},
                        16945537,{16945533,16945258},
                        16945538,{16945534,16945267},   -- HP
                        16945545,{16945541,16945540},  -- MP
                        16945546,{16945542}, -- HP
                        16945547,{16945543}
              };
--                     Serjeant_Tombstone mobid, {spawnlist: mob1, mob2,...}
QufimOrcishList = {
                        16945477,{16945473,16945471,16945156,16945154,16945168},
                        16945478,{16945474,16945472,16945165,16945167,16945178},
                        16945479,{16945475,16945157,16945155,16945174,16945176},
                        16945488,{16945481,16945484,16945493,16945175},
                        16945489,{16945482,16945485,16945494,16945179},
                        16945490,{16945483,16945486,16945164,16945166},
                        16945497,{16945496,16945158,16945164,16945166}
              };
--                   Adamantking_Effigy  mobid, {spawnlist: mob1, mob2,...}
QufimQuadavList = {
                        16945565,{16945559,16945560,16945204,16945205,16945184},
                        16945566,{16945563,16945564,16945206,16945207,16945185},
                        16945567,{16945561,16945208,16945198,16945189,16945188},
                        16945575,{16945569,16945570,16945583,16945195,16945194},
                        16945576,{16945571,16945572,16945582,16945580,16945186},
                        16945577,{16945573,16945581,16945579,16945197,16945196}
              };
-----------------------------------
-- Dynamis-Tavnazia
-----------------------------------

TavnaziaEyesList    ={
--  1: WAR   2: MNK   3: WHM   4: BLM   5: RDM   6: THF   7: PLD   8: DRK
--  9: BST  10: BRD  11: RNG  12: SAM  13: NIN  14: DRG  15: SMN

                      -- eyes third floor
                        16949475, {11,12}, --  'Vanguard_Eye'
                        16949476, {1,6}, --  'Vanguard_Eye'
                        16949477, {7,8,15}, --  'Vanguard_Eye'
                        16949478, {5,10,14}, --  'Vanguard_Eye'
                        16949479, {4,9,13}, --  'Vanguard_Eye'
                        16949480, {2,3}, --  'Vanguard_Eye'
                        16949481, {8,11}, --  'Vanguard_Eye'
                        16949482, {2}, --  'Vanguard_Eye'
                        16949483, {6,12,9}, --  'Vanguard_Eye'
                        16949484, {15,7,10}, --  'Vanguard_Eye'
                        16949485, {1,13,14}, --  'Vanguard_Eye'
                        16949486, {2,9,15}, --  'Vanguard_Eye'
                      -- eyes second floor
                        16949487, {1,5,11}, --  'Vanguard_Eye'  - war rdm rng
                        16949488, {9,15}, --  'Vanguard_Eye's
                        16949489, {7,3,12}, --  'Vanguard_Eye'
                        16949490, {10,13}, --  'Vanguard_Eye'
                        16949491, {14,15,9}, --  'Vanguard_Eye'
                        16949492, {7,8,9}, --  'Vanguard_Eye'
                        16949493, {1,12,6,2}, --  'Vanguard_Eye'
                        16949494, {5,4,3} --  'Vanguard_Eye'
};
TavnaziaTaurusList    = {
                        16949475, {1},
                        16949476, {1},
                        16949477, {1},
                        16949478, {1},
                        16949479, {1},
                        16949480, {1},
                        16949481, {1},
                        16949482, {3},
                        16949483, {0},
                        16949484, {0},
                        16949485, {0},
                        16949486, {3}
                      };





TavnaziaCloneList = {
                        16949332, {16949431,16949432}, --  'Nightmare_Cluster'
                        16949333, {16949433,16949434}, --  'Nightmare_Cluster'
                        16949334, {16949435,16949436}, --  'Nightmare_Cluster'
                        16949335, {16949437,16949438}, --  'Nightmare_Cluster'
                        16949336, {16949439,16949440}, --  'Nightmare_Cluster'
                        16949337, {16949441,16949442}, --  'Nightmare_Cluster'
                        16949338, {16949443,16949444}, --  'Nightmare_Cluster'
                        16949339, {16949445,16949446}, --  'Nightmare_Cluster'
                        16949340, {16949447,16949448}, --  'Nightmare_Cluster'

                        16949341, {16949449,16949450}, --  'Nightmare_Leech'
                        16949342, {16949451,16949452}, --  'Nightmare_Leech'
                        16949343, {16949453,16949454}, --  'Nightmare_Leech'
                        16949344, {16949455,16949456}, --  'Nightmare_Leech'
                        16949345, {16949457,16949458}, --  'Nightmare_Leech'
                        16949346, {16949459,16949460}, --  'Nightmare_Leech'
                        16949347, {16949461,16949462}, --  'Nightmare_Leech'
                        16949348, {16949463,16949464}, --  'Nightmare_Leech'

                        16949317, {16949465,16949466}, --  'Nightmare_Makara'
                        16949318, {16949467,16949468}, --  'Nightmare_Makara'
                        16949319, {16949469,16949470}, --  'Nightmare_Makara'
                        16949320, {16949471,16949472}, --  'Nightmare_Makara'
                        16949321, {16949473,16949474}, --  'Nightmare_Makara'

                        16949273, {16949415,16949416}, --  'Nightmare_Hornet'
                        16949274, {16949417,16949418}, --  'Nightmare_Hornet'
                        16949275, {16949419,16949420}, --  'Nightmare_Hornet'
                        16949276, {16949421,16949422}, --  'Nightmare_Hornet'
                        16949277, {16949423,16949424}, --  'Nightmare_Hornet'
                        16949278, {16949425,16949426}, --  'Nightmare_Hornet'
                        16949279, {16949427,16949428}, --  'Nightmare_Hornet'
                        16949280, {16949429,16949430} --  'Nightmare_Hornet'
};

TavnaziaDiabolosList = {
                         16949249, -- Diabolos_Spade
                         16949250, -- Diabolos_Heart
                         16949251, -- Diabolos_Diamond
                         16949252 -- Diabolos_Club
};


--------------------------------------------------
-- getListDynaMob
-- List of mobid by zone and job
--------------------------------------------------

function getDynaMob(player,mobjob,list)

    local pZone = player:getZoneID();

    -- Dynamis San d'Oria -------------------------------
    if (pZone == 185) then
        return GetMobIDByJob(17534980,17535204,mobjob);
    -- Dynamis Bastok -----------------------------------
    elseif (pZone == 186) then
        return GetMobIDByJob(17539074,17539305,mobjob);
    -- Dynamis Windurst ---------------------------------
    elseif (pZone == 187) then
        return GetMobIDByJob(17543172,17543460,mobjob);
    -- Dynamis Jeuno ------------------------------------
    elseif (pZone == 188) then
        return GetMobIDByJob(17547266,17547400,mobjob);
    -- Dynamis Beaucedine -------------------------------
    elseif (pZone == 134 and list == 1) then
        return GetMobIDByJob(17326280,17326348,mobjob); -- Yagudo's Vanguard
    elseif (pZone == 134 and list == 2) then
        return GetMobIDByJob(17326354,17326463,mobjob); -- Goblin's Vanguard
    elseif (pZone == 134 and list == 3) then
        return GetMobIDByJob(17326099,17326202,mobjob); -- Quadav's Vanguard
    elseif (pZone == 134 and list == 4) then
        return GetMobIDByJob(17326208,17326274,mobjob); -- Orcish's Vanguard
    elseif (pZone == 134 and list == 5) then
        return GetMobIDByJob(17326469,17326789,mobjob); -- Hydra's
    -- Dynamis Xarcabard --------------------------------
    elseif (pZone == 135) then
        return GetMobIDByJob(17330215,17330768,mobjob);
    -- Dynamis Tavnazia
    elseif (pZone == 42 and list == 1) then
        return GetMobIDByJob(16949281,16949302,mobjob); -- hydra
    elseif (pZone == 42 and list == 2) then
        return GetMobIDByJob(16949349,16949375,mobjob); -- kindred
    end
end;

--------------------------------------------------
-- alreadyReceived
-- I use this function for TE and Boss Trigger
--------------------------------------------------

function alreadyReceived(player,number)

    local dynaVar = 0;
    local bit = {};
    local pZone = player:getZoneID();

    if (pZone == 185) then
        dynaVar = GetServerVariable("[DynaSandoria]Already_Received");
    elseif (pZone == 186) then
        dynaVar = GetServerVariable("[DynaBastok]Already_Received");
    elseif (pZone == 187) then
        dynaVar = GetServerVariable("[DynaWindurst]Already_Received");
    elseif (pZone == 188) then
        dynaVar = GetServerVariable("[DynaJeuno]Already_Received");
    elseif (pZone == 134) then
        dynaVar = GetServerVariable("[DynaBeaucedine]Already_Received");
    elseif (pZone == 135) then
        dynaVar = GetServerVariable("[DynaXarcabard]Already_Received");
    elseif (pZone == 39) then
        dynaVar = GetServerVariable("[DynaValkurm]Already_Received");
    elseif (pZone == 40) then
        dynaVar = GetServerVariable("[DynaBuburimu]Already_Received");
    elseif (pZone == 41) then
        dynaVar = GetServerVariable("[DynaQufim]Already_Received");
    elseif (pZone == 42) then
        dynaVar = GetServerVariable("[DynaTavnazia]Already_Received");
    end

    for i = 12,0,-1 do
        twop = 2^i;
        if (dynaVar >= twop) then
            bit[i+1] = 1;
            dynaVar = dynaVar - twop;
        else
            bit[i+1] = 0;
        end;
    end;
    -- printf("received %u",bit[number]);
    if (bit[number] == 0) then
        return false;
    else
        return true;
    end
end;

--------------------------------------------------
-- addDynamisList
-- Add this mob to already received list
--------------------------------------------------

function addDynamisList(player,number)

    local pZone = player:getZoneID();

    if (pZone == 185) then
        SetServerVariable("[DynaSandoria]Already_Received",GetServerVariable("[DynaSandoria]Already_Received") + number);
    elseif (pZone == 186) then
        SetServerVariable("[DynaBastok]Already_Received",GetServerVariable("[DynaBastok]Already_Received") + number);
    elseif (pZone == 187) then
        SetServerVariable("[DynaWindurst]Already_Received",GetServerVariable("[DynaWindurst]Already_Received") + number);
    elseif (pZone == 188) then
        SetServerVariable("[DynaJeuno]Already_Received",GetServerVariable("[DynaJeuno]Already_Received") + number);
    elseif (pZone == 134) then
        SetServerVariable("[DynaBeaucedine]Already_Received",GetServerVariable("[DynaBeaucedine]Already_Received") + number);
    elseif (pZone == 135) then
        SetServerVariable("[DynaXarcabard]Already_Received",GetServerVariable("[DynaXarcabard]Already_Received") + number);
    elseif (pZone == 39) then
        SetServerVariable("[DynaValkurm]Already_Received",GetServerVariable("[DynaValkurm]Already_Received") + number);
    elseif (pZone == 40) then
        SetServerVariable("[DynaBuburimu]Already_Received",GetServerVariable("[DynaBuburimu]Already_Received") + number);
    elseif (pZone == 41) then
        SetServerVariable("[DynaQufim]Already_Received",GetServerVariable("[DynaQufim]Already_Received") + number);
    elseif (pZone == 42) then
        SetServerVariable("[DynaTavnazia]Already_Received",GetServerVariable("[DynaTavnazia]Already_Received") + number);
    end

end;

--------------------------------------------------
-- activateAnimatedWeapon
-- change subanim when all NM are killed
--------------------------------------------------

function activateAnimatedWeapon()

    for i = 17330199, 17330214, 1 do
        GetMobByID(i):AnimationSub(3);
    end

end;

--------------------------------------------------
-- getDynamisMapList
-- Produces a bitmask for the goblin ancient currency NPCs
--------------------------------------------------

function getDynamisMapList(player)
    local bitmask = 0;
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_SANDORIA) == true) then
        bitmask = bitmask + 2;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_BASTOK) == true) then
        bitmask = bitmask + 4;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_WINDURST) == true) then
        bitmask = bitmask + 8;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_JEUNO) == true) then
        bitmask = bitmask + 16;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_BEAUCEDINE) == true) then
        bitmask = bitmask + 32;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_XARCABARD) == true) then
        bitmask = bitmask + 64;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_VALKURM) == true) then
        bitmask = bitmask + 128;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_BUBURIMU) == true) then
        bitmask = bitmask + 256;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_QUFIM) == true) then
        bitmask = bitmask + 512;
    end
    if (player:hasKeyItem(dsp.ki.MAP_OF_DYNAMIS_TAVNAZIA) == true) then
        bitmask = bitmask + 1024;
    end

    return bitmask;
end;

function dynamis.spawnGroup(mob, spawnList, mobTypeList)
    local mobID = mob:getID();
    local superLinkId = mob:getShortID();
    local X = mob:getXPos();
    local Y = mob:getYPos();
    local Z = mob:getZPos();

    -- Ensure my members superlink with me
    mob:setMobMod(dsp.mobMod.SUPERLINK, superLinkId);

    if (mob:getStatPoppedMobs() == false) then
        mob:setStatPoppedMobs(true);
        for nb = 1, #spawnList, 2 do
            if (mobID == spawnList[nb]) then
                for nbi = 1, #spawnList[nb + 1], 1 do
                    if ((nbi % 2) == 0) then X=X+2; Z=Z+2; else X=X-2; Z=Z-2; end
                    local mobNBR = spawnList[nb + 1][nbi];

                    if (mobNBR <= 20) then
                        -- Spawn random mob by job
                        if (mobNBR == 0) then
                            -- Spawn random Vanguard (TEMPORARY)
                            mobNBR = math.random(1,15);
                        end

                        local DynaMob = getDynaMob(mob,mobNBR,mobTypeList);

                        if (DynaMob ~= nil) then
                            dynamis.spawnMob(DynaMob, superLinkId, X, Y, Z);
                        end
                    elseif (mobNBR > 20) then
                        -- Spawn specific mob by mob id
                        dynamis.spawnMob(mobNBR, superLinkId, X, Y, Z);
                    end
                end
            end
        end
    end
end;

function dynamis.spawnMob(mobId, superLinkId, x, y, z)
    -- Spawn Mob
    local mob = SpawnMob(mobId);
    mob:setMobMod(dsp.mobMod.SUPERLINK, superLinkId);
    mob:setPos(x,y,z);
    mob:setSpawn(x,y,z);

    local mJob = mob:getMainJob();

    -- Spawn Pet for BST, and SMN
    if (mJob == dsp.job.BST or mJob == dsp.job.SMN) then
        if(mob:getPet() ~= nil) then
            local petId = nil;

            -- randomize pet for SMN
            if (mJob == dsp.job.SMN) then
                petId = math.random(8, 14);

                -- switch pet to Ramuh if pet is Fenrir
                if (petId == 9) then
                    petId = 15;
                end
            end

            mob:spawnPet(petId);

            local pet = mob:getPet();

            pet:setMobMod(dsp.mobMod.SUPERLINK, superLinkId);
        end
    end
end;

function dynamis.extendTimeLimit(battlefield, minutes)
    dsp.battlefield.ExtendTimeLimit(battlefield, minutes, msgBasic.TIME_DYNAMIS_EXTENDED)
end

-- todo: fix these to use tables
function dynamis.getExtensions(player)
    local count = 0
    for i=dsp.ki.CRIMSON_GRANULES_OF_TIME, dsp.ki.OBSIDIAN_GRANULES_OF_TIME do
        if player:hasKeyItem(i) then count = count + 1 end
    end
    return count
end

function dynamis.procMonster(mob, player)
    if player and player:getAllegiance() == 1 then
        local extensions = dynamis.getExtensions(player)
        if extensions > 2 then
            if player:getSubJob() == dsp.job.NONE and math.random(0,99) == 0 then
                mob:setLocalVar("dynamis_proc", 4)
                mob:weaknessTrigger(3)
                mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
            elseif extensions == 5 then
                mob:setLocalVar("dynamis_proc", 3)
                mob:weaknessTrigger(2)
                mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
            elseif extensions == 4 then
                mob:setLocalVar("dynamis_proc", 2)
                mob:weaknessTrigger(1)
                mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
            elseif extensions == 3 then
                mob:setLocalVar("dynamis_proc", 1)
                mob:weaknessTrigger(0)
                mob:addStatusEffect(dsp.effect.TERROR, 0, 0, 30)
            end
        end
    end
end

function dynamis.addExtension(player, keyitem, duration)
    if not player:hasKeyItem(keyitem) then
        npcUtil.giveKeyItem(player, keyitem)
        local effect = player:getStatusEffect(dsp.effect.DYNAMIS)
        local old_duration = effect:getDuration()
        effect:setDuration((old_duration + (duration * 60)) * 1000)
        player:setLocalVar("dynamis_lasttimeupdate", effect:getTimeRemaining() / 1000)
        player:messageSpecial(zones[player:getZoneID()].text.DYNAMIS_TIME_EXTEND, duration)
    end
end
