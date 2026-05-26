-- https://lua.expert/
return {
	BornInTheSaddle = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 1,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-29"),
		RequiredMissions = { "Hayride" },
		Rewards = {
			BullHornedHat = 1,
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
	WantedStar = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-29"),
		RequiredMissions = { "BornInTheSaddle" },
		Rewards = {
			MiniSheriffsHat = 1,
			GoldCoins = 100
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
	},
	MostWanted = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-29"),
		RequiredMissions = { "WantedStar" },
		Rewards = {
			StackOfGoldBars = 1,
			GoldCoins = 100
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
	TheLastHorizon = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-29"),
		RequiredMissions = { "MostWanted" },
		Rewards = {
			WesternWingPotion = 1,
			GoldCoins = 100
		},
		Tasks = {
			{
				Preset = "TameSpecificSpecies",
				Species = "Nephyrian",
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
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 2
			}
		}
	},
	Biscuit = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		ShowMissionRewards = true,
		UnlockTime = DateTime.fromIsoDate("2026-05-30"),
		Rewards = {
			Caniquine = 1,
			GoldCoins = 200
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
				Description = function(p1, p2) --[[ Description | Line: 222 ]]
					return ("Compete in the %* and receive at least %* points!"):format(p2.TaskData.Contest, p2.TaskData.PointsRequired)
				end,
				Check = function(p1, p2, p3) --[[ Check | Line: 226 ]]
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