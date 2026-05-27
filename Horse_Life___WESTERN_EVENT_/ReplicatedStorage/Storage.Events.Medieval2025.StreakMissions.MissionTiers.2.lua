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
		Type = "Breed",
		Amount = 5
	},
	Preset4 = {
		Type = "StatLevelUp",
		Amount = 5
	},
	Preset5 = {
		Type = "Foal",
		Amount = 5
	},
	Preset6 = {
		Type = "HarvestNode",
		Amount = 20
	},
	Preset7 = {
		Type = "JumpObstacle",
		Amount = 20
	},
	Preset8 = {
		Type = "WinJoust",
		Description = "Win %s Joust Battles",
		Amount = 3
	},
	Preset9 = {
		Type = "TurninJoustFlag",
		Description = "Turn in %s Joust Flags",
		Amount = 10
	},
	Preset10 = {
		Type = "CompleteJoust",
		Amount = 10,
		Description = "Compete in a Joust Duel %s times"
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "JoustFlag",
		Amount = 2
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