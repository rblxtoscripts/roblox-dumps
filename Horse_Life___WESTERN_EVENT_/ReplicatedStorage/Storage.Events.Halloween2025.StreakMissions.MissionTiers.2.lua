-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Hauntmares",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Hauntmare"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 20
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Halloween Horses from the Haunted Stables",
		Amount = 2,
		Check = function(p1) --[[ Check | Line: 34 ]]
			return p1 == "Event"
		end
	},
	Preset5 = {
		Type = "CompleteEventMinigame",
		Description = "Complete %s Event Minigames",
		Amount = 2
	},
	Preset6 = {
		Type = "GetItem",
		Amount = 100,
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
		Amount = 50
	},
	RewardId2 = {
		P = 0.3,
		Name = "UndeadLasso",
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