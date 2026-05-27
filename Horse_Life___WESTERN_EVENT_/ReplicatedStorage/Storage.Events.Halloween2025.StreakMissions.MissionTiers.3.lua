-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Hauntmares",
		Amount = 4,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Hauntmare"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 30
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Halloween Horses from the Haunted Stables",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 34 ]]
			return p1 == "Event"
		end
	},
	Preset5 = {
		Type = "CompleteEventMinigame",
		Description = "Complete %s Event Minigames",
		Amount = 3
	},
	Preset6 = {
		Type = "GetItem",
		Amount = 250,
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
		Amount = 100
	},
	RewardId2 = {
		P = 0.3,
		Name = "UndeadLasso",
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