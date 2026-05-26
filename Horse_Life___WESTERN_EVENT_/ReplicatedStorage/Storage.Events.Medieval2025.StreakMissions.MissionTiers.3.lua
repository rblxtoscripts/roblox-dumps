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
		Type = "Breed",
		Amount = 10
	},
	Preset4 = {
		Type = "StatLevelUp",
		Amount = 10
	},
	Preset5 = {
		Type = "Foal",
		Amount = 10
	},
	Preset6 = {
		Type = "HarvestNode",
		Amount = 30
	},
	Preset7 = {
		Type = "JumpObstacle",
		Amount = 30
	},
	Preset8 = {
		Type = "WinJoust",
		Description = "Win %s Joust Battles",
		Amount = 5
	},
	Preset9 = {
		Type = "TurninJoustFlag",
		Description = "Turn in %s Joust Flags",
		Amount = 15
	},
	Preset10 = {
		Type = "CompleteJoust",
		Amount = 15,
		Description = "Compete in a Joust Duel %s times"
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "JoustFlag",
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