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
		end,
		species = function(p1) --[[ species | Line: 27 ]]
			return p1.TaskData.Species
		end,
		minigame = function(p1) --[[ minigame | Line: 30 ]]
			return p1.TaskData.Minigame
		end,
		contest = function(p1) --[[ contest | Line: 33 ]]
			return p1.TaskData.Contest
		end,
		forageable = function(p1) --[[ forageable | Line: 36 ]]
			return p1.TaskData.Forageable
		end,
		interface = function(p1) --[[ interface | Line: 39 ]]
			return p1.TaskData.Interface
		end,
		npc = function(p1) --[[ npc | Line: 42 ]]
			return p1.TaskData.NPC
		end,
		skill = function(p1) --[[ skill | Line: 45 ]]
			return p1.TaskData.Skill
		end,
		tier = function(p1) --[[ tier | Line: 48 ]]
			return p1.TaskData.Tier
		end,
		tool = function(p1) --[[ tool | Line: 51 ]]
			if p1.TaskData.Tool == "Lasso" then
				return "a Lasso"
			end
			if p1.TaskData.Tool == "Food" then
				return "Food"
			else
				return p1.TaskData.Tool
			end
		end
	}
}