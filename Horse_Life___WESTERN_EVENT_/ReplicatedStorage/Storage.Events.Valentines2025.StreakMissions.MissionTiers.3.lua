-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Pastrequines",
		Amount = 4,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Pastrequine"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 20
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Pastrequines from the Love Stables",
		Amount = 3,
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
		Amount = 250,
		Description = "Earn %s Hearts",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Hearts"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 3,
		Description = "Interact with %s unique Lore Structures in the Valentines World"
	},
	Preset8 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Cake Baking Minigame %s times",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 61 ]]
			return p1 == "DesignCoffee"
		end
	},
	Preset10 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Taiyaki Fishing Minigame %s times",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 77 ]]
			return p1 == "Fishing"
		end
	},
	Preset11 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Rose Maze Minigame %s times",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 85 ]]
			return p1 == "Maze"
		end
	},
	Preset12 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Chocolate Minigame %s times",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 93 ]]
			return p1 == "FarmingMinigame"
		end
	},
	Preset13 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Dango Defense Minigame %s times",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 101 ]]
			return p1 == "DefenseMinigame"
		end
	},
	Preset14 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Chaos Canyon Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 110 ]]
			return p1 == "DestructionMinigame"
		end
	},
	Preset15 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Chocolate Delivery Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 119 ]]
			return p1 == "DeliveryMinigame"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Hearts",
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
		}
	}
}