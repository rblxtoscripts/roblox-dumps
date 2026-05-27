-- https://lua.expert/
local t = {
	"StarrySkirt",
	"ElegantCrystalScythe",
	"ElegantCrystalLantern",
	"PrincessTiara",
	"KingsCrown",
	"RoyalScythe",
	"QueensCrown",
	"DelicateFan",
	"RoyalViolin",
	"KingsSword",
	"KnightLongsword",
	"RoyalTeapot",
	"PrincessBackBow",
	"DelicateParasol",
	"CrystalScepter",
	"FancyFrillsHat",
	"CrystalEarclip",
	"SillyMustache",
	"CuteRibbonsParasol",
	"RoyalBackBow",
	"PrincessHat",
	"QueensScepter",
	"RoyalInsignia",
	"SharpCrystalScythe",
	"CrystallionBasicBridle",
	"CrystallionBasicSaddle",
	"CrystallionBasicSocks"
}
task.delay(2, function() --[[ Line: 32 | Upvalues: t (copy) ]]
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
	RoyalBundle = {
		DisplayOrder = 1,
		ProductId = 3263122214,
		Cost = 249,
		BundleArt = "rbxassetid://76259159029062",
		Fertility = true,
		Items = {
			RoyalWingPotion = {
				Amount = 2
			},
			CrystalLasso = {
				Amount = 5
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "PurpleGeode", "RoyalPattern" }
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
				PullTable = { "AfternoonTea", "RoyalBall", "OpalGlow" }
			},
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "FloatingCrowns", "FloatingGeodes" }
			}
		},
		BackgroundColor = Color3.fromRGB(45, 33, 99),
		BarColor = Color3.fromRGB(218, 165, 32),
		CornerColors = Color3.fromRGB(72, 61, 139),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Crystallion" },
			Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
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
	RoyalItemBundle = {
		DisplayOrder = 2,
		ProductId = 3263122370,
		Cost = 249,
		BundleArt = "rbxassetid://125593750193208",
		Fertility = true,
		Items = {
			RandomAccessoryDrop1 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 1,
				Theme = { "PurpleGeode", "RoyalPattern" },
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
		BackgroundColor = Color3.fromRGB(45, 33, 99),
		BarColor = Color3.fromRGB(218, 165, 32),
		CornerColors = Color3.fromRGB(72, 61, 139)
	}
}