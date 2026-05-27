-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
return {
	["Cupid\'sPractice"] = {
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s horses",
				Amount = 10
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 5
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 3
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "UnlovelyHat",
				Theme = { "Mint", "Rose" }
			}
		}
	},
	HeartSkills = {
		Requires = "Cupid\'sPractice",
		Missions = {
			Mission1 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 5
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Description = "Complete the Western Maze Minigame %s times",
				Amount = 2,
				Check = function(p1) --[[ Check | Line: 47 ]]
					return p1 == "Maze"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete the Costume Contest Minigame %s times",
				Amount = 2,
				Check = function(p1) --[[ Check | Line: 55 ]]
					return p1 == "CostumeContest"
				end
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "HeartbaneCupidBridle"
			},
			{
				Name = "HeartbaneCupidSocks",
				Amount = 1
			}
		}
	},
	Heartbound = {
		Requires = "WingsOfLove",
		Missions = {
			Mission1 = {
				Type = "CompleteEventMinigame",
				Description = "Complete the Tasty Fishing Minigame %s times",
				Amount = 2,
				Check = function(p1) --[[ Check | Line: 81 ]]
					return p1 == "Fishing"
				end
			},
			Mission2 = {
				Type = "CompleteRace",
				Amount = 2,
				Description = "Complete the Crimson Loop Track %s times",
				Check = function(p1) --[[ Check | Line: 89 ]]
					return p1 == "CrimsonLoopTrack"
				end
			},
			Mission3 = {
				Type = "Foal",
				Description = "Foal any horse %s times",
				Amount = 5
			},
			Mission4 = {
				Type = "InteractWorldLore",
				Amount = 5,
				Description = "Interact with %s unique Western Lore Structures in the World"
			}
		},
		Rewards = {
			{
				Species = "Pastrequine",
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
			}
		}
	},
	WingsOfLove = {
		Requires = "HeartSkills",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s Horses",
				Amount = 15
			},
			Mission2 = {
				Type = "Breed",
				Description = "Breed any Horse %s times",
				Amount = 10
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 5,
				Description = "Complete Cross-Country Sprint %s times",
				Check = function(p1) --[[ Check | Line: 140 ]]
					return p1 == "ObbyMinigame"
				end
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
				Name = "SweetWingPotion"
			}
		}
	},
	PastrequinePath = {
		Requires = "Heartbound",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Heartbane %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 165 ]]
					return p1 == "Heartbane"
				end
			},
			Mission2 = {
				Type = "StatLevelUp",
				Amount = 2,
				Description = "Level up any horses bond skill %s times",
				Check = function(p1, p2) --[[ Check | Line: 175 ]]
					if p1 == "Bond" then
						return true
					end
				end
			},
			Mission3 = {
				Type = "InteractWorldLore",
				Amount = 10,
				Description = "Interact with %s unique Western Lore Structures in the World"
			},
			Mission4 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s minigames",
				Amount = 5
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
			}
		}
	},
	DoveDreams = {
		Requires = "PastrequinePath",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Heartbane %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 215 ]]
					return p1 == "Heartbane"
				end
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s minigames",
				Amount = 2
			},
			Mission3 = {
				Type = "CompleteRace",
				Description = "Complete the Crimson Loop Track %s times",
				Amount = 2,
				Check = function(p1) --[[ Check | Line: 230 ]]
					return p1 == "CrimsonLoopTrack"
				end
			}
		},
		Rewards = {
			{
				Name = "SweetWingPotion",
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
	HeartTest = {
		Requires = "DoveDreams",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s Horses",
				Amount = 10
			},
			Mission2 = {
				Type = "InteractWorldLore",
				Amount = 3,
				Description = "Interact with %s unique Western Lore Structures in the World"
			},
			Mission3 = {
				Type = "StatLevelUp",
				Description = "Level up any horse %s times",
				Amount = 5
			},
			Mission4 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s minigames",
				Amount = 3
			}
		},
		Rewards = {
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 2,
				Theme = { "Mint", "Rose" }
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	HeartbondPromise = {
		Requires = "HeartTest",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Heartbane %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 298 ]]
					return p1 == "Heartbane"
				end
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Amount = 15,
				Description = "Complete any minigame %s times"
			},
			Mission3 = {
				Type = "Foal",
				Description = "Foal any Horse %s times",
				Amount = 15
			},
			Mission4 = {
				Type = "CompleteEventMinigame",
				Amount = 3,
				Description = "Complete Cross-Country Sprint %s times",
				Check = function(p1) --[[ Check | Line: 318 ]]
					return p1 == "ObbyMinigame"
				end
			}
		},
		Rewards = {
			{
				Name = "HeartbaneBreedingLicense",
				ThemeChance = 1,
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
	TrueBond = {
		Requires = "HeartbondPromise",
		Missions = {
			Mission1 = {
				Type = "CompleteEventMinigame",
				Description = "Complete the Costume Contest Minigame %s times",
				Amount = 1,
				Check = function(p1) --[[ Check | Line: 347 ]]
					return p1 == "CostumeContest"
				end
			},
			Mission2 = {
				Type = "Breed",
				Description = "Breed any Horse %s times",
				Amount = 10
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 3,
				Description = "Complete Cross-Country Sprint %s times",
				Check = function(p1) --[[ Check | Line: 360 ]]
					return p1 == "ObbyMinigame"
				end
			}
		},
		Rewards = {
			{
				Name = "HeartbaneCupidSaddle",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	BrokenTrust = {
		Requires = "TrueBond",
		Missions = {
			Mission1 = {
				Type = "CompleteRace",
				Amount = 2,
				Description = "Complete the Crimson Loop Track %s times",
				Check = function(p1) --[[ Check | Line: 390 ]]
					return p1 == "CrimsonLoopTrack"
				end
			},
			Mission2 = {
				Type = "Foal",
				Description = "Foal any horse %s times",
				Amount = 3
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 2,
				Description = "Complete Cross-Country Sprint %s times",
				Check = function(p1) --[[ Check | Line: 403 ]]
					return p1 == "ObbyMinigame"
				end
			}
		},
		Rewards = {
			{
				Name = "HeartbreakerStaff",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	ForgottenPromises = {
		Requires = "BrokenTrust",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s horses",
				Amount = 10
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 5
			},
			Mission3 = {
				Type = "Breed",
				Description = "Breed any Horse %s times",
				Amount = 5
			},
			Mission4 = {
				Type = "DefeatBoss",
				Amount = 1,
				Description = "Defeat %s Bosses"
			}
		},
		Rewards = {
			{
				Name = "ScorpionLollipop",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			},
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	BittersweetGoodbyes = {
		Requires = "ForgottenPromises",
		Missions = {
			Mission1 = {
				Type = "CompleteEventMinigame",
				Description = "Complete the Costume Contest Minigame %s times",
				Amount = 3,
				Check = function(p1) --[[ Check | Line: 475 ]]
					return p1 == "CostumeContest"
				end
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 10
			},
			Mission3 = {
				Type = "Breed",
				Description = "Breed any Horse %s times",
				Amount = 10
			}
		},
		Rewards = {
			{
				Species = "Pastrequine",
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
	CrushedHope = {
		Requires = "BittersweetGoodbyes",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s horses",
				Amount = 10
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 5
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 5
			},
			Mission4 = {
				Type = "InteractWorldLore",
				Amount = 5,
				Description = "Interact with %s unique Western Lore Structures in the World"
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
	LingeringSorrow = {
		Requires = "CrushedHope",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Pastrequine %s times",
				Amount = 15,
				Check = function(p1) --[[ Check | Line: 569 ]]
					return p1 == "Pastrequine"
				end
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 10
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 15
			}
		},
		Rewards = {
			{
				Name = "PastrequineBreedingLicense",
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
	Heartbreak = {
		Requires = "LingeringSorrow",
		Missions = {
			Mission1 = {
				Type = "Foal",
				Description = "Foal any horse %s times",
				Amount = 10
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 10
			},
			Mission3 = {
				Type = "Tame",
				Description = "Tame a Heartbane %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 617 ]]
					return p1 == "Heartbane"
				end
			}
		},
		Rewards = {
			{
				Name = "CupidWingPotion",
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
	LostLove = {
		Requires = "Heartbreak",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s horses",
				Amount = 15
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 3
			},
			Mission3 = {
				Type = "InteractWorldLore",
				Amount = 5,
				Description = "Interact with %s unique Western Lore Structures in the World"
			}
		},
		Rewards = {
			{
				Name = "RandomEquipment",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	RideWithLove = {
		Requires = "LostLove",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s horses",
				Amount = 10
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 5
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 2
			},
			Mission4 = {
				Type = "InteractWorldLore",
				Amount = 3,
				Description = "Interact with %s unique Western Lore Structures in the World"
			}
		},
		Rewards = {
			{
				Name = "DoveOfLove",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	LoveyDovey = {
		Requires = "RideWithLove",
		Missions = {
			Mission1 = {
				Type = "RideWithHorse",
				Amount = 3,
				Description = "Ride a horse for %s minutes"
			},
			Mission2 = {
				Type = "CompleteRace",
				Amount = 2,
				Description = "Complete the Crimson Loop Track %s times",
				Check = function(p1) --[[ Check | Line: 719 ]]
					return p1 == "CrimsonLoopTrack"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 1,
				Description = "Complete the Western Maze Minigame %s time",
				Check = function(p1) --[[ Check | Line: 727 ]]
					return p1 == "Maze"
				end
			}
		},
		Rewards = {
			{
				Name = "HeartbrokenDove",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	FoalsOfFate = {
		Requires = "LoveyDovey",
		Missions = {
			Mission1 = {
				Type = "Foal",
				Description = "Foal any horse %s times",
				Amount = 10
			},
			Mission2 = {
				Type = "Tame",
				Description = "Tame a Pastrequine %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 754 ]]
					return p1 == "Pastrequine"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 5
			}
		},
		Rewards = {
			{
				Name = "DarkLoveLantern",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	HeartbaneRising = {
		Requires = "FoalsOfFate",
		Missions = {
			Mission1 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 3
			},
			Mission2 = {
				Type = "Tame",
				Description = "Tame a Pastrequine %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 788 ]]
					return p1 == "Pastrequine"
				end
			},
			Mission3 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 10
			},
			Mission4 = {
				Type = "InteractWorldLore",
				Amount = 5,
				Description = "Interact with %s unique Western Lore Structures in the World"
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
			}
		}
	},
	PastrequineRising = {
		Requires = "HeartbaneRising",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame a Pastrequine %s times",
				Amount = 10,
				Check = function(p1) --[[ Check | Line: 829 ]]
					return p1 == "Pastrequine"
				end
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 5
			},
			Mission3 = {
				Type = "DefeatBoss",
				Amount = 1,
				Description = "Defeat %s Bosses"
			}
		},
		Rewards = {
			{
				Name = "DarkRoseEarClip",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	Yearning = {
		Requires = "PastrequineRising",
		Missions = {
			Mission1 = {
				Type = "Breed",
				Description = "Breed any Horse %s times",
				Amount = 5
			},
			Mission2 = {
				Type = "HarvestNode",
				Description = "Harvest %s harvestables",
				Amount = 20
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 2
			}
		},
		Rewards = {
			{
				Name = "SaurequineGoldLeafSaddle",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	Obsession = {
		Requires = "Yearning",
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame any %s horses",
				Amount = 10
			},
			Mission2 = {
				Type = "StatLevelUp",
				Description = "Level up any horse\'s skill %s times",
				Amount = 5
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Description = "Complete any %s event minigames",
				Amount = 2
			}
		},
		Rewards = {
			{
				Name = "SaurequineGoldLeafSocks",
				ThemeChance = 1,
				Amount = 1,
				Theme = { "Mint", "Rose" }
			}
		}
	},
	LoveOnTheLoop = {
		Requires = "Obsession",
		Missions = {
			Mission1 = {
				Type = "CompleteRace",
				Amount = 2,
				Description = "Complete the Crimson Loop Track %s times",
				Check = function(p1) --[[ Check | Line: 929 ]]
					return p1 == "CrimsonLoopTrack"
				end
			},
			Mission2 = {
				Type = "CompleteEventMinigame",
				Amount = 2,
				Description = "Complete the Western Maze Minigame %s time",
				Check = function(p1) --[[ Check | Line: 937 ]]
					return p1 == "Maze"
				end
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 2,
				Description = "Complete Cross-Country Sprint %s times",
				Check = function(p1) --[[ Check | Line: 945 ]]
					return p1 == "ObbyMinigame"
				end
			},
			Mission4 = {
				Type = "InteractWorldLore",
				Amount = 3,
				Description = "Interact with %s unique Western Lore Structures in the World"
			}
		},
		Rewards = {
			{
				Species = "Pastrequine",
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
			}
		}
	},
	["TheValentine\'sPrize"] = {
		Requires = "LoveOnTheLoop",
		Missions = {
			Mission1 = {
				Type = "CompleteRace",
				Description = "Complete the Crimson Loop Track %s times",
				Amount = 2,
				Check = function(p1) --[[ Check | Line: 982 ]]
					return p1 == "CrimsonLoopTrack"
				end
			},
			Mission2 = {
				Type = "Foal",
				Description = "Foal any Horse %s times",
				Amount = 3
			},
			Mission3 = {
				Type = "CompleteEventMinigame",
				Amount = 2,
				Description = "Complete Cross-Country Sprint %s times",
				Check = function(p1) --[[ Check | Line: 995 ]]
					return p1 == "ObbyMinigame"
				end
			},
			Mission4 = {
				Type = "DefeatBoss",
				Amount = 1,
				Description = "Defeat %s Bosses"
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
			}
		}
	}
}