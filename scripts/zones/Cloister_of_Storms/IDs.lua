-----------------------------------
-- Area: Cloister_of_Storms
-----------------------------------
require("scripts/globals/zone")
-----------------------------------

zones = zones or {}

zones[dsp.zone.CLOISTER_OF_STORMS] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED          = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED                    = 6387, -- Obtained: <item>
        GIL_OBTAINED                     = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED                 = 6390, -- Obtained key item: <keyitem>
        CONQUEST_BASE                    = 7048, -- Tallying conquest results...
        YOU_CANNOT_ENTER_THE_BATTLEFIELD = 7209, -- You cannot enter the battlefield at present.
        PROTOCRYSTAL                     = 7233, -- It is a giant crystal.
        RAMUH_UNLOCKED                   = 7673, -- You are now able to summon
    },
    mob =
    {
    },
    npc =
    {
    },
}

return zones[dsp.zone.CLOISTER_OF_STORMS]