-- https://lua.expert/
local t = {
	"RaceFlag",
	"RuffleRibbonEarClip",
	"TrafficCone",
	"RibbonEarClip",
	"PartialFlyHood",
	"RaceHood",
	"Visor",
	"RaceSocks",
	"RacingSaddle",
	"Tire",
	"StreetLights",
	"Medal",
	"RaceTailRibbon",
	"RaceBow"
}
return {
	{
		Position = 1,
		TotalRewards = 5,
		Rewards = {
			{
				Name = "MysticFeed",
				Amount = 1,
				P = 0.35
			},
			{
				Name = "ExclusiveFeed",
				Amount = 3,
				P = 0.45
			},
			{
				Name = "PremiumFeed",
				Amount = 3,
				P = 0.5
			},
			{
				Name = "YouthPotion",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "GrowthPotion",
				Amount = 1,
				P = 0.25
			},
			{
				Name = "WovenLasso",
				Amount = 10,
				P = 0.35
			},
			{
				Name = "RedCheckerTrail",
				Amount = 1,
				P = 0.15
			},
			{
				Name = "CheckerTrail",
				Amount = 1,
				P = 0.15
			},
			{
				Name = "Confetti",
				Amount = 1,
				P = 0.15
			},
			{
				Name = "HorseRace",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "RandomEquipment",
				Theme = "Thunder",
				Amount = 1,
				P = 0.35
			},
			{
				Theme = "Random",
				Amount = 1,
				P = 0.35,
				Name = t
			}
		}
	},
	{
		TotalRewards = 4,
		Position = NumberRange.new(2, 3),
		Rewards = {
			{
				Name = "MysticFeed",
				Amount = 1,
				P = 0.2
			},
			{
				Name = "ExclusiveFeed",
				Amount = 1,
				P = 0.3
			},
			{
				Name = "PremiumFeed",
				Amount = 1,
				P = 0.4
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				P = 0.5
			},
			{
				Name = "WovenLasso",
				Amount = 8,
				P = 0.35
			},
			{
				Name = "RedCheckerTrail",
				Amount = 1,
				P = 0.125
			},
			{
				Name = "Confetti",
				Amount = 1,
				P = 0.15
			},
			{
				Name = "YouthPotion",
				Amount = 1,
				P = 0.05
			},
			{
				Name = "GrowthPotion",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "CheckerTrail",
				Amount = 1,
				P = 0.125
			},
			{
				Name = "HorseRace",
				Amount = 1,
				P = 0.075
			},
			{
				Name = "RandomEquipment",
				Theme = "Thunder",
				Amount = 1,
				P = 0.3
			},
			{
				Theme = "Random",
				Amount = 1,
				P = 0.3,
				Name = t
			}
		}
	},
	{
		TotalRewards = 4,
		Position = NumberRange.new(4, 8),
		Rewards = {
			{
				Name = "MysticFeed",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "ExclusiveFeed",
				Amount = 1,
				P = 0.2
			},
			{
				Name = "PremiumFeed",
				Amount = 1,
				P = 0.3
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				P = 0.5
			},
			{
				Name = "Confetti",
				Amount = 1,
				P = 0.15
			},
			{
				Name = "WovenLasso",
				Amount = 5,
				P = 0.35
			},
			{
				Name = "RedCheckerTrail",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "CheckerTrail",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "YouthPotion",
				Amount = 1,
				P = 0.025
			},
			{
				Name = "GrowthPotion",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "HorseRace",
				Amount = 1,
				P = 0.05
			},
			{
				Name = "RandomEquipment",
				Theme = "Thunder",
				Amount = 1,
				P = 0.25
			},
			{
				Theme = "Random",
				Amount = 1,
				P = 0.25,
				Name = t
			}
		}
	},
	{
		TotalRewards = 3,
		Rewards = {
			{
				Name = "PremiumFeed",
				Amount = 1,
				P = 0.25
			},
			{
				Name = "GoodFeed",
				Amount = 1,
				P = 0.5
			},
			{
				Name = "BasicFeed",
				Amount = 1,
				P = 0.75
			},
			{
				Name = "WovenLasso",
				Amount = 3,
				P = 0.35
			},
			{
				Name = "RedCheckerTrail",
				Amount = 1,
				P = 0.075
			},
			{
				Name = "CheckerTrail",
				Amount = 1,
				P = 0.075
			},
			{
				Name = "RandomEquipment",
				Theme = "Thunder",
				Amount = 1,
				P = 0.1
			},
			{
				Name = "GrowthPotion",
				Amount = 1,
				P = 0.075
			},
			{
				Theme = "Random",
				Amount = 1,
				P = 0.1,
				Name = t
			}
		}
	}
}