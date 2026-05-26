-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
require(ReplicatedStorage:WaitForChild("Sonar"))
return {
	EpicMissionTrackOne = {
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 13 ]]
					return p1 == "Horse"
				end
			},
			Mission2 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 21 ]]
					return p1 == "Horse"
				end
			},
			Mission3 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 29 ]]
					return p1 == "Horse"
				end
			},
			Mission4 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 37 ]]
					return p1 == "Horse"
				end
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "RandomEquipment",
				Theme = { "Frozen", "Candycane" }
			}
		}
	},
	EpicMissionTrackTwo = {
		Missions = {
			Mission1 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 58 ]]
					return p1 == "Horse"
				end
			},
			Mission2 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 66 ]]
					return p1 == "Horse"
				end
			},
			Mission3 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 74 ]]
					return p1 == "Horse"
				end
			},
			Mission4 = {
				Type = "Tame",
				Description = "Tame %s Horse",
				Amount = 25,
				Check = function(p1) --[[ Check | Line: 82 ]]
					return p1 == "Horse"
				end
			}
		},
		Rewards = {
			{
				Amount = 1,
				Name = "RandomEquipment",
				Theme = { "Frozen", "Candycane" }
			}
		}
	}
}