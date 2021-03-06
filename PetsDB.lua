PFH_DB_BOSSES = {
    [9736]  = { name = "Quartermaster Zigris" },
    [10596] = { name = "Mother Smolderweb" },
    [11982] = { name = "Magmadar" },
    [11988] = { name = "Golemagg the Incinerator" },
    [12017] = { name = "Broodlord Lashlayer" },
    [12098] = { name = "Sulfuron Harbinger" },
    [12435] = { name = "Razorgore the Untamed" },
    [14020] = { name = "Chromaggus" },
    [15263] = { name = "The Prophet Skeram" },
    [15276] = { name = "Emperor Vek'lor" },
    [15299] = { name = "Viscidus" },
    [15688] = { name = "Terestian Illhoof" },
    [15690] = { name = "Prince Malchezaar" },
    [15691] = { name = "The Curator" },
    [15932] = { name = "Gluth" },
    [15952] = { name = "Maexxna" },
    [16011] = { name = "Loatheb" },
    [17521] = { name = "The Big Bad Wolf"           , raid = "Opera Event" },
    [17808] = { name = "Anetheron" },
    [17842] = { name = "Azgalor" },
    [17968] = { name = "Archimonde" },
    [18805] = { name = "High Astromancer Solarian" },
    [19514] = { name = "Al'ar" },
    [19516] = { name = "Void Reaver" },
    [21212] = { name = "Lady Vashj" },
    [21213] = { name = "Morogrim Tidewalker" },
    [21216] = { name = "Hydross the Unstable" },
    [22887] = { name = "High Warlord Naj'entus" },
    [22898] = { name = "Supremus" },
    [22947] = { name = "Mother Shahraz" },
    [23420] = { name = "Essence of Anger"           , raid = "Reliquary of Souls" },
    [24664] = { name = "Kael'thas Sunstrider" },
    [24882] = { name = "Brutallus" },
    [25165] = { name = "Lady Sacrolash"             , raid = "The Eredar Twins" },
    [25166] = { name = "Grand Warlock Alythess"     , raid = "The Eredar Twins" },
    [25840] = { name = "Entropius"                  , raid = "M'uru" },
    [32845] = { name = "Hodir" },
    [32857] = { name = "Stormcaller Brundir"        , raid = "The Assembly of Iron" },
    [32867] = { name = "Steelbreaker"               , raid = "The Assembly of Iron" },
    [32906] = { name = "Freya" },
    [32927] = { name = "Runemaster Molgeim"         , raid = "The Assembly of Iron" },
    [33118] = { name = "Ignis the Furnace Master" },
    [33186] = { name = "Razorscale" },
    [33288] = { name = "Yogg-Saron" },
    [33350] = { name = "Mimiron" },
    [33515] = { name = "Auriaya" },
    [34564] = { name = "Anub'arak" },
    [34799] = { name = "Dreadscale"                 , raid = "Northrend Beasts" },
    [35144] = { name = "Acidmaw"                    , raid = "Northrend Beasts" },
    [36597] = { name = "The Lich King" },
    [36612] = { name = "Lord Marrowgar" },
    [36678] = { name = "Professor Putricide" },
    [36853] = { name = "Sindragosa" },
    [37813] = { name = "Deathbringer Saurfang" },
    [42178] = { name = "Magmatron"                  , raid = "Omnitron Defense System" },
    [41378] = { name = "Maloriak" },
    [41376] = { name = "Nefarian" },
    [45992] = { name = "Valiona"                    , raid = "Valiona and Theralion" },
    [45993] = { name = "Theralion"                  , raid = "Valiona and Theralion" },
    [43735] = { name = "Elementium Monstrosity"     , raid = "Ascendant Council" },
    [43324] = { name = "Cho'gall" },
    [45871] = { name = "Nezir"                      , raid = "Conclave of Wind" },
    [46753] = { name = "Al'Akir" },
    [53691] = { name = "Shannox" },
    [52498] = { name = "Beth'tilac" },
    [53494] = { name = "Baleroc" },
    [52571] = { name = "Majordomo Staghelm" },
    [55312] = { name = "Yor'sahj the Unsleeping" },
    [53879] = { name = "Deathwing"                  , raid = "Spine of Deathwing" },
    [56173] = { name = "Deathwing"                  , raid = "Madness of Deathwing" },
}

