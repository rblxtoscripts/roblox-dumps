-- https://lua.expert/
local EventCurrencyName = require(game.ReplicatedStorage.Sonar)("Constants").EventCurrencyName
local t = { "SaurequineFestiveBridle", "SaurequineFestiveSocks", "SaurequineFestiveSaddle" }
local t2 = { "UnicornFestiveBridle", "UnicornFestiveSaddle", "UnicornFestiveSocks" }
local t3 = { "HollyhoofBasicSaddle", "HollyhoofBasicSocks", "HollyhoofBasicBridle" }
local t4 = { "GargoyleCozySaddle", "GargoyleCozySocks" }
local t5 = { "AlcesFestiveSaddle", "AlcesFestiveSocks", "AlcesFestiveBridle" }
local t6 = { "AlcesBasicSaddle", "AlcesBasicSocks", "AlcesBasicBridle" }
local t7 = { "CactalineCozyBridle", "CactalineCozySocks", "CactalineCozySaddle" }
local t8 = { "FaeCozySaddle", "FaeCozySocks" }
local t9 = { "HollyhoofFestiveSaddle", "HollyhoofFestiveSocks", "HollyhoofFestiveBridle" }
local t10 = { "SaurequineCozySocks", "SaurequineCozySaddle" }
local t11 = {
	Boosts = {
		BoostShort = {
			ProductId = 1940807137,
			Description = "Earn 25% more on all Star sources!",
			NameText = "Star Collector",
			SaleStarts = 1765562400,
			SaleEnds = 1767384000,
			StrokeColor = Color3.fromRGB(120, 50, 255),
			DescriptionTextColor = Color3.fromRGB(200, 120, 255),
			TitleUIGradient = script.BoostShortTitleGradient,
			BackgroundUIGradient = script.BoostShortBackgroundGradient
		},
		BoostLong = {
			ProductId = 1940807079,
			Description = "Earn 50% more on all Star sources!",
			NameText = "Star Catcher",
			SaleStarts = 1765562400,
			SaleEnds = 1767384000,
			StrokeColor = Color3.fromRGB(50, 255, 230),
			DescriptionTextColor = Color3.fromRGB(140, 200, 255),
			TitleUIGradient = script.BoostLongTitleGradient,
			BackgroundUIGradient = script.BoostLongBackgroundGradient
		}
	},
	[EventCurrencyName] = {
		{
			ProductId = 1940799862,
			Amount = 225
		},
		{
			ProductId = 1940800010,
			Amount = 600
		},
		{
			ProductId = 1940800732,
			Amount = 1650
		},
		{
			ProductId = 1940800882,
			Amount = 3675
		},
		{
			ProductId = 1940801351,
			Amount = 10625
		},
		{
			ProductId = 1940801639,
			Amount = 48250
		}
	},
	Capsules = {
		{
			ProductId = 3424738274,
			ProductName = "Product3",
			CapsuleName = "GhoulsteedCapsule",
			DisplayName = "Ghoulsteed Capsule",
			ProductType = "EventCapsule"
		},
		{
			ProductId = 3424738384,
			ProductName = "Product3",
			CapsuleName = "HauntmareCapsule",
			DisplayName = "Hauntmare Capsule",
			ProductType = "EventCapsule"
		}
	},
	Lootboxes = {
		{
			LootboxName = "CozyTackLootbox"
		},
		{
			LootboxName = "FrozenLootbox"
		}
	},
	TackProducts = {
		{
			ProductId = 3427167927,
			ProductType = "EventTack",
			Species = "Horse",
			DisplayName = "Hollyhoof",
			LootTable = {
				RandomAccessoryDrop1 = {
					Amount = 2,
					PullAmount = 1,
					NoRepeatItems = true,
					AlwaysTheme = true,
					SeedOffset = 1,
					Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" },
					PullTable = {
						"PolarPlush",
						"CandyCane",
						"StarWand",
						"SnowLantern",
						"IceScepter",
						"PeppermintEarclip",
						"HindGiftStack",
						"MouthStocking",
						"HindPresent",
						"WinterTiara",
						"IceCrown",
						"MistletoeEarclip",
						"SnowOwl",
						"KrampusPlush",
						"FrostbittenAxe",
						"IceboundSceptre",
						"FestiveSnowman",
						"FestiveTopHat",
						"FestiveScroll",
						"ChristmasGiftBag",
						"HollyWreath",
						"StarTopper",
						"SnowflakeBow",
						"PoinsettiaBow",
						"SnowmanSnowglobe",
						"SantaHat",
						"FestiveReindeerAntlers",
						"FestiveRibbonEarpiece",
						"FestiveBell",
						"FestiveTruck",
						"ReindeerPlush",
						"MistletoeMouthpiece",
						"OwlTiara",
						"SnowflakeTiara",
						"NorthStarTiara",
						"OwlAmulet",
						"SnowflakeAmulet",
						"NorthStarAmulet",
						"ChristmasStreetLight",
						"SnowflakeGuitar",
						"FestiveTeddyBear",
						"PoinsettiaBouquet",
						"ReindeerPlushy",
						"NorthernStarHorn",
						"BabyPenguinPlush",
						"ShatteredIceSychte"
					}
				},
				ArmorSet = {
					Amount = 1,
					PullAmount = 3,
					SeedOffset = 3,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = { t5, t6, t9, t3 }
				},
				FrozenWingPotion = {
					Amount = 1,
					Theme = "Random",
					SeedOffset = 5,
					ThemeChance = 0.75
				},
				FrostMutationPotion = {
					Amount = 1,
					Theme = "Random",
					SeedOffset = 6,
					ThemeChance = 0.75
				},
				NorthStarMutationPotion = {
					Amount = 1,
					Theme = "Random",
					SeedOffset = 7,
					ThemeChance = 0.75
				},
				FestiveCapsule = {
					Amount = 1,
					Theme = "Random",
					SeedOffset = 8,
					ThemeChance = 0.75
				}
			}
		},
		{
			ProductId = 3424756883,
			ProductType = "EventTack",
			Species = "Horse",
			DisplayName = "Festive Tack",
			LootTable = {
				ArmorSet = {
					Amount = 1,
					PullAmount = 3,
					SeedOffset = 1,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = { t5, t6, t9, t3 }
				},
				ArmorSet2 = {
					Amount = 1,
					PullAmount = 2,
					SeedOffset = 2,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = { t4, t7, t8, t10, t, t2 }
				},
				ArmorSet3 = {
					Amount = 1,
					PullAmount = 2,
					SeedOffset = 3,
					NoRepeatItems = true,
					ThemeChance = 0.75,
					Theme = { "AuroraBorealisTheme", "Candycane", "Frozen" },
					ChoosePullTable = { t4, t7, t8, t10, t, t2 }
				}
			}
		}
	}
}
for k, v in pairs(t11[EventCurrencyName]) do
	v.Currency = EventCurrencyName
	v.ProductType = "Currency"
end
for k, v in pairs(t11.Boosts) do
	v.Name = k
	v.ProductType = "EventBoost"
end
return t11