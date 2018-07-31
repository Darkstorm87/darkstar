-----------------------------------
-- Area: Abyssea-Konschtat
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/zones")
-----------------------------------

zones = zones or {}

zones[dsp.zone.ABYSSEA_KONSCHTAT] =
{
    text =
    {
        ITEM_CANNOT_BE_OBTAINED = 6381, -- You cannot obtain the item <item> come back again after sorting your inventory
        ITEM_OBTAINED           = 6387, -- Obtained: <item>
        GIL_OBTAINED            = 6388, -- Obtained <number> gil
        KEYITEM_OBTAINED        = 6390, -- Obtained key item: <keyitem>
        CRUOR_TOTAL             = 6985, -- Obtained <Numeric Parameter 0> cruor. (Total: <Numeric Parameter 1>)<Prompt>
        STAGGERED               = 7315, -- ?Player/Chocobo Parameter 0?'s attack staggers the fiend!
        YELLOW_STAGGER          = 7316, -- The fiend is unable to cast magic.
        BLUE_STAGGER            = 7317, -- The fiend is unable to use special attacks.
        RED_STAGGER             = 7318, -- The fiend is frozen in its tracks.
        YELLOW_WEAKNESS         = 7319, -- The fiend appears vulnerable to Multiple Choice (Parameter 0)[/fire/ice/wind/earth/lightning/water/light/darkness] elemental magic
        BLUE_WEAKNESS           = 7320, -- The fiend appears vulnerable to Multiple Choice (Parameter 0)[/hand-to-hand/dagger/sword/great sword/axe/great axe/scythe/polearm/katana/great katana/club/staff/archery/marksmanship] weapon skills
        RED_WEAKNESS            = 7321, -- The fiend appears vulnerable to Multiple Choice (Parameter 0)[/fire/ice/wind/earth/lightning/water/light/darkness] elemental weapon skills
        EXACT_TIME_REMAINING    = 7322, -- Your visitant status will wear off inMultiple Choice (Parameter 1)[second/minute]
        TIME_REMAINING          = 7323, -- Your visitant status will wear off inMultiple Choice (Parameter 1)[seconds/minutes]
        LOST_VISITANT_STATUS    = 7324, -- Your visitant status has worn off
        VISITANT_EXTENDED       = 7325, -- Your visitant status has been extended bySingular/Plural Choice (Parameter 0)[minute/minutes]
        EXIT_WARNING_1          = 7326, -- Exiting inSingular/Plural Choice (Parameter 0)[minute/minutes]
        EXIT_WARNING_2          = 7327, -- Those without visitant status will be ejected from the area inSingular/Plural Choice (Parameter 0)[minute/minutes]. To learn about this status, please consult a Conflux Surveyor
        EXIT_WARNING_3          = 7328, -- Exiting inMultiple Choice (Parameter 1)[second/minute]
        EXIT_WARNING_4          = 7329, -- Exiting inMultiple Choice (Parameter 1)[seconds/minutes]
        EXITING_NOW             = 7330, -- Exiting now.
        WARD_WARNING_1          = 7331, -- Returning to the Searing Ward inSingular/Plural Choice (Parameter 0)[second/seconds]
        WARD_WARNING_2          = 7332, -- You do not have visitant status. Returning to the Searing Ward inSingular/Plural Choice (Parameter 0)[second/seconds]
        WARD_WARNING_3          = 7332, -- Returning to the Searing Ward inSingular/Plural Choice (Parameter 0)[second/seconds]
        SEARING_WARD_TELE       = 7334, -- Returning to the Searing Ward now.
        CRUOR_OBTAINED          = 7494, -- <Possible Special Code: 1F>y<Player Name> obtains <Numeric Parameter 0> cruor.
        BOUNDLESS_RAGE          = 7571, -- You sense an aura of boundless rage...
        INFO_KI                 = 7572, -- Your keen senses tell you that something may happen if only you had Multiple Choice (Parameter 0)[this item/these items]
        USE_KI                  = 7575, -- Use the Multiple Choice (Parameter 0)[key item/key items]
    },
    mob =
    {
    },
    npc =
    {
        QM_POPS = 
        {
            --  [16839078] = { 'qm1', {2914},                                                                                                                                           {}, 16838718}, -- Ashtaerth The Gallvexed
            --  [16839079] = { 'qm2', {2911},                                                                                                                                           {}, 16838767}, -- Sarcophilus
            --  [16839080] = { 'qm3', {2909},                                                                                                                                           {}, 16838782}, -- Bombadeel
            --  [16839081] = { 'qm4', {2908},                                                                                                                                           {}, 16838837}, -- Hexenpilz
            --  [16839082] = { 'qm5', {2910},                                                                                                                                           {}, 16838871}, -- Keratyrannos
            --  [16839083] = { 'qm6', {2904},                                                                                                                                           {}, 16838885}, -- Lentor
            --  [16839084] = { 'qm7', {2903},                                                                                                                                           {}, 16838899}, -- Bloodguzzler
            --  [16839085] = { 'qm8', {2907},                                                                                                                                           {}, 16838946}, -- Clingy Clare
            --  [16839086] = { 'qm9', {2906},                                                                                                                                           {}, 16838962}, -- Siranpa-Kamuy
            --  [16839087] = {'qm10', {2912},                                                                                                                                           {}, 16838979}, -- Alkonost
            --  [16839088] = {'qm11', {2913},                                                                                                                                           {}, 16838993}, -- Arimaspi
            --  [16839089] = {'qm12', {2905},                                                                                                                                           {}, 16839033}, -- Fear Gorta
            --  [16839090] = {'qm13',     {}, {dsp.ki.FRAGRANT_TREANT_PETAL,dsp.ki.FETID_RAFFLESIA_STALK,dsp.ki.DECAYING_MORBOL_TOOTH,dsp.ki.TURBID_SLIME_OIL,dsp.ki.VENOMOUS_PEISTE_CLAW}, 16839007}, -- Eccentric Eve
            --  [16839091] = {'qm14',     {},                                                     {dsp.ki.TATTERED_HIPPOGRYPH_WING,dsp.ki.CRACKED_WIVRE_HORN,dsp.ki.MUCID_AHRIMAN_EYEBALL}, 16838872}, -- Kukulkan
            --  [16839092] = {'qm15',     {},                                                                                                              {dsp.ki.TWISTED_TONBERRY_CROWN}, 16839068}, -- Bloodeye Vileberry
            --  [16839093] = {'qm16',     {}, {dsp.ki.FRAGRANT_TREANT_PETAL,dsp.ki.FETID_RAFFLESIA_STALK,dsp.ki.DECAYING_MORBOL_TOOTH,dsp.ki.TURBID_SLIME_OIL,dsp.ki.VENOMOUS_PEISTE_CLAW}, 16839069}, -- Eccentric Eve
            --  [16839094] = {'qm17',     {},                                                     {dsp.ki.TATTERED_HIPPOGRYPH_WING,dsp.ki.CRACKED_WIVRE_HORN,dsp.ki.MUCID_AHRIMAN_EYEBALL}, 16839070}, -- Kukulkan
            --  [16839095] = {'qm18',     {},                                                                                                              {dsp.ki.TWISTED_TONBERRY_CROWN}, 16839071}, -- Bloodeye Vileberry
            --  [16839096] = {'qm19',     {}, {dsp.ki.FRAGRANT_TREANT_PETAL,dsp.ki.FETID_RAFFLESIA_STALK,dsp.ki.DECAYING_MORBOL_TOOTH,dsp.ki.TURBID_SLIME_OIL,dsp.ki.VENOMOUS_PEISTE_CLAW}, 16839072}, -- Eccentric Eve
            --  [16839097] = {'qm20',     {},                                                     {dsp.ki.TATTERED_HIPPOGRYPH_WING,dsp.ki.CRACKED_WIVRE_HORN,dsp.ki.MUCID_AHRIMAN_EYEBALL}, 16839073}, -- Kukulkan
            --  [16839098] = {'qm21',     {},                                                                                                              {dsp.ki.TWISTED_TONBERRY_CROWN}, 16839074}, -- Bloodeye Vileberry
        },
    },
}

return zones[dsp.zone.ABYSSEA_KONSCHTAT]