-- https://lua.expert/
local t = {
	RankSave = "normal.v6",
	MaxSummonerSpawn = 5,
	HitboxSize = Vector3.new(1.25, 1.25, 1.25),
	SkipWait = {
		["1"] = 8,
		["2"] = 8,
		["3"] = 8,
		["99"] = 16,
		["199"] = 8,
		["299"] = 16
	},
	AdminPanel = {
		1315580227,
		3789107515,
		6219601416,
		607249713,
		4248006074,
		175743100,
		478515580,
		5359502287,
		113006766,
		1633052769,
		1538109910,
		476736886,
		3454121991,
		883829438,
		3679192737,
		1108032657,
		2425603844,
		1706755114,
		3219207465,
		5639016840,
		5709347205,
		5435567302
	},
	PowerCosts = {
		Common = 0.25,
		Uncommon = 0.25,
		Rare = 0.25,
		Epic = 0.25,
		Mythic = 0.5,
		Secret = 1.5,
		Nightmare = 2,
		Forgotten = 3,
		Apex = 3
	},
	Rarities = {
		"Common",
		"Uncommon",
		"Rare",
		"Epic",
		"Mythic",
		"Secret",
		"Nightmare",
		"Forgotten",
		"Apex"
	},
	EnemyCFrameOffset = {
		["Zombie Mangle"] = Vector3.new(0, -4, 0),
		["Insane Music Man"] = Vector3.new(0, 12, 0)
	},
	BossRaidBosses = {
		{
			Enemy = "Binded SpringTrap",
			Health = "25k"
		},
		{
			Enemy = "Unforgiving Ennard",
			Health = "25k"
		},
		{
			Enemy = "Insomniac Moondrop",
			Health = "25k"
		},
		{
			Enemy = "Bounty Hunter Puppet",
			Health = "25k"
		},
		{
			Enemy = "Fallen Foxseidon",
			Health = "25k"
		},
		{
			Enemy = "Controlled Lefty",
			Health = "25k"
		},
		{
			Enemy = "Bloodlust Vanny",
			Health = "25k"
		},
		{
			Enemy = "Dreadful Mr Hippo",
			Health = "25k"
		}
	},
	BossRaidRewards = {
		{
			["Death Tokens"] = {
				Amount = 300
			},
			Item_Souls = {
				Amount = 25
			},
			Item_StatChips = {
				Amount = 1,
				Chance = 0
			},
			Present_PandorasBox = {
				Amount = 1,
				Chance = 15
			},
			Present_ExclusivePack9 = {
				Amount = 1,
				Chance = 15
			}
		},
		{
			["Death Tokens"] = {
				Amount = 600
			},
			Item_Souls = {
				Amount = 31
			},
			Item_StatChips = {
				Amount = 2,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 2,
				Chance = 100
			},
			Present_ExclusivePack9 = {
				Amount = 2,
				Chance = 100
			}
		},
		{
			["Death Tokens"] = {
				Amount = 900
			},
			Item_Souls = {
				Amount = 40
			},
			Item_StatChips = {
				Amount = 2,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 1,
				Chance = 15
			},
			Present_ExclusivePack9 = {
				Amount = 1,
				Chance = 15
			}
		},
		{
			["Death Tokens"] = {
				Amount = 1300
			},
			Item_Souls = {
				Amount = 46
			},
			Item_StatChips = {
				Amount = 2,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 1,
				Chance = 15
			},
			Present_ExclusivePack9 = {
				Amount = 1,
				Chance = 15
			}
		},
		{
			["Death Tokens"] = {
				Amount = 1600
			},
			Item_Souls = {
				Amount = 52
			},
			Item_StatChips = {
				Amount = 3,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 3,
				Chance = 100
			},
			Present_ExclusivePack9 = {
				Amount = 3,
				Chance = 100
			}
		},
		{
			["Death Tokens"] = {
				Amount = 1900
			},
			Item_Souls = {
				Amount = 60
			},
			Item_StatChips = {
				Amount = 3,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 1,
				Chance = 20
			},
			Present_ExclusivePack9 = {
				Amount = 1,
				Chance = 20
			}
		},
		{
			["Death Tokens"] = {
				Amount = 2200
			},
			Item_Souls = {
				Amount = 68
			},
			Item_StatChips = {
				Amount = 3,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 1,
				Chance = 20
			},
			Present_ExclusivePack9 = {
				Amount = 1,
				Chance = 20
			}
		},
		{
			["Death Tokens"] = {
				Amount = 2500
			},
			Item_Souls = {
				Amount = 75
			},
			Item_StatChips = {
				Amount = 3,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 4,
				Chance = 100
			},
			Present_ExclusivePack9 = {
				Amount = 4,
				Chance = 100
			}
		},
		{
			["Death Tokens"] = {
				Amount = 2800
			},
			Item_Souls = {
				Amount = 83
			},
			Item_StatChips = {
				Amount = 4,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 1,
				Chance = 25
			},
			Present_ExclusivePack9 = {
				Amount = 1,
				Chance = 25
			}
		},
		{
			["Death Tokens"] = {
				Amount = 3100
			},
			Item_Souls = {
				Amount = 91
			},
			Item_StatChips = {
				Amount = 4,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 1,
				Chance = 25
			},
			Present_ExclusivePack9 = {
				Amount = 1,
				Chance = 25
			}
		},
		{
			["Death Tokens"] = {
				Amount = 3300
			},
			Item_Souls = {
				Amount = 98
			},
			Item_StatChips = {
				Amount = 4,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 5,
				Chance = 100
			},
			Present_ExclusivePack9 = {
				Amount = 5,
				Chance = 100
			}
		},
		{
			["Death Tokens"] = {
				Amount = 3600
			},
			Item_Souls = {
				Amount = 105
			},
			Item_StatChips = {
				Amount = 4,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 2,
				Chance = 25
			},
			Present_ExclusivePack9 = {
				Amount = 2,
				Chance = 25
			}
		},
		{
			["Death Tokens"] = {
				Amount = 3900
			},
			Item_Souls = {
				Amount = 113
			},
			Item_StatChips = {
				Amount = 5,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 2,
				Chance = 25
			},
			Present_ExclusivePack9 = {
				Amount = 2,
				Chance = 25
			}
		},
		{
			["Death Tokens"] = {
				Amount = 4100
			},
			Item_Souls = {
				Amount = 120
			},
			Item_StatChips = {
				Amount = 5,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 6,
				Chance = 100
			},
			Present_ExclusivePack9 = {
				Amount = 6,
				Chance = 100
			}
		},
		{
			["Death Tokens"] = {
				Amount = 5000
			},
			Item_Souls = {
				Amount = 128
			},
			Item_StatChips = {
				Amount = 6,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 2,
				Chance = 25
			},
			Present_ExclusivePack9 = {
				Amount = 2,
				Chance = 25
			}
		},
		{
			["Death Tokens"] = {
				Amount = 5200
			},
			Item_Souls = {
				Amount = 135
			},
			Item_StatChips = {
				Amount = 6,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 2,
				Chance = 25
			},
			Present_ExclusivePack9 = {
				Amount = 2,
				Chance = 25
			}
		},
		{
			["Death Tokens"] = {
				Amount = 5500
			},
			Item_Souls = {
				Amount = 143
			},
			Item_StatChips = {
				Amount = 6,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 7,
				Chance = 100
			},
			Present_ExclusivePack9 = {
				Amount = 7,
				Chance = 100
			}
		},
		{
			["Death Tokens"] = {
				Amount = 5800
			},
			Item_Souls = {
				Amount = 150
			},
			Item_StatChips = {
				Amount = 6,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 3,
				Chance = 30
			},
			Present_ExclusivePack9 = {
				Amount = 3,
				Chance = 30
			}
		},
		{
			["Death Tokens"] = {
				Amount = 6100
			},
			Item_Souls = {
				Amount = 158
			},
			Item_StatChips = {
				Amount = 6,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 3,
				Chance = 30
			},
			Present_ExclusivePack9 = {
				Amount = 3,
				Chance = 30
			}
		},
		{
			["Death Tokens"] = {
				Amount = 6500
			},
			Item_Souls = {
				Amount = 165
			},
			Item_StatChips = {
				Amount = 6,
				Chance = 100
			},
			Present_PandorasBox = {
				Amount = 3,
				Chance = 30
			},
			Present_ExclusivePack9 = {
				Amount = 3,
				Chance = 30
			}
		}
	},
	SpecialSettings = {
		InfoPosition = { "Left", "Right", "Tower" }
	},
	EnchantShines = { "Vengeance", "Springlock", "Developer", "Overclock", "Investigator", "bear5", "Prototype", "Champion" },
	EndlessRewards = {
		["1"] = {
			{
				Wave = 100,
				Rewards = { "Present_Endo_1" }
			}
		},
		["2"] = {
			{
				Wave = 100,
				Rewards = { "Present_Puppet_1" }
			}
		},
		["3"] = {
			{
				Wave = 100,
				Rewards = { "Present_PhantomFreddy_1" }
			}
		},
		["4"] = {
			{
				Wave = 100,
				Rewards = { "Present_PlushtrapPresent_1" }
			}
		},
		["5"] = {
			{
				Wave = 100,
				Rewards = { "Present_BoomboxFoxyPresent_1" }
			}
		},
		["6"] = {
			{
				Wave = 100,
				Rewards = { "Present_MrCanDo_1" }
			}
		},
		["7"] = {
			{
				Wave = 100,
				Rewards = { "Present_GlamrockEndo_1" }
			}
		},
		["8"] = {
			{
				Wave = 100,
				Rewards = { "Present_ThePrincess_1" }
			}
		},
		["9"] = {
			{
				Wave = 100,
				Rewards = { "Present_HappyFrog_1" }
			}
		},
		["10"] = {
			{
				Wave = 100,
				Rewards = { "Present_JJPresent_1" }
			}
		}
	},
	TotalMoneyMultipliers = {
		["10m"] = 0.25,
		["5m"] = 0.35,
		["1m"] = 0.5,
		["500k"] = 0.6,
		["100k"] = 0.75,
		PVP = {
			["30m"] = 0.1,
			["10m"] = 0.1,
			["1m"] = 0.05,
			["500k"] = 0.1,
			["150k"] = 0.2,
			["70k"] = 0.35,
			["30k"] = 0.5
		}
	},
	Difficulties = { "Easy", "Medium", "Hard", "Impossible", "Nightmare" },
	HellModeRewards = {
		["1_1"] = {
			Present_Corrupted = {
				Chance = 0.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 2, 3 }
			},
			Item_Agony = {
				Chance = 1.2,
				Amount = 1
			}
		},
		["1_2"] = {
			Present_Corrupted = {
				Chance = 0.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 2, 3 }
			},
			Item_Agony = {
				Chance = 1.2,
				Amount = 1
			}
		},
		["1_3"] = {
			Present_Corrupted = {
				Chance = 0.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 2, 3 }
			},
			Item_Agony = {
				Chance = 1.2,
				Amount = 1
			}
		},
		["1_4"] = {
			Present_Corrupted = {
				Chance = 0.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 2, 3 }
			},
			Item_Agony = {
				Chance = 1.2,
				Amount = 1
			}
		},
		["1_5"] = {
			Present_Corrupted = {
				Chance = 0.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 2, 3 }
			},
			Item_Agony = {
				Chance = 1.2,
				Amount = 1
			}
		},
		["1_6"] = {
			Present_Corrupted = {
				Chance = 0.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 2, 3 }
			},
			Item_Agony = {
				Chance = 1.2,
				Amount = 1
			}
		},
		["2_1"] = {
			Present_Corrupted = {
				Chance = 0.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 3, 4 }
			},
			Item_Agony = {
				Chance = 1.5,
				Amount = 1
			}
		},
		["2_2"] = {
			Present_Corrupted = {
				Chance = 0.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 3, 4 }
			},
			Item_Agony = {
				Chance = 1.5,
				Amount = 1
			}
		},
		["2_3"] = {
			Present_Corrupted = {
				Chance = 0.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 3, 4 }
			},
			Item_Agony = {
				Chance = 1.5,
				Amount = 1
			}
		},
		["2_4"] = {
			Present_Corrupted = {
				Chance = 0.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 3, 4 }
			},
			Item_Agony = {
				Chance = 1.5,
				Amount = 1
			}
		},
		["2_5"] = {
			Present_Corrupted = {
				Chance = 0.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 3, 4 }
			},
			Item_Agony = {
				Chance = 1.5,
				Amount = 1
			}
		},
		["2_6"] = {
			Present_Corrupted = {
				Chance = 0.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 3, 4 }
			},
			Item_Agony = {
				Chance = 1.5,
				Amount = 1
			}
		},
		["3_1"] = {
			Present_Corrupted = {
				Chance = 0.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 5, 6 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["3_2"] = {
			Present_Corrupted = {
				Chance = 0.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 5, 6 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["3_3"] = {
			Present_Corrupted = {
				Chance = 0.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 5, 6 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["3_4"] = {
			Present_Corrupted = {
				Chance = 0.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 5, 6 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["3_5"] = {
			Present_Corrupted = {
				Chance = 0.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 5, 6 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["3_6"] = {
			Present_Corrupted = {
				Chance = 0.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 50,
				Amount = { 5, 6 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["4_1"] = {
			Present_Corrupted = {
				Chance = 0.6,
				Amount = 1
			},
			Item_Souls = {
				Chance = 75,
				Amount = { 6, 7 }
			},
			Item_Agony = {
				Chance = 3,
				Amount = 1
			}
		},
		["4_2"] = {
			Present_Corrupted = {
				Chance = 0.6,
				Amount = 1
			},
			Item_Souls = {
				Chance = 75,
				Amount = { 6, 7 }
			},
			Item_Agony = {
				Chance = 3,
				Amount = 1
			}
		},
		["4_3"] = {
			Present_Corrupted = {
				Chance = 0.6,
				Amount = 1
			},
			Item_Souls = {
				Chance = 75,
				Amount = { 6, 7 }
			},
			Item_Agony = {
				Chance = 3,
				Amount = 1
			}
		},
		["4_4"] = {
			Present_Corrupted = {
				Chance = 0.6,
				Amount = 1
			},
			Item_Souls = {
				Chance = 75,
				Amount = { 7, 7 }
			},
			Item_Agony = {
				Chance = 3,
				Amount = 1
			}
		},
		["4_5"] = {
			Present_Corrupted = {
				Chance = 0.6,
				Amount = 1
			},
			Item_Souls = {
				Chance = 75,
				Amount = { 6, 7 }
			},
			Item_Agony = {
				Chance = 3,
				Amount = 1
			}
		},
		["4_6"] = {
			Present_Corrupted = {
				Chance = 0.6,
				Amount = 1
			},
			Item_Souls = {
				Chance = 75,
				Amount = { 6, 7 }
			},
			Item_Agony = {
				Chance = 3,
				Amount = 1
			}
		},
		["5_1"] = {
			Present_Corrupted = {
				Chance = 0.75,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 9 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["5_2"] = {
			Present_Corrupted = {
				Chance = 0.75,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 9 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["5_3"] = {
			Present_Corrupted = {
				Chance = 0.75,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 9 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["5_4"] = {
			Present_Corrupted = {
				Chance = 0.75,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 9 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["5_5"] = {
			Present_Corrupted = {
				Chance = 0.75,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 9 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["5_6"] = {
			Present_Corrupted = {
				Chance = 0.75,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 9 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["6_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 9, 12 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["6_2"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 9, 12 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["6_3"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 9, 12 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["6_4"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 9, 12 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["6_5"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 9, 12 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["6_6"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 9, 12 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["7_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 14 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["7_2"] = {
			Present_Corrupted = {
				Chance = 1.05,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 14 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["7_3"] = {
			Present_Corrupted = {
				Chance = 1.1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 14 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["7_4"] = {
			Present_Corrupted = {
				Chance = 1.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 14 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["7_5"] = {
			Present_Corrupted = {
				Chance = 1.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 14 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["7_6"] = {
			Present_Corrupted = {
				Chance = 1.25,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 14 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["8_1"] = {
			Present_Corrupted = {
				Chance = 1.15,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["8_2"] = {
			Present_Corrupted = {
				Chance = 1.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["8_3"] = {
			Present_Corrupted = {
				Chance = 1.25,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["8_4"] = {
			Present_Corrupted = {
				Chance = 1.3,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["8_5"] = {
			Present_Corrupted = {
				Chance = 1.35,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["8_6"] = {
			Present_Corrupted = {
				Chance = 1.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["9_1"] = {
			Present_Corrupted = {
				Chance = 1.2,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 14, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["9_2"] = {
			Present_Corrupted = {
				Chance = 1.25,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 14, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["9_3"] = {
			Present_Corrupted = {
				Chance = 1.3,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 14, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["9_4"] = {
			Present_Corrupted = {
				Chance = 1.35,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 14, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["9_5"] = {
			Present_Corrupted = {
				Chance = 1.4,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 14, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["9_6"] = {
			Present_Corrupted = {
				Chance = 1.5,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 14, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["99_4"] = {
			Present_Corrupted = {
				Chance = 0.5,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 3, 4 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["99_5"] = {
			Present_Corrupted = {
				Chance = 0.75,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 4, 5 }
			},
			Item_Agony = {
				Chance = 2,
				Amount = 1
			}
		},
		["99_6"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 4, 5 }
			},
			Item_Agony = {
				Chance = 3,
				Amount = 1
			}
		},
		["99_7"] = {
			Present_Corrupted = {
				Chance = 1.25,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 8, 10 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["99_8"] = {
			Present_Corrupted = {
				Chance = 1.35,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 12, 14 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["99_9"] = {
			Present_Corrupted = {
				Chance = 1.35,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 14, 16 }
			},
			Item_Agony = {
				Chance = 5,
				Amount = 1
			}
		},
		["801_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["801_2"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["801_3"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["801_4"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["801_5"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["801_6"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["800_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["800_2"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["800_3"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["800_4"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["800_5"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["800_6"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["900_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["900_2"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["900_3"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["900_4"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["900_5"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["900_6"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["901_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["901_2"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["901_3"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["901_4"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["901_5"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["901_6"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["1100_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["1100_2"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["1100_3"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["1100_4"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["1100_5"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 7, 8 }
			},
			Item_Agony = {
				Chance = 0.4,
				Amount = 1
			}
		},
		["1101_1"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["1101_2"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["1101_3"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["1101_4"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		},
		["1101_5"] = {
			Present_Corrupted = {
				Chance = 1,
				Amount = 1
			},
			Item_Souls = {
				Chance = 100,
				Amount = { 10, 12 }
			},
			Item_Agony = {
				Chance = 0.75,
				Amount = 1
			}
		}
	},
	SpecialEndlessRewards = {
		["10"] = {
			Present_ScarecrowFoxyPresent = {
				Chance = 0.25,
				Amount = 1
			}
		},
		["20"] = {
			Present_BouncerPresent = {
				Chance = 0.25,
				Amount = 1
			}
		}
	},
	SlotCosts = {
		["4"] = 5,
		["5"] = 20,
		["6"] = 125
	},
	SpecialShinyBooster = {
		["Eclipse Ballora"] = {
			Damage = 1.125,
			Cooldown = 0.875
		}
	},
	GetRandomPresent = function() --[[ GetRandomPresent | Line: 268 ]]
		local sum = Random.new():NextNumber(0, 100)
		for v2, v3 in {
			Present_ExclusivePack9 = 0.1,
			Present_Secret = 0.25,
			Present_Mythic = 1,
			Present_Epic = 8.65,
			Present_Rare = 30,
			Present_Uncommon = 60
		} do
			sum = sum - v3
			if sum < 0 then
				return v2
			end
		end
		return nil
	end
}
function t.GetEndlessRewards(p1, p2, p3) --[[ GetEndlessRewards | Line: 282 | Upvalues: t (copy) ]]
	if not t.EndlessRewards[tonumber(p1)] then
		return
	end
	local t2 = {}
	for k, v in pairs(t.EndlessRewards[tonumber(p1)]) do
		if tonumber(v.Wave) <= p2 then
			for k2, v2 in pairs(v.Rewards) do
				if string.find(v2, "Present_Random") then
					local v1 = string.gsub(v2, "Present_Random", "")
					v2 = t.GetRandomPresent() .. v1
				end
				table.insert(t2, v2)
			end
		end
	end
	return t2
end
function t.GetReward(p1) --[[ GetReward | Line: 302 ]]
	if typeof(p1) == "table" then
		for k, v in pairs(p1) do
			p1 = v
			break
		end
	end
	if not p1 or typeof(p1) == "table" then
		return nil
	end
	local v1 = 1
	local v2 = ""
	if not string.find(p1, "_") then
		return nil
	end
	local v3 = 2
	local v4 = string.split(p1, "_")
	if tonumber(v4[2]) then
		v1 = v4[2]
		v3 = 2
	elseif tonumber(v4[3]) then
		v1 = v4[3]
		v3 = 3
	elseif tonumber(v4[4]) then
		v1 = v4[4]
		v3 = 4
	end
	for i = 1, v3 - 1 do
		v2 = v2 .. v4[i] .. (if i == v3 - 1 then "" else "_")
	end
	return { v1, v2 }
end
return t