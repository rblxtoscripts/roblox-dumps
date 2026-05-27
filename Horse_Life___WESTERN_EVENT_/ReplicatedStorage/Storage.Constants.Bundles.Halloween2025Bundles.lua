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
task.delay(2, function() --[[ Line: 57 | Upvalues: t (copy) ]]
	if not game:GetService("RunService"):IsStudio() then
		return
	end
	for v1, v2 in t do
		if not require(game.ReplicatedStorage:WaitForChild("Sonar"))("ItemDataService").GetByName(v2) then
			for i = 1, 20 do
				warn("NO ITEM INFO FOUND FOR" .. v2 .. "DO NOT PUBLISH" .. i)
			end
		end
	end
end)
return {
	HauntedBundle = {
		DisplayOrder = 1,
		ProductId = 3263122214,
		Cost = 249,
		BundleArt = "rbxassetid://90686560908983",
		Fertility = true,
		Items = {
			AlienWingPotion = {
				Amount = 2
			},
			AlienLasso = {
				Amount = 5
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "WitchPotion", "Ghoul", "Pumpkin" }
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
					"FloatingCandycorn",
					"FloatingPumpkins",
					"FloatingTombstones",
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
		BackgroundColor = Color3.fromRGB(35, 20, 80),
		BarColor = Color3.fromRGB(220, 100, 255),
		CornerColors = Color3.fromRGB(140, 70, 200),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Hauntmare" },
			Preset = {
				"GhoulStone",
				"GhoulSwamp",
				"GhoulSpectral",
				"GhoulHell",
				"GhoulPumpkin",
				"GhoulVampire",
				"GhoulBat",
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
	HauntedItemBundle = {
		DisplayOrder = 2,
		ProductId = 3263122370,
		Cost = 249,
		BundleArt = "rbxassetid://90686560908983",
		Fertility = true,
		Items = {
			RandomAccessoryDrop1 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 1,
				Theme = { "WitchPotion", "Ghoul", "Pumpkin" },
				PullTable = t
			},
			RandomAccessoryDrop2 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 2,
				Theme = { "Void", "Heavenly" },
				PullTable = t
			},
			RandomAccessoryDrop3 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 3,
				Theme = { "Blueberry", "Lemon", "Berry" },
				PullTable = t
			},
			RandomAccessoryDrop4 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 4,
				Theme = { "Thunder", "Cookie", "Clover", "Opal", "Gold", "Fossilized" },
				PullTable = t
			},
			RandomAccessoryDrop5 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 5,
				Theme = { "Galaxy", "Nature", "Obsidian" },
				PullTable = t
			},
			RandomAccessoryDrop6 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 6,
				PullTable = t
			}
		},
		BackgroundColor = Color3.fromRGB(15, 40, 70),
		BarColor = Color3.fromRGB(80, 230, 255),
		CornerColors = Color3.fromRGB(60, 160, 220)
	}
}