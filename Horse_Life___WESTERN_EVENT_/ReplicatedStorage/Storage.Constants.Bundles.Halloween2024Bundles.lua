-- https://lua.expert/
local t = {
	"GhoulsteedBasicSaddle",
	"GhoulsteedBasicSocks",
	"GhoulsteedBasicBridle",
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
	"CatFamiliar"
}
return {
	HalloweenBundle = {
		DisplayOrder = 1,
		ProductId = 1940806847,
		Cost = 249,
		BundleArt = "rbxassetid://91995449515522",
		Fertility = true,
		Items = {
			SpookyWingPotion = {
				Amount = 2
			},
			UndeadLasso = {
				Amount = 20
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "Pumpkin", "Ghoul" }
			},
			RandomAccessoryDrop1 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = t
			},
			RandomAccessoryDrop2 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 2,
				PullTable = t
			},
			RandomAccessoryDrop3 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 3,
				PullTable = t
			},
			RandomPalette = {
				Amount = 1,
				SeedOffset = 4,
				PullTable = { "Harvest", "Spooky", "Vampire", "Potion" }
			},
			RandomFlair = {
				Amount = 1,
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
			}
		},
		BackgroundColor = Color3.fromRGB(255, 106, 0),
		BarColor = Color3.fromRGB(255, 198, 55),
		CornerColors = Color3.fromRGB(255, 198, 55),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Ghoulsteed" },
			Preset = {
				"GhoulBat",
				"GhoulVampire",
				"GhoulPumpkin",
				"GhoulHell",
				"GhoulStone",
				"GhoulSpectral",
				"GhoulSwamp",
				"GhoulWere",
				"GhoulUndead",
				"Rotted"
			},
			MutationChances = {
				Nothing = 0,
				Wings = 100,
				Glow = 0
			},
			MutationSlotChances = {
				{
					Amount = 0,
					P = 0
				},
				{
					Amount = 1,
					P = 0
				},
				{
					Amount = 2,
					P = 0
				},
				{
					Amount = 3,
					P = 1
				}
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	ItemBundle = {
		DisplayOrder = 2,
		ProductId = 1940806899,
		Cost = 249,
		BundleArt = "rbxassetid://91995449515522",
		Fertility = true,
		Items = {
			RandomAccessoryDrop1 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = t
			},
			RandomAccessoryDrop2 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 2,
				PullTable = t
			},
			RandomAccessoryDrop3 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 3,
				PullTable = t
			},
			RandomAccessoryDrop4 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 4,
				PullTable = t
			},
			RandomAccessoryDrop5 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 5,
				PullTable = t
			},
			RandomAccessoryDrop6 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 6,
				PullTable = t
			}
		},
		BackgroundColor = Color3.fromRGB(255, 106, 0),
		BarColor = Color3.fromRGB(255, 198, 55),
		CornerColors = Color3.fromRGB(255, 198, 55)
	}
}