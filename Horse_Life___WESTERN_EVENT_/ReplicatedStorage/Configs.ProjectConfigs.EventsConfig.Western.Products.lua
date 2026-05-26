-- https://lua.expert/
return {
	{
		Name = "WesternCollector",
		Description = "Earn 25% MORE Gold Coins!",
		ProductId = 3596376735,
		ProductType = "CurrencyBoost",
		MaximumPurchases = 2,
		Stats = {
			GoldCoinsMultiplier = 0.25
		},
		TargetStats = { "GoldCoinsMultiplier" }
	},
	{
		Name = "WesternCatcher",
		Description = "Earn 50% MORE Gold Coins!",
		MaximumPurchases = 2,
		ProductId = 1940807079,
		ProductType = "CurrencyBoost",
		Stats = {
			GoldCoinsMultiplier = 0.5
		},
		TargetStats = { "GoldCoinsMultiplier" }
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
		ProductId = 3596371512,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldCoins",
				Amount = 550
			}
		}
	},
	{
		Name = "EventCurrencyTier2",
		ProductId = 3596371710,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldCoins",
				Amount = 1300
			}
		}
	},
	{
		Name = "EventCurrencyTier3",
		ProductId = 3596372148,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldCoins",
				Amount = 3800
			}
		}
	},
	{
		Name = "EventCurrencyTier4",
		ProductId = 3596372291,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldCoins",
				Amount = 9000
			}
		}
	},
	{
		Name = "EventCurrencyTier5",
		ProductId = 3596372395,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldCoins",
				Amount = 25000
			}
		}
	},
	{
		Name = "EventCurrencyTier6",
		ProductId = 3596372566,
		ProductType = "EventCurrency",
		Rewards = {
			{
				Name = "GoldCoins",
				Amount = 55000
			}
		}
	},
	{
		Name = "YeehawCapsule",
		ProductId = 3596844674,
		ProductType = "EventCapsule",
		StartTime = DateTime.fromIsoDate("2026-05-22"),
		Rewards = {
			{
				Name = "YeehawCapsule",
				Amount = 1
			}
		}
	},
	{
		Name = "WesternWingPotion",
		ProductId = 3487514455,
		ProductType = "Items",
		StartTime = DateTime.fromIsoDate("2026-05-22"),
		Rewards = {
			{
				Name = "WesternWingPotion",
				Amount = 1
			}
		}
	},
	{
		Name = "HowdyPack",
		ProductId = 3596819307,
		ProductType = "EventBundle",
		StartTime = DateTime.fromIsoDate("2026-05-22"),
		Rewards = {
			{
				Name = "YeehawCapsule",
				Amount = 1
			},
			{
				Name = "WesternWingPotion",
				Amount = 1
			},
			{
				Name = "Cowboy",
				Amount = 1
			},
			{
				Name = "Random",
				Amount = 2,
				ThemeChance = 1,
				Rewards = {
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						IncludesDropSets = { "OversizedCowboyHat" }
					},
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						IncludesDropSets = { "WesternBootEarring" }
					},
					{
						Name = "Random",
						Amount = 2,
						ThemeChance = 1,
						IncludesDropSets = { "AceOfSpades" }
					}
				}
			}
		}
	},
	{
		Name = "WesternBuildables",
		ProductId = 3596838534,
		ProductType = "EventBundle",
		StartTime = DateTime.fromIsoDate("2026-05-22"),
		Rewards = {
			{
				Name = "RanchBed",
				Amount = 1
			},
			{
				Name = "WesternChandelier",
				Amount = 1
			},
			{
				Name = "WesternBarrelTable",
				Amount = 1
			},
			{
				Name = "WesternSaddleStand",
				Amount = 1
			},
			{
				Name = "WesternSkull",
				Amount = 1
			},
			{
				Name = "WesternCowSpotCarpet",
				Amount = 1
			}
		}
	}
}