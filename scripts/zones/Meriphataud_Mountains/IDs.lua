-----------------------------------
-- Area: Meriphataud_Mountains
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.MERIPHATAUD_MOUNTAINS] =
{
    text =
    {
        NOTHING_HAPPENS          = 141,   -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6404,  -- You cannot obtain the <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6410,  -- Obtained: <item>.
        GIL_OBTAINED             = 6411,  -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6413,  -- Obtained key item: <keyitem>.
        KEYITEM_LOST             = 6414,  -- Lost key item: <keyitem>.
        CONQUEST_BASE            = 7071,  -- Tallying conquest results...
        BEASTMEN_BANNER          = 7152,  -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET   = 7230,  -- You can't fish here.
        DIG_THROW_AWAY           = 7243,  -- You dig up <item>, but your inventory is full. You regretfully throw the <item> away.
        FIND_NOTHING             = 7245,  -- You dig and you dig, but find nothing.
        NOTHING_FOUND            = 7488,  -- You find nothing.
        CONQUEST                 = 7900,  -- You've earned conquest points!
        PLAYER_OBTAINS_ITEM      = 8342,  -- Player obtains <item>!
        UNABLE_TO_OBTAIN_ITEM    = 8343,  -- You were unable to obtain the item.
        PLAYER_OBTAINS_TEMP_ITEM = 8344,  -- Player obtains the temporary item: <temp item>!
        ALREADY_POSSESS_TEMP     = 8345,  -- You already possess that temporary item.
		NO_COMBINATION           = 8350,  -- You were unable to enter a combination.
        REGIME_REGISTERED        = 10590, -- New training regime registered!
        COMMON_SENSE_SURVIVAL    = 12619, -- It appears that you have arrived at a new survival guide provided by the Adventurers' Mutual Aid Network. Common sense dictates that you should now be able to teleport here from similar tomes throughout the world.
    },
    mob =
    {
        NAA_ZEKU_THE_UNWAITING_PH =
        {
            [17264763] = 17264768,
        },
        PATRIPATAN_PH       =
        {
            [17264967] = 17264972, -- 551.767,-32.570,590.205
            [17264968] = 17264972, -- 646.199,-24.483,644.477
            [17264969] = 17264972, -- 535.318,-32.179,602.055
        },
        DAGGERCLAW_DRACOS_PH =
        {
            [17264815] = 17264818, -- 583.725 -15.652 -388.159
        },
        WARAXE_BEAK         = 17264828,
        COO_KEJA_THE_UNSEEN = 17264946,
    },
    npc =
    {
        CASKET_BASE   = 17265218,
        OVERSEER_BASE = 17265270,
    },
}

return zones[dsp.zone.MERIPHATAUD_MOUNTAINS]