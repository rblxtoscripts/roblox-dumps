-- https://lua.expert/
local t = {
	"HorseArmoredSaddle",
	"HorseArmoredSocks",
	"HorseArmoredBridle",
	"UnicornArmoredSaddle",
	"UnicornArmoredSocks",
	"UnicornArmoredBridle",
	"KelpieArmoredSaddle",
	"KelpieArmoredSocks",
	"KelpieArmoredBridle",
	"PerytonArmoredSaddle",
	"PerytonArmoredSocks",
	"PerytonArmoredBridle",
	"RoseSpear",
	"StampedeBattleaxe",
	"MedievalSword",
	"MedievalShield",
	"ArmoredDragonPlush"
}
task.delay(2, function() --[[ Line: 46 | Upvalues: t (copy) ]]
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
	LargeBundle = {
		DisplayOrder = 1,
		ProductId = 1940806847,
		Cost = 599,
		Fertility = true,
		BundleArt = "rbxassetid://108239586053701",
		Items = {
			RandomEquipment = {
				Amount = 3,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "Armored" }
			},
			RandomAccessoryDrop1 = {
				Amount = 3,
				Theme = "Random",
				SeedOffset = 6,
				PullTable = t
			},
			RandomPalette = {
				Amount = 2,
				SeedOffset = 4,
				PullTable = { "ArmoredGuard", "Renaissance" }
			},
			ArmorSet = {
				Amount = 3,
				SeedOffset = 3,
				Theme = "Random",
				AlwaysTheme = true,
				PullTable = {
					{ "UnicornArmoredSaddle", "UnicornArmoredSocks", "UnicornArmoredBridle" },
					{ "HorseArmoredSaddle", "HorseArmoredSocks", "HorseArmoredBridle" },
					{ "KelpieArmoredSaddle", "KelpieArmoredSocks", "KelpieArmoredBridle" },
					{ "PerytonArmoredSaddle", "PerytonArmoredSocks", "PerytonArmoredBridle" }
				}
			},
			MedievalWingPotion = {
				Amount = 2
			}
		},
		Horse = {
			P = 50,
			MaxEyeRarity = 30,
			Species = { "Unicorn" },
			Preset = {
				"Black",
				"LightGray",
				"DarkGray",
				"LightRoan",
				"Tan",
				"Cream",
				"Blonde",
				"ZebraRare",
				"BlackWhite",
				"WhiteBlack",
				"BlackBrown",
				"Mustang",
				"Arabian",
				"BrownBlonde",
				"RedBrown",
				"White",
				"Calico"
			},
			MutationChances = {
				Wings = 25,
				Glow = 0
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		},
		BackgroundColor = Color3.fromRGB(202, 107, 23),
		BarColor = Color3.fromRGB(255, 193, 48),
		CornerColors = Color3.fromRGB(255, 193, 117)
	},
	AccessoryBundle = {
		DisplayOrder = 2,
		ProductId = 1940806899,
		Cost = 299,
		BundleArt = "rbxassetid://103739064011280",
		Fertility = true,
		Items = {
			RandomAccessoryDrop1 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 1,
				Theme = { "Armored" },
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
				Theme = { "Thunder", "Cookie", "Clover", "Opal", "Gold", "Nebula" },
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
		BackgroundColor = Color3.fromRGB(221, 236, 255),
		BarColor = Color3.fromRGB(139, 205, 255),
		CornerColors = Color3.fromRGB(171, 221, 255)
	}
}