-- https://lua.expert/
local t = {
	Preset1 = {
		Type = "Tame",
		Description = "Tame %s Horses",
		Amount = 15,
		Check = function(p1) --[[ Check | Line: 4 ]]
			return p1 == "Horse"
		end
	},
	Preset2 = {
		Type = "HarvestNode",
		Amount = 20
	},
	Preset19 = {
		Type = "Breed",
		Description = "Breed a Akhal Teke %s times",
		Amount = 2,
		Check = function(p1, p2) --[[ Check | Line: 16 ]]
			return if p1 == "AkhalTeke" then true else p2 == "AkhalTeke"
		end
	},
	Preset20 = {
		Type = "Foal",
		Description = "Foal a Akhal Teke %s times",
		Amount = 2,
		Check = function(p1) --[[ Check | Line: 24 ]]
			return p1 == "AkhalTeke"
		end
	}
}
local t2 = {
	RewardId1 = {
		P = 0.6,
		Name = "Leafs",
		Amount = 50
	},
	RewardId2 = {
		P = 0,
		Name = "Leafs",
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
		}
	}
}