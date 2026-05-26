-- https://lua.expert/
local EventCurrencyName = require(game.ReplicatedStorage.Sonar)("Constants").EventCurrencyName
local t = {
	"MedievalLance",
	"ScaryPumpkin",
	"SillyPumpkin",
	"OwlPlush",
	"MushroomWitch",
	"WitchHat",
	"HarvestWitch",
	"BatPlush",
	"PumpkinPlush",
	"SunflowerCrown",
	"FloatingCandleCrown",
	"PoisonApple",
	"CaramelApple",
	"VampiricCrown",
	"VampireScythe",
	"MageStaff",
	"WitchBroom",
	"DeathScythe",
	"Scarecrow",
	"SpiderPlush",
	"LunarWitch",
	"BowBatEarClip",
	"CrossboneEarClip",
	"CrowFamiliar",
	"CrowPlush",
	"VampiricAmulet",
	"MagicPotion",
	"WretchedTree",
	"MapleLeaf",
	"PossessedWitch",
	"EyeBat",
	"CoffinEarClip",
	"BatWingHeadband",
	"CrowsCrown",
	"WitchesCauldron",
	"CatFamiliar",
	"CandleFamiliar",
	"CandledPumpkin",
	"GhostFamiliar",
	"HonsePumpkinpail",
	"OceanWitchHat",
	"HindPumpkin",
	"BoneWitchHat",
	"WerewolfWitchHat",
	"CandyWitchHat"
}
local t2 = {
	Boosts = {
		BoostShort = {
			ProductId = 1940807137,
			Description = "Earn 25% more on all Soul sources!",
			NameText = "Soul Seeker",
			StrokeColor = Color3.fromRGB(120, 50, 255),
			DescriptionTextColor = Color3.fromRGB(200, 120, 255),
			TitleUIGradient = script.BoostShortTitleGradient,
			BackgroundUIGradient = script.BoostShortBackgroundGradient
		},
		BoostLong = {
			ProductId = 1940807079,
			Description = "Earn 50% more on all Soul sources!",
			NameText = "Soul Catcher",
			StrokeColor = Color3.fromRGB(50, 255, 230),
			DescriptionTextColor = Color3.fromRGB(140, 200, 255),
			TitleUIGradient = script.BoostLongTitleGradient,
			BackgroundUIGradient = script.BoostLongBackgroundGradient
		}
	},
	[EventCurrencyName] = {
		{
			ProductId = 1940799862,
			Amount = 625
		},
		{
			ProductId = 1940800010,
			Amount = 1500
		},
		{
			ProductId = 1940800732,
			Amount = 4375
		},
		{
			ProductId = 1940800882,
			Amount = 9750
		},
		{
			ProductId = 1940801351,
			Amount = 20625
		},
		{
			ProductId = 1940801639,
			Amount = 70000
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
			DisplayName = "Featured Horror",
			LootTable = {
				RandomAccessoryDrop1 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 1,
					Theme = { "WitchPotion", "Ghoul", "Pumpkin" },
					PullTable = t
				},
				RandomAccessoryDrop2 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 2,
					Theme = { "WitchPotion", "Ghoul", "Pumpkin" },
					PullTable = t
				},
				RandomAccessoryDrop3 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 3,
					Theme = { "WitchPotion", "Ghoul", "Pumpkin" },
					PullTable = t
				},
				SpookyWingPotion = {
					Amount = 2,
					Theme = "Random",
					SeedOffset = 5,
					ThemeChance = 0.75
				},
				HauntedMutationPotion = {
					Amount = 1,
					SeedOffset = 6
				},
				HauntmareCapsule = {
					Amount = 1,
					SeedOffset = 6
				},
				UndeadLasso = {
					Amount = 20,
					SeedOffset = 6
				},
				RandomFlair = {
					Amount = 1,
					PullAmount = 1,
					SeedOffset = 5,
					PullTable = {
						"Ghost",
						"MageBats",
						"VampireBats",
						"Bats",
						"PinkSunflower",
						"BlueSunflower",
						"Sunflower",
						"Haunted",
						"Possessed",
						"Bewitched"
					}
				},
				RandomPalette = {
					Amount = 1,
					PullAmount = 1,
					SeedOffset = 4,
					PullTable = { "Harvest", "Spooky", "Vampire", "Potion" }
				}
			}
		},
		{
			ProductId = 3424756883,
			ProductType = "EventTack",
			Species = "Horse",
			DisplayName = "Spooky Tack",
			LootTable = {
				ArmorSet = {
					Amount = 2,
					PullAmount = 3,
					SeedOffset = 1,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = {
						{ "HauntmareBasicSaddle", "HauntmareBasicBridle", "HauntmareBasicSocks" },
						{ "GhoulsteedBasicSaddle", "GhoulsteedBasicBridle", "GhoulsteedBasicSocks" },
						{ "GhoulsteedPumpkinSaddle", "GhoulsteedPumpkinBridle", "GhoulsteedPumpkinSocks" }
					}
				},
				ArmorSet2 = {
					Amount = 2,
					PullAmount = 3,
					SeedOffset = 2,
					Theme = "Random",
					NoRepeatItems = true,
					ThemeChance = 0.75,
					ChoosePullTable = {
						{ "PerytonRavenSaddle", "PerytonRavenBridle", "PerytonRavenSocks" },
						{ "FloraSpiderLilySaddle", "FloraSpiderLilyBridle", "FloraSpiderLilySocks" },
						{ "CactalineNecromancerSaddle", "CactalineNecromancerBridle", "CactalineNecromancerSocks" },
						{ "UnicornChainedBridle", "UnicornChainedSaddle", "UnicornChainedSocks" },
						{ "AkhalTekeBoneSaddle", "AkhalTekeBoneBridle", "AkhalTekeBoneSocks" }
					}
				}
			}
		},
		{
			ProductId = 3427148948,
			ProductType = "EventTack",
			Species = "Horse",
			DisplayName = "Haunted Accessories",
			LootTable = {
				RandomAccessoryDrop1 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 1,
					Theme = { "WitchPotion", "Ghoul", "Pumpkin" },
					PullTable = t
				},
				RandomAccessoryDrop2 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 2,
					Theme = { "Void", "Heavenly" },
					PullTable = t
				},
				RandomAccessoryDrop3 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 3,
					Theme = { "Blueberry", "Lemon", "Berry" },
					PullTable = t
				},
				RandomAccessoryDrop4 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 4,
					Theme = { "Thunder", "Cookie", "Clover", "Opal", "Gold", "Fossilized" },
					PullTable = t
				},
				RandomAccessoryDrop5 = {
					Amount = 2,
					PullAmount = 1,
					AlwaysTheme = true,
					SeedOffset = 5,
					Theme = { "Galaxy", "Nature", "Obsidian" },
					PullTable = t
				},
				RandomAccessoryDrop6 = {
					Amount = 2,
					PullAmount = 1,
					Theme = "Random",
					SeedOffset = 6,
					PullTable = t
				}
			}
		}
	}
}
for k, v in pairs(t2[EventCurrencyName]) do
	v.Currency = EventCurrencyName
	v.ProductType = "Currency"
end
for k, v in pairs(t2.Boosts) do
	v.Name = k
	v.ProductType = "EventBoost"
end
return t2