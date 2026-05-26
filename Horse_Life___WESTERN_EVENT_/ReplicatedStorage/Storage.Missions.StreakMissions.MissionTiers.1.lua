-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Amount = 5
	},
	Preset2 = {
		Type = "Sell",
		Amount = 2
	},
	Preset3 = {
		Type = "GrowMax",
		Amount = 2
	},
	Preset4 = {
		Type = "Breed",
		Amount = 2
	},
	Preset5 = {
		Type = "StatLevelUp",
		Amount = 3
	},
	Preset6 = {
		Type = "Foal",
		Amount = 3
	},
	Preset7 = {
		Type = "TameWings",
		Amount = 1
	},
	Preset8 = {
		Type = "HarvestNode",
		Amount = 10
	},
	Preset9 = {
		Type = "BuyStable",
		Amount = 1
	},
	Preset10 = {
		Type = "JumpObstacle",
		Amount = 10
	},
	Preset11 = {
		Type = "CompleteRace",
		Amount = 1
	},
	Preset12 = {
		Type = "BuyAccessory",
		Amount = 1
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "BasicFeed",
		Amount = 1
	},
	RewardId2 = {
		P = 0.5,
		Name = "GoodFeed",
		Amount = 1
	},
	RewardId3 = {
		P = 0.6,
		Name = "OatMuffin",
		Amount = 1
	},
	RewardId4 = {
		P = 0.4,
		Name = "SugarMuffin",
		Amount = 1
	},
	RewardId5 = {
		P = 0.6,
		Name = "WovenLasso",
		Amount = 3
	},
	RewardId6 = {
		P = 0.4,
		Name = "WesternLasso",
		Amount = 3
	},
	RewardId7 = {
		P = 0.4,
		Name = "VibrantLasso",
		Amount = 3
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
		},
		{
			MissionsByType = t,
			Rewards = t2
		}
	}
}