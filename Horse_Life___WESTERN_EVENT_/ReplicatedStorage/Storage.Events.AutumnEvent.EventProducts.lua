-- https://lua.expert/
local EventCurrencyName = require(game.ReplicatedStorage.Sonar)("Constants").EventCurrencyName
local t = { "PonyFallBridle", "PonyFallSaddle", "PonyFallSocks" }
local t2 = { "AkhalTekeSleekSaddle", "AkhalTekeSleekSocks" }
local t3 = { "AnticornFallSaddle", "AnticornFallSock" }
local t4 = { "ClydesdaleFallSaddle", "ClydesdaleFallSocks" }
local t5 = { "CelestialFallSaddle", "CelestialFallSocks" }
local t6 = {
	"GiantAcorn",
	"TurkeyHat",
	"AutumnScythe",
	"MapleMask",
	"MapleBinder",
	"MapleEarring",
	"FallParasol",
	"GreatAcornShield",
	"MapleLeafCrown",
	"LargeCinnamonRoll",
	"CozyEveningStack"
}
local t7 = {
	Boosts = {
		BoostShort = {
			ProductId = 1940807137,
			Description = "Earn 25% more on all Leaf sources!",
			NameText = "Maple Collector",
			StrokeColor = Color3.fromRGB(120, 50, 255),
			DescriptionTextColor = Color3.fromRGB(200, 120, 255),
			TitleUIGradient = script.BoostShortTitleGradient,
			BackgroundUIGradient = script.BoostShortBackgroundGradient
		},
		BoostLong = {
			ProductId = 1940807079,
			Description = "Earn 50% more on all Leaf sources!",
			NameText = "Leaf Catcher",
			StrokeColor = Color3.fromRGB(50, 255, 230),
			DescriptionTextColor = Color3.fromRGB(140, 200, 255),
			TitleUIGradient = script.BoostLongTitleGradient,
			BackgroundUIGradient = script.BoostLongBackgroundGradient
		}
	},
	[EventCurrencyName] = {
		{
			ProductId = 1940799862,
			Amount = 150
		},
		{
			ProductId = 1940800010,
			Amount = 400
		},
		{
			ProductId = 1940800732,
			Amount = 1100
		},
		{
			ProductId = 1940800882,
			Amount = 2450
		},
		{
			ProductId = 1940801351,
			Amount = 5150
		},
		{
			ProductId = 1940801639,
			Amount = 17500
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
	TackProducts = {
		{
			ProductId = 3427167927,
			ProductType = "EventTack",
			Species = "Horse",
			DisplayName = "Featured Harvest",
			LootTable = {
				RandomAccessoryDrop1 = {
					Amount = 2,
					PullAmount = 1,
					Theme = "Random",
					AlwaysTheme = true,
					SeedOffset = 1,
					PullTable = t6
				},
				RandomAccessoryDrop2 = {
					Amount = 2,
					PullAmount = 1,
					Theme = "Random",
					AlwaysTheme = true,
					SeedOffset = 2,
					PullTable = t6
				},
				ArmorSet = {
					Amount = 1,
					PullAmount = 3,
					SeedOffset = 1,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = { t }
				},
				ArmorSet2 = {
					Amount = 1,
					PullAmount = 2,
					SeedOffset = 2,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = { t2, t3, t4, t5 }
				},
				AutumnWingPotion = {
					Amount = 2,
					Theme = "Random",
					SeedOffset = 5,
					ThemeChance = 0.75
				},
				AnticornCapsule = {
					Amount = 1,
					SeedOffset = 5,
					ThemeChance = 0.75
				}
			}
		},
		{
			ProductId = 3424756883,
			ProductType = "EventTack",
			Species = "Horse",
			DisplayName = "Bountiful Tack",
			LootTable = {
				ArmorSet = {
					Amount = 2,
					PullAmount = 3,
					SeedOffset = 1,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = { t }
				},
				ArmorSet2 = {
					Amount = 2,
					PullAmount = 2,
					SeedOffset = 2,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = { t2, t3, t4, t5 }
				},
				ArmorSet3 = {
					Amount = 2,
					PullAmount = 1,
					SeedOffset = 3,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = {
						{ "FloraCozySaddle" }
					}
				}
			}
		},
		{
			ProductId = 3427148948,
			ProductType = "EventTack",
			Species = "Horse",
			DisplayName = "Festive Accessories",
			LootTable = {
				RandomAccessoryDrop1 = {
					Amount = 2,
					PullAmount = 1,
					Theme = "Random",
					AlwaysTheme = true,
					NoRepeatItems = true,
					SeedOffset = 1,
					PullTable = t6
				},
				RandomAccessoryDrop2 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					NoRepeatItems = true,
					SeedOffset = 2,
					Theme = { "Void", "Heavenly" },
					PullTable = t6
				},
				RandomAccessoryDrop3 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					NoRepeatItems = true,
					SeedOffset = 3,
					Theme = { "Blueberry", "Lemon", "Berry" },
					PullTable = t6
				},
				RandomAccessoryDrop4 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					NoRepeatItems = true,
					SeedOffset = 4,
					Theme = { "Thunder", "Cookie", "Clover", "Opal", "Gold", "Fossilized" },
					PullTable = t6
				},
				RandomAccessoryDrop5 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					NoRepeatItems = true,
					SeedOffset = 5,
					Theme = { "Galaxy", "Nature", "Obsidian" },
					PullTable = t6
				},
				RandomAccessoryDrop6 = {
					Amount = 2,
					PullAmount = 1,
					Theme = "Random",
					NoRepeatItems = true,
					SeedOffset = 6,
					PullTable = t6
				}
			}
		}
	}
}
for k, v in pairs(t7[EventCurrencyName]) do
	v.Currency = EventCurrencyName
	v.ProductType = "Currency"
end
for k, v in pairs(t7.Boosts) do
	v.Name = k
	v.ProductType = "EventBoost"
end
return t7