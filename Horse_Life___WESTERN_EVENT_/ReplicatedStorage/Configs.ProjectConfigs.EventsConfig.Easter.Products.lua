-- https://lua.expert/
return {
	{
		Name = "EasterCollector",
		Description = "Earn 25% MORE Gold Eggs!",
		ProductId = 1940807137,
		ProductType = "CurrencyBoost",
		MaximumPurchases = 2,
		Stats = {
			GoldEggsMultiplier = 0.25
		},
		TargetStats = { "GoldEggsMultiplier" }
	},
	{
		Name = "EasterCatcher",
		Description = "Earn 50% MORE Gold Eggs!",
		MaximumPurchases = 2,
		ProductId = 1940807079,
		ProductType = "CurrencyBoost",
		Stats = {
			GoldEggsMultiplier = 0.5
		},
		TargetStats = { "GoldEggsMultiplier" }
	},
	{
		Name = "SkipEventMissionTier1",
		ProductId = 3351562972,
		ProductType = "SkipEventMission",
		MissionTier = 1
	},
	{
		Name = "SkipEventMissionTier2",
		ProductId = 3568622519,
		ProductType = "SkipEventMission",
		MissionTier = 2
	},
	{
		Name = "ReplayEventMission",
		ProductId = 3529480728,
		ProductType = "ReplayEventMission"
	},
	{
		Name = "EventCurrencyTier1",
		ProductId = 1940799862,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldEggs",
				Amount = 638
			}
		}
	},
	{
		Name = "EventCurrencyTier2",
		ProductId = 1940800010,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldEggs",
				Amount = 1530
			}
		}
	},
	{
		Name = "EventCurrencyTier3",
		ProductId = 1940800732,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldEggs",
				Amount = 4463
			}
		}
	},
	{
		Name = "EventCurrencyTier4",
		ProductId = 1940800882,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldEggs",
				Amount = 10625
			}
		}
	},
	{
		Name = "EventCurrencyTier5",
		ProductId = 1940801351,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldEggs",
				Amount = 29200
			}
		}
	},
	{
		Name = "EventCurrencyTier6",
		ProductId = 1940801639,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldEggs",
				Amount = 64175
			}
		}
	},
	{
		Name = "PastelCapsule",
		ProductId = 3568761780,
		ProductType = "EventCapsule",
		StartTime = DateTime.fromIsoDate("2026-04-03"),
		Rewards = {
			{
				Name = "PastelCapsule",
				Amount = 1
			}
		}
	},
	{
		Name = "HoneyWingPotion",
		ProductId = 3568761514,
		ProductType = "Items",
		StartTime = DateTime.fromIsoDate("2026-04-10"),
		Rewards = {
			{
				Name = "HoneyWingPotion",
				Amount = 1
			}
		}
	},
	{
		Name = "SakuraMutationPotion",
		ProductId = 2152883452,
		ProductType = "Items",
		StartTime = DateTime.fromIsoDate("2026-04-17"),
		EndTime = DateTime.fromIsoDate("2026-04-24"),
		Rewards = {
			{
				Name = "SakuraMutationPotion",
				Amount = 1
			}
		}
	},
	{
		Name = "EasterWingPotion",
		ProductId = 3540754470,
		ProductType = "Items",
		StartTime = DateTime.fromIsoDate("2026-04-17"),
		Rewards = {
			{
				Name = "EasterWingPotion",
				Amount = 1
			}
		}
	},
	{
		Name = "FeaturedBloomBundle",
		ProductId = 3568760986,
		ProductType = "EventBundle",
		StartTime = DateTime.fromIsoDate("2026-04-03"),
		EndTime = DateTime.fromIsoDate("2026-04-17"),
		Rewards = {
			{
				Name = "EasterWingPotion",
				Amount = 1
			},
			{
				Name = "HoneyWingPotion",
				Amount = 1
			},
			{
				Name = "BunnyLasso",
				Amount = 5
			},
			{
				Name = "Random",
				Rewards = {
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "DefaultAccessories" }
					},
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "DefaultAccessories" }
					}
				}
			},
			{
				Name = "Random",
				Rewards = {
					{
						UniqueWithinPurchase = true,
						Name = "Random",
						Amount = 2,
						IncludesDropSets = { "DefaultFlairs" }
					}
				}
			},
			{
				Name = "Random",
				Rewards = {
					{
						UniqueWithinPurchase = true,
						Name = "Random",
						Amount = 2,
						IncludesDropSets = { "DefaultPalettes" }
					}
				}
			}
		}
	},
	{
		Name = "SweetBundle",
		ProductId = 3568761249,
		ProductType = "EventBundle",
		StartTime = DateTime.fromIsoDate("2026-04-17"),
		EndTime = DateTime.fromIsoDate("2026-04-24"),
		Rewards = {
			{
				Name = "PastelCapsule",
				Amount = 1
			},
			{
				Name = "BunnyLasso",
				Amount = 20
			},
			{
				Name = "SpringTulips",
				Amount = 1
			},
			{
				Name = "Random",
				GrantAllItemsFromChosenDropSets = true,
				Amount = 2,
				UniqueWithinPurchase = true,
				ThemeChance = 1,
				Rewards = { "EasterTackSet", "HoneytrotTackSet", "WolperTackSet", "KirinDyedEggSet", "FloraFlowerySet", "HorseEasterSet", "WolperEggslingerSet" }
			}
		}
	},
	{
		Name = "SpringtimeBundle",
		ProductId = 3572471037,
		ProductType = "EventBundle",
		StartTime = DateTime.fromIsoDate("2026-04-10"),
		EndTime = DateTime.fromIsoDate("2026-04-17"),
		Rewards = {
			{
				Name = "PastelCapsule",
				Amount = 1
			},
			{
				Name = "Random",
				Rewards = {
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "DefaultAccessories" }
					},
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "DefaultAccessories" }
					},
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "HalloweenAccessories" }
					},
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "HalloweenAccessories" }
					},
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "HalloweenAccessories" }
					}
				}
			}
		}
	},
	{
		Name = "EasterBundle",
		ProductId = 3568762574,
		ProductType = "EventBundle",
		StartTime = DateTime.fromIsoDate("2026-04-17"),
		EndTime = DateTime.fromIsoDate("2026-04-24"),
		Rewards = {
			{
				Name = "SakuraMutationPotion",
				Amount = 1
			},
			{
				Name = "PastelCapsule",
				Amount = 1
			},
			{
				Name = "EasterWingPotion",
				Amount = 1
			},
			{
				Name = "BunnyLasso",
				Amount = 25
			},
			{
				Name = "DownyFeather",
				Amount = 1
			},
			{
				Name = "Random",
				Rewards = {
					{
						Name = "Random",
						Amount = 1,
						UniqueWithinPurchase = true,
						IncludesDropSets = { "DefaultPalettes" }
					}
				}
			}
		}
	},
	{
		Name = "EasterBundle",
		ProductId = 3568762980,
		ProductType = "EventBundle",
		StartTime = DateTime.fromIsoDate("2026-04-24"),
		EndTime = DateTime.fromIsoDate("2026-05-01"),
		Rewards = {
			{
				Name = "SakuraMutationPotion",
				Amount = 1
			},
			{
				Name = "PorcelainMutationPotion",
				Amount = 1
			},
			{
				Name = "VegetableCapsule",
				Amount = 1
			},
			{
				Name = "EasterWingPotion",
				Amount = 1
			},
			{
				Name = "DownyFeather",
				Amount = 1
			},
			{
				Name = "SpringTulips",
				Amount = 1
			}
		}
	}
}