PFH_DB_ZONES = {
    [721] = { map  = "Hall of Blackhand" },
    [775] = { raid = "The Battle for Mount Hyjal" },
    [780] = { raid = "Coilfang: Serpentshrine Cavern" },
    [789] = { raid = "The Sunwell" },
    [798] = { raid = "Magister's Terrace" },
}

PFH_DB_PETS = {
    [12264] = { -- Worg Carrier
        npc_id = 10259,
        from = {
            {
                type = 'dungeon', npc_id = 9736,
                zone_id = 721,
                level = 48, for_sort = 63,
            },
        },
    },
    [35504] = { -- Phoenix Hatchling
        npc_id = 26119,
        from = {
            {
                type = 'dungeon', npc_id = 24664,
                zone_id = 798,
                level = 65, for_sort = 115,
            },
        },
    },
    [68673] = { -- Smolderweb Egg
        npc_id = 10598,
        from = {
            {
                type = 'dungeon', npc_id = 10596,
                zone_id = 721,
                level = 48, for_sort = 60,
            },
        },
    },
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
            },
            {
                type = 'raid', npc_id = 25166,
                zone_id = 789,
                level = 70, for_sort = 159,
            },
        },
    },
    [142094] = { -- Fragment of Frozen Bone
        npc_id = 115146,
        from = {
            {
                type = 'raid', npc_id = 36612,
                zone_id = 604,
                level = 80, for_sort = 251,
            },
        },
    },
    [142095] = { -- Remains of a Blood Beast
        npc_id = 115147,
        from = {
            {
                type = 'raid', npc_id = 37813,
                zone_id = 604,
                level = 80, for_sort = 251,
            },
        },
    },
    [142096] = { -- Putricide's Alchemy Supplies
        npc_id = 115148,
        from = {
            {
                type = 'raid', npc_id = 36678,
                zone_id = 604,
                level = 80, for_sort = 251,
            },
        },
    },
    [142097] = { -- Skull of a Frozen Whelp
        npc_id = 115149,
        from = {
            {
                type = 'raid', npc_id = 36853,
                zone_id = 604,
                level = 80, for_sort = 251,
            },
        },
    },
    [142098] = { -- Drudge Remains
        npc_id = 115150,
        from = {
            {
                type = 'raid', npc_id = 36597,
                zone_id = 604,
                level = 80, for_sort = 258,
            },
        },
    },
    [142099] = { -- Call of the Frozen Blade
        npc_id = 115152,
        from = {
            {
                type = 'raid', npc_id = 36597,
                zone_id = 604,
                level = 80, for_sort = 258,
            },
        },
    },
    [142085] = { -- Nerubian Relic
        npc_id = 115137,
        from = {
            {
                type = 'raid', npc_id = 34564,
                zone_id = 543,
                level = 80, for_sort = 232,
            },
        },
    },
    [142083] = { -- Giant Worm Egg
        npc_id = 115135,
        from = {
            {
                type = 'raid', npc_id = 35144,
                zone_id = 543,
                level = 80, for_sort = 232,
            },
            {
                type = 'raid', npc_id = 34799,
                zone_id = 543,
                level = 80, for_sort = 232,
            },
        },
    },
    [142086] = { -- Red-Hot Coal
        npc_id = 115138,
        from = {
            {
                type = 'raid', npc_id = 33118,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [142087] = { -- Ironbound Collar
        npc_id = 115139,
        from = {
            {
                type = 'raid', npc_id = 33186,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [142088] = { -- Stormforged Rune
        npc_id = 115140,
        from = {
            {
                type = 'raid', npc_id = 32857,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
            {
                type = 'raid', npc_id = 32867,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
            {
                type = 'raid', npc_id = 32927,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [142089] = { -- Glittering Ball of Yarn
        npc_id = 115141,
        from = {
            {
                type = 'raid', npc_id = 33515,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [142090] = { -- Ominous Pile of Snow
        npc_id = 115142,
        from = {
            {
                type = 'raid', npc_id = 32845,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [142091] = { -- Blessed Seed
        npc_id = 115143,
        from = {
            {
                type = 'raid', npc_id = 32906,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [142092] = { -- Overcomplicated Controller
        npc_id = 115144,
        from = {
            {
                type = 'raid', npc_id = 33350,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [142093] = { -- Wriggling Darkness
        npc_id = 115145,
        from = {
            {
                type = 'raid', npc_id = 33288,
                zone_id = 529,
                level = 80, for_sort = 219,
            },
        },
    },
    [152966] = { -- Tinytron
        npc_id = 127850,
        from = {
            {
                type = 'raid', npc_id = 42178,
                zone_id = 754,
                level = 85, for_sort = 359,
            },
        },
    },
    [152967] = { -- Discarded Experiment
        npc_id = 127852,
        from = {
            {
                type = 'raid', npc_id = 41378,
                zone_id = 754,
                level = 85, for_sort = 359,
            },
        },
    },
    [152968] = { -- Rattlejaw
        npc_id = 127853,
        from = {
            {
                type = 'raid', npc_id = 41376,
                zone_id = 754,
                level = 85, for_sort = 359,
            },
        },
    },
    [152969] = { -- Twilight Clutch-Sister
        npc_id = 127857,
        from = {
            {
                type = 'raid', npc_id = 45992,
                zone_id = 758,
                level = 85, for_sort = 359,
            },
            {
                type = 'raid', npc_id = 45993,
                zone_id = 758,
                level = 85, for_sort = 359,
            },
        },
    },
    [152970] = { -- Bound Stream
        npc_id = 127858,
        from = {
            {
                type = 'raid', npc_id = 43735,
                zone_id = 758,
                level = 85, for_sort = 359,
            },
        },
    },
    [152972] = { -- Faceless Minion
        npc_id = 127859,
        from = {
            {
                type = 'raid', npc_id = 43324,
                zone_id = 758,
                level = 85, for_sort = 359,
            },
        },
    },
    [152974] = { -- Drafty
        npc_id = 127863,
        from = {
            {
                type = 'raid', npc_id = 45871,
                zone_id = 773,
                level = 85, for_sort = 359,
            },
        },
    },
    [152973] = { -- Zephyrian Prince
        npc_id = 127862,
        from = {
            {
                type = 'raid', npc_id = 46753,
                zone_id = 773,
                level = 85, for_sort = 359,
            },
        },
    },
    [152975] = { -- Blazehound
        npc_id = 127947,
        from = {
            {
                type = 'raid', npc_id = 53691,
                zone_id = 800,
                level = 85, for_sort = 378,
            },
        },
    },
    [152976] = { -- Cinderweb Recluse
        npc_id = 127948,
        from = {
            {
                type = 'raid', npc_id = 52498,
                zone_id = 800,
                level = 85, for_sort = 378,
            },
        },
    },
    [152977] = { -- Surger
        npc_id = 127950,
        from = {
            {
                type = 'raid', npc_id = 53494,
                zone_id = 800,
                level = 85, for_sort = 378,
            },
        },
    },
    [152978] = { -- Infernal Pyreclaw
        npc_id = 127951,
        from = {
            {
                type = 'raid', npc_id = 52571,
                zone_id = 800,
                level = 85, for_sort = 378,
            },
        },
    },
    [152979] = { -- Faceless Mindlasher
        npc_id = 127952,
        from = {
            {
                type = 'raid', npc_id = 55312,
                zone_id = 824,
                level = 85, for_sort = 397,
            },
        },
    },
    [152980] = { -- Corrupted Blood
        npc_id = 127953,
        from = {
            {
                type = 'raid', npc_id = 53879,
                zone_id = 824,
                level = 85, for_sort = 403,
            },
        },
    },
    [152981] = { -- Unstable Tendril
        npc_id = 127954,
        from = {
            {
                type = 'raid', npc_id = 56173,
                zone_id = 824,
                level = 85, for_sort = 403,
            },
        },
    },
}
