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
	"CrystallionBasicBridle",
	"CrystallionBasicSaddle",
	"CrystallionBasicSocks"
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
				Theme = { "PurpleGeode", "RoyalPattern" }
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
				Theme = { "PurpleGeode", "RoyalPattern" }
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
				Species = "Crystallion",
				Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
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
				Theme = { "PurpleGeode", "RoyalPattern" }
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
				Name = "RoyalWingPotion"
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
				Species = "Crystallion",
				Preset = { "PurpleGem", "VioletGem", "SeaGreenGem", "GreenMarble", "BlueLav", "RockyCrystal", "RedStone", "Amber" },
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
				Name = "CrystallionBreedingLicense"
			}
		},
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 203 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Crystallion.Value = true
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
				Name = "RoyalMutationPotion"
			}
		},
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 225 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Crystallion.Value = true
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
				Name = "RoyalWingPotion"
			}
		},
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 247 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Crystallion.Value = true
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
				Species = "Crystallion",
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
		RunOnCompleted = function(p1) --[[ RunOnCompleted | Line: 275 ]]
			p1.PlayerData.ExtraSpeciesUnlocks.Crystallion.Value = true
			return true
		end
	}
}