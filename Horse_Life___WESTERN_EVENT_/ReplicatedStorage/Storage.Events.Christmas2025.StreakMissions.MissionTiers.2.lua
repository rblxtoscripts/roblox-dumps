-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame a Horse-species horse %s times",
		Amount = 10,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Horse"
		end
	},
	Preset20 = {
		Type = "Foal",
		Description = "Foal a Horse-species horse %s times",
		Amount = 2,
		Check = function(p1) --[[ Check | Line: 24 ]]
			return p1 == "Horse"
		end
	},
	Preset5 = {
		Type = "CompleteEventMinigame",
		Description = "Complete %s Event Minigames",
		Amount = 6
	},
	Preset6 = {
		Type = "GetItem",
		Amount = 100,
		Description = "Earn %s Stars",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Stars"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Stars",
		Amount = 50
	},
	RewardId2 = {
		P = 0,
		Name = "Stars",
		Amount = 50
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