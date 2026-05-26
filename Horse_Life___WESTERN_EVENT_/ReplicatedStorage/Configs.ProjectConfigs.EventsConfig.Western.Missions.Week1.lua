-- https://lua.expert/
return {
	DustySpurs = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 1,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-22"),
		Rewards = {
			Dynamite = 1,
			GoldCoins = 100
		},
		Tasks = {
			{
				Preset = "TameAnySpecies",
				Amount = 15
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
				Amount = 5
			}
		}
	},
	SheriffsBandana = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-22"),
		RequiredMissions = { "DustySpurs" },
		Rewards = {
			SheriffStar = 1,
			GoldCoins = 100
		},
		Tasks = {
			{
				Preset = "CompleteAnyEventMinigame",
				Amount = 4
			},
			{
				Preset = "HarvestAnyForageable",
				Amount = 15
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 2
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 3
			}
		}
	},
	LassoLoop = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-22"),
		RequiredMissions = { "SheriffsBandana" },
		Rewards = {
			WornSign = 1,
			GoldCoins = 100
		},
		Tasks = {
			{
				Preset = "HarvestAnyForageable",
				Amount = 20
			},
			{
				Preset = "CompleteAnyEventMinigame",
				Amount = 4
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 2
			},
			{
				Preset = "InspectAnyLore",
				Amount = 5
			}
		}
	},
	TumbleweedTrail = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-22"),
		RequiredMissions = { "LassoLoop" },
		Rewards = {
			Tumbleweeds = 1,
			GoldCoins = 100
		},
		Tasks = {
			{
				Preset = "TameSpecificSpecies",
				Species = "Bisorse",
				Amount = 15
			},
			{
				Preset = "CompleteAnyEventMinigame",
				Amount = 4
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 5
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 2
			}
		}
	},
	Ranger = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-22"),
		RequiredMissions = { "TumbleweedTrail" },
		Rewards = {
			Caniquine = 1,
			GoldCoins = 100
		},
		ExtraRewardData = {
			Caniquine = {
				Age = 100,
				Infertile = true,
				NoMutations = true,
				Origin = "Developer",
				Species = "Caniquine",
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
				Preset = "TameSpecificSpecies",
				Species = "Caniquine",
				Amount = 5
			},
			{
				Preset = "CompleteAnyEventMinigame",
				Amount = 4
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 5
			},
			{
				Preset = "BreedAnySpecies",
				Amount = 10
			}
		}
	},
	Hayride = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-23"),
		RequiredMissions = { "Ranger" },
		Rewards = {
			CoveredWagon = 1,
			GoldCoins = 100
		},
		Tasks = {
			{
				Preset = "TameAnySpecies",
				Amount = 15
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
				Amount = 15
			}
		}
	},
	Huckleberry = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-26"),
		Rewards = {
			Caniquine = 1,
			GoldCoins = 500
		},
		ExtraRewardData = {
			Caniquine = {
				Age = 100,
				Infertile = true,
				NoMutations = true,
				Origin = "Developer",
				Species = "Caniquine",
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
				Preset = "InspectAnyLore",
				Amount = 5
			},
			{
				Preset = "CompeteInSpecificContest",
				Amount = 1,
				Contest = "TamingContest",
				PointsRequired = 100,
				Description = function(p1, p2) --[[ Description | Line: 335 ]]
					return ("Compete in the %* and receive at least %* points!"):format(p2.TaskData.Contest, p2.TaskData.PointsRequired)
				end,
				Check = function(p1, p2, p3) --[[ Check | Line: 339 ]]
					local v1 = nil or true
					return (if v1 then if p3 == p2.TaskData.Contest then true else false else v1) and p2.TaskData.PointsRequired <= p1.TameContestData.Score.Value
				end
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 1
			},
			{
				Preset = "CompeteInSpecificContest",
				Contest = "CosmeticContest",
				Amount = 1
			}
		}
	}
}