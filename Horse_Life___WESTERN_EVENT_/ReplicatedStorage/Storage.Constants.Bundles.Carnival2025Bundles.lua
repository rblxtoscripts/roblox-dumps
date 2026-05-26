-- https://lua.expert/
local t = {
	"ClownNose",
	"MouthCottonCandy",
	"LionPlush",
	"RainbowPlush",
	"GiraffePlush",
	"FeatheredTophat",
	"TimepieceNecklace",
	"SillyMonkeyPlush",
	"FeatherStaff",
	"FeatherEarring",
	"ElephantPlush",
	"PartyHat",
	"SqueakyHammer",
	"PaintedClownMask",
	"MushroomPlush",
	"PartyBlower",
	"TicketRoll",
	"CarnivalMask",
	"MouthPopcorn",
	"CircusBall",
	"JugglingClub",
	"CornDog",
	"Pretzel",
	"CanSmashGame",
	"CircusLionPlush",
	"JugglingBalls",
	"StrongManWeights",
	"CarouselNobleBridle",
	"CarouselNobleSaddle",
	"CarouselDelicateBridle",
	"CarouselDelicateSaddle",
	"CarouselTasselBridle",
	"CarouselTasselSaddle",
	"CarouselPrincessSaddle",
	"CarouselPrincessBridle",
	"CarouselPrincessSocks",
	"CarouselJesterSaddle",
	"CarouselJesterBridle",
	"CarouselMoonSaddle",
	"CarouselMoonBridle"
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
	CarnivalBundle = {
		DisplayOrder = 1,
		ProductId = 3263122214,
		Cost = 249,
		BundleArt = "rbxassetid://121537910905245",
		Fertility = true,
		Items = {
			CircusWingPotion = {
				Amount = 2
			},
			SillyLasso = {
				Amount = 20
			},
			RandomEquipment = {
				Amount = 2,
				SeedOffset = 1,
				AlwaysTheme = true,
				Theme = { "CottonCandy", "Popcorn" }
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
				PullTable = { "MardiGras", "TintCarousel" }
			},
			RandomFlair = {
				Amount = 1,
				SeedOffset = 5,
				PullTable = { "PoppingPopcorn", "FallingPearls", "CarnivalLights" }
			}
		},
		BackgroundColor = Color3.fromRGB(250, 248, 230),
		BarColor = Color3.fromRGB(255, 203, 164),
		CornerColors = Color3.fromRGB(200, 225, 255),
		Horse = {
			P = 50,
			MaxEyeRarity = 50,
			Species = { "Carousel" },
			Preset = { "CarouselDefault", "CarouselToy", "CarouselBarber", "CarouselFortune", "CarouselVintage", "CarouselWeathered" },
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
	CarnivalItemBundle = {
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
				Theme = { "CottonCandy", "Popcorn" },
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