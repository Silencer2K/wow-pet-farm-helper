PFH_DB_NPC_NAMES = {
    [11982] = "Magmadar",
    [11988] = "Golemagg the Incinerator",
    [12017] = "Broodlord Lashlayer",
    [12098] = "Sulfuron Harbinger",
    [12435] = "Razorgore the Untamed",
    [14020] = "Chromaggus",
    [15263] = "The Prophet Skeram",
    [15276] = "Emperor Vek'lor",
    [15299] = "Viscidus",
    [15688] = "Terestian Illhoof",
    [15690] = "Prince Malchezaar",
    [15691] = "The Curator",
    [15932] = "Gluth",
    [15952] = "Maexxna",
    [16011] = "Loatheb",
    [17521] = "The Big Bad Wolf",
    [17808] = "Anetheron",
    [17842] = "Azgalor",
    [17968] = "Archimonde",
    [18805] = "High Astromancer Solarian",
    [19514] = "Al'ar",
    [19516] = "Void Reaver",
    [21212] = "Lady Vashj",
    [21213] = "Morogrim Tidewalker",
    [21216] = "Hydross the Unstable",
    [22887] = "High Warlord Naj'entus",
    [22898] = "Supremus",
    [22947] = "Mother Shahraz",
    [23420] = "Essence of Anger",
    [24882] = "Brutallus",
    [25165] = "Lady Sacrolash",
    [25166] = "Grand Warlock Alythess",
    [25840] = "Entropius",
}

