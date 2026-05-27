-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Wolpers",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Wolper"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 10
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Wolpers from the Easter Stables",
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
		Description = "Earn %s Gold Eggs",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "GoldEggs"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 2,
		Description = "Interact with %s unique Lore Structures in the Easter World"
	},
	Preset10 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Easter Egg Fishing Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 77 ]]
			return p1 == "Fishing"
		end
	},
	Preset13 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Carrot Defense Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 101 ]]
			return p1 == "DefenseMinigame"
		end
	},
	Preset15 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Carrot Delivery Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 119 ]]
			return p1 == "DeliveryMinigame"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "GoldEggs",
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