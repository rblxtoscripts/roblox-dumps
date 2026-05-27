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
return {
	{
		FreeReward = "SillyLasso",
		PaidReward = "SillyLasso",
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 5,
		PaidRewardAmount = 10,
		PointsNeeded = 1
	},
	{
		FreeRewardTheme = "Random",
		FreeRewardAmount = 1,
		PaidRewardAmount = 2,
		PointsNeeded = 1,
		FreeReward = t,
		PaidReward = t,
		PaidRewardTheme = {
			"Gift",
			"Opal",
			"Thunder",
			"Galaxy",
			"Obsidian",
			"Nature",
			"Cookie",
			"Clover",
			"Tulip",
			"Dyed",
			"Amethyst",
			"Armored",
			"Berry",
			"BlueAgate",
			"Blueberry",
			"Candycane",
			"Cloud",
			"Coffee",
			"Floral",
			"Fossilized",
			"Frozen",
			"Ghoul",
			"Gold",
			"Heavenly",
			"Lemon",
			"Magma",
			"Mint",
			"Moon",
			"Nebula",
			"Ocean",
			"Pumpkin",
			"Rose",
			"Ruby",
			"Sakura",
			"Sun",
			"Void"
		}
	},
	{
		FreeRewardAmount = 1,
		PaidRewardAmount = 2,
		PointsNeeded = 1,
		FreeReward = t,
		PaidReward = t,
		PaidRewardTheme = { "CottonCandy", "Popcorn" },
		FreeRewardTheme = { "CottonCandy", "Popcorn" }
	},
	{
		FreeReward = "RandomEquipment",
		PaidReward = "RandomEquipment",
		PaidRewardTheme = "CottonCandy",
		FreeRewardTheme = "CottonCandy",
		FreeRewardAmount = 1,
		PaidRewardAmount = 2,
		PointsNeeded = 1
	},
	{
		FreeReward = "RandomEquipment",
		PaidReward = "RandomEquipment",
		PaidRewardTheme = "Popcorn",
		FreeRewardTheme = "Popcorn",
		FreeRewardAmount = 1,
		PaidRewardAmount = 2,
		PointsNeeded = 1
	},
	{
		FreeReward = "RoyalBall",
		PaidReward = "AfternoonTea",
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 1,
		PointsNeeded = 1
	},
	{
		FreeReward = "PoppingPopcorn",
		PaidReward = "CarnivalLights",
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 1,
		PointsNeeded = 1
	},
	{
		FreeReward = "CarouselBreedingLicense",
		PaidReward = "SillyLasso",
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 20,
		PointsNeeded = 1,
		RunOnComplete = function(p1) --[[ RunOnComplete | Line: 150 ]]
			local Carousel = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild("Carousel")
			if not Carousel then
				return
			end
			Carousel.Value = true
		end
	},
	{
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 20,
		PointsNeeded = 1,
		FreeReward = {
			Species = "Carousel",
			Preset = { "CarouselToy", "CarouselBarber", "CarouselFortune", "CarouselVintage", "CarouselWeathered" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 2,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 2,
				AlwaysMax = true
			}
		},
		PaidReward = {
			Species = "Carousel",
			Preset = { "CarouselToy", "CarouselBarber", "CarouselFortune", "CarouselVintage", "CarouselWeathered" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	{
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 20,
		PointsNeeded = 2,
		FreeReward = {
			Species = "Random",
			Infertile = true,
			Origin = "Developer",
			Preset = { "Clown" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		},
		PaidReward = {
			Species = "Random",
			Infertile = true,
			Origin = "Developer",
			Preset = { "Clown" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		}
	},
	{
		FreeReward = "CircusWingPotion",
		PaidReward = "CircusWingPotion",
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 2,
		PointsNeeded = 2
	},
	{
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 1,
		PointsNeeded = 2,
		FreeReward = {
			Species = "Carousel",
			Infertile = true,
			Origin = "Developer",
			Preset = {
				"PlushNeapolitan",
				"PlushNeapolitan2",
				"PlushMatchaBoba",
				"PlushRainbowSherbet",
				"MoonL",
				"MoonD",
				"Morpho",
				"LunarMoth",
				"Demon",
				"Nightmare",
				"Vampire",
				"Poison",
				"DartFrog"
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		},
		PaidReward = {
			Species = "Carousel",
			Infertile = true,
			Origin = "Developer",
			Preset = {
				"PlushNeapolitan",
				"PlushNeapolitan2",
				"PlushMatchaBoba",
				"PlushRainbowSherbet",
				"MoonL",
				"MoonD",
				"Morpho",
				"LunarMoth",
				"Demon",
				"Nightmare",
				"Vampire",
				"Poison",
				"DartFrog"
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