-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Amount = 10
	},
	Preset2 = {
		Type = "Sell",
		Amount = 5
	},
	Preset3 = {
		Type = "GrowMax",
		Amount = 3
	},
	Preset4 = {
		Type = "Breed",
		Amount = 5
	},
	Preset5 = {
		Type = "StatLevelUp",
		Amount = 5
	},
	Preset6 = {
		Type = "Foal",
		Amount = 5
	},
	Preset7 = {
		Type = "TameWings",
		Amount = 1
	},
	Preset8 = {
		Type = "HarvestNode",
		Amount = 20
	},
	Preset9 = {
		Type = "BuyStable",
		Amount = 2
	},
	Preset10 = {
		Type = "JumpObstacle",
		Amount = 20
	},
	Preset11 = {
		Type = "CompleteRace",
		Amount = 1
	},
	Preset12 = {
		Type = "BuyAccessory",
		Amount = 2
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "GoodFeed",
		Amount = 1
	},
	RewardId2 = {
		P = 0.5,
		Name = "PremiumFeed",
		Amount = 1
	},
	RewardId3 = {
		P = 0.6,
		Name = "SugarMuffin",
		Amount = 1
	},
	RewardId4 = {
		P = 0.4,
		Name = "MintMuffin",
		Amount = 1
	},
	RewardId5 = {
		P = 0.6,
		Name = "WovenLasso",
		Amount = 5
	},
	RewardId6 = {
		P = 0.4,
		Name = "MagicalLasso",
		Amount = 3
	},
	RewardId7 = {
		P = 0.4,
		Name = "OvergrownLasso",
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