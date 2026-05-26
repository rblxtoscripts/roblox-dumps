-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("EventUtils")
local v2 = Sonar("FormatTime")
local v3 = Sonar("MarketplaceUtils")
local v4 = Sonar("Mission", {
	Deferred = true
})
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("StorageUtils")
local v8 = Sonar("Constants")
local IsServer = v8.IsServer
local IsStudio = v8.IsStudio
local t2 = {}
local v9 = v7.GetConfig("Events")()
local v10 = v9.Event
local v11 = v6.GetRemoteFunction("ReplayEventMission")
local v12 = v6.GetRemoteFunction("SkipEventMission")
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
function t.GetAllMissions() --[[ GetAllMissions | Line: 39 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetMissionData(p1) --[[ GetMissionData | Line: 44 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.GetRequiredMissions(p1) --[[ GetRequiredMissions | Line: 49 | Upvalues: t (copy) ]]
	local v1 = t.GetMissionData(p1)
	local t2 = {}
	for v3, v4 in if v1 and v1.RequiredMissions then v1.RequiredMissions else {} do
		t2[v4] = t.GetMissionData(v4)
	end
	return t2
end
function t.GetTasksFromMissionValue(p1) --[[ GetTasksFromMissionValue | Line: 67 ]]
	local t = {}
	for v1, v2 in p1:GetChildren() do
		if tonumber(v2.Name) then
			table.insert(t, v2)
		end
	end
	return t
end
function t._setupMissions(p1) --[[ _setupMissions | Line: 84 | Upvalues: Sonar (copy), v7 (copy), v9 (copy), v10 (copy), t2 (copy), IsStudio (copy), IsServer (copy) ]]
	local v1 = Sonar(v7.Get("NewNewMissions"))
	local v2 = v9.EventsData[v10]
	for v4, v5 in { if v2 then v2.Missions or nil else nil, v1 } do
		for v6, v72 in v5 do
			if v6 ~= "Metadata" then
				t2[v6] = v72
			end
		end
	end
	if not (IsStudio and IsServer) then
		return
	end
	print("\240\159\151\146\239\184\143 MissionsService, All missions:")
	print(t2)
end
function t._setupMissionsWatcher(p1) --[[ _setupMissionsWatcher | Line: 106 | Upvalues: IsServer (copy), v1 (copy), v4 (copy), v2 (copy) ]]
	if IsServer then
		v1.spawnLoop(function() --[[ Line: 111 | Upvalues: v4 (ref), v2 (ref) ]]
			for v1, v22 in v4.GetAllMissions() do
				local v3 = v1.Value
				local v42 = v2.GetTime()
				local v5 = v22:IsExpired()
				local v6 = nil or true
				if (if v6 then if v3 <= v42 then true else false else v6) and v3 ~= 0 then
					v22:Reset()
				elseif v5 then
					v22:SetExpired(true)
				end
				for v8, v9 in v22:GetTasks() do
					if v9.TaskData.Type == "Playtime" then
						v9:Increment({
							Type = "Playtime",
							Amount = 1
						})
					end
				end
			end
		end, 1)
	end
end
function t._setupPlayerWrappers(p1) --[[ _setupPlayerWrappers | Line: 144 | Upvalues: IsServer (copy), v5 (copy), t (copy), t5 (copy), t6 (copy) ]]
	if IsServer then
		v5.bindToPlayers(function(p1) --[[ Line: 149 | Upvalues: v5 (ref), t (ref) ]]
			local v1 = v5.getWrapperFromPlayer(p1)
			for v2, v3 in t.GetAllMissions() do
				local v4 = v3.Name
				if not v3.TemplateMission then
					if not v4 then
						warn(v3)
					end
					v1.NewMissionsWrapper:GiveMission(v4)
				end
			end
		end, function(p1) --[[ Line: 166 | Upvalues: t5 (ref), t6 (ref) ]]
			t5[p1.UserId] = nil
			t6[p1.UserId] = nil
		end)
	end
end
function t.RequestToClaimMission(p1) --[[ RequestToClaimMission | Line: 173 | Upvalues: v6 (copy) ]]
	return v6.GetRemoteEvent("ClaimNewMission"):FireServer(p1)
end
function t._setupRemotes(p1) --[[ _setupRemotes | Line: 180 | Upvalues: IsServer (copy), v6 (copy), v5 (copy), v11 (copy), t (copy), v4 (copy), t5 (copy), v3 (copy), v12 (copy), t6 (copy) ]]
	if IsServer then
		v6.GetRemoteEvent("ClaimNewMission").OnServerEvent:Connect(function(p1, p2) --[[ Line: 185 | Upvalues: v5 (ref) ]]
			local v1 = v5.getWrapperFromPlayer(p1)
			if v1 then
				v1.NewMissionsWrapper:ClaimMission(p2)
			end
		end)
		function v11.OnServerInvoke(p1, p2) --[[ Line: 196 | Upvalues: t (ref), v4 (ref), t5 (ref) ]]
			local v1 = t.GetMissionData(p2)
			local UserId = p1.UserId
			if not (v1 and v1.Replayable) then
				return
			end
			local v2 = v4.GetMissionForPlayer(p1, p2)
			if v2 and v2:IsClaimed() then
				t5[UserId] = p2
				return true
			end
		end
		v3.AddProductHandler("ReplayEventMission", function(p1, p2) --[[ Line: 215 | Upvalues: t5 (ref), t (ref), v4 (ref) ]]
			local v1 = t5[p1.Player.UserId]
			local v2 = t.GetMissionData(v1)
			if not (if v2 then v2.Replayable else v2) then
				return
			end
			local v42 = v4.GetMissionForPlayer(p1.Player, v1)
			if v42 and v42:IsClaimed() then
				v42:Replay()
				return {
					ItemType = "ReplayEventMission",
					ItemId = v1
				}
			end
		end)
		function v12.OnServerInvoke(p1, p2) --[[ Line: 239 | Upvalues: t (ref), v4 (ref), t6 (ref) ]]
			local v1 = t.GetMissionData(p2)
			local v2 = t.GetMissionData(p2) and v1.MissionTier or nil
			local UserId = p1.UserId
			if typeof(v2) ~= "number" or not (v2 > 0 and v2 <= 2) then
				return
			end
			local v3 = v4.GetMissionForPlayer(p1, p2)
			if v3 and not v3:IsClaimed() then
				t6[UserId] = p2
				return true
			end
		end
		v3.AddProductHandler("SkipEventMission", function(p1, p2) --[[ Line: 259 | Upvalues: t6 (ref), v4 (ref) ]]
			local UserId = p1.Player.UserId
			local v1 = t6[UserId]
			if not v1 then
				return
			end
			local v2 = v4.GetMissionForPlayer(p1.Player, v1)
			local v3 = v4.GetMissionForPlayer(p1.Player, v1) and v2.MissionData.MissionTier or nil
			if not v2 or typeof(v3) ~= "number" then
				return
			end
			if p2.MissionTier ~= v3 then
				return
			end
			if v2:IsClaimed() then
				return
			end
			for v42, v5 in v2:GetTasks() do
				v5:SetValue(v5:GetGoalAmount())
			end
			v2:Claim()
			t6[UserId] = nil
			return {
				ItemType = "SkipEventMission",
				ItemId = v1
			}
		end)
		v3.AddProductHandler("ResetEventMission", function(p1, p2) --[[ Line: 294 | Upvalues: v5 (ref), t6 (ref) ]]
			local v1 = v5.getWrapperFromPlayer(p1.Player)
			if not v1 then
				return false
			end
			local v3 = getEventMissionData(v1, t6[p1.Player])
			if not v3 then
				return false
			end
			if not v3.Claimed.Value then
				return false
			end
			v3.Completed.Value = false
			v3.Claimed.Value = false
			if v3:FindFirstChild("CompletedAt") then
				v3.CompletedAt.Value = 0
			end
			local CompletedCount = v3:FindFirstChild("CompletedCount")
			if CompletedCount and CompletedCount.Value == 0 then
				CompletedCount.Value = 1
			end
			for v4, v52 in v3.Missions:GetChildren() do
				v52.Value = false
				v52.Amount.Value = 0
			end
			return {
				ItemType = p2.Currency,
				ItemId = p2.Amount
			}
		end)
	end
end
function t.Init(p1) --[[ Init | Line: 334 | Upvalues: t (copy), t3 (copy), t4 (copy) ]]
	p1:_setupMissions()
	p1:_setupMissionsWatcher()
	p1:_setupPlayerWrappers()
	p1:_setupRemotes()
	t.GlobalMissionCompletedCallbacks = t3
	t.GlobalTaskCompletedCallbacks = t4
end
t:Init()
return t