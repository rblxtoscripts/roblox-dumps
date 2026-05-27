-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Carousels",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Carousel"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 25
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Carousels from the Carnival Stables",
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
		Description = "Earn %s Tickets",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Tickets"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 4,
		Description = "Interact with %s unique Lore Structures in the Carnival World"
	},
	Preset10 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Carnival Fishing Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 77 ]]
			return p1 == "Fishing"
		end
	},
	Preset13 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Popcorn Catch Minigame %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 101 ]]
			return p1 == "PopcornMinigame"
		end
	},
	Preset15 = {
		Type = "CompleteEventMinigame",
		Description = "Complete the Bowling Minigame %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 119 ]]
			return p1 == "BowlingMinigame"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Tickets",
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