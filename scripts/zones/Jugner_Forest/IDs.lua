-----------------------------------
-- Area: Jugner_Forest
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.JUGNER_FOREST] =
{
    text =
    {
        NOTHING_HAPPENS          = 141, -- Nothing happens...
        ITEM_CANNOT_BE_OBTAINED  = 6403, -- You cannot obtain the item <item>. Come back after sorting your inventory.
        ITEM_OBTAINED            = 6409, -- Obtained: <item>.
        GIL_OBTAINED             = 6410, -- Obtained <number> gil.
        KEYITEM_OBTAINED         = 6412, -- Obtained key item: <keyitem>.
        CONQUEST_BASE            = 7070, -- Tallying conquest results...
        BEASTMEN_BANNER          = 7151, -- There is a beastmen's banner.
        FISHING_MESSAGE_OFFSET   = 7703, -- You can't fish here.
        DIG_THROW_AWAY           = 7716, -- You dig up$, but your inventory is full. You regretfully throw the # away.
        FIND_NOTHING             = 7718, -- You dig and you dig, but find nothing.
        LOGGING_IS_POSSIBLE_HERE = 7896, -- Logging is possible here if you have
        CONQUEST                 = 8047, -- You've earned conquest points!
    },
    mob =
    {
        KING_ARTHRO = 17203216,
        FRAELISSA   = 17203447,
    },
    npc =
    {
        OVERSEER_BASE = 17203846,
    },
}

return zones[dsp.zone.JUGNER_FOREST]