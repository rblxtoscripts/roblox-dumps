-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Amount = 25
	},
	Preset2 = {
		Type = "Sell",
		Amount = 15
	},
	Preset3 = {
		Type = "GrowMax",
		Amount = 10
	},
	Preset4 = {
		Type = "Breed",
		Amount = 15
	},
	Preset5 = {
		Type = "StatLevelUp",
		Amount = 15
	},
	Preset6 = {
		Type = "Foal",
		Amount = 15
	},
	Preset7 = {
		Type = "TameWings",
		Amount = 2
	},
	Preset8 = {
		Type = "HarvestNode",
		Amount = 50
	},
	Preset9 = {
		Type = "BuyStable",
		Amount = 5
	},
	Preset10 = {
		Type = "JumpObstacle",
		Amount = 50
	},
	Preset11 = {
		Type = "CompleteRace",
		Amount = 3
	},
	Preset12 = {
		Type = "BuyAccessory",
		Amount = 5
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "ExclusiveFeed",
		Amount = 2
	},
	RewardId2 = {
		P = 0.5,
		Name = "MysticFeed",
		Amount = 2
	},
	RewardId3 = {
		P = 0.6,
		Name = "CarrotMuffin",
		Amount = 2
	},
	RewardId4 = {
		P = 0.4,
		Name = "AppleMuffin",
		Amount = 2
	},
	RewardId5 = {
		P = 0.6,
		Name = "WovenLasso",
		Amount = 15
	},
	RewardId6 = {
		P = 0.4,
		Name = "MysticCloudLasso",
		Amount = 3
	},
	RewardId7 = {
		P = 0.4,
		Name = "RoseLasso",
		Amount = 3
	},
	RewardId8 = {
		P = 0.25,
		Name = "TrophyUpgradePotion",
		Amount = 1
	}
}
return {
	Missions = {
		{
			MissionsByType = t,
			Rewards = t2
		},
		{
			MissionsByType = t,
			Rewards = t2
		},
		{
			MissionsByType = t,
			Rewards = t2
		}
	}
}