-- https://lua.expert/
local t = {
	"StarCommander",
	"AlienHood",
	"IntergalacticHeadset",
	"AlienGrub",
	"AlienCat",
	"StarScythe",
	"XenoreaperScythe",
	"SwordOfSaturn",
	"AlienRaygun",
	"AlienAntennae",
	"UFOAccessory",
	"UFOHat",
	"AlienShades",
	"PlasmaSaber",
	"EquenariBasicSaddle",
	"EquenariBasicSocks",
	"EquenariBasicBridle",
	"ContingencyArmorSaddle",
	"ContingencyArmorSocks",
	"ContingencyArmorBridle"
}
task.delay(2, function() --[[ Line: 26 | Upvalues: t (copy) ]]
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
	CosmicBundle = {
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
				Theme = { "Martian", "Goop" }
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
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "SpaceWarp", "SpaceSpill", "WishingStar" }
			}
		},
		BackgroundColor = Color3.fromRGB(35, 20, 80),
		BarColor = Color3.fromRGB(220, 100, 255),
		CornerColors = Color3.fromRGB(140, 70, 200),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Equenari" },
			Preset = {
				"HippoJelly",
				"GhoulBat",
				"BlueLav",
				"GhoulStone",
				"BlueLav",
				"FloraBlack",
				"FloraWhite",
				"BlueKelp",
				"EquenOrange",
				"EquenPurple",
				"EquenSea",
				"EquenDust"
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
	CosmicItemBundle = {
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
				Theme = { "Martian", "Goop" },
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