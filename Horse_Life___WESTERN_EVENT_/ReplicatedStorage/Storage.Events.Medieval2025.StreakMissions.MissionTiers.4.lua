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
		Type = "Breed",
		Amount = 15
	},
	Preset4 = {
		Type = "StatLevelUp",
		Amount = 15
	},
	Preset5 = {
		Type = "Foal",
		Amount = 15
	},
	Preset6 = {
		Type = "HarvestNode",
		Amount = 50
	},
	Preset7 = {
		Type = "JumpObstacle",
		Amount = 50
	},
	Preset8 = {
		Type = "WinJoust",
		Description = "Win %s Joust Battles",
		Amount = 20
	},
	Preset9 = {
		Type = "TurninJoustFlag",
		Description = "Turn in %s Joust Flags",
		Amount = 10
	},
	Preset10 = {
		Type = "CompleteJoust",
		Amount = 20,
		Description = "Compete in a Joust Duel %s times"
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "JoustFlag",
		Amount = 4
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