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
		Type = "Breed",
		Amount = 2
	},
	Preset4 = {
		Type = "StatLevelUp",
		Amount = 3
	},
	Preset5 = {
		Type = "Foal",
		Amount = 3
	},
	Preset6 = {
		Type = "HarvestNode",
		Amount = 10
	},
	Preset7 = {
		Type = "JumpObstacle",
		Amount = 10
	},
	Preset8 = {
		Type = "WinJoust",
		Description = "Win %s Joust Battles",
		Amount = 1
	},
	Preset9 = {
		Type = "TurninJoustFlag",
		Description = "Turn in %s Joust Flags",
		Amount = 5
	},
	Preset10 = {
		Type = "CompleteJoust",
		Amount = 5,
		Description = "Compete in a Joust Duel %s times"
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "JoustFlag",
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
		},
		{
			MissionsByType = t,
			Rewards = t2
		}
	}
}