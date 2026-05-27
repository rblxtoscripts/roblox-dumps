-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Amount = 15
	},
	Preset2 = {
		Type = "Sell",
		Amount = 10
	},
	Preset3 = {
		Type = "GrowMax",
		Amount = 5
	},
	Preset4 = {
		Type = "Breed",
		Amount = 10
	},
	Preset5 = {
		Type = "StatLevelUp",
		Amount = 10
	},
	Preset6 = {
		Type = "Foal",
		Amount = 10
	},
	Preset7 = {
		Type = "TameWings",
		Amount = 2
	},
	Preset8 = {
		Type = "HarvestNode",
		Amount = 30
	},
	Preset9 = {
		Type = "BuyStable",
		Amount = 4
	},
	Preset10 = {
		Type = "JumpObstacle",
		Amount = 30
	},
	Preset11 = {
		Type = "CompleteRace",
		Amount = 2
	},
	Preset12 = {
		Type = "BuyAccessory",
		Amount = 3
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "PremiumFeed",
		Amount = 2
	},
	RewardId2 = {
		P = 0.5,
		Name = "ExclusiveFeed",
		Amount = 2
	},
	RewardId3 = {
		P = 0.6,
		Name = "MintMuffin",
		Amount = 2
	},
	RewardId4 = {
		P = 0.4,
		Name = "CarrotMuffin",
		Amount = 2
	},
	RewardId5 = {
		P = 0.6,
		Name = "WovenLasso",
		Amount = 10
	},
	RewardId6 = {
		P = 0.4,
		Name = "KelpLasso",
		Amount = 3
	},
	RewardId7 = {
		P = 0.4,
		Name = "MysticWebLasso",
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
		}
	}
}