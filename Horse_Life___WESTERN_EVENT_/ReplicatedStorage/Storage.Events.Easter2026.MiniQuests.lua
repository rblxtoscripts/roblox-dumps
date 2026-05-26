-- https://lua.expert/
return {
	{
		Name = "Blooming Wings",
		UnlockDate = 1771790400,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Heartbane %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 9 ]]
					return p1 == "Heartbane"
				end
			},
			Mission2 = {
				Type = "Breed",
				Description = "Breed any Horse %s times",
				Amount = 10
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 15,
				Description = "Complete any minigame %s times"
			},
			Mission4 = {
				Type = "Foal",
				Description = "Foal any Horse %s times",
				Amount = 5
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "LoveMutationPotion"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	{
		Name = "Love\'s Legacy",
		UnlockDate = 1772395200,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any Horse %s times",
				Amount = 25
			},
			Mission2 = {
				Type = "CompleteRace",
				Amount = 3,
				Description = "Complete the Crimson Loop Track %s times",
				Check = function(p1) --[[ Check | Line: 59 ]]
					return p1 == "CrimsonLoopTrack"
				end
			},
			Mission3 = {
				Type = "DefeatBoss",
				Amount = 1,
				Description = "Defeat %s Bosses"
			},
			Mission4 = {
				Type = "Foal",
				Description = "Foal any Horse %s times",
				Amount = 15
			}
		},
		Rewards = {
			{
				Species = "Heartbane",
				Infertile = true,
				NoMutations = true,
				Origin = "Developer",
				Preset = {
					"Demon",
					"Nightmare",
					"Vampire",
					"Poison",
					"MoonL",
					"MoonD",
					"Morpho",
					"PlushNeapolitan",
					"PlushNeapolitan2",
					"PlushMatchaBoba",
					"PlushRainbowSherbet",
					"JewelBeetle",
					"Dango"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2,
					AlwaysMax = true
				}
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	{
		Name = "Lovely Capsule",
		UnlockDate = 1772568000,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "DefeatBoss",
				Amount = 1,
				Description = "Defeat %s Bosses"
			},
			Mission2 = {
				Type = "CompleteRace",
				Amount = 3,
				Description = "Complete the Crimson Loop Track %s times",
				Check = function(p1) --[[ Check | Line: 111 ]]
					return p1 == "CrimsonLoopTrack"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 10,
				Description = "Complete any minigame %s times"
			},
			Mission4 = {
				Type = "Foal",
				Description = "Foal any Horse %s times",
				Amount = 15
			}
		},
		Rewards = {
			{
				Name = "LovelyCapsule",
				Amount = 1
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	{
		Name = "Love, Rewarded",
		UnlockDate = 1773169200,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Foal",
				Description = "Foal any horse %s times",
				Amount = 15
			},
			Mission2 = {
				Type = "Tame",
				Description = "Tame any %s horses",
				Amount = 25
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 10,
				Description = "Complete any %s minigames"
			},
			Mission4 = {
				Type = "DefeatBoss",
				Amount = 1,
				Description = "Defeat %s Bosses"
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "LaceboundMutationPotion"
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	{
		Name = "True Devotion",
		UnlockDate = 1773781200,
		Image = "rbxassetid://80642573883441",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Heartbane %s times",
				Amount = 20,
				Check = function(p1) --[[ Check | Line: 187 ]]
					return p1 == "Heartbane"
				end
			},
			Mission2 = {
				Type = "Breed",
				Description = "Breed any Horse %s times",
				Amount = 10
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 15,
				Description = "Complete any %s minigames"
			},
			Mission4 = {
				Type = "Foal",
				Description = "Foal any horse %s times",
				Amount = 10
			}
		},
		Rewards = {
			{
				Name = "StarMask",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose", "Random" }
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	}
}