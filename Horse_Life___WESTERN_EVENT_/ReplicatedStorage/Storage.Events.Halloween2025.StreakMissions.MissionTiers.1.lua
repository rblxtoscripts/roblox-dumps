-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Hauntmares",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Hauntmare"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 10
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Halloween Horses from the Haunted Stables",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 34 ]]
			return p1 == "Event"
		end
	},
	Preset5 = {
		Type = "CompleteEventMinigame",
		Description = "Complete %s Event Minigames",
		Amount = 1
	},
	Preset6 = {
		Type = "GetItem",
		Amount = 50,
		Description = "Earn %s Souls",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Souls"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Souls",
		Amount = 25
	},
	RewardId2 = {
		P = 0.3,
		Name = "UndeadLasso",
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