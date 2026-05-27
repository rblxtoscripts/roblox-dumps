-- https://lua.expert/
return {
	SpringAwakening = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 1,
		Replayable = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-03"),
		Rewards = {
			AprilShowersUmbrella = 1,
			GoldEggs = 150
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
				Amount = 5
			}
		}
	},
	FirstBloomPatrol = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-03"),
		RequiredMissions = { "SpringAwakening" },
		Rewards = {
			DandelionScythe = 1,
			GoldEggs = 200
		},
		Tasks = {
			{
				Preset = "InspectAnyLore",
				Amount = 5
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
	TheHoneybeesArrival = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-04"),
		RequiredMissions = { "FirstBloomPatrol" },
		Rewards = {
			BabyChick = 1,
			GoldEggs = 450
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
	FieldsOfRenewal = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-04"),
		RequiredMissions = { "TheHoneybeesArrival" },
		Rewards = {
			Honeytrot = 1,
			GoldEggs = 250
		},
		ExtraRewardData = {
			Honeytrot = {
				Age = 100,
				Infertile = true,
				NoMutations = true,
				Origin = "Developer",
				Species = "Honeytrot",
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
				Preset = "CompleteSpecificMinigame",
				Minigame = "Race",
				Amount = 3
			},
			{
				Preset = "DefeatMinimumTierBoss",
				Amount = 1,
				Tier = 2
			},
			{
				Preset = "FoalAnySpecies",
				Amount = 1
			}
		}
	},
	EasterTrailRide = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		AlwaysVisible = true,
		UnlockTime = DateTime.fromIsoDate("2026-04-05"),
		RequiredMissions = { "FieldsOfRenewal" },
		Rewards = {
			WolperBreedingLicense = 1,
			GoldEggs = 300
		},
		ExtraRewardData = {
			WolperBreedingLicense = {
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
				Species = "Wolper",
				Amount = 15
			},
			{
				Preset = "LevelAnySpeciesSpecificSkill",
				Skill = "Bond",
				Amount = 2
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
	WingsOfSpring = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		UnlockTime = DateTime.fromIsoDate("2026-04-06"),
		Rewards = {
			Wolper = 1,
			GoldEggs = 350
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
				Preset = "TameSpecificSpecies",
				Species = "Wolper",
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
	},
	EggHuntLasso = {
		KeepDataValueOnComplete = true,
		KeepInProgressTasksOnComplete = true,
		MissionTier = 2,
		Replayable = true,
		Category = "EventSpecialQuests",
		UnlockTime = DateTime.fromIsoDate("2026-04-08"),
		Rewards = {
			BunnyLasso = 20,
			GoldEggs = 350
		},
		Tasks = {
			{
				Preset = "HarvestAnyForageable",
				Amount = 20
			},
			{
				Preset = "LevelAnySpeciesAnySkill",
				Amount = 5
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
	}
}