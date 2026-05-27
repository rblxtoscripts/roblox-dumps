-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("UnlockSequenceService")
local t2 = {
	{
		RequiredPoints = 10,
		Rewards = {
			Coins = 100
		}
	},
	{
		RequiredPoints = 15,
		Rewards = {
			Coins = 100
		}
	},
	{
		RequiredPoints = 15,
		Rewards = {
			Coins = 100
		}
	},
	{
		RequiredPoints = 20,
		Rewards = {
			Coins = 100
		}
	},
	{
		RequiredPoints = 20,
		MaxCompletions = (1 / 0),
		Rewards = {
			Coins = 100
		}
	}
}
local v2 = Sonar("MissionsService").GetMissionData("DailyMissions")
function t.GetDailyMissionRewards(p1) --[[ GetDailyMissionRewards | Line: 37 ]]
	return p1.DailyMissionRewards
end
function t.Init(p1) --[[ Init | Line: 41 | Upvalues: v1 (copy), t2 (copy), v2 (copy) ]]
	p1.DailyMissionRewards = v1.AddSequence("DailyMissions", {
		ClaimInOrder = false,
		RequiredPointsDataValue = "DailyMissionRewardPoints",
		Tiers = t2,
		Refresh = {
			TimeSeed = v2.TimeSeed
		},
		Data = function(p1, p2) --[[ Data | Line: 53 ]]
			local PlayerData = p2.PlayerData
			if PlayerData then
				return PlayerData.DailyMissionRewards
			end
		end
	})
end
t:Init()
return t