PFH_DB_PETS = {
    [93029] = { -- Gluth's Bone
        npc_id = 68654,
        from = {
            {
                type = 'raid', npc_id = 15932,
                zone_id = 535,
                level = 80, for_sort = 200,
            },
        },
    },
    [93030] = { -- Dusty Clutch of Eggs
        npc_id = 68656,
        from = {
            {
                type = 'raid', npc_id = 15952,
                zone_id = 535,
                level = 80, for_sort = 200,
            },
        },
    },
    [93032] = { -- Blighted Spore
        npc_id = 68657,
        from = {
            {
                type = 'raid', npc_id = 16011,
                zone_id = 535,
                level = 80, for_sort = 200,
            },
        },
    },
    [93033] = { -- Mark of Flame
        npc_id = 68665,
        from = {
            {
                type = 'raid', npc_id = 12098,
                zone_id = 696,
                level = 60, for_sort = 66,
            },
        },
    },
    [93034] = { -- Blazing Rune
        npc_id = 68664,
        from = {
            {
                type = 'raid', npc_id = 11982,
                zone_id = 696,
                level = 60, for_sort = 71,
            },
        },
    },
    [93035] = { -- Core of Hardened Ash
        npc_id = 68666,
        from = {
            {
                type = 'raid', npc_id = 11988,
                zone_id = 696,
                level = 60, for_sort = 71,
            },
        },
    },
    [93036] = { -- Unscathed Egg
        npc_id = 68661,
        from = {
            {
                type = 'raid', npc_id = 12435,
                zone_id = 755,
                level = 60, for_sort = 76,
            },
        },
    },
    [93037] = { -- Blackwing Banner
        npc_id = 68663,
        from = {
            {
                type = 'raid', npc_id = 12017,
                zone_id = 755,
                level = 60, for_sort = 76,
            },
        },
    },
    [93038] = { -- Whistle of Chromatic Bone
        npc_id = 68662,
        from = {
            {
                type = 'raid', npc_id = 14020,
                zone_id = 755,
                level = 60, for_sort = 77,
            },
        },
    },
    [93039] = { -- Viscidus Globule
        npc_id = 68660,
        from = {
            {
                type = 'raid', npc_id = 15299,
                zone_id = 766,
                level = 60, for_sort = 78,
            },
        },
    },
    [93040] = { -- Anubisath Idol
        npc_id = 68659,
        from = {
            {
                type = 'raid', npc_id = 15276,
                zone_id = 766,
                level = 60, for_sort = 81,
            },
        },
    },
    [93041] = { -- Jewel of Maddening Whispers
        npc_id = 68658,
        from = {
            {
                type = 'raid', npc_id = 15263,
                zone_id = 766,
                level = 60, for_sort = 75,
            },
        },
    },
    [97548] = { -- Spiky Collar
        npc_id = 71014,
        from = {
            {
                type = 'raid', npc_id = 17521,
                zone_id = 799,
                level = 70, for_sort = 115,
                raid_save_boss = 'Opera Event',
            },
        },
    },
    [97549] = { -- Instant Arcane Sanctum Security Kit
        npc_id = 71015,
        from = {
            {
                type = 'raid', npc_id = 15691,
                zone_id = 799,
                level = 70, for_sort = 115,
            },
        },
    },
    [97550] = { -- Netherspace Portal-Stone
        npc_id = 71016,
        from = {
            {
                type = 'raid', npc_id = 15690,
                zone_id = 799,
                level = 70, for_sort = 125,
            },
        },
    },
    [97551] = { -- Satyr Charm
        npc_id = 71033,
        from = {
            {
                type = 'raid', npc_id = 15688,
                zone_id = 799,
                level = 70, for_sort = 115,
            },
        },
    },
    [97552] = { -- Shell of Tide-Calling
        npc_id = 71017,
        from = {
            {
                type = 'raid', npc_id = 21213,
                zone_id = 780,
                level = 70, for_sort = 134,
            },
        },
    },
    [97553] = { -- Tainted Core
        npc_id = 71018,
        from = {
            {
                type = 'raid', npc_id = 21216,
                zone_id = 780,
                level = 70, for_sort = 128,
            },
        },
    },
    [97554] = { -- Dripping Strider Egg
        npc_id = 71019,
        from = {
            {
                type = 'raid', npc_id = 21212,
                zone_id = 780,
                level = 70, for_sort = 141,
            },
        },
    },
    [97555] = { -- Tiny Fel Engine Key
        npc_id = 71020,
        from = {
            {
                type = 'raid', npc_id = 19516,
                zone_id = 782,
                level = 70, for_sort = 128,
            },
        },
    },
    [97556] = { -- Crystal of the Void
        npc_id = 71021,
        from = {
            {
                type = 'raid', npc_id = 18805,
                zone_id = 782,
                level = 70, for_sort = 134,
            },
        },
    },
    [97557] = { -- Brilliant Phoenix Hawk Feather
        npc_id = 71022,
        from = {
            {
                type = 'raid', npc_id = 19514,
                zone_id = 782,
                level = 70, for_sort = 134,
            },
        },
    },
    [122104] = { -- Leviathan Egg
        npc_id = 90201,
        from = {
            {
                type = 'raid', npc_id = 22887,
                zone_id = 796,
                level = 70, for_sort = 141,
            },
        },
    },
    [122105] = { -- Grotesque Statue
        npc_id = 90200,
        from = {
            {
                type = 'raid', npc_id = 17842,
                zone_id = 775,
                level = 70, for_sort = 141,
            },
        },
    },
    [122106] = { -- Shard of Supremus
        npc_id = 90202,
        from = {
            {
                type = 'raid', npc_id = 22898,
                zone_id = 796,
                level = 70, for_sort = 141,
            },
        },
    },
    [122107] = { -- Fragment of Anger
        npc_id = 90203,
        from = {
            {
                type = 'raid', npc_id = 23420,
                zone_id = 796,
                level = 70, for_sort = 141,
            },
        },
    },
    [122108] = { -- Fragment of Suffering
        npc_id = 90204,
        from = {
            {
                type = 'raid', npc_id = 23420,
                zone_id = 796,
                level = 70, for_sort = 141,
            },
        },
    },
    [122109] = { -- Fragment of Desire
        npc_id = 90205,
        from = {
            {
                type = 'raid', npc_id = 23420,
                zone_id = 796,
                level = 70, for_sort = 141,
            },
        },
    },
    [122110] = { -- Sultry Grimoire
        npc_id = 90206,
        from = {
            {
                type = 'raid', npc_id = 22947,
                zone_id = 796,
                level = 70, for_sort = 141,
            },
        },
    },
    [122111] = { -- Smelly Gravestone
        npc_id = 90207,
        from = {
            {
                type = 'raid', npc_id = 17808,
                zone_id = 775,
                level = 70, for_sort = 141,
            },
        },
    },
    [122112] = { -- Hyjal Wisp
        npc_id = 90208,
        from = {
            {
                type = 'raid', npc_id = 17968,
                zone_id = 775,
                level = 70, for_sort = 151,
            },
        },
    },
    [122113] = { -- Sunblade Rune of Activation
        npc_id = 90212,
        from = {
            {
                type = 'raid', npc_id = 24882,
                zone_id = 789,
                level = 70, for_sort = 159,
                raid_save_zone = 'The Sunwell',
            },
        },
    },
    [122114] = { -- Void Collar
        npc_id = 90213,
        from = {
            {
                type = 'raid', npc_id = 25840,
                zone_id = 789,
                level = 70, for_sort = 159,
                raid_save_zone = 'The Sunwell',
            },
        },
    },
    [122115] = { -- Servant's Bell
        npc_id = 90214,
        from = {
            {
                type = 'raid', npc_id = 25165,
                zone_id = 789,
                level = 70, for_sort = 159,
                raid_save_zone = 'The Sunwell',
            },
            {
                type = 'raid', npc_id = 25166,
                zone_id = 789,
                level = 70, for_sort = 159,
                raid_save_zone = 'The Sunwell',
            },
        },
    },
}
