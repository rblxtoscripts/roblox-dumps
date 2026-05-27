-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Horses",
		Amount = 10,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Horse"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 10
	},
	Preset19 = {
		Type = "Breed",
		Description = "Breed a Clydesdale %s times",
		Amount = 1,
		Check = function(p1, p2) --[[ Check | Line: 16 ]]
			return if p1 == "Clydesdale" then true else p2 == "Clydesdale"
		end
	},
	Preset20 = {
		Type = "Foal",
		Description = "Foal a Clydesdale %s times",
		Amount = 1,
		Check = function(p1) --[[ Check | Line: 24 ]]
			return p1 == "Clydesdale"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Leafs",
		Amount = 25
	},
	RewardId2 = {
		P = 0,
		Name = "Leafs",
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
		}
	}
}