-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Horses",
		Amount = 20,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Horse"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 30
	},
	Preset19 = {
		Type = "Breed",
		Description = "Breed a Felorse %s times",
		Amount = 4,
		Check = function(p1, p2) --[[ Check | Line: 16 ]]
			return if p1 == "Felorse" then true else p2 == "Felorse"
		end
	},
	Preset20 = {
		Type = "Foal",
		Description = "Foal a Felorse %s times",
		Amount = 4,
		Check = function(p1) --[[ Check | Line: 24 ]]
			return p1 == "Felorse"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Leafs",
		Amount = 75
	},
	RewardId2 = {
		P = 0,
		Name = "Leafs",
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
		}
	}
}