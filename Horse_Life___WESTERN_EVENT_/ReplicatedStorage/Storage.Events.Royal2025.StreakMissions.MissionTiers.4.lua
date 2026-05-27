-- https://lua.expert/
local t = {
	Preset2 = {
		Type = "HarvestNode",
		Amount = 30
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Crystallions from the Royal Stables",
		Amount = 4,
		Check = function(p1) --[[ Check | Line: 34 ]]
			return p1 == "Event"
		end
	},
	Preset5 = {
		Type = "CompleteEventMinigame",
		Description = "Complete %s Event Minigames",
		Amount = 4
	},
	Preset6 = {
		Type = "GetItem",
		Amount = 500,
		Description = "Earn %s Gems",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Gems"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 4,
		Description = "Interact with %s unique Lore Structures in the Royal World"
	},
	Preset13 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Royal Ball Minigame %s times",
		Amount = 4,
		Check = function(p1) --[[ Check | Line: 127 ]]
			return p1 == "CircusShow"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Gems",
		Amount = 75
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