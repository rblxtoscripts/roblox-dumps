-- https://lua.expert/
local t = {
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Winter Horses from the Festive Stables",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 34 ]]
			return p1 == "Event"
		end
	},
	Preset5 = {
		Type = "CompleteEventMinigame",
		Description = "Complete %s Event Minigames",
		Amount = 7
	},
	Preset6 = {
		Type = "GetItem",
		Amount = 250,
		Description = "Earn %s Stars",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Stars"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 4,
		Description = "Interact with unique world lore %s times"
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Stars",
		Amount = 75
	},
	RewardId2 = {
		P = 0,
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
		},
		{
			MissionsByType = t,
			Rewards = t2
		}
	}
}