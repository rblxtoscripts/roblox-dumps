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
		PaidRewardTheme = { "Martian", "Goop" },
		FreeRewardTheme = { "Martian", "Goop" }
	},
	{
		FreeReward = "RandomEquipment",
		PaidReward = "RandomEquipment",
		PaidRewardTheme = "Goop",
		FreeRewardTheme = "Martian",
		FreeRewardAmount = 1,
		PaidRewardAmount = 2,
		PointsNeeded = 1
	},
	{
		FreeReward = "RandomEquipment",
		PaidReward = "RandomEquipment",
		PaidRewardTheme = "Goop",
		FreeRewardTheme = "Martian",
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
		FreeReward = "SpaceSpill",
		PaidReward = "SpaceWarp",
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 1,
		PointsNeeded = 1
	},
	{
		FreeReward = "EquenariBreedingLicense",
		PaidReward = "SillyLasso",
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 20,
		PointsNeeded = 1,
		RunOnComplete = function(p1) --[[ RunOnComplete | Line: 131 ]]
			local Equenari = p1.PlayerData.ExtraSpeciesUnlocks:FindFirstChild("Equenari")
			if not Equenari then
				return
			end
			Equenari.Value = true
		end
	},
	{
		PaidRewardTheme = nil,
		FreeRewardTheme = nil,
		FreeRewardAmount = 1,
		PaidRewardAmount = 20,
		PointsNeeded = 1,
		FreeReward = {
			Species = "Equenari",
			Preset = { "CarouselToy", "CarouselBarber", "CarouselFortune", "CarouselVintage", "CarouselWeathered" },
			MaxCosmetics = {
				MaxPatternsPerSlot = 2,
				MaxPaintsPerSlot = 1,
				MaxCosmeticsPerSlot = 2,
				AlwaysMax = true
			}
		},
		PaidReward = {
			Species = "Equenari",
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
		FreeReward = "AlienWingPotion",
		PaidReward = "AlienWingPotion",
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
			Species = "Equenari",
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
				"DartFrog",
				"JewelBeetle"
			},
			MaxCosmetics = {
				MaxPatternsPerSlot = 4,
				MaxPaintsPerSlot = 2,
				MaxCosmeticsPerSlot = 4,
				AlwaysMax = true
			}
		},
		PaidReward = {
			Species = "Equenari",
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
				"DartFrog",
				"JewelBeetle"
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