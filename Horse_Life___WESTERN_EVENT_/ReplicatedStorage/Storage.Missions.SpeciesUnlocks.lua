-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalDataService")
local v2 = nil
local tbl = {
	Horse = {
		Cost = 0,
		MissionDisplayName = "Finding Your Way",
		Title = "Horses",
		Preset = {
			"Brown",
			"DarkBrown",
			"LightBrown",
			"DarkDullBrown",
			"LightDullBrown",
			"Tan",
			"Cream",
			"RedBrown",
			"White",
			"Black",
			"BlueRoan",
			"LightRoan",
			"LightGray",
			"DarkGray",
			"DarkOrange",
			"LightOrange",
			"Blonde"
		},
		Missions = {
			{
				TrackObjective = true,
				Type = "HarvestNode",
				Amount = 1,
				Description = "Harvest Forageables",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "Tame",
				Amount = 1,
				Description = "Tame any species",
				Reward = {
					Amount = 10,
					Name = "StringLasso"
				}
			},
			{
				TrackObjective = true,
				Type = "Breed",
				Amount = 1,
				Description = "Breed any horses",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Pony = {
		Cost = 0,
		Title = "Ponies",
		Preset = {
			"Brown",
			"DarkBrown",
			"LightBrown",
			"DarkDullBrown",
			"LightDullBrown",
			"Tan",
			"Cream",
			"RedBrown",
			"White",
			"Black",
			"BlueRoan",
			"LightRoan",
			"LightGray",
			"DarkGray",
			"DarkOrange",
			"LightOrange",
			"Blonde"
		},
		Missions = {
			{
				TrackObjective = true,
				Type = "Tame",
				Amount = 3,
				Description = "Tame any species",
				Reward = {
					Amount = 5,
					Name = "WovenLasso"
				}
			},
			{
				TrackObjective = true,
				Type = "Breed",
				Amount = 2,
				Description = "Breed any horses",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "HarvestNode",
				Amount = 5,
				Description = "Harvest Forageables",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "JumpObstacle",
				Amount = 5,
				Description = "Complete Jumps",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Equus = {
		Cost = 250,
		Title = "Equus",
		Preset = {
			"Brown",
			"DarkBrown",
			"LightBrown",
			"DarkDullBrown",
			"LightDullBrown",
			"Tan",
			"Cream",
			"Zebra",
			"ZebraRare",
			"LightGray",
			"DarkGray",
			"Blonde"
		},
		Missions = {
			{
				TrackObjective = true,
				Type = "Breed",
				Amount = 2,
				Description = "Breed any horses",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "StatLevelUp",
				Amount = 4,
				Description = "Level any skill for any horse",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "JumpObstacle",
				Amount = 10,
				Description = "Complete Jumps",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "Sell",
				Amount = 10,
				Description = "Sell any horse",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Bisorse = {
		Cost = 500,
		Title = "Bisorses",
		Preset = {
			"Brown",
			"DarkBrown",
			"LightBrown",
			"DarkDullBrown",
			"LightDullBrown",
			"Black",
			"Cream",
			"Tan",
			"White",
			"DarkGray"
		},
		Missions = {
			{
				TrackObjective = true,
				Type = "Foal",
				Amount = 5,
				Description = "Claim Foals",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "Sell",
				Amount = 20,
				Description = "Sell any horse",
				Reward = {
					Amount = 1,
					Name = "WesternLasso"
				}
			},
			{
				TrackObjective = true,
				Type = "HarvestNode",
				Amount = 10,
				Description = "Harvest Forageables",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "StatLevelUp",
				Amount = 5,
				Description = "Level Strength skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 191 ]]
					if p1 == "Strength" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	AkhalTeke = {
		Cost = 750,
		Title = "AkhalTeke",
		Preset = { "White", "Black", "LightGray", "DarkGray", "LightRoan", "Tan", "Cream", "Blonde" },
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Tame an Akhal Teke",
				Check = function(p1) --[[ Check | Line: 211 ]]
					if p1 == "AkhalTeke" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 5,
				Description = "Level Bond skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 224 ]]
					if p1 == "Bond" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "Tame",
				Amount = 50,
				Description = "Tame any species",
				Reward = {
					Amount = 10,
					Name = "StringLasso"
				}
			},
			{
				Type = "HarvestPlant",
				Amount = 5,
				Description = "Harvest Forageables",
				Reward = {
					Amount = 5,
					Name = "MysticFeed"
				}
			}
		}
	},
	Friesian = {
		Cost = 8000,
		Title = "Friesian",
		Preset = {
			"FriesianBlack",
			"FriesianBlackPaint",
			"FriesianDarkGray",
			"FriesianBlackBrown",
			"FriesianBrown",
			"FriesianDarkDullBrown",
			"FriesianLightDullBrown",
			"FriesianPeryGray",
			"FriesianPeryDBrown",
			"FriesianBlackWhite",
			"FriesianLightGray",
			"FriesianDarkGray"
		},
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Tame a Friesian",
				Check = function(p1) --[[ Check | Line: 264 ]]
					if p1 == "Friesian" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level Bond skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 277 ]]
					if p1 == "Bond" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level Agility skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 290 ]]
					if p1 == "Agility" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "WovenLasso"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 5,
				Description = "Level Jump skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 303 ]]
					if p1 == "Jump" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Caprine = {
		Cost = 1000,
		Title = "Caprines",
		Preset = { "White", "Black", "LightGray", "DarkGray", "LightRoan", "Tan", "Cream", "Blonde" },
		Missions = {
			{
				Type = "Tame",
				Amount = 10,
				Description = "Tame Ponies",
				Check = function(p1) --[[ Check | Line: 323 ]]
					if p1 == "Pony" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level Jump skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 336 ]]
					if p1 == "Jump" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "VibrantLasso"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 3,
				Description = "Level Bond skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 349 ]]
					if p1 == "Bond" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "HarvestNode",
				Amount = 10,
				Description = "Harvest Large Berry Bushes",
				Check = function(p1) --[[ Check | Line: 362 ]]
					if p1 == "LargeBerryBush" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Clydesdale = {
		Cost = 1250,
		Title = "Clydesdale",
		Preset = { "White", "Black", "LightGray", "DarkGray", "LightRoan", "Tan", "Cream", "Blonde" },
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Tame a Clydesdale",
				Check = function(p1) --[[ Check | Line: 383 ]]
					if p1 == "Clydesdale" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level Strength skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 396 ]]
					if p1 == "Strength" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "WovenLasso"
				}
			},
			{
				TrackObjective = true,
				Type = "Tame",
				Amount = 50,
				Description = "Tame any species",
				Reward = {
					Amount = 10,
					Name = "StringLasso"
				}
			},
			{
				TrackObjective = true,
				Type = "JumpObstacle",
				Amount = 10,
				Description = "Complete Jumps",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Unicorn = {
		Cost = 1500,
		Title = "Unicorns",
		Preset = { "White", "Black", "LightGray", "DarkGray", "LightRoan", "Tan", "Cream", "Blonde" },
		Missions = {
			{
				Type = "StatLevelUp",
				Amount = 5,
				Description = "Level Agility skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 436 ]]
					if p1 == "Agility" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "MagicalLasso"
				}
			},
			{
				Type = "EquipEquipment",
				Amount = 1,
				Description = "Equip an accessory to a horse",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "DyeEquipment",
				Amount = 1,
				Description = "Dye an accessory",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Gargoyle = {
		Cost = 2000,
		Title = "Gargoyles",
		Preset = { "GargoyleBasic", "GargoyleBlossom", "GargoyleBlack", "GargoyleRocky" },
		Missions = {
			{
				Type = "Tame",
				Amount = 1,
				Description = "Tame a Unicorn",
				Check = function(p1) --[[ Check | Line: 474 ]]
					if p1 == "Unicorn" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level Strength skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 487 ]]
					if p1 == "Strength" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "OvergrownLasso"
				}
			},
			{
				Type = "HarvestNode",
				Amount = 15,
				Description = "Harvest Stone Deposits",
				Check = function(p1) --[[ Check | Line: 500 ]]
					if p1 == "StoneDeposit" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Kelpie = {
		Cost = 3500,
		Title = "Kelpies",
		Preset = {
			"KelpieGold",
			"KelpieGrass",
			"KelpieVibrant",
			"KelpieSwamp",
			"KelpieMint",
			"KelpieRedKelp",
			"KelpieDark",
			"KelpieKelp",
			"KelpieGreenBlue"
		},
		Missions = {
			{
				Type = "Tame",
				Amount = 3,
				Description = "Tame Gargoyles",
				Check = function(p1) --[[ Check | Line: 520 ]]
					if p1 == "Gargoyle" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "ListAuction",
				Amount = 1,
				Description = "List a horse for Auction in the Market Realm",
				Check = function(p1, p2) --[[ Check | Line: 533 ]]
					return true
				end,
				Reward = {
					Amount = 1,
					Name = "CarrotOnAStick"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 2,
				Description = "Level Bond skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 545 ]]
					if p1 == "Fertility" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "OvergrownLasso"
				}
			},
			{
				Type = "FullyEquipEquipment",
				Amount = 1,
				Description = "Equip something in each equipment slot on any horse",
				Check = function(p1) --[[ Check | Line: 558 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Peryton = {
		Cost = 4500,
		Title = "Perytons",
		Preset = {
			"PeryDBrown",
			"PeryWBrown",
			"PeryCBrown",
			"PeryGBrown",
			"PeryWTan",
			"PeryLTan",
			"PeryBGray",
			"PeryGray",
			"PeryCream",
			"WhiteBlue",
			"BrownGreen"
		},
		Missions = {
			{
				Type = "TameWings",
				Amount = 2,
				Description = "Tame Any Winged Horses",
				Check = function() --[[ Check | Line: 577 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "UpgradeMutation",
				Amount = 1,
				Description = "Use a Wing Upgrade Potion",
				Check = function(p1, p2, p3) --[[ Check | Line: 589 ]]
					warn(p1, p2, p3)
					if p1 ~= "Wings" then
						return
					end
					if p3 == 2 then
						return true
					end
				end,
				Reward = {
					Amount = 5,
					Name = "MysticFeed"
				}
			},
			{
				Type = "Tame",
				Amount = 3,
				Description = "Tame Kelpies",
				Check = function(p1) --[[ Check | Line: 604 ]]
					if p1 == "Kelpie" then
						return true
					end
				end,
				Reward = {
					Amount = 2,
					Name = "MysticCloudLasso"
				}
			},
			{
				Type = "MarketStallSale",
				Amount = 1,
				Description = "Sell something in your market stall",
				Check = function() --[[ Check | Line: 617 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "CompleteRace",
				Amount = 3,
				Description = "Complete Races",
				Check = function() --[[ Check | Line: 629 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Cactaline = {
		Cost = 5500,
		Title = "Cactaline",
		Preset = { "CactusVibrant", "CactusSucculent", "CactusDefault" },
		Missions = {
			{
				Type = "Tame",
				Amount = 5,
				Description = "Tame Cactalines",
				Check = function(p1) --[[ Check | Line: 648 ]]
					if p1 == "Cactaline" then
						return true
					end
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			},
			{
				Type = "CompleteMission",
				Amount = 3,
				Description = "Complete Daily Missions",
				Check = function(p1) --[[ Check | Line: 661 ]]
					return true
				end,
				Reward = {
					Amount = 5,
					Name = "MysticFeed"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 5,
				Description = "Level Agility skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 673 ]]
					if p1 == "Agility" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "CactiLasso"
				}
			},
			{
				Type = "HarvestNode",
				Amount = 25,
				Description = "Harvest Cactus Fruit",
				Check = function(p1) --[[ Check | Line: 686 ]]
					if p1 == "CactusFruit" then
						return true
					end
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			}
		}
	},
	Fae = {
		Cost = 6500,
		Title = "Fae",
		Preset = { "FaeOakwood", "FaeMaple", "FaeAspen", "FaeRedwood", "FaeBirch", "FaePoinciana", "FaeGoldBirch" },
		Missions = {
			[1] = {
				Type = "Tame",
				Amount = 5,
				Description = "Tame Perytons",
				Check = function(p1) --[[ Check | Line: 706 ]]
					if p1 == "Peryton" then
						return true
					end
				end,
				Reward = {
					Amount = 3,
					Name = "MagicFairyNet"
				}
			},
			[2] = {
				Type = "TameContestScore",
				Amount = 100,
				Description = "Earn Points in the Taming Contest",
				Reward = {
					Amount = 1,
					Name = "MysticWebLasso"
				}
			},
			[4] = {
				Type = "CompleteMission",
				Amount = 3,
				Description = "Complete Daily Missions",
				Check = function(p1) --[[ Check | Line: 728 ]]
					return true
				end,
				Reward = {
					Amount = 5,
					Name = "MysticFeed"
				}
			},
			[5] = {
				Type = "CompleteNPCMission",
				Amount = 3,
				Description = "Complete NPC Quests",
				Reward = {
					Amount = 1000,
					Name = "Coins"
				}
			},
			[3] = {
				Type = "EnterBreedContest",
				Amount = 1,
				Description = "Enter the Cosmetic Contest",
				Reward = {
					Amount = 100,
					Name = "Coins"
				},
				CompleteOnUnlock = function(p1) --[[ CompleteOnUnlock | Line: 753 ]]
					if p1.PlayerData.BreedContest.Score.Value <= 0 then
					else
						return true
					end
				end
			}
		}
	},
	Plush = {
		Cost = 7500,
		Title = "Plushies",
		Preset = { "PlushWhite", "PlushBlack", "PlushGreen", "PlushBlue", "PlushPurple", "PlushRed" },
		Missions = {
			{
				Type = "BuyItem",
				Description = "Purchase items from the Gacha Machine using plush coins",
				Amount = 1,
				Check = function(p1) --[[ Check | Line: 769 ]]
					return p1 == "GachaMachine"
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			},
			{
				Type = "CompleteMission",
				Description = "Replay and complete any species quest",
				Amount = 2,
				Check = function(p1, p2) --[[ Check | Line: 781 ]]
					return p1 == "SpeciesMission"
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			},
			{
				Type = "Tame",
				Amount = 3,
				Description = "Tame Faes",
				Check = function(p1) --[[ Check | Line: 793 ]]
					if p1 == "Fae" then
						return true
					end
				end,
				Reward = {
					Amount = 2,
					Name = "DivineLarvae"
				}
			},
			{
				Type = "Tame",
				Amount = 5,
				Description = "Tame Perytons",
				Check = function(p1) --[[ Check | Line: 816 ]]
					if p1 == "Peryton" then
						return true
					end
				end,
				Reward = {
					Amount = 5,
					Name = "MysticFeed"
				}
			},
			{
				Type = "InteractWorldLore",
				Amount = 5,
				Description = "Interact with unique Lore Structures in the world",
				Reward = {
					Amount = 2,
					Name = "GoldenNeedle"
				}
			}
		}
	},
	Flora = {
		Cost = 8500,
		Title = "Flora",
		Preset = { "FloraTropic", "FloraSun", "FloraHyd", "FloraLav", "FloraPurple", "FloraRed", "FloraYellow" },
		Missions = {
			{
				Type = "HarvestNode",
				Amount = 25,
				Description = "Harvest Cactus Fruit",
				Check = function(p1) --[[ Check | Line: 845 ]]
					if p1 == "CactusFruit" then
						return true
					end
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			},
			{
				Type = "BuyItem",
				Amount = 4,
				Description = "Buy Plush Species",
				Check = function(p1) --[[ Check | Line: 858 ]]
					return p1 == "PlushMachine"
				end,
				Reward = {
					Amount = 1,
					Name = "RoseLasso"
				}
			},
			{
				Type = "CoTame",
				Amount = 5,
				Description = "Co-tame any species",
				Check = function(p1, p2) --[[ Check | Line: 870 ]]
					return true
				end,
				Reward = {
					Amount = 1,
					Theme = "Random",
					Name = "FloraBasicSaddle"
				}
			},
			{
				Type = "SpendCoins",
				Amount = 5000,
				Description = "Spend coins at the Market Stalls",
				Check = function(p1) --[[ Check | Line: 883 ]]
					return p1 == "MarketStalls"
				end,
				Reward = {
					Amount = 1,
					Name = "GalacticNeedle"
				}
			},
			{
				Type = "HarvestPlant",
				Amount = 5,
				Description = "Harvest Planted Crops",
				Reward = {
					Amount = 5,
					Name = "MysticFeed"
				}
			}
		}
	},
	Hippocampus = {
		Cost = 9000,
		Title = "Hippocampus",
		Preset = { "Koi", "HippoYellow", "HippoRed", "HippoJelly", "HippoDefault", "HippoSilverfish", "HippoGreen" },
		Missions = {
			{
				TrackObjective = true,
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level any skills for any horses",
				Check = function(p1, p2) --[[ Check | Line: 913 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "UseFishingRod",
				Amount = 10,
				Description = "Use Fishing Rods",
				Reward = {
					Amount = 1,
					Name = "MagnetOnAStick"
				}
			},
			{
				Type = "Tame",
				Amount = 3,
				Description = "Tame Kelpies",
				Check = function(p1) --[[ Check | Line: 934 ]]
					if p1 == "Kelpie" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "OceanLasso"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 5,
				Description = "Level Agility skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 947 ]]
					if p1 == "Agility" then
						return true
					end
				end,
				Reward = {
					Amount = 1,
					Name = "OceanLasso"
				}
			}
		}
	},
	Felorse = {
		Cost = 10000,
		Title = "Felorse",
		Preset = {
			"Brown",
			"DarkBrown",
			"LightBrown",
			"DarkDullBrown",
			"LightDullBrown",
			"Tan",
			"Cream",
			"Blonde",
			"Arabian",
			"AlcesTan",
			"PeryWTan",
			"PeryGray",
			"PeryDBrown",
			"PeryWBrown",
			"PeryCream",
			"BlackPaint",
			"White",
			"Black",
			"BlackWhite",
			"WhiteBlack",
			"LightRoan",
			"Mustang",
			"BrownBlonde",
			"BlueRoan",
			"LightGray",
			"DarkGray",
			"Zebra",
			"ZebraRare",
			"PeryLTan",
			"PeryBGray",
			"PeryCBrown",
			"PlushCalico"
		},
		Missions = {
			{
				TrackObjective = true,
				Type = "StatLevelUp",
				Amount = 15,
				Description = "Level any skills for any horses",
				Check = function(p1, p2) --[[ Check | Line: 970 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "CompleteRace",
				Amount = 3,
				Description = "Complete Races",
				Check = function(p1) --[[ Check | Line: 982 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "Tame",
				Amount = 1,
				Description = "Tame a Clydesdale",
				Check = function(p1) --[[ Check | Line: 994 ]]
					if p1 == "Clydesdale" then
						return true
					end
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			},
			{
				Type = "CompleteMission",
				Description = "Replay and complete any species quests",
				Amount = 3,
				Check = function(p1, p2) --[[ Check | Line: 1007 ]]
					return p1 == "SpeciesMission"
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			}
		}
	},
	Anticorn = {
		Cost = 11000,
		Title = "Anticorn",
		Preset = { "AnticornIce", "AnticornFire", "AnticornAsh" },
		Missions = {
			{
				TrackObjective = true,
				Type = "StatLevelUp",
				Amount = 15,
				Description = "Level up any horses skills",
				Check = function(p1, p2) --[[ Check | Line: 1029 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "CompleteMission",
				Description = "Replay and complete any species quests",
				Amount = 3,
				Check = function(p1, p2) --[[ Check | Line: 1041 ]]
					return p1 == "SpeciesMission"
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "Tame",
				Amount = 50,
				Description = "Tame any species",
				Reward = {
					Amount = 10,
					Name = "StringLasso"
				}
			},
			{
				TrackObjective = true,
				Type = "HarvestNode",
				Amount = 15,
				Description = "Harvest Forageables",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Cybred = {
		Cost = 12500,
		Title = "Cybred",
		Preset = { "CybredSynthetic", "CybredSynth", "CybredBlue", "CybredDesert", "CybredSilver", "CybredCopper", "CybredRed", "CybredSteam" },
		Missions = {
			{
				Type = "FindChest",
				Amount = 2,
				Description = "Find Daily Chests behind Rock Walls",
				Check = function(p1) --[[ Check | Line: 1080 ]]
					if p1 == "ExplorationChests" then
						return true
					end
				end,
				Reward = {
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Gold",
					PullTable = { "RoboPal", "FuturisticBlade", "GearEarring", "GearStaff", "CybredBasicBridle", "CybredBasicSocks", "CybredBasicSaddle" }
				}
			},
			{
				Type = "CompleteMission",
				Amount = 10,
				Description = "Complete Daily Missions",
				Check = function(p1) --[[ Check | Line: 1092 ]]
					return p1 == "DailyStreakMission"
				end,
				Reward = {
					Name = "RandomFlair",
					Amount = 1,
					PullTable = { "GreenTechnoTrail", "PurpleTechnoTrail", "RainbowTechnoTrail", "YellowTechnoTrail", "RedTechnoTrail", "CyanTechnoTrail" }
				}
			},
			{
				Type = "Tame",
				Amount = 5,
				Description = "Tame Flora",
				Check = function(p1) --[[ Check | Line: 1103 ]]
					if p1 == "Flora" then
						return true
					end
				end,
				Reward = {
					Amount = 5,
					Name = "RainbowLasso"
				}
			},
			{
				Type = "CompleteRace",
				Amount = 3,
				Description = "Complete Races",
				Check = function(p1) --[[ Check | Line: 1116 ]]
					return true
				end,
				Reward = {
					Amount = 250,
					Name = "Coins"
				}
			},
			{
				Type = "CompleteRace",
				Amount = 1,
				Description = "Place top 3 in a race",
				Check = function(p1, p2) --[[ Check | Line: 1128 ]]
					return true
				end,
				Reward = {
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Thunder",
					PullTable = { "RoboPal", "FuturisticBlade", "GearEarring", "GearStaff", "CybredBasicBridle", "CybredBasicSocks", "CybredBasicSaddle" }
				}
			}
		}
	},
	Celestial = {
		Cost = 15000,
		Title = "Celestial",
		Preset = { "CelestialVibrant", "CelestialPurple", "CelestialBlack", "CelestialWhite", "CelestialCerulian", "CelestialHorizon" },
		Missions = {
			{
				Type = "Breed",
				Amount = 5,
				Description = "Breed horses, both with 3 patterns, 3 cosmetics, and 1 paint",
				Check = function(p1, p2, p3, p4) --[[ Check | Line: 1146 | Upvalues: v1 (copy) ]]
					if not (p3 and p4) then
						warn("MISSING SLOTS")
						return
					end
					local function IsValidSlot(p1) --[[ IsValidSlot | Line: 1149 | Upvalues: v1 (ref) ]]
						local _, v12 = v1.GetTotalTraits(p1)
						if not (v12.Patterns and (v12.Paints and v12.Cosmetics)) then
							return false
						end
						return if v12.Paints >= 1 and v12.Patterns >= 3 then v12.Cosmetics >= 3 else false
					end
					local _, v12 = v1.GetTotalTraits(p3)
					if if v12.Patterns and (v12.Paints and v12.Cosmetics) and (v12.Paints >= 1 and v12.Patterns >= 3) then if v12.Cosmetics >= 3 then true else false else false then
						return true
					end
					local _2, v3 = v1.GetTotalTraits(p4)
					if if v3.Patterns and (v3.Paints and v3.Cosmetics) and (v3.Paints >= 1 and v3.Patterns >= 3) then v3.Cosmetics >= 3 else false then
						return true
					else
						return false
					end
				end,
				Reward = {
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Gold",
					PullTable = { "CelestialStaff", "JarOfStars", "CosmicSerpent", "CelestialBasicBridle", "CelestialBasicSocks", "CelestialBasicSaddle" }
				}
			},
			{
				Type = "Tame",
				Amount = 5,
				Description = "Tame horses with any Mutation",
				Check = function(p1, p2) --[[ Check | Line: 1174 ]]
					if not p2 then
						return
					end
					local count = 0
					for v1, v2 in p2.Mutations:GetChildren() do
						if v2.Value ~= "Nothing" then
							count = count + 1
						end
					end
					return count >= 1
				end,
				Reward = {
					Name = "RandomFlair",
					Amount = 1,
					PullTable = { "BlueNebula", "GreenNebula", "PinkNebula" }
				}
			},
			{
				TrackObjective = true,
				Type = "StatLevelUp",
				Amount = 15,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "EnterBreedContest",
				Amount = 1,
				Description = "Enter and score greater than 20%% in the Cosmetic Contest",
				Reward = {
					Amount = 100,
					Name = "Coins"
				},
				Check = function(p1) --[[ Check | Line: 1207 ]]
					if not p1 then
						return
					end
					if p1 < 20 then
					else
						return true
					end
				end,
				CompleteOnUnlock = function(p1) --[[ CompleteOnUnlock | Line: 1212 | Upvalues: v2 (ref), Sonar (copy) ]]
					v2 = v2 or Sonar("BreedContestService")
					local v22 = v2.GetPercentageScore(p1.PlayerData.BreedContest.Score.Value)
					if v22 < 20 then
					else
						return true, { v22 }
					end
				end
			},
			{
				Type = "ShrineSubmit",
				Amount = 10,
				Description = "Submit horses to the Horse Shrine",
				Reward = {
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Thunder",
					PullTable = { "CelestialStaff", "JarOfStars", "CosmicSerpent", "CelestialBasicBridle", "CelestialBasicSocks", "CelestialBasicSaddle" }
				}
			}
		}
	},
	Saurequine = {
		Cost = 20000,
		Title = "Saurequine",
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
		Missions = {
			{
				Type = "FindShovels",
				Amount = 3,
				Description = "Find Shovels in the world",
				Reward = {
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Fossilized",
					PullTable = { "Trike", "FluffyRaptor", "BoneScythe", "SaurequineBasicBridle", "SaurequineBasicSocks", "SaurequineBasicSaddle" }
				}
			},
			{
				Type = "Dig",
				Amount = 5,
				Description = "Dig dirt at the digsite",
				Reward = {
					Name = "RandomFlair",
					Amount = 1,
					PullTable = { "FallingStones" }
				}
			},
			{
				TrackObjective = true,
				Type = "StatLevelUp",
				Amount = 15,
				Description = "Level any skill for any horse",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "HarvestNode",
				Amount = 20,
				Description = "Harvest Forageables",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Kirin = {
		Cost = 25000,
		Title = "Kirin",
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
		Missions = {
			{
				Type = "FireWisp",
				Amount = 3,
				Description = "Find Fire Wisps in the Dungeon",
				Reward = {
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Random",
					PullTable = { "VolcanoMask", "AllSeeingScepter", "LavaLamp", "MagmaCrown", "MagmaRose", "KirinBasicBridle", "KirinBasicSocks", "KirinBasicSaddle" }
				}
			},
			{
				Type = "DungeonDebris",
				Amount = 5,
				Description = "Destroy Dungeon Debris",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				TrackObjective = true,
				Type = "CompleteRace",
				Amount = 5,
				Description = "Complete Races",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 15,
				Description = "Level Agility skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 1307 ]]
					if p1 == "Agility" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Seraph = {
		Cost = 30000,
		Title = "Seraph",
		Preset = { "SeraphGold", "SeraphLight", "SeraphFallen", "SeraphDark" },
		Missions = {
			{
				Type = "DefeatBoss",
				Amount = 3,
				Description = "Defeat Spirit Bosses",
				Reward = {
					Name = "RandomEquipment",
					Amount = 1,
					Theme = "Random",
					PullTable = { "SeraphBasicBridle", "SeraphBasicSaddle", "SeraphBasicSocks" }
				}
			},
			{
				Type = "ElderHorse",
				Amount = 1,
				Description = "Elder any horse",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "TameWings",
				Amount = 25,
				Description = "Tame any winged horses",
				Check = function() --[[ Check | Line: 1344 ]]
					return true
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 15,
				Description = "Level Jump skill for any horses",
				Check = function(p1, p2) --[[ Check | Line: 1356 ]]
					if p1 == "Jump" then
						return true
					end
				end,
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			}
		}
	},
	Nephyrian = {
		Cost = 13500,
		Title = "Nephyrian",
		Preset = { "NephyNormal", "NephySnow", "NephyStorm", "NephySunny" },
		Missions = {
			{
				Type = "CompleteRace",
				Amount = 3,
				Description = "Complete Races",
				Reward = {
					Name = "NephyrianBasicBridle",
					Amount = 1,
					Theme = "Random"
				}
			},
			{
				Type = "Foal",
				Amount = 15,
				Description = "Claim Foals",
				Reward = {
					Amount = 3,
					Name = "GoldLasso"
				}
			},
			{
				Type = "Tame",
				Amount = 25,
				Description = "Tame any species",
				Reward = {
					Name = "NephyrianBasicSocks",
					Amount = 1,
					Theme = "Random"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 15,
				Description = "Level any skill for any horse",
				Reward = {
					Name = "NephyrianBasicSaddle",
					Amount = 1,
					Theme = "Random"
				}
			}
		}
	},
	Fjord = {
		Cost = 1250,
		Title = "Fjord",
		Preset = { "AkhalBrown", "PeryGray", "AkhalBlack", "FelorseBrown", "Blonde" },
		Missions = {
			{
				Type = "CompleteRace",
				Amount = 2,
				Description = "Complete Races",
				Reward = {
					Name = "FjordBasicBridle",
					Amount = 1,
					Theme = "Random"
				}
			},
			{
				Type = "Breed",
				Amount = 10,
				Description = "Breed any species",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "HarvestNode",
				Amount = 15,
				Description = "Break harvestables",
				Reward = {
					Name = "FjordBasicSocks",
					Amount = 1,
					Theme = "Random"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 5,
				Description = "Level any skill for any horse",
				Reward = {
					Name = "FjordBasicSaddle",
					Amount = 1,
					Theme = "Random"
				}
			}
		}
	},
	Caniquine = {
		Cost = 8750,
		Title = "Caniquine",
		Preset = { "CaniGrayWolf", "CaniSeaWolf", "CaniManedWolf" },
		Missions = {
			{
				Type = "Tame",
				Amount = 5,
				Description = "Tame any horse with any Mutation",
				Check = function(p1, p2) --[[ Check | Line: 1456 ]]
					if not p2 then
						return
					end
					local count = 0
					for v1, v2 in p2.Mutations:GetChildren() do
						if v2.Value ~= "Nothing" then
							count = count + 1
						end
					end
					return count >= 1
				end,
				Reward = {
					Name = "CaniquineBasicBridle",
					Amount = 1,
					Theme = "Random"
				}
			},
			{
				Type = "Breed",
				Amount = 10,
				Description = "Breed any species",
				Reward = {
					Amount = 100,
					Name = "Coins"
				}
			},
			{
				Type = "HarvestNode",
				Amount = 20,
				Description = "Break harvestables",
				Reward = {
					Name = "CaniquineBasicLegWraps",
					Amount = 1,
					Theme = "Random"
				}
			},
			{
				Type = "StatLevelUp",
				Amount = 10,
				Description = "Level any skill for any horse",
				Reward = {
					Name = "CaniquineBasicSaddle",
					Amount = 1,
					Theme = "Random"
				}
			}
		}
	}
}
local tbl2 = {
	{
		DisplayName = "Common Steeds",
		UnlockOrder = { "Horse", "Pony", "Equus", "AkhalTeke", "Bisorse", "Clydesdale" }
	},
	{
		DisplayName = "Unique Horses",
		UnlockOrder = { "Caprine", "Unicorn", "Gargoyle", "Kelpie" }
	},
	{
		DisplayName = "Enchanted Mounts",
		UnlockOrder = { "Peryton", "Cactaline", "Fae", "Plush", "Flora", "Friesian" }
	},
	{
		DisplayName = "Mysterious Legends",
		UnlockOrder = { "Felorse", "Hippocampus", "Anticorn" }
	},
	{
		DisplayName = "Forged Myths",
		UnlockOrder = { "Cybred", "Celestial", "Saurequine", "Kirin", "Seraph" }
	}
}
for k, v in pairs(tbl2) do
	v.Index = k
	for k2, v3 in pairs(v.UnlockOrder) do
		local v32 = tbl[v3]
		if v32 then
			v32.Index = k2
			v32.UnlockTrack = v
			v32.Species = v3
		end
		v.UnlockOrder[k2] = v32
	end
end
for k, v in pairs(tbl) do
	v.Name = k
	v.Species = k
end
return {
	Missions = tbl,
	UnlockTracks = tbl2
}