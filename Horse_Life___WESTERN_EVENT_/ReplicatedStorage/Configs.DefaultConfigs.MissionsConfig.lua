-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("FormatNumber")
return {
	MaxPinnedTasks = 4,
	MaxPinnedMissions = 4,
	AutoPinWhenNoPinnedMissions = "DailyMissions",
	AutoPinClosestToCompleteMissionIfNoOther = true,
	TypeImages = {
		CatchFish = "rbxassetid://94364100833932"
	},
	PresetDescriptions = {},
	DescriptionTextPlaceholders = {
		amount = function(p1, p2) --[[ amount | Line: 24 | Upvalues: v1 (copy) ]]
			return v1.suffix(p2)
		end
	}
}