-- https://lua.expert/
return {
	WolpersReturn = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 1,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-24"),
		RequiredMissions = { "PetalsInTheWind" },
		Rewards = {
			Wolper = 1,
			GoldEggs = 200
		},
		ExtraRewardData = {
			Wolper = {
				Age = 100,
				Infertile = true,
				NoMutations = true,
				Origin = "Developer",
				Species = "Wolper",
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2,
					AlwaysMax = true
				},
				Presets = {
					"PlushNeapolitan",
					"PlushNeapolitan2",
					"PlushMatchaBoba",
					"PlushRainbowSherbet",
					"MoonL",
					"MoonD",
					"Morpho",
					"LunarMoth",
					"Demon",
					"Nightmare",
					"Vampire",
					"Poison",
					"DartFrog",
					"PinkLemonade",
					"Vaporwave",
					"Magma",
					"JewelBeetle",
					"CottonCandy",
					"Dango"
				}
			}
		},
		Tasks = {
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 5
			},
			{
				Preset = "TameAnySpecies",
				Amount = 15
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 1
			},
			{
				Preset = "BreedAnySpecies",
				Amount = 10
			}
		}
	},
	SpringCollector = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-24"),
		RequiredMissions = { "WolpersReturn" },
		Rewards = {
			EasterBowStaff = 1,
			GoldEggs = 300
		},
		Tasks = {
			{
				Preset = "TameAnySpecies",
				Amount = 10
			},
			{
				Preset = "LevelAnySpeciesAnySkill",
				Amount = 5
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 1
			},
			{
				Preset = "BreedAnySpecies",
				Amount = 10
			}
		}
	},
	BloomInfusion = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-25"),
		RequiredMissions = { "SpringCollector" },
		Rewards = {
			PorcelainMutationPotion = 1,
			GoldEggs = 400
		},
		Tasks = {
			{
				Preset = "TameSpecificSpecies",
				Species = "Honeytrot",
				Amount = 20
			},
			{
				Preset = "CompleteAnySpeciesQuest",
				Amount = 2
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 10
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 3
			}
		}
	},
	GrandTackReward = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		UnlockTime = DateTime.fromIsoDate("2026-04-25"),
		Rewards = {
			GoldEggs = 400,
			WolperEggslingerSocks = 1,
			WolperEggslingerBridle = 1,
			WolperEggslingerSaddle = 1
		},
		Tasks = {
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 1
			},
			{
				Preset = "SellAnySpecies",
				Amount = 15
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 3
			},
			{
				Preset = "BreedAnySpecies",
				Amount = 10
			}
		}
	}
}