-- https://lua.expert/
local t = {
	"HeartKeeperKey",
	"EternalRose",
	"CupidsBow",
	"CupidStaff",
	"ValentinesFork",
	"CherubsMist",
	"HeartShades",
	"DarkCupidLantern",
	"HeartStaff",
	"CupidsHeadwings",
	"CupidsArrow",
	"HeartBox",
	"LovesickSycthe",
	"ValentinesArrow",
	"LovingBow",
	"StrawberryCake",
	"LovingTeddyBear",
	"LoveLetterBag",
	"CupidsRibbonBow",
	"ValentinesLantern",
	"LoveLetter",
	"HeartSickle",
	"SweetHeartPurse",
	"ValentinesPicnicBasket",
	"LovelyHeartBass",
	"PastrequineBasicBridle",
	"PastrequineBasicSaddle",
	"PastrequineBasicSocks"
}
task.delay(2, function() --[[ Line: 33 | Upvalues: t (copy) ]]
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
	ValentinesBundle = {
		DisplayOrder = 1,
		ProductId = 1940806847,
		Cost = 249,
		BundleArt = "rbxassetid://131010044585369",
		Fertility = true,
		Items = {
			SweetWingPotion = {
				Amount = 2
			},
			RedVelvetLasso = {
				Amount = 20
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "Mint", "Rose" }
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
				PullTable = { "Cake", "Candy", "Adoration", "Heartbreak" }
			},
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "InLove", "ChocolatePinkHearts", "ChocolateHearts" }
			}
		},
		BackgroundColor = Color3.fromRGB(136, 12, 56),
		BarColor = Color3.fromRGB(255, 42, 117),
		CornerColors = Color3.fromRGB(255, 255, 255),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Pastrequine" },
			Preset = { "PastryChocRas", "PastryMint", "PastryBrown", "PastryCotton", "PastryOrange", "PastryMatcha" },
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
	ValentinesItemBundle = {
		DisplayOrder = 2,
		ProductId = 1940806899,
		Cost = 249,
		BundleArt = "rbxassetid://88688214939803",
		Fertility = true,
		Items = {
			RandomAccessoryDrop1 = {
				Amount = 2,
				AlwaysTheme = true,
				SeedOffset = 1,
				Theme = { "Mint", "Rose" },
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
		BackgroundColor = Color3.fromRGB(255, 246, 249),
		BarColor = Color3.fromRGB(255, 164, 119),
		CornerColors = Color3.fromRGB(255, 188, 134)
	}
}