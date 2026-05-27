-- https://lua.expert/
return {
	CallOfTheHive = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 1,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-10"),
		RequiredMissions = { "EasterTrailRide" },
		Rewards = {
			BabyCarrot = 1,
			GoldEggs = 200
		},
		Tasks = {
			{
				Preset = "InspectAnyLore",
				Amount = 5
			},
			{
				Preset = "HarvestAnyForageable",
				Amount = 10
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 1
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 3
			}
		}
	},
	WolperLegacy = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-10"),
		RequiredMissions = { "CallOfTheHive" },
		Rewards = {
			DewyCloverLeaf = 1,
			GoldEggs = 100
		},
		Tasks = {
			{
				Preset = "TameSpecificSpecies",
				Species = "Wolper",
				Amount = 20
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 1
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 10
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 5
			}
		}
	},
	PollinatorsFlight = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-10"),
		RequiredMissions = { "WolperLegacy" },
		Rewards = {
			BunnyTopHat = 1,
			GoldEggs = 200
		},
		Tasks = {
			{
				Preset = "FoalAnySpecies",
				Amount = 5
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 5
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 10
			},
			{
				Preset = "CompleteSpecificMinigame",
				Minigame = "EggHunt",
				Amount = 1
			}
		}
	},
	LicenseOfTheHivekeeper = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-11"),
		RequiredMissions = { "PollinatorsFlight" },
		Rewards = {
			HoneytrotBreedingLicense = 1,
			GoldEggs = 200
		},
		ExtraRewardData = {
			HoneytrotBreedingLicense = {
				DefaultToRewardsIfAlreadyOwned = true,
				Rewards = {
					{
						Name = "Random",
						Rewards = {
							{
								Name = "Random",
								Amount = 1,
								IncludesDropSets = { "DefaultAccessories" }
							}
						}
					}
				}
			}
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
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 5
			}
		}
	},
	WingsOfTheHive = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		UnlockTime = DateTime.fromIsoDate("2026-04-13"),
		Rewards = {
			HoneyWingPotion = 1,
			GoldEggs = 250
		},
		Tasks = {
			{
				Preset = "FoalAnySpecies",
				Amount = 10
			},
			{
				Preset = "CompleteAnySpeciesQuest",
				Amount = 2
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 2
			},
			{
				Preset = "BreedAnySpecies",
				Amount = 15
			}
		}
	}
}