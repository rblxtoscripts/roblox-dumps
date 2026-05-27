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
		PointsNeeded = 25,
		MissionName = "Mission 1",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Name = t,
				Theme = { "g" }
			}
		}
	},
	{
		PointsNeeded = 70,
		MissionName = "Mission 2",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Theme = "Random",
				Name = t
			}
		}
	},
	{
		PointsNeeded = 220,
		MissionName = "Mission 3",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Name = t,
				Theme = { "Martian", "Goop" }
			}
		}
	},
	{
		PointsNeeded = 265,
		MissionName = "Mission 4",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Species = "Equenari",
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
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2,
					AlwaysMax = true
				}
			}
		}
	},
	{
		PointsNeeded = 310,
		MissionName = "Mission 5",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Theme = "Random",
				Name = t
			}
		}
	},
	{
		PointsNeeded = 460,
		MissionName = "Mission 6",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Name = t,
				Theme = { "Martian", "Goop" }
			}
		}
	},
	{
		PointsNeeded = 505,
		MissionName = "Mission 7",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Theme = "Random",
				Name = t
			}
		}
	},
	{
		PointsNeeded = 550,
		MissionName = "Mission 8",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Name = "AlienWingPotion"
			}
		}
	},
	{
		PointsNeeded = 700,
		MissionName = "Mission 9",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Species = "Equenari",
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
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 1,
					MaxCosmeticsPerSlot = 2,
					AlwaysMax = true
				}
			}
		}
	},
	{
		PointsNeeded = 950,
		MissionName = "Mission 10",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Name = "EquenariBreedingLicense"
			}
		},
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 213 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Equenari.Value = true
			return true
		end
	},
	{
		PointsNeeded = 1250,
		MissionName = "Mission 11",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Name = "AlienMutationPotion"
			}
		},
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 235 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Equenari.Value = true
			return true
		end
	},
	{
		PointsNeeded = 1450,
		MissionName = "Mission 12",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
				Amount = 1,
				Name = "AlienWingPotion"
			}
		},
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 257 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Equenari.Value = true
			return true
		end
	},
	{
		PointsNeeded = 1750,
		MissionName = "Mission 13",
		CanSkip = true,
		SkipProductID = 3354292486,
		Rewards = {
			{
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
					"PinkLemonade",
					"Magma"
				},
				MaxCosmetics = {
					MaxPatternsPerSlot = 2,
					MaxPaintsPerSlot = 2,
					MaxCosmeticsPerSlot = 2,
					AlwaysMax = true
				}
			}
		},
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 285 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Equenari.Value = true
			return true
		end
	}
}