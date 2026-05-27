-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame a Horse-species horse %s times",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Horse"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 10
	},
	Preset20 = {
		Type = "Foal",
		Description = "Foal a Horse-species horse %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 24 ]]
			return p1 == "Horse"
		end
	},
	Preset5 = {
		Type = "CompleteEventMinigame",
		Description = "Complete %s Event Minigames",
		Amount = 3
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Stars",
		Amount = 25
	},
	RewardId2 = {
		P = 0,
		Name = "Stars",
		Amount = 25
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