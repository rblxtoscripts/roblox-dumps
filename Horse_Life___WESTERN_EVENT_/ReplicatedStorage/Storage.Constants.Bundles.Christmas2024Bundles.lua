-- https://lua.expert/
local t = {
	"SnowLantern",
	"IceScepter",
	"StarWand",
	"HindGiftStack",
	"MouthStocking",
	"HindPresent",
	"WinterTiara",
	"IceCrown",
	"PeppermintEarclip",
	"MistletoeEarclip",
	"SnowOwl",
	"KrampusPlush",
	"FrostbittenAxe",
	"IceboundSceptre",
	"AlcesBasicSaddle",
	"AlcesBasicBridle",
	"AlcesBasicSocks",
	"GingerbreadMan",
	"CandyCane",
	"PolarPlush",
	"FestiveSnowman",
	"FestiveRibbon",
	"FestiveTopHat",
	"FestiveScroll",
	"SantaPlush",
	"ChristmasGiftBag",
	"HollyWreath",
	"YetiPlush",
	"StarTopper",
	"SnowflakeBow",
	"PoinsettiaBow",
	"SnowmanSnowglobe",
	"ArcticFoxPlush",
	"SantaHat",
	"FestiveReindeerAntlers",
	"FestiveRibbonEarpiece",
	"FestiveTruck",
	"ReindeerPlush",
	"MistletoeMouthpiece",
	"SnowLeopardPlush",
	"NorthStarTiara",
	"OwlTiara",
	"SnowflakeTiara",
	"OwlAmulet",
	"SnowflakeAmulet",
	"NorthStarAmulet"
}
task.delay(2, function() --[[ Line: 50 | Upvalues: t (copy) ]]
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
	ChristmasBundle = {
		DisplayOrder = 1,
		ProductId = 1940806847,
		Cost = 249,
		BundleArt = "rbxassetid://96035997983316",
		Fertility = true,
		Items = {
			FrozenWingPotion = {
				Amount = 2
			},
			IceLasso = {
				Amount = 20
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "Frozen", "Candycane" }
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
				PullTable = { "Borealis", "Festive", "Glacier", "WinterWonderland" }
			},
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "Aurora", "AuroraBorealisTrail", "FestiveStars", "Snowflake", "Snowfall", "CandyCanes" }
			}
		},
		BackgroundColor = Color3.fromRGB(0, 123, 255),
		BarColor = Color3.fromRGB(48, 165, 255),
		CornerColors = Color3.fromRGB(55, 195, 255),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Alces" },
			Preset = { "AlcesTan", "AlcesCream", "AlcesWhite", "AlcesBlack", "AlcesIce", "AlcesIceSnap", "AlcesWinter" },
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
	ChristmasItemBundle = {
		DisplayOrder = 2,
		ProductId = 1940806899,
		Cost = 249,
		BundleArt = "rbxassetid://70816669212574",
		Fertility = true,
		Items = {
			RandomAccessoryDrop1 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 1,
				Theme = { "Frozen", "Candycane" },
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
				Theme = { "Thunder", "Cookie", "Clover", "Opal", "Gold" },
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
		BackgroundColor = Color3.fromRGB(0, 123, 255),
		BarColor = Color3.fromRGB(48, 165, 255),
		CornerColors = Color3.fromRGB(55, 195, 255)
	},
	SantaBundle = {
		ForcedDisplayName = "Santa\'s Bundle",
		StartTime = 1735098780,
		EndTime = 1735199520,
		DisplayOrder = 1,
		ProductId = 2677553379,
		Cost = 249,
		BundleArt = "rbxassetid://103511524759757",
		Fertility = true,
		Items = {
			FrozenWingPotion = {
				Amount = 3
			},
			HornGrowthPotion = {
				Amount = 3
			},
			IceLasso = {
				Amount = 20
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "Frozen", "Candycane" }
			},
			RandomAccessoryDrop1 = {
				Amount = 2,
				Theme = "Random",
				SeedOffset = 1,
				PullTable = t
			},
			SantaPlush = {
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
				PullTable = { "Borealis", "Festive", "Glacier", "WinterWonderland" }
			},
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "Aurora", "AuroraBorealisTrail", "FestiveStars", "Snowflake", "Snowfall", "CandyCanes" }
			}
		},
		BackgroundColor = Color3.fromRGB(255, 78, 105),
		BarColor = Color3.fromRGB(255, 46, 95),
		CornerColors = Color3.fromRGB(255, 30, 60),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Alces" },
			Preset = {
				"AlcesTan",
				"AlcesCream",
				"AlcesWhite",
				"AlcesBlack",
				"AlcesIce",
				"AlcesIceSnap",
				"AlcesWinter",
				"AlcesRedWhite",
				"AlcesFir"
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
		},
		Horse2 = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Plush" },
			Preset = { "AuroraBorealis", "AlcesFestive" },
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
	}
}