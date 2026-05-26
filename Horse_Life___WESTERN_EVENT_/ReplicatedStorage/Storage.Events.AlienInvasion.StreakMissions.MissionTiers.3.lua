-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Equenaris",
		Amount = 4,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Equenari"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 30
	},
	Preset4 = {
		Type = "BuyStable",
		Description = "Buy %s Equenaris from the Cosmic Stables",
		Amount = 3,
		Check = function(p1) --[[ Check | Line: 34 ]]
			return p1 == "Event"
		end
	},
	Preset6 = {
		Type = "GetItem",
		Amount = 250,
		Description = "Earn %s Plasma",
		Check = function(p1) --[[ Check | Line: 46 ]]
			return p1 == "Plasma"
		end
	},
	Preset7 = {
		Type = "InteractWorldLore",
		Amount = 4,
		Description = "Interact with %s unique Cosmic Lore Structures in the World"
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Plasma",
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