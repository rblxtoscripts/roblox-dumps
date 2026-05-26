-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DataUtils")
Sonar("AnimalDataService")
local v2 = Sonar("ItemDataService")
local v3 = Sonar("ItemSetService")
local v4 = Sonar("NotificationsService")
local v5 = Sonar("Maid")
local v6 = Sonar("Mission")
local v7 = Sonar("NewMissionsService")
local v8 = Sonar("Signal")
local IsServer = Sonar("Constants").IsServer
local v9 = Sonar("AnalyticsService", "Server")
function t.new(p1) --[[ new | Line: 29 | Upvalues: t (ref), v5 (copy), v8 (copy), v7 (copy), v6 (copy) ]]
	local v2 = setmetatable({}, t)
	if not p1:IsLocalOrServer() then
		return v2
	end
	v2.Player = p1.Player
	v2.UserId = v2.Player.UserId
	v2.PlayerWrapper = p1
	v2.PlayerData = v2.PlayerWrapper.PlayerData
	v2.MissionsFolder = v2.PlayerData.NewMissions
	v2.PlayerWrapper.TaskToKeyMap = {}
	v2.TaskToKeyMap = v2.PlayerWrapper.TaskToKeyMap
	v2.Maid = v2.PlayerWrapper.Maid:GiveTask(v5.new())
	v2.MissionAddedSignal = v2.Maid:GiveTask(v8.new())
	v2.Maid:GiveTask(v2.MissionsFolder.ChildAdded:Connect(function(p1) --[[ Line: 50 | Upvalues: v7 (ref), v6 (ref), v2 (copy) ]]
		if v7.GetMissionData(p1.MissionName.Value) then
			v2.MissionAddedSignal:Fire((v6.new(p1)))
		end
	end))
	v2.PlayerWrapper.NewMissionsWrapper = v2
	for v3, v4 in v2.MissionsFolder:GetChildren() do
		if v7.GetMissionData(v4.MissionName.Value) then
			v6.new(v4)
		end
	end
	return v2
end
function t.CanGiveMission(p1, p2) --[[ CanGiveMission | Line: 77 | Upvalues: v7 (copy) ]]
	local v1 = v7.GetMissionData(p2)
	if not v1 then
		return false
	end
	if v1.AlwaysVisible == true then
		return true
	end
	for v2, v3 in v7.GetRequiredMissions(p2) do
		local v4 = p1:GetMission(v2)
		if not v4 then
			return false
		end
		if not (v4:IsComplete() or v4:GetRepetitions() > 0) then
			return false
		end
	end
	return true
end
function t.GetMission(p1, p2) --[[ GetMission | Line: 102 | Upvalues: v6 (copy) ]]
	return v6.GetMissionForPlayer(p1.Player, p2)
end
function t.GetMissions(p1) --[[ GetMissions | Line: 107 | Upvalues: v6 (copy) ]]
	return v6.GetAllMissionsForPlayer(p1.Player)
end
function t.GetMissionsByType(p1, p2) --[[ GetMissionsByType | Line: 112 ]] end
function t.GetMissionsChangedSignal(p1) --[[ GetMissionsChangedSignal | Line: 117 | Upvalues: v8 (copy), v5 (copy) ]]
	local v1 = v8.new()
	local t = {}
	v1:GiveTask(function() --[[ Line: 121 | Upvalues: t (ref) ]]
		for v1, v2 in t do
			v2:DoCleaning()
		end
		t = {}
	end)
	local function onMissionRemoved(p1) --[[ onMissionRemoved | Line: 128 | Upvalues: t (ref), v1 (copy) ]]
		if t[p1.MissionValue] then
			t[p1.MissionValue]:DoCleaning()
			t[p1.MissionValue] = nil
		end
		v1:Fire(p1)
	end
	local function onMissionAdded(p1) --[[ onMissionAdded | Line: 136 | Upvalues: v5 (ref), t (ref), v1 (copy), onMissionRemoved (copy) ]]
		local v12 = v5.new()
		t[p1.MissionValue] = v12
		v12:GiveTask(p1:GetChangedSignal():Connect(function() --[[ Line: 140 | Upvalues: v1 (ref), p1 (copy) ]]
			v1:Fire(p1)
		end))
		v12:GiveTask(p1:GetRemovedSignal():Connect(onMissionRemoved))
		v1:Fire(p1)
	end
	v1:GiveTask(p1.MissionAddedSignal:Connect(onMissionAdded))
	for v2, v3 in p1:GetMissions() do
		onMissionAdded(v3)
	end
	return v1
