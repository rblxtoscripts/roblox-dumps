-- https://lua.expert/
local t = {
	"DandelionScythe",
	"CarrotLance",
	"DecoratedEggs",
	"ChocolateBunny",
	"CarrotCake",
	"BabyChick",
	"AprilShowersUmbrella",
	"BunnyTopHat",
	"WolperMask",
	"SpringHeadBand",
	"EasterEggHeadBand",
	"BunnyBucketHat",
	"HoneyDipper",
	"EasterEggStaff",
	"HoneyHive",
	"DewyCloverLeaf",
	"BeeSword",
	"MilkChocolateBunny",
	"EasterEggBasket",
	"EasterMarshmallows",
	"StrawberryCowPlush",
	"CrackedEasterEgg",
	"EasterBowStaff",
	"WolperBasicBridle",
	"WolperBasicSaddle",
	"WolperBasicSocks"
}
task.delay(2, function() --[[ Line: 31 | Upvalues: t (copy) ]]
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
	LimitedBundle = {
		ForcedDisplayName = "Easter Bundle",
		DisplayOrder = 0,
		ProductId = 1940806847,
		Cost = 249,
		StartTime = 1745072400,
		EndTime = 1745223600,
		BundleArt = "rbxassetid://80514483260817",
		Fertility = true,
		Items = {
			EasterWingPotion = {
				Amount = 3
			},
			BunnyLasso = {
				Amount = 20
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "Dyed", "Tulip" }
			},
			RandomAccessoryDrop1 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = t
			},
			DownyFeather = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 2,
				AlwaysTheme = true
			},
			SpringTulips = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 2,
				AlwaysTheme = true
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
				PullTable = { "FarmAnimals", "PaintedEggs", "EasterBasket" }
			},
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "BabyCarrot", "Bunny", "PinkTulips", "PurpleTulips", "YellowTulips", "DyedEggs" }
			}
		},
		BackgroundColor = Color3.fromRGB(205, 231, 255),
		BarColor = Color3.fromRGB(181, 255, 198),
		CornerColors = Color3.fromRGB(255, 240, 166),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Wolper" },
			Preset = { "EasterBunny" },
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
		},
		Horse2 = {
			P = 50,
			MaxEyeRarity = 50,
			SeedOffset = 2,
			Species = { "Wolper" },
			Preset = { "AlbinoBunny" },
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
	EasterBundle = {
		DisplayOrder = 1,
		ProductId = 3263122214,
		Cost = 249,
		BundleArt = "rbxassetid://121537910905245",
		Fertility = true,
		Items = {
			EasterWingPotion = {
				Amount = 2
			},
			BunnyLasso = {
				Amount = 20
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "Dyed", "Tulip" }
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
				PullTable = { "EasterBasket", "PaintedEggs", "FarmAnimals" }
			},
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "PinkTulips", "YellowTulips", "PurpleTulips", "Bunny", "BabyCarrot", "DyedEggs" }
			}
		},
		BackgroundColor = Color3.fromRGB(250, 248, 230),
		BarColor = Color3.fromRGB(255, 203, 164),
		CornerColors = Color3.fromRGB(200, 225, 255),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Wolper" },
			Preset = { "WolpTricolor", "WolpBlackCalico", "WolpCalico", "WolpGray", "WolpPink" },
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
	EasterItemBundle = {
		DisplayOrder = 2,
		ProductId = 3263122370,
		Cost = 249,
		BundleArt = "rbxassetid://80514483260817",
		Fertility = true,
		Items = {
			RandomAccessoryDrop1 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 1,
				Theme = { "Dyed", "Tulip" },
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
		BackgroundColor = Color3.fromRGB(255, 240, 245),
		BarColor = Color3.fromRGB(174, 198, 207),
		CornerColors = Color3.fromRGB(189, 236, 182)
	}
}