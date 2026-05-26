-- https://lua.expert/
local t = {
	Preset2 = {
		Type = "HarvestNode",
		Amount = 15
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Crystallions from the Royal Stables",
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
		Description = "Earn %s Gems",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Gems"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 2,
		Description = "Interact with %s unique Lore Structures in the Royal World"
	},
	Preset11 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Royal Maze Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 85 ]]
			return p1 == "Maze"
		end
	},
	Preset13 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Royal Ball Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 93 ]]
			return p1 == "CircusShow"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Gems",
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