end
function t.IncrementMission(p1, p2, p3) --[[ IncrementMission | Line: 157 ]]
	local v1 = false
	for v3, v4 in p1.TaskToKeyMap[p2] or {} do
		if v4:Increment(p3) then
			v1 = true
		end
	end
	return v1
end
function t.ClaimMission(p1, p2) --[[ ClaimMission | Line: 168 | Upvalues: v6 (copy) ]]
	local v1 = v6.GetMissionForPlayer(p1.Player, p2.MissionId)
	if v1 then
		return v1:Claim()
	end
end
function t.GiveRewards(p1, p2) --[[ GiveRewards | Line: 177 | Upvalues: v3 (copy), v9 (copy), v4 (copy), v2 (copy) ]]
	local v1 = p2:GetReward()
	local v22 = nil
	if not v1 then
		return
	end
	local v32 = (if v22 then v22 else p2.PlayerWrapper) or p2.Mission.PlayerWrapper
	if not v32 then
		return
	end
	local v42 = v32
	for v5, v6 in v1 do
		if if v6.RewardType == "Species" then true else false then
			local t = {}
			for v92, v10 in v6.ExtraData do
				if v92 ~= "DefaultToRewardsIfAlreadyOwned" and v92 ~= "Rewards" then
					if v92 == "Presets" then
						v92 = "Preset"
					end
					t[v92] = v10
				end
			end
			local v11 = v3:_giveHorse(v42, t)
			if v11 then
				v9.ReportResourceEvent(v42.Player, "Source", "HorseSlot", v11.Species.Value, "MissionReward", 1)
				v4.NotifyPlayer(v42.Player, "TamingSuccess", v11.Name, true)
			end
			continue
		end
		if v2.GetByName(v6.Name) then
			local t = {
				IgnoreLimit = true,
				Name = v6.Name,
				Amount = v6.Amount or 1
			}
			t.Source = if p2.TaskId then "TaskCompleted" else "MissionCompleted"
			v42:GiveItem(t)
		end
	end
end
function t.GetMissionsInOrderOfProgress(p1, p2) --[[ GetMissionsInOrderOfProgress | Line: 229 ]]
	local v2 = p2 or {}
	local v3 = v2.Missions or p1:GetMissions()
	local t = {}
	if typeof(v3) == "table" then
		for v4, v5 in v3 do
			if typeof(v5) == "table" and v5.GetGoalProgress then
				table.insert(t, v5)
			end
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 242 | Upvalues: v2 (ref) ]]
		if v2.Reverse then
			return p1:GetGoalProgress() > p2:GetGoalProgress()
		else
			return p1:GetGoalProgress() < p2:GetGoalProgress()
		end
	end)
	return t
end
function t.GiveMission(p1, p2) --[[ GiveMission | Line: 253 | Upvalues: IsServer (copy), v1 (copy) ]]
	if not IsServer then
		return
	end
	local v12 = p1:GetMission(p2)
	if v12 then
		v12:_reconcileTasks()
		return v12
	end
	if p1:CanGiveMission(p2) then
		local v2 = v1.CreateIndexedDataValue(p1.MissionsFolder, {
			DataValueName = "NewMissions"
		})
		v2.MissionName.Value = p2
		v2.Parent = p1.MissionsFolder
		return p1:GetMission(p2)
	end
end
return t