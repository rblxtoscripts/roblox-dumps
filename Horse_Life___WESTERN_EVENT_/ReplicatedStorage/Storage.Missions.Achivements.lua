-- https://lua.expert/
return {
	Achievements = {
		{
			Type = "SpeciesUnlock",
			Title = "Horse Whisperer",
			Amount = 15,
			Description = "Unlock %s species!",
			Rewards = {
				{
					Amount = 20,
					Name = "AppleMuffin"
				},
				{
					Amount = 20,
					Name = "RainbowLasso"
				},
				{
					Amount = 1,
					Name = "RandomEquipment",
					Theme = "Opal"
				}
			},
			UnlockedRewards = {
				StableStorage = 5
			}
		},
		{
			Type = "AlexBond",
			Title = "Horse Whisperer",
			Amount = 800,
			DisplayAs = 100,
			Description = "Reach %s%% bond with Alex!",
			Rewards = {
				{
					Amount = 3,
					Name = "SunEarClip",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "GeodeCrown",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "MiningPickaxe",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "ExplorersPack",
					Theme = "Opal"
				}
			}
		},
		{
			Type = "LyricBond",
			Title = "Horse Whisperer",
			Amount = 500,
			DisplayAs = 100,
			Description = "Reach %s%% bond with Lyric!",
			Rewards = {
				{
					Amount = 3,
					Name = "DelicateFlowerCrown",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "WoodenMask",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "GatherersBasket",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "RoseCrown",
					Theme = "Opal"
				}
			}
		},
		{
			Type = "AureliaBond",
			Title = "Horse Whisperer",
			Amount = 2200,
			DisplayAs = 100,
			Description = "Reach %s%% bond with Aurelia!",
			Rewards = {
				{
					Amount = 3,
					Name = "MoonEarClip",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "StarryEarClip",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "LanternStaff",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "HeartEarClip",
					Theme = "Opal"
				}
			}
		},
		{
			Type = "SpeciesReplay",
			Title = "Herd Hero",
			Amount = 11,
			Description = "Replay horse species missions 1 time!",
			Rewards = {
				{
					Amount = 15,
					Name = "ExclusiveFeed"
				},
				{
					Amount = 20,
					Name = "RainbowLasso"
				},
				{
					Amount = 1,
					Name = "RandomEquipment",
					Theme = "Opal"
				}
			},
			UnlockedRewards = {
				StableStorage = 5
			}
		}
	},
	Milestones = {
		Tame = {
			{
				Type = "Tame",
				Title = "Novice Tamer",
				NextTitle = "Apprentice Tamer",
				Amount = 10,
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 5,
						Name = "WovenLasso"
					},
					{
						Amount = 5,
						Name = "OatMuffin"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Apprentice Tamer",
				NextTitle = "Adept Tamer",
				Requires = 1,
				Amount = 100,
				Trophy = "Bronze",
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "OatMuffin"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Adept Tamer",
				NextTitle = "Expert Tamer",
				Requires = 2,
				Amount = 500,
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "WesternLasso"
					},
					{
						Amount = 10,
						Name = "SugarMuffin"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Expert Tamer",
				NextTitle = "Master Tamer",
				Requires = 3,
				Amount = 1000,
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "VibrantLasso"
					},
					{
						Amount = 10,
						Name = "MintMuffin"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Grandmaster Tamer",
				NextTitle = "Legendary Tamer",
				Requires = 4,
				Amount = 2500,
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "MagicalLasso"
					},
					{
						Amount = 10,
						Name = "CarrotMuffin"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Legendary Tamer",
				NextTitle = "Mythic Tamer",
				Requires = 5,
				Amount = 5000,
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "OvergrownLasso"
					},
					{
						Amount = 10,
						Name = "AppleMuffin"
					},
					{
						Amount = 1,
						Name = "Lasso",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Mythic Tamer",
				NextTitle = "Ultimate Tamer",
				Requires = 6,
				Amount = 7500,
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "KelpLasso"
					},
					{
						Amount = 1,
						Name = "Lasso",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Ultimate Tamer",
				NextTitle = "Divine Tamer",
				Requires = 7,
				Amount = 10000,
				Description = "Tame %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "MysticCloudLasso"
					},
					{
						Amount = 1,
						Name = "Lasso",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Tame",
				Title = "Divine Tamer",
				Requires = 8,
				Amount = 20000,
				Description = "Tame %s horses!",
				GiveTitle = "Divine Tamer",
				Rewards = {
					{
						Amount = 10,
						Name = "WovenLasso"
					},
					{
						Amount = 10,
						Name = "MysticWebLasso"
					},
					{
						Amount = 10,
						Name = "RainbowLasso"
					},
					{
						Amount = 1,
						Name = "Lasso",
						Theme = "Random"
					}
				}
			}
		},
		Foal = {
			{
				Type = "Foal",
				Title = "Few Foals",
				NextTitle = "Handful of Foals",
				Amount = 10,
				Description = "Foal %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "BasicFeed"
					}
				}
			},
			{
				Type = "Foal",
				Title = "Handful of Foals",
				NextTitle = "Budding Herd",
				Requires = 1,
				Amount = 100,
				Description = "Foal %s horses!",
				Rewards = {
					{
						Amount = 5,
						Name = "BasicFeed"
					}
				}
			},
			{
				Type = "Foal",
				Title = "Budding Herd",
				NextTitle = "Growing Herds",
				Requires = 2,
				Amount = 500,
				Description = "Foal %s horses!",
				Rewards = {
					{
						Amount = 10,
						Name = "BasicFeed"
					},
					{
						Amount = 5,
						Name = "GoodFeed"
					}
				}
			},
			{
				Type = "Foal",
				Title = "Growing Herd",
				NextTitle = "Thriving Herd",
				Requires = 3,
				Amount = 1000,
				Description = "Foal %s horses!",
				GiveTitle = "Growing Herd",
				Rewards = {
					{
						Amount = 20,
						Name = "BasicFeed"
					},
					{
						Amount = 10,
						Name = "PremiumFeed"
					}
				}
			}
		},
		Playtime = {
			{
				Type = "Playtime",
				Title = "Casual Hour",
				NextTitle = "A Few Hours",
				Amount = 3600,
				Description = "Play %s hour!",
				FormatRatio = 3600,
				Rewards = {
					{
						Amount = 10,
						Name = "RainbowLasso"
					},
					{
						Amount = 5,
						Name = "GoodFeed"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Playtime",
				Title = "A Few Hours",
				NextTitle = "Daily Grind",
				Requires = 1,
				Amount = 18000,
				FormatRatio = 3600,
				Description = "Play %s hours!",
				Rewards = {
					{
						Amount = 10,
						Name = "RainbowLasso"
					},
					{
						Amount = 5,
						Name = "PremiumFeed"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Playtime",
				Title = "Daily Grind",
				NextTitle = "Weekly Warrior",
				Requires = 2,
				Amount = 36000,
				FormatRatio = 3600,
				Description = "Play %s hours!",
				Rewards = {
					{
						Amount = 10,
						Name = "RainbowLasso"
					},
					{
						Amount = 5,
						Name = "PremiumFeed"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "Hourglass",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Playtime",
				Title = "Weekly Warrior",
				NextTitle = "Dedicated Player",
				Requires = 3,
				Amount = 72000,
				FormatRatio = 3600,
				Description = "Play %s hours!",
				Rewards = {
					{
						Amount = 10,
						Name = "RainbowLasso"
					},
					{
						Amount = 5,
						Name = "PremiumFeed"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "Hourglass",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Playtime",
				Title = "Dedicated Player",
				NextTitle = "Committed Gamer",
				Requires = 4,
				Amount = 180000,
				FormatRatio = 3600,
				Description = "Play %s hours!",
				Rewards = {
					{
						Amount = 15,
						Name = "RainbowLasso"
					},
					{
						Amount = 5,
						Name = "PremiumFeed"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "Hourglass",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Playtime",
				Title = "Committed Gamer",
				NextTitle = "Committed Gamer",
				Requires = 5,
				Amount = 360000,
				FormatRatio = 3600,
				Description = "Play %s hours!",
				Rewards = {
					{
						Amount = 20,
						Name = "RainbowLasso"
					},
					{
						Amount = 10,
						Name = "PremiumFeed"
					},
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "Hourglass",
						Theme = "Random"
					}
				}
			},
			{
				Type = "Playtime",
				Title = "Gaming Addict",
				Requires = 6,
				Amount = 900000,
				FormatRatio = 3600,
				Description = "Play %s hours!",
				GiveTitle = "Gaming Addict",
				Rewards = {
					{
						Amount = 25,
						Name = "RainbowLasso"
					},
					{
						Amount = 15,
						Name = "PremiumFeed"
					},
					{
						Amount = 1,
						Name = "Hourglass",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "Hourglass",
						Theme = "Random"
					}
				}
			}
		},
		LoginStreak = {
			{
				Type = "LoginStreak",
				Title = "Casual Visitor",
				NextTitle = "Regular",
				Amount = 5,
				Description = "Play %s days!",
				Rewards = {
					{
						Amount = 1,
						Name = "NameTag"
					},
					{
						Amount = 1,
						Name = "ColorDye"
					},
					{
						Amount = 5,
						Name = "GoodFeed"
					}
				}
			},
			{
				Type = "LoginStreak",
				Title = "Regular",
				NextTitle = "Frequent Flyer",
				Requires = 1,
				Amount = 10,
				Description = "Play %s days!",
				Rewards = {
					{
						Amount = 1,
						Name = "TraitBoostPotion"
					},
					{
						Amount = 1,
						Name = "RestingWingPotion"
					},
					{
						Amount = 1,
						Name = "LiftedWingPotion"
					},
					{
						Amount = 1,
						Name = "FlowingAmulet",
						Theme = "Random"
					}
				}
			},
			{
				Type = "LoginStreak",
				Title = "Frequent Flyer",
				NextTitle = "Daily Devotee",
				Requires = 2,
				Amount = 20,
				Description = "Play %s days!",
				Rewards = {
					{
						Amount = 1,
						Name = "NameTag"
					},
					{
						Amount = 1,
						Name = "ColorDye"
					},
					{
						Amount = 2,
						Name = "FlowingAmulet",
						Theme = "Random"
					}
				}
			},
			{
				Type = "LoginStreak",
				Title = "Daily Devotee",
				NextTitle = "Loyal Member",
				Requires = 3,
				Amount = 50,
				Description = "Play %s days!",
				Rewards = {
					{
						Amount = 1,
						Name = "GenderSwapPotion"
					},
					{
						Amount = 1,
						Name = "MutationPotion"
					},
					{
						Amount = 3,
						Name = "FlowingAmulet",
						Theme = "Random"
					}
				}
			},
			{
				Type = "LoginStreak",
				Title = "Loyal Member",
				Requires = 4,
				Amount = 100,
				Description = "Play %s days!",
				GiveTitle = "Loyal",
				Rewards = {
					{
						Amount = 1,
						Name = "RandomWingPotion"
					},
					{
						Amount = 1,
						Name = "PredictFoalPotion"
					},
					{
						Amount = 1,
						Name = "MutationPotion"
					},
					{
						Amount = 4,
						Name = "FlowingAmulet",
						Theme = "Random"
					}
				}
			}
		},
		HarvestNode = {
			{
				Type = "HarvestNode",
				Title = "Forager",
				NextTitle = "Gatherer",
				Amount = 10,
				Description = "Harvest %s harvestables!",
				Rewards = {
					{
						Amount = 10,
						Name = "Apple"
					}
				}
			},
			{
				Type = "HarvestNode",
				Title = "Gatherer",
				NextTitle = "Reaper",
				Requires = 1,
				Amount = 100,
				Description = "Harvest %s harvestables!",
				Rewards = {
					{
						Amount = 10,
						Name = "SugarCubes"
					},
					{
						Amount = 5,
						Name = "Strawberry"
					},
					{
						Amount = 1,
						Name = "BountyAmulet",
						Theme = "Random"
					}
				}
			},
			{
				Type = "HarvestNode",
				Title = "Reaper",
				NextTitle = "Extractor",
				Requires = 2,
				Amount = 1000,
				Description = "Harvest %s harvestables!",
				Rewards = {
					{
						Amount = 10,
						Name = "WhitePeach"
					},
					{
						Amount = 10,
						Name = "Meadowsweet"
					},
					{
						Amount = 2,
						Name = "BountyAmulet",
						Theme = "Random"
					}
				}
			},
			{
				Type = "HarvestNode",
				Title = "Reaper",
				NextTitle = "Extractor",
				Requires = 3,
				Amount = 5000,
				Description = "Harvest %s harvestables!",
				Rewards = {
					{
						Amount = 15,
						Name = "WhitePeach"
					},
					{
						Amount = 15,
						Name = "Pineberry"
					},
					{
						Amount = 3,
						Name = "BountyAmulet",
						Theme = "Random"
					}
				}
			},
			{
				Type = "HarvestNode",
				Title = "Extractor",
				Requires = 4,
				Amount = 10000,
				Description = "Harvest %s harvestables!",
				GiveTitle = "Extractor",
				Rewards = {
					{
						Amount = 20,
						Name = "WhitePeach"
					},
					{
						Amount = 20,
						Name = "PinkPrincessApple"
					},
					{
						Amount = 4,
						Name = "BountyAmulet",
						Theme = "Random"
					}
				}
			}
		},
		CompleteRace = {
			{
				Type = "CompleteRace",
				Title = "Rookie",
				NextTitle = "Sprinter",
				Amount = 5,
				Description = "Win %s races!",
				Rewards = {
					{
						Amount = 1,
						Name = "RandomEquipment",
						Theme = "Thunder"
					},
					{
						Amount = 2,
						Name = "RaceHood",
						Theme = "Opal"
					},
					{
						Amount = 2,
						Name = "PartialFlyHood",
						Theme = "Opal"
					},
					{
						Amount = 1,
						Name = "DragonPendant",
						Theme = "Thunder"
					}
				}
			},
			{
				Type = "CompleteRace",
				Title = "Sprinter",
				NextTitle = "Jockey",
				Requires = 1,
				Amount = 20,
				Description = "Win %s races!",
				Rewards = {
					{
						Amount = 2,
						Name = "RandomEquipment",
						Theme = "Thunder"
					},
					{
						Amount = 2,
						Name = "DragonPendant",
						Theme = "Random"
					},
					{
						Amount = 2,
						Name = "RaceFlag",
						Theme = "Opal"
					},
					{
						Amount = 2,
						Name = "RibbonEarClip",
						Theme = "Opal"
					}
				}
			},
			{
				Type = "CompleteRace",
				Title = "Jockey",
				NextTitle = "Trailblazer",
				Requires = 2,
				Amount = 50,
				Description = "Win %s races!",
				Rewards = {
					{
						Amount = 3,
						Name = "DragonPendant",
						Theme = "Random"
					},
					{
						Amount = 2,
						Name = "Tire",
						Theme = "Opal"
					},
					{
						Amount = 2,
						Name = "RuffleRibbonEarClip",
						Theme = "Opal"
					},
					{
						Amount = 2,
						Name = "Visor",
						Theme = "Opal"
					}
				}
			},
			{
				Type = "CompleteRace",
				Title = "Trailblazer",
				Requires = 3,
				Amount = 100,
				Description = "Win %s races!",
				GiveTitle = "Trail Blazer",
				Rewards = {
					{
						Amount = 5,
						Name = "DragonPendant",
						Theme = "Random"
					},
					{
						Amount = 2,
						Name = "RaceSocks",
						Theme = "Opal"
					},
					{
						Amount = 2,
						Name = "RacingSaddle",
						Theme = "Opal"
					},
					{
						Amount = 2,
						Name = "StreetLights",
						Theme = "Opal"
					}
				}
			}
		}
	},
	DefeatBoss = {
		{
			Type = "DefeatBoss",
			Title = "Challenger",
			NextTitle = "Protector",
			Amount = 5,
			Description = "Defeat %s bosses!",
			Rewards = {
				{
					Amount = 1,
					Name = "WingUpgradePotion"
				},
				{
					Amount = 2,
					Name = "CarrotOnAStick"
				},
				{
					Amount = 2,
					Name = "BrightHalo",
					Theme = "Opal"
				},
				{
					Amount = 1,
					Name = "SpiritHeartPendant",
					Theme = "Opal"
				}
			}
		},
		{
			Type = "DefeatBoss",
			Title = "Protector",
			NextTitle = "Hero",
			Requires = 1,
			Amount = 25,
			Description = "Defeat %s bosses!",
			Rewards = {
				{
					Amount = 2,
					Name = "WingUpgradePotion"
				},
				{
					Amount = 2,
					Name = "BerryOnAStick"
				},
				{
					Amount = 2,
					Name = "GlintHalo",
					Theme = "Opal"
				},
				{
					Amount = 1,
					Name = "SpiritHeartPendant",
					Theme = "Random"
				}
			}
		},
		{
			Type = "DefeatBoss",
			Title = "Hero",
			Requires = 1,
			Amount = 50,
			Description = "Defeat %s bosses!",
			GiveTitle = "Warden",
			Rewards = {
				{
					Amount = 5,
					Name = "InstantFoalPotion"
				},
				{
					Amount = 2,
					Name = "GoldAppleOnAStick"
				},
				{
					Amount = 2,
					Name = "LuminousHalo",
					Theme = "Opal"
				},
				{
					Amount = 2,
					Name = "SpiritHeartPendant",
					Theme = "Random"
				}
			}
		}
	},
	MoneySpent = {
		[1] = {
			Type = "MoneySpent",
			Title = "Saver",
			NextTitle = "Spender",
			Amount = 1000,
			Description = "Spend %s coins!",
			Rewards = {
				{
					Amount = 1,
					Name = "RandomEquipment",
					Theme = "Opal"
				},
				{
					Amount = 1,
					Name = "GoldenNeedle"
				},
				{
					Amount = 1,
					Name = "CelestialHalo",
					Theme = "Opal"
				}
			}
		},
		[2] = {
			Type = "MoneySpent",
			Title = "Spender",
			NextTitle = "Investor",
			Requires = 1,
			Amount = 10000,
			Description = "Spend %s coins!",
			Rewards = {
				{
					Amount = 2,
					Name = "RandomEquipment",
					Theme = "Opal"
				},
				{
					Amount = 2,
					Name = "BerryOnAStick"
				},
				{
					Amount = 2,
					Name = "GoldenNeedle"
				},
				{
					Amount = 1,
					Name = "CelestialHalo",
					Theme = "Random"
				}
			}
		},
		[3] = {
			Type = "MoneySpent",
			Title = "Investor",
			NextTitle = "Legend",
			Requires = 2,
			Amount = 100000,
			Description = "Spend %s coins!",
			Rewards = {
				{
					Amount = 3,
					Name = "RandomEquipment",
					Theme = "Opal"
				},
				{
					Amount = 2,
					Name = "GoldAppleOnAStick"
				},
				{
					Amount = 3,
					Name = "CelestialHalo",
					Theme = "Random"
				},
				{
					Amount = 2,
					Name = "GalacticNeedle"
				}
			}
		},
		[4] = {
			Type = "MoneySpent",
			Title = "Legend",
			Requires = 3,
			Amount = 1000000,
			Description = "Spend %s coins!",
			GiveTitle = "Legend",
			Rewards = {
				{
					Amount = 5,
					Name = "RandomEquipment",
					Theme = "Opal"
				},
				{
					Amount = 3,
					Name = "RandomWingPotion"
				},
				{
					Amount = 4,
					Name = "CelestialHalo",
					Theme = "Random"
				},
				{
					Amount = 5,
					Name = "GoldAppleOnAStick"
				}
			}
		},
		ReplayMission = {
			{
				Type = "ReplayMission",
				Title = "Replayer",
				NextTitle = "",
				Amount = 1,
				Description = "Replay each mission %s times!",
				Rewards = {}
			}
		}
	}
}