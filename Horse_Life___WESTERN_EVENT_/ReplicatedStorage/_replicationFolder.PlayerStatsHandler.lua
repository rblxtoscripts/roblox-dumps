-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("EventUtils")
local v3 = Sonar("SpeciesUpgradeService")
local v4 = Sonar("StorageUtils")
Sonar("Constants")
local v5 = Sonar(v4.Get("SpeciesUpgrades"))
local t2 = {}
local t3 = {}
function t.new(p1) --[[ new | Line: 27 | Upvalues: t (copy), v1 (copy), v3 (copy), t3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	if v1 or p1.PlayerData then
		v2.PlayerData = p1.PlayerData
		v2.PlayerStatsData = p1.PlayerData.Stats
		v2.LeaderboardStatsData = p1.PlayerData.LeaderboardStats
	end
	v2.SpeciesUpgradeService = v3.new(p1)
	if v1 then
		v2.LeaderstatsFolder = Instance.new("Folder")
		v2.LeaderstatsFolder.Name = "ReplicatedStats"
		v2.LeaderstatsFolder.Parent = v2.Player
		v2.Maid:GiveTask(v2.LeaderstatsFolder)
		v2.Leaderstats = { "Tames", "FoalsBorn" }
		for k, v in pairs(v2.Leaderstats) do
			local v32 = Instance.new("IntValue")
			v32.Name = v
			v2.Maid:GiveTask(v2:GetStatValue(v):GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 57 | Upvalues: v32 (copy), v2 (copy), v (copy) ]]
				v32.Value = v2:GetStatValue(v).Value
			end))
			v32.Value = v2:GetStatValue(v).Value
			v32.Parent = v2.LeaderstatsFolder
		end
		v2.LastPlayTimeSet = tick()
		v2.LastPlayTimeValueIndex = 0
		v2.PlayTimeLeaderboardData = v2:GetLeaderboardStatValue("PlayTime")
		v2.PlayTimeStatValues = { v2:GetStatValue("PlayTime"), v2.PlayTimeLeaderboardData.Daily.Stat, v2.PlayTimeLeaderboardData.Weekly.Stat }
	else
		v2.LeaderstatsFolder = v2.Player:WaitForChild("ReplicatedStats")
	end
	for k, v in pairs(t) do
		if type(v) == "function" and not p1[k] then
			p1[k] = function(p1, ...) --[[ Line: 84 | Upvalues: v (copy), v2 (copy) ]]
				return v(v2, ...)
			end
		end
	end
	t3[v2] = true
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 94 | Upvalues: t3 (copy) ]]
	t3[p1] = nil
	setmetatable(p1, nil)
	table.clear(p1)
end
function t.GetStatValue(p1, p2) --[[ GetStatValue | Line: 100 ]]
	return p1.PlayerStatsData:FindFirstChild(p2)
end
function t.GetLeaderboardStatValue(p1, p2) --[[ GetLeaderboardStatValue | Line: 104 ]]
	return p1.LeaderboardStatsData:FindFirstChild(p2)
end
function t.IncrementStat(p1, p2) --[[ IncrementStat | Line: 108 | Upvalues: t2 (copy) ]]
	local v1 = p1:GetStatValue(p2.Type)
	if v1 then
		local v2 = t2[p2.Type]
		if v2 then
			v1.Value = v2(p1)
		else
			v1.Value = v1.Value + p2.Amount
		end
	end
	local v3 = p1.PlayerData.BreedContest:FindFirstChild(p2.Type)
	if v3 then
		v3.Value = v3.Value + p2.Amount
	end
	p1:IncrementLeaderboardStat(p2)
end
function t.IncrementLeaderboardStat(p1, p2) --[[ IncrementLeaderboardStat | Line: 127 ]]
	local v1 = p1:GetLeaderboardStatValue(p2.Type)
	if not v1 then
		return
	end
	for k, v in pairs(v1:GetChildren()) do
		local Stat = v.Stat
		Stat.Value = Stat.Value + p2.Amount
	end
end
function t.IncrementSpeciesUpgrade(p1, p2, p3) --[[ IncrementSpeciesUpgrade | Line: 136 | Upvalues: v5 (copy) ]]
	local v1 = p1.SpeciesUpgradeService:GetSpeciesUpgradesData(p2)
	if not v1 then
		return
	end
	local v2 = v5[p2]
	if not v2 then
		return
	end
	local v3 = v2[p3]
	if not v3 then
		return
	end
	local v4 = v1[p3].Value
	if v4 < #v3 then
		v1[p3].Value = v4 + 1
		return true, v1[p3].Value
	else
		return false, v4
	end
end
function t.Init(p1) --[[ Init | Line: 157 | Upvalues: v1 (copy), v2 (copy), t3 (copy) ]]
	if not v1 then
		return
	end
	v2.spawnLoop(function() --[[ Line: 159 | Upvalues: t3 (ref) ]]
		for k, v in pairs(t3) do
			if k.LastPlayTimeSet and tick() - k.LastPlayTimeSet > 10 then
				k.LastPlayTimeSet = tick()
				k:IncrementStat({
					Type = "PlayTime",
					Amount = 10
				})
				k.PlayerWrapper:IncrementMission({
					Type = "Playtime",
					Amount = 10
				})
			end
		end
	end, 5)
end
t:Init()
return t