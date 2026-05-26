-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Horses",
		Amount = 25,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Horse"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 40
	},
	Preset19 = {
		Type = "Breed",
		Description = "Breed a Anticorn %s times",
		Amount = 5,
		Check = function(p1, p2) --[[ Check | Line: 16 ]]
			return if p1 == "Anticorn" then true else p2 == "Anticorn"
		end
	},
	Preset20 = {
		Type = "Foal",
		Description = "Foal a Anticorn %s times",
		Amount = 5,
		Check = function(p1) --[[ Check | Line: 24 ]]
			return p1 == "Anticorn"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Leafs",
		Amount = 100
	},
	RewardId2 = {
		P = 0,
		Name = "Leafs",
		Amount = 100
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