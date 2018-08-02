-----------------------------------
-- Area: Promyvion-Mea
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.PROMYVION_MEA] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
    },
    mob =
    {
        MEA_MEMORY_RECEPTACLES =
        {
            [16859151] = {1, 3, 16859451},
            [16859198] = {2, 5, 16859454},
            [16859205] = {2, 5, 16859458},
            [16859212] = {2, 5, 16859459},
            [16859219] = {2, 5, 16859460},
            [16859271] = {3, 7, 16859452},
            [16859280] = {3, 7, 16859453},
            [16859289] = {3, 7, 16859455},
            [16859347] = {4, 7, 16859456},
            [16859356] = {4, 7, 16859457},
            [16859365] = {4, 7, 16859461},
        },
    },
    npc =
    {
        MEA_MEMORY_STREAMS =
        {
            [11]        = {-122, -4,  197, -117, 4,  202, {46}},    -- floor 1 return
            [21]        = {  -1, -4, -121,    2, 4, -118, {41}},    -- floor 2 return
            [31]        = {-161, -4,  158, -157, 4,  161, {30}},    -- floor 3 return
            [32]        = { 158, -4, -281,  161, 4, -278, {30}},    -- floor 3 return
            [41]        = { -82, -4,  358,  -78, 4,  361, {33}},    -- floor 4 return
            [16859451]  = {-283, -4,  237, -276, 4,  242, {30}},    -- floor 1 MR1
            [16859454]  = { -82, -4,  -42,  -78, 4,  -38, {33,37}}, -- floor 2 MR1
            [16859458]  = {-322, -4, -361, -318, 4, -357, {33,37}}, -- floor 2 MR2
            [16859459]  = { -42, -4, -321,  -37, 4, -317, {33,37}}, -- floor 2 MR3
            [16859460]  = {  77, -4, -241,   81, 4, -238, {33,37}}, -- floor 2 MR4
            [16859452]  = {-321, -4,  -42, -318, 4,  -38, {31}},    -- floor 3 MR1
            [16859453]  = {-241, -4,  -42, -238, 4,  -37, {31}},    -- floor 3 MR2
            [16859455]  = { -42, -4,   -2,  -38, 4,    2, {31}},    -- floor 3 MR3
            [16859456]  = { 198, -4,   -2,  201, 4,    2, {31}},    -- floor 3 MR4
            [16859457]  = { 358, -4,  -41,  362, 4,  -38, {31}},    -- floor 3 MR5
            [16859461]  = { 240, -4, -322,  244, 4, -317, {31}},    -- floor 3 MR6
        },
    },
}

return zones[dsp.zone.PROMYVION_MEA]