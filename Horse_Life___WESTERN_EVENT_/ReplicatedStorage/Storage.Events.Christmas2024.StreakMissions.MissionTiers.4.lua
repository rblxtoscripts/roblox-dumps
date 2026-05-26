-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Alces",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Alces"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 25
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Alces from the Snowy Stables",
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
		Description = "Earn %s Stars",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Stars"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 4,
		Description = "Interact with %s unique Lore Structures in the Winter World"
	},
	Preset8 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Gingerbread Baking Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 61 ]]
			return p1 == "DesignApple"
		end
	},
	Preset9 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Present Making Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 69 ]]
			return p1 == "DesignCoffee"
		end
	},
	Preset10 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Ice Fishing Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 77 ]]
			return p1 == "Fishing"
		end
	},
	Preset11 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Chilly Maze Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 85 ]]
			return p1 == "Maze"
		end
	},
	Preset12 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Candy Cane Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 93 ]]
			return p1 == "PumpkinDelivery"
		end
	},
	Preset13 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Dango Defense Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 101 ]]
			return p1 == "CrowDefense"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Stars",
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