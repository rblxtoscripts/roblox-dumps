-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemDataService")
local v2 = Sonar("Table")
local v3 = Sonar("StorageUtils")
Sonar("Constants")
local v4 = v1.GetEquipmentBySpecies()
local v5 = game:GetService("RunService"):IsServer()
local v6 = Sonar(v3.Get("SpeciesUnlocks"))
local t = {
	Horse = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 30,
				Description = "Tame Horses",
				Check = function(p1) --[[ Check | Line: 25 ]]
					return p1 == "Horse"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "ScrollFilledSatchel",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WovenLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Pony = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 25,
				Description = "Tame Ponies",
				Check = function(p1) --[[ Check | Line: 55 ]]
					return p1 == "Pony"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "CherryPlush",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WovenLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	AkhalTeke = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 1,
				Description = "Tame an Akhal Teke",
				Check = function(p1) --[[ Check | Line: 85 ]]
					return p1 == "AkhalTeke"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "HarpOfNature",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "StarCollar",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId3 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 3
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WovenLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Friesian = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 1,
				Description = "Tame a Friesian",
				Check = function(p1) --[[ Check | Line: 116 ]]
					return p1 == "Friesian"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RoseHeadCrown",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 2
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WovenLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Clydesdale = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 1,
				Description = "Tame a Clydesdale",
				Check = function(p1) --[[ Check | Line: 146 ]]
					return p1 == "Clydesdale"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "LogStack",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "LongHonse",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId3 = {
				Name = "RusticAxe",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 3
			},
			RewardId4 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 4
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WovenLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Felorse = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 25,
				Description = "Tame Any Horses"
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "CalicoEarBow",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "CalicoBackBow",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId3 = {
				Name = "StringToy",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 3
			},
			RewardId4 = {
				Name = "MouseToy",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 4
			},
			RewardId5 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 5
			}
		},
		Missions = {
			{
				Reward = {
					Name = "GoldLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Anticorn = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 25,
				Description = "Tame Any Horses"
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "GhostlySpear",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 3
			},
			RewardId2 = {
				Name = "WrathScissors",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			},
			RewardId3 = {
				Name = "CursedBoneMask",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId4 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 4
			}
		},
		Missions = {
			{
				Reward = {
					Name = "GoldLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Equus = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 25,
				Description = "Tame Equus",
				Check = function(p1) --[[ Check | Line: 238 ]]
					return p1 == "Equus"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "BoneClub",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WovenLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Bisorse = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 25,
				Description = "Tame Bisorse",
				Check = function(p1) --[[ Check | Line: 269 ]]
					return p1 == "Bisorse"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				Seedoffset = 2
			},
			RewardId2 = {
				Name = "BisorseSkull",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WesternLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Caprine = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 25,
				Description = "Tame Caprines",
				Check = function(p1) --[[ Check | Line: 300 ]]
					return p1 == "Caprine"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "BellCollar",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "VibrantLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "PremiumFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Unicorn = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 10,
				Description = "Tame Unicorns",
				Check = function(p1) --[[ Check | Line: 331 ]]
					return p1 == "Unicorn"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "MysticLightStaff",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "MagicalLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "PremiumFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Gargoyle = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 10,
				Description = "Tame Gargoyles",
				Check = function(p1) --[[ Check | Line: 362 ]]
					return p1 == "Gargoyle"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "GothicPendant",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "OvergrownLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "ExclusiveFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Kelpie = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 10,
				Description = "Tame Kelpies",
				Check = function(p1) --[[ Check | Line: 393 ]]
					return p1 == "Kelpie"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "GoldAppleOnAStick",
				Amount = 1,
				P = 0.05
			},
			RewardId3 = {
				Name = "BerryOnAStick",
				Amount = 2,
				P = 0.1
			},
			RewardId4 = {
				Name = "RandomEquipment",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2,
				PullTable = {
					"MermaidCrown",
					"StarfishEarClip",
					"CoralTiara",
					"SeaweedEarBow",
					"KelpCrown",
					"ClamEarClip",
					"HibiscusEarClip",
					"HibiscusFlowerCrown",
					"ManateePlush",
					"ShrimpPlush"
				}
			},
			RewardId5 = {
				Name = "ConchShell",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 3
			}
		},
		Missions = {
			{
				Reward = {
					Name = "KelpLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "ExclusiveFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Peryton = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 10,
				Description = "Tame Perytons",
				Check = function(p1) --[[ Check | Line: 427 ]]
					return p1 == "Peryton"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "CloudyHalo",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "MysticCloudLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Cactaline = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 5,
				Description = "Tame Cactalines",
				Check = function(p1) --[[ Check | Line: 458 ]]
					return p1 == "Cactaline"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "CactusCorsage",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "GilaWoodpecker",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId3 = {
				Name = "Canteen",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 3
			},
			RewardId4 = {
				Name = "PottedCactus",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 4
			},
			RewardId5 = {
				Name = "CactusWren",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 5
			},
			RewardId6 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 6
			}
		},
		Missions = {
			{
				Reward = {
					Name = "CactiLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Fae = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 5,
				Description = "Tame Fae",
				Check = function(p1) --[[ Check | Line: 493 ]]
					return p1 == "Fae"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "VineWrappedStaff",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "MysticWebLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Plush = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "BuyItem",
				Amount = 5,
				Description = "Buy Plush horses from the Plush Machine",
				Check = function(p1) --[[ Check | Line: 524 ]]
					return p1 == "PlushMachine"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Species = "Plush",
				P = 0.25,
				Preset = { "PlushWhite", "PlushBlack", "PlushGreen", "PlushBlue", "PlushPurple", "PlushRed" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2
				}
			},
			RewardId3 = {
				Name = "HeartPlushPillow",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2
			}
		},
		Missions = {
			{
				Reward = {
					Name = "BraidedLasso",
					Amount = 2
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Flora = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 5,
				Description = "Tame Flora",
				Check = function(p1) --[[ Check | Line: 561 ]]
					return p1 == "Flora"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "WildflowerBouquet",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 2
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RoseLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Cybred = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 50,
				Description = "Tame Any Horses"
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 6
			},
			RewardId2 = {
				Species = "Cybred",
				P = 0.1,
				Preset = { "CybredSynthetic", "CybredSynth", "CybredBlue", "CybredDesert", "CybredSilver", "CybredCopper", "CybredRed", "CybredSteam" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2
				}
			},
			RewardId3 = {
				Name = "FuturisticBlade",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 1
			},
			RewardId4 = {
				Name = "RandomFlair",
				Amount = 1,
				P = 0.25,
				SeedOffset = 2,
				PullTable = { "GreenTechnoTrail", "PurpleTechnoTrail", "RainbowTechnoTrail", "YellowTechnoTrail", "RedTechnoTrail", "CyanTechnoTrail" }
			},
			RewardId5 = {
				Name = "RoboPal",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 3
			},
			RewardId6 = {
				Name = "GearEarring",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 4
			},
			RewardId7 = {
				Name = "GearStaff",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 5
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 4
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Celestial = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 50,
				Description = "Tame Any Horses"
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Species = "Celestial",
				P = 0.1,
				Preset = { "CelestialVibrant", "CelestialPurple", "CelestialBlack", "CelestialWhite", "CelestialHorizon", "CelestialCerulian" },
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2
				}
			},
			RewardId3 = {
				Name = "CelestialStaff",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId4 = {
				Name = "JarOfStars",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 3
			},
			RewardId5 = {
				Name = "CosmicSerpent",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 4
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 4
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Saurequine = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "FindShovels",
				Amount = 3,
				Description = "Find shovels in the world"
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75
			},
			RewardId2 = {
				Species = "Saurequine",
				P = 0.1,
				Preset = {
					"SaurTan",
					"SaurBrown",
					"SaurOrange",
					"SaurGreen",
					"SaurGreenYellow",
					"SaurTanBlue",
					"SaurBlack",
					"PeryBGray",
					"PeryLTan",
					"PeryWTan",
					"PeryGBrown",
					"PeryCBrown",
					"GargoyleCanyon",
					"GhoulSwamp"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2
				}
			},
			RewardId3 = {
				Name = "Trike",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 1
			},
			RewardId4 = {
				Name = "FluffyRaptor",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 1
			},
			RewardId5 = {
				Name = "BoneScythe",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 1
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 4
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Kirin = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level Agility skill on any horses",
				Check = function(p1, p2) --[[ Check | Line: 702 ]]
					if p1 == "Agility" then
						return true
					end
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Species = "Kirin",
				P = 0.1,
				Preset = {
					"KirinSun",
					"KirinWinter",
					"KirinDark",
					"KirinBlue",
					"KirinVibrant",
					"KirinWhite",
					"KirinSunset",
					"KirinForest",
					"KirinDefault",
					"KirinWarm"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2
				}
			},
			RewardId3 = {
				Name = "VolcanoMask",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId4 = {
				Name = "MagmaRose",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 3
			},
			RewardId5 = {
				Name = "MagmaCrown",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 4
			},
			RewardId6 = {
				Name = "LavaLamp",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 5
			},
			RewardId7 = {
				Name = "AllSeeingScepter",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 6
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 4
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Hippocampus = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 10,
				Description = "Tame Hippocampus",
				Check = function(p1) --[[ Check | Line: 745 ]]
					return p1 == "Hippocampus"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "RandomEquipment",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = { "WaterLilyParasol", "TreasureTrident", "SeaFishBag", "SeaHeadBand", "SeashellEarclip", "SeaFinEarRing", "SeaBlueFish", "OctopusPlush" }
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 4
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Seraph = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "DefeatBoss",
				Amount = 1,
				Description = "Defeat Spirit Boss"
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 1
			},
			RewardId2 = {
				Name = "DivineSword",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 2
			},
			RewardId3 = {
				Name = "FallenBow",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 3
			},
			RewardId4 = {
				Name = "CorruptSpear",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 4
			},
			RewardId5 = {
				Name = "HolyGreatAxe",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 5
			},
			RewardId6 = {
				Name = "DisgracedSword",
				Amount = 1,
				P = 0.5,
				Theme = "Random",
				SeedOffset = 6
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 4
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Nephyrian = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 2,
				Description = "Tame Nephyrians",
				Check = function(p1) --[[ Check | Line: 808 ]]
					return p1 == "Nephyrian"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 0.75,
				SeedOffset = 2
			},
			RewardId2 = {
				Name = "RandomEquipment",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = { "RainBow", "ThunderstormFlail" }
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 4
				}
			},
			{
				Reward = {
					Name = "MysticFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Fjord = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 15,
				Description = "Tame Fjords",
				Check = function(p1) --[[ Check | Line: 839 ]]
					return p1 == "Fjord"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomEquipment",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = { "RunewoodHorseshoeStaff", "RunesBucket", "MountainCharmBell" }
			},
			RewardId2 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 2
			}
		},
		Missions = {
			{
				Reward = {
					Name = "WovenLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "GoodFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	},
	Caniquine = {
		RewardAmount = 1,
		MissionsByType = {
			Preset1 = {
				Type = "Tame",
				Amount = 5,
				Description = "Tame Caniquines",
				Check = function(p1) --[[ Check | Line: 869 ]]
					return p1 == "Caniquine"
				end
			}
		},
		Rewards = {
			RewardId1 = {
				Name = "RandomEquipment",
				Amount = 1,
				P = 0.25,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = { "WolfAmulet", "MoonStaff" }
			},
			RewardId2 = {
				Name = "RandomSpeciesEquipment",
				Amount = 1,
				Theme = "Random",
				P = 1,
				SeedOffset = 2
			}
		},
		Missions = {
			{
				Reward = {
					Name = "RainbowLasso",
					Amount = 5
				}
			},
			{
				Reward = {
					Name = "EpicFeed",
					Amount = 3
				}
			},
			{
				Reward = {
					Name = "Coins",
					Amount = 100
				}
			}
		}
	}
}
for v7, v8 in t do
	v8.Index = v6.Missions[v7].Index
	v8.Name = v7
	v8.Species = v7
	v8.Title = v6.Missions[v7].Title
	if v5 then
		for v9, v10 in v8.Rewards do
			if v10.Name == "RandomSpeciesEquipment" then
				v10.PullTable = {}
				task.spawn(function() --[[ Line: 912 | Upvalues: v4 (copy), v7 (copy), v2 (copy), v10 (copy) ]]
					while not next(v4) do
						task.wait()
					end
					if v4[v7] then
						for v22, v3 in v2.ToListByIndex(v4[v7]) do
							v10.PullTable[v22] = v3
						end
					end
					if v4[v7] then
						return
					end
					warn((("No RandomSpeciesEquipment items found for %*"):format(v7)))
				end)
			end
		end
	end
	for v11, v12 in v8.Missions do
		if not v12.Type then
			v12.MissionsByType = v8.MissionsByType
		end
	end
end
return {
	Missions = t
}