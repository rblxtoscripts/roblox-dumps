-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("CommunityGoal")
local v2 = Sonar("Signal")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("InstanceUtils")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("RemoteUtils")
local v7 = Sonar("MessagingService", "Server")
local v8 = Sonar("EventUtils")
local v9 = Sonar("DataUpdateService", "Server")
local v10 = Sonar("GamebeastUtils", {
	Context = "Server"
})
local v11 = Sonar("RateLimiter")
local IS_SERVER = Sonar("Constants").IS_SERVER
local v12 = v3.GetConfig("CommunityGoal")()
local v13 = v3.Get("CommunityGoals")()
local function _decodeJSON(p1) --[[ _decodeJSON | Line: 83 | Upvalues: HttpService (copy) ]]
	if not p1 or p1 == "" then
		return {}
	end
	local v1, v2 = pcall(HttpService.JSONDecode, HttpService, p1)
	return if v1 and v2 then v2 else {}
end
local function _encodeJSON(p1) --[[ _encodeJSON | Line: 91 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(HttpService.JSONEncode, HttpService, p1)
	return if v1 and v2 then v2 else "{}"
end
local t2 = {}
local t3 = {}
local v14 = v2.new()
local v15 = nil
local v16 = v11.new({
	Run = function(p1, p2) --[[ Run | Line: 103 | Upvalues: v7 (copy), v12 (copy) ]]
		v7.Publish(v12.MessagingServiceTopic, {
			GoalName = p1,
			Contribution = p2,
			JobId = game.JobId
		})
	end,
	Limit = v12.ContributionPublishTokens or 10,
	Rate = v12.ContributionPublishRefillRate or 1
})
function t.GetRemoteConfigurations() --[[ GetRemoteConfigurations | Line: 114 | Upvalues: v13 (copy) ]]
	return v13
end
function t.AddGoal(p1, p2) --[[ AddGoal | Line: 118 | Upvalues: t2 (copy), IS_SERVER (copy), v1 (copy), v15 (ref), v12 (copy), t3 (copy), v14 (copy) ]]
	if t2[p1] then
		warn("\226\154\160\239\184\143 CommunityGoalService, Goal already exists:", p1)
		return t2[p1]
	end
	local v13 = if IS_SERVER then v1.new(p1, p2, v15, v12) else v1.fromReplication(p1, v15)
	t2[p1] = v13
	local Type = v13.Config.Type
	if Type then
		if not t3[Type] then
			t3[Type] = {}
		end
		t3[Type][#t3[Type] + 1] = v13
	end
	v14:Fire(v13)
	return v13
end
function t.GetGoal(p1) --[[ GetGoal | Line: 146 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.GetGoals() --[[ GetGoals | Line: 150 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetGoalsByType(p1) --[[ GetGoalsByType | Line: 154 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.IsGoalCompleted(p1) --[[ IsGoalCompleted | Line: 158 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1]
	if v1 then
		return v1:IsCompleted()
	else
		return true
	end
end
function t.GetGoalAddedSignal(p1) --[[ GetGoalAddedSignal | Line: 166 | Upvalues: v2 (copy), v14 (copy) ]]
	local v1 = v2.new()
	v1:GiveTask(v14:Connect(function(p12) --[[ Line: 169 | Upvalues: p1 (copy), v1 (copy) ]]
		if p12.Name ~= p1 then
			return
		end
		v1:Fire(p12)
	end))
	return v1
end
function t.OnGoalAdded(p1, p2) --[[ OnGoalAdded | Line: 178 | Upvalues: t (copy) ]]
	local v1 = t.GetGoalAddedSignal(p1)
	v1:Connect(p2)
	local v2 = t.GetGoal(p1)
	if not v2 then
		return v1
	end
	p2(v2)
	return v1
end
function t.CanClaimCommunityGoalMilestoneReward(p1, p2, p3) --[[ CanClaimCommunityGoalMilestoneReward | Line: 190 | Upvalues: t (copy), _decodeJSON (copy) ]]
	local v1 = t.GetGoal(p2)
	if not v1 then
		return "GoalNotFound"
	end
	local v2 = v1:GetMilestone(p3)
	if not v2 then
		return "MilestoneNotFound"
	end
	if not v1:IsMilestoneCompleted(p3) then
		return "MilestoneNotReached"
	end
	local v3 = p1:_getGoalFolder(p2)
	if not v3 then
		return "GoalNotFound"
	end
	local ContributedMilestones = v3:FindFirstChild("ContributedMilestones")
	local v4 = if ContributedMilestones then _decodeJSON(ContributedMilestones.Value) or {} else {}
	local v5 = tostring(p3)
	if not v4[v5] then
		return "NotContributed"
	end
	local ClaimedMilestones = v3:FindFirstChild("ClaimedMilestones")
	if (v3:FindFirstChild("ClaimedMilestones") and _decodeJSON(ClaimedMilestones.Value) or {})[v5] then
		return "AlreadyClaimed"
	end
	if not v1.Config.CanClaim then
		return true
	end
	local v7 = v1.Config.CanClaim(p1, v1, v2)
	if v7 == true then
		return true
	else
		return v7 or "CustomCheckFailed"
	end
end
function t.ClaimCommunityGoalMilestoneReward(p1, p2, p3) --[[ ClaimCommunityGoalMilestoneReward | Line: 233 | Upvalues: IS_SERVER (copy), t (copy), _decodeJSON (copy), HttpService (copy), v12 (copy) ]]
	if not IS_SERVER then
		return false
	end
	if t.CanClaimCommunityGoalMilestoneReward(p1, p2, p3) ~= true then
		return false
	end
	local v1 = t.GetGoal(p2)
	local v2 = v1:GetMilestone(p3)
	local v3 = p1:_getGoalFolder(p2)
	if not v3 then
		return false
	end
	local ClaimedMilestones = v3:FindFirstChild("ClaimedMilestones")
	if not ClaimedMilestones then
		return false
	end
	local v4 = _decodeJSON(ClaimedMilestones.Value)
	v4[tostring(p3)] = true
	local v5, v6 = pcall(HttpService.JSONEncode, HttpService, v4)
	ClaimedMilestones.Value = if v5 and v6 then v6 else "{}"
	if v2.Rewards then
		p1:GiveItems({
			Items = v2.Rewards,
			AnalyticsSource = v12.AnalyticsSource or "CommunityGoal"
		})
	end
	if v2.OnClaim then
		task.spawn(v2.OnClaim, p1, v1, v2)
	end
	if v12.OnMilestoneClaimed then
		task.spawn(v12.OnMilestoneClaimed, p1, v1, v2)
	end
	if p1.CommunityGoalMilestoneClaimedSignal then
		p1.CommunityGoalMilestoneClaimedSignal:Fire(p2, p3)
	end
	if not p1.CommunityGoalMilestoneStateChangedSignal then
		return true
	end
	p1.CommunityGoalMilestoneStateChangedSignal:Fire(p2, p3, "Claimed")
	return true
end
function t.RequestToClaimCommunityGoalMilestoneReward(p1, p2) --[[ RequestToClaimCommunityGoalMilestoneReward | Line: 287 | Upvalues: v6 (copy) ]]
	return v6.GetRemoteFunction("ClaimCommunityGoalMilestoneRemote"):InvokeServer(p1, p2)
end
function t._publishContribution(p1, p2) --[[ _publishContribution | Line: 291 | Upvalues: IS_SERVER (copy), v16 (copy) ]]
	if IS_SERVER then
		v16(p1, p2)
	end
end
function t._publishMilestoneCompleted(p1, p2) --[[ _publishMilestoneCompleted | Line: 298 | Upvalues: IS_SERVER (copy), v7 (copy), v12 (copy) ]]
	if IS_SERVER then
		v7.Publish(v12.MessagingServiceTopic, {
			GoalName = p1,
			MilestoneCompleted = p2,
			JobId = game.JobId
		})
	end
end
function t.Init(p1) --[[ Init | Line: 309 | Upvalues: v15 (ref), v4 (copy), ReplicatedStorage (copy), v5 (copy), IS_SERVER (copy), v7 (copy), v12 (copy), t2 (copy), v8 (copy), v10 (copy), v13 (copy), v6 (copy), t (copy), v9 (copy) ]]
	v15 = v4.Create("Configuration", {
		Name = "CommunityGoalsReplication",
		Parent = ReplicatedStorage
	}, true)
	if not v5.IsWrapperInitialising("CommunityGoalWrapper") then
		warn("\226\154\160\239\184\143 CommunityGoalService, CommunityGoalWrapper not found in PlayerWrapperConfig, try adding it to the PlayerWrapperConfig/Shared")
	end
	if IS_SERVER then
		v7.Subscribe(v12.MessagingServiceTopic, function(p1) --[[ Line: 320 | Upvalues: t2 (ref) ]]
			local v1 = p1.Data or p1
			if type(v1) ~= "table" then
				return
			end
			if v1.JobId == game.JobId then
				return
			end
			local v2 = t2[v1.GoalName]
			if not v2 then
				return
			end
			if v1.Contribution then
				v2:_onContributionReceived(v1.Contribution)
			end
			if not v1.MilestoneCompleted then
				return
			end
			v2:_onMilestoneCompleted(v1.MilestoneCompleted)
		end)
		v8.spawnLoop(function() --[[ Line: 344 | Upvalues: v12 (ref), t2 (ref) ]]
			local v1 = v12.SyncStagger or 0
			for v2, v3 in t2 do
				local v4, v5 = v3:_syncToMemoryStore()
				if v4 then
					v3:_onProgressReceived(v4)
				end
				if v5 then
					v3:_onMilestonesReceived(v5)
				end
				if v1 > 0 then
					task.wait(v1)
				end
			end
		end, v12.SyncInterval)
		v10.ObserveOverride(v13, v12.GamebeastConfigKey)
		v6.GetRemoteFunction("ClaimCommunityGoalMilestoneRemote").OnServerInvoke = function(p1, p2, p3) --[[ Line: 362 | Upvalues: v5 (ref), t (ref) ]]
			local v1 = v5.getWrapperFromPlayer(p1)
			if not v1 then
				return
			end
			local v2 = t.CanClaimCommunityGoalMilestoneReward(v1, p2, p3)
			if v2 == true then
				return t.ClaimCommunityGoalMilestoneReward(v1, p2, p3)
			else
				return v2
			end
		end
		game:BindToClose(function() --[[ Line: 376 | Upvalues: t2 (ref) ]]
			for v1, v2 in t2 do
				if v2.LocalProgress > 0 then
					v2:_syncToMemoryStore()
				end
			end
		end)
	end
	for v1 in v13 do
		t.AddGoal(v1)
	end
	if not IS_SERVER then
		return
	end
	v9.AddRigDataCallback(function(p1) --[[ Line: 391 | Upvalues: v4 (ref), t (ref) ]]
		local CommunityGoals = p1:FindFirstChild("CommunityGoals")
		if not CommunityGoals then
			CommunityGoals = v4.Create("Folder", {
				Name = "CommunityGoals",
				Parent = p1
			})
		end
		for v2 in t.GetGoals() do
			local v3 = CommunityGoals:FindFirstChild(v2)
			if not v3 then
				v3 = v4.Create("Folder", {
					Name = v2,
					Parent = CommunityGoals
				})
			end
			if not v3:FindFirstChild("Contribution") then
				v4.Create("NumberValue", {
					Name = "Contribution",
					Value = 0,
					Parent = v3
				})
			end
			if not v3:FindFirstChild("ContributedMilestones") then
				v4.Create("StringValue", {
					Name = "ContributedMilestones",
					Value = "{}",
					Parent = v3
				})
			end
			if not v3:FindFirstChild("ClaimedMilestones") then
				v4.Create("StringValue", {
					Name = "ClaimedMilestones",
					Value = "{}",
					Parent = v3
				})
			end
		end
	end)
end
t:Init()
return t