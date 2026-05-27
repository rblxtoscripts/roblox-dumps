-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Signal")
local v2 = Sonar("TableUtils")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("InstanceUtils")
local v5 = Sonar("CommunityGoalService", {
	Deferred = true
})
local v6 = Sonar("GamebeastUtils", {
	Context = "Server"
})
local v7 = Sonar("Constants")
local IS_SERVER = v7.IS_SERVER
local IS_STUDIO = v7.IS_STUDIO
local v8 = v3.Get("CommunityGoals")()
function t.new(p1, p2, p3, p4) --[[ new | Line: 77 | Upvalues: t (copy), v8 (copy), v2 (copy), v1 (copy), IS_SERVER (copy), Sonar (copy), v4 (copy), v6 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Name = p1
	v22._goalConfigOverride = p2
	v22.Config = v2.Merge(v8[p1] or {}, if p2 then p2 else {})
	v22.Progress = 0
	v22.DisplayProgress = 0
	v22.Initialised = false
	v22.CompletedMilestones = {}
	v22.RecentContributions = {}
	v22.InitialisedSignal = v1.new()
	v22.ActiveChangedSignal = v1.new()
	v22.ProgressChangedSignal = v1.new()
	v22.MilestoneReachedSignal = v1.new()
	v22.GoalCompletedSignal = v1.new()
	v22.ContributionAddedSignal = v1.new()
	if IS_SERVER then
		local v52 = Sonar("MemoryStore", "Server")
		v22.LocalProgress = 0
		v22._memoryStore = v52.new(p4.MemoryStoreName, {
			HashMap = true,
			Expiration = p4.MemoryStoreExpiration
		})
		v22._serviceConfig = p4
		v22._replicatedSlots = {}
		v22._contributionIndex = 0
		v22.ReplicationInstance = Instance.new("Configuration")
		v22.ReplicationInstance.Name = p1
		v22.ReplicationInstance.Parent = p3
		v22._contributionsFolder = v4.Create("Folder", {
			Name = "RecentContributions",
			Parent = v22.ReplicationInstance
		})
		v22:_replicateState()
		v22:_loadInitialProgress()
		v6.GetOverrideChangedSignal(p4.GamebeastConfigKey):Connect(function() --[[ Line: 122 | Upvalues: v5 (ref), p1 (copy), v22 (copy) ]]
			local v1 = v5.GetRemoteConfigurations()[p1]
			if not v1 then
				return
			end
			if v1.Target and v1.Target ~= v22.Config.Target then
				v22:SetTarget(v1.Target)
			end
			if v1.Active == nil or v1.Active == v22:IsActive() then
				return
			end
			v22:SetActive(v1.Active)
		end)
	end
	return v22
end
function t.fromReplication(p1, p2) --[[ fromReplication | Line: 140 | Upvalues: t (copy), v8 (copy), HttpService (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Name = p1
	v2.Config = v8[p1] or {}
	local v4 = p2:WaitForChild(p1)
	v2.ReplicationInstance = v4
	v2.Progress = v4:GetAttribute("Progress") or 0
	v2.Initialised = v4:GetAttribute("Initialised") == true
	v2.CompletedMilestones = {}
	local v7, v82 = pcall(HttpService.JSONDecode, HttpService, v4:GetAttribute("CompletedMilestones") or "[]")
	if v7 and type(v82) == "table" then
		for v9, v10 in v82 do
			v2.CompletedMilestones[v10] = true
		end
	end
	v2.RecentContributions = {}
	v2.InitialisedSignal = v1.new()
	v2.ActiveChangedSignal = v1.new()
	v2.ProgressChangedSignal = v1.new()
	v2.MilestoneReachedSignal = v1.new()
	v2.GoalCompletedSignal = v1.new()
	v2.ContributionAddedSignal = v1.new()
	if v2.Initialised then
		v2.InitialisedSignal:Fire(true)
	end
	v4:GetAttributeChangedSignal("Initialised"):Connect(function() --[[ Line: 173 | Upvalues: v4 (copy), v2 (copy) ]]
		local v1 = v4:GetAttribute("Initialised") == true
		if v1 and not v2.Initialised then
			v2.Initialised = true
			v2.InitialisedSignal:Fire(true)
			return
		end
		if v1 then
			return
		end
		v2.Initialised = false
	end)
	v4:GetAttributeChangedSignal("Active"):Connect(function() --[[ Line: 183 | Upvalues: v4 (copy), v2 (copy) ]]
		v2.ActiveChangedSignal:Fire(v4:GetAttribute("Active") == true)
	end)
	v4:GetAttributeChangedSignal("Progress"):Connect(function() --[[ Line: 188 | Upvalues: v2 (copy), v4 (copy) ]]
		local Progress = v2.Progress
		v2.Progress = v4:GetAttribute("Progress") or 0
		v2:_checkMilestones(Progress, v2.Progress)
		v2.ProgressChangedSignal:Fire(v2.Progress)
	end)
	v4:GetAttributeChangedSignal("CompletedMilestones"):Connect(function() --[[ Line: 195 | Upvalues: v4 (copy), HttpService (ref), v2 (copy) ]]
		local v22, v3 = pcall(HttpService.JSONDecode, HttpService, v4:GetAttribute("CompletedMilestones") or "[]")
		if not v22 or type(v3) ~= "table" then
			return
		end
		v2.CompletedMilestones = {}
		for v42, v5 in v3 do
			v2.CompletedMilestones[v5] = true
		end
	end)
	v4:GetAttributeChangedSignal("Completed"):Connect(function() --[[ Line: 206 | Upvalues: v4 (copy), v2 (copy) ]]
		if not v4:GetAttribute("Completed") then
			return
		end
		v2.GoalCompletedSignal:Fire()
	end)
	local RecentContributions = v4:WaitForChild("RecentContributions", 10)
	if RecentContributions then
		local function _parseContributionInstance(p1) --[[ _parseContributionInstance | Line: 214 | Upvalues: HttpService (ref) ]]
			local v1 = p1:GetAttribute("CustomData")
			local v2 = nil
			if v1 then
				local v3, v4 = pcall(HttpService.JSONDecode, HttpService, v1)
				if v3 then
					v2 = v4
				end
			end
			return {
				UserId = p1:GetAttribute("UserId"),
				UserName = p1:GetAttribute("UserName") or "",
				DisplayName = p1:GetAttribute("DisplayName") or "",
				Amount = p1:GetAttribute("Amount") or 0,
				CustomData = v2
			}
		end
		for v11, v122 in RecentContributions:GetChildren() do
			v2.RecentContributions[#v2.RecentContributions + 1] = _parseContributionInstance(v122)
		end
		RecentContributions.ChildAdded:Connect(function(p1) --[[ Line: 237 | Upvalues: _parseContributionInstance (copy), v2 (copy) ]]
			v2:_addContribution((_parseContributionInstance(p1)))
		end)
		RecentContributions.ChildRemoved:Connect(function() --[[ Line: 242 | Upvalues: v2 (copy), RecentContributions (copy), _parseContributionInstance (copy) ]]
			v2.RecentContributions = {}
			for v1, v22 in RecentContributions:GetChildren() do
				v2.RecentContributions[#v2.RecentContributions + 1] = _parseContributionInstance(v22)
			end
		end)
	end
	return v2
end
function t.GetName(p1) --[[ GetName | Line: 253 ]]
	return p1.Name
end
function t.GetType(p1) --[[ GetType | Line: 257 ]]
	return p1.Config.Type
end
function t.GetProgress(p1) --[[ GetProgress | Line: 261 | Upvalues: IS_SERVER (copy) ]]
	if not IS_SERVER and p1.ReplicationInstance then
		return p1.ReplicationInstance:GetAttribute("Progress") or 0
	end
	return p1.DisplayProgress
end
function t.GetAuthoritativeProgress(p1) --[[ GetAuthoritativeProgress | Line: 268 ]]
	return p1.Progress
end
function t.GetTarget(p1) --[[ GetTarget | Line: 272 | Upvalues: IS_SERVER (copy) ]]
	if not IS_SERVER and p1.ReplicationInstance then
		return p1.ReplicationInstance:GetAttribute("Target") or 0
	end
	return p1.Config.Target or 0
end
function t.IsActive(p1) --[[ IsActive | Line: 279 | Upvalues: IS_SERVER (copy) ]]
	if IS_SERVER or not p1.ReplicationInstance then
		return p1.Config.Active ~= false
	else
		return p1.ReplicationInstance:GetAttribute("Active") == true
	end
end
function t.IsCompleted(p1) --[[ IsCompleted | Line: 286 | Upvalues: IS_SERVER (copy) ]]
	if IS_SERVER or not p1.ReplicationInstance then
		for v2, v3 in p1.Config.Milestones or {} do
			if v3.Percent == 100 and p1.CompletedMilestones[v2] then
				return true
			end
		end
		return false
	else
		return p1.ReplicationInstance:GetAttribute("Completed") == true
	end
end
function t.GetProgressPercent(p1) --[[ GetProgressPercent | Line: 298 ]]
	local v1 = p1:GetTarget()
	if v1 <= 0 then
		return 0
	else
		return math.clamp(math.floor(p1:GetProgress() / v1 * 100), 0, 100)
	end
end
function t.GetMilestones(p1) --[[ GetMilestones | Line: 306 ]]
	return p1.Config.Milestones or {}
end
function t.GetMilestone(p1, p2) --[[ GetMilestone | Line: 310 ]]
	return (p1.Config.Milestones or {})[p2]
end
function t.GetCompletedMilestones(p1) --[[ GetCompletedMilestones | Line: 315 ]]
	local t = {}
	for v1 in p1.CompletedMilestones do
		t[#t + 1] = v1
	end
	table.sort(t)
	return t
end
function t.IsMilestoneCompleted(p1, p2) --[[ IsMilestoneCompleted | Line: 324 ]]
	return p1.CompletedMilestones[p2] == true
end
function t.GetActiveChangedSignal(p1) --[[ GetActiveChangedSignal | Line: 328 ]]
	return p1.ActiveChangedSignal
end
function t.GetProgressChangedSignal(p1) --[[ GetProgressChangedSignal | Line: 332 ]]
	return p1.ProgressChangedSignal
end
function t.GetMilestoneReachedSignal(p1) --[[ GetMilestoneReachedSignal | Line: 336 ]]
	return p1.MilestoneReachedSignal
end
function t.GetGoalCompletedSignal(p1) --[[ GetGoalCompletedSignal | Line: 340 ]]
	return p1.GoalCompletedSignal
end
function t.GetRecentContributions(p1) --[[ GetRecentContributions | Line: 344 ]]
	return p1.RecentContributions
end
function t.GetContributionAddedSignal(p1) --[[ GetContributionAddedSignal | Line: 348 ]]
	return p1.ContributionAddedSignal
end
function t.IsInitialised(p1) --[[ IsInitialised | Line: 352 ]]
	return p1.Initialised
end
function t.GetInitialisedSignal(p1) --[[ GetInitialisedSignal | Line: 356 ]]
	return p1.InitialisedSignal
end
function t.CanIncrement(p1, p2, p3) --[[ CanIncrement | Line: 360 ]]
	if not p1.Initialised then
		return false
	end
	if not p1:IsActive() then
		return false
	end
	if p1:IsCompleted() then
		return false
	end
	if p1.Config.Check then
		return p1.Config.Check(p2, p1, p3)
	else
		return true
	end
end
function t.IncrementProgress(p1, p2, p3, p4) --[[ IncrementProgress | Line: 380 | Upvalues: IS_SERVER (copy), v5 (copy) ]]
	if not IS_SERVER then
		return
	end
	p1.LocalProgress = p1.LocalProgress + p2
	p1.DisplayProgress = p1.DisplayProgress + p2
	p1:_replicateAttribute("Progress", p1.DisplayProgress)
	p1.ProgressChangedSignal:Fire(p1.DisplayProgress)
	if p1:_wouldCrossMilestone(p1.Progress + p1.LocalProgress) then
		local v1 = p1:_syncToMemoryStore()
		if v1 then
			local Progress = p1.Progress
			p1.Progress = tonumber(v1) or p1.Progress
			p1:_checkMilestones(Progress, p1.Progress)
			p1.DisplayProgress = math.max(p1.DisplayProgress, p1.Progress)
			p1:_replicateAttribute("Progress", p1.DisplayProgress)
		end
	end
	if not p3 then
		return
	end
	local t = {
		UserId = p3.Player.UserId,
		UserName = p3.Player.Name,
		DisplayName = p3.Player.DisplayName,
		Amount = p2
	}
	if p1.Config.ContributionData then
		t.CustomData = p1.Config.ContributionData(p3, if p4 then p4 else {})
	end
	p1:_addContribution(t)
	v5._publishContribution(p1.Name, t)
end
function t.SetTarget(p1, p2) --[[ SetTarget | Line: 419 | Upvalues: IS_SERVER (copy) ]]
	if not IS_SERVER then
		return
	end
	local v1 = p1.Config.Target or 0
	if v1 == p2 then
		return
	end
	local v2 = v1 > 0 and math.clamp(math.floor(p1.Progress / v1 * 100), 0, 100) or 0
	p1.Config.Target = p2
	p1:_checkMilestonesWithPercent(v2, p2 > 0 and math.clamp(math.floor(p1.Progress / p2 * 100), 0, 100) or 0)
	p1:_replicateAttribute("Target", p1.Config.Target or 0)
end
function t.SetActive(p1, p2) --[[ SetActive | Line: 437 | Upvalues: IS_SERVER (copy) ]]
	if not IS_SERVER then
		return
	end
	p1.Config.Active = p2
	p1:_replicateAttribute("Active", p1.Config.Active ~= false)
	p1.ActiveChangedSignal:Fire(p1.Config.Active ~= false)
end
function t._addContribution(p1, p2) --[[ _addContribution | Line: 447 | Upvalues: IS_SERVER (copy) ]]
	p1.RecentContributions[#p1.RecentContributions + 1] = p2
	while (p1.Config.MaxRecentContributions or p1._serviceConfig and p1._serviceConfig.MaxRecentContributions or 5) < #p1.RecentContributions do
		table.remove(p1.RecentContributions, 1)
	end
	if IS_SERVER then
		p1:_tryReplicateContribution(p2)
	end
	p1.ContributionAddedSignal:Fire(p2)
end
function t._tryReplicateContribution(p1, p2) --[[ _tryReplicateContribution | Line: 465 | Upvalues: HttpService (copy) ]]
	local v2 = p1.Config.ContributionDisplayDuration or (p1._serviceConfig.ContributionDisplayDuration or 5)
	if (p1.Config.MaxRecentContributions or (p1._serviceConfig.MaxRecentContributions or 5)) <= #p1._contributionsFolder:GetChildren() then
		local v3 = (1 / 0)
		local v4 = nil
		for v5, v6 in p1._replicatedSlots do
			if v6 < v3 then
				v3 = v6
				v4 = v5
			end
		end
		if not v4 or os.clock() - v3 < v2 then
			return
		end
		local v7 = p1._contributionsFolder:FindFirstChild(v4)
		if v7 then
			v7:Destroy()
		end
		p1._replicatedSlots[v4] = nil
	end
	p1._contributionIndex = p1._contributionIndex + 1
	local v8 = tostring(p1._contributionIndex)
	local Configuration = Instance.new("Configuration")
	Configuration.Name = v8
	Configuration:SetAttribute("UserId", p2.UserId)
	Configuration:SetAttribute("UserName", p2.UserName or "")
	Configuration:SetAttribute("DisplayName", p2.DisplayName or "")
	Configuration:SetAttribute("Amount", p2.Amount or 0)
	if p2.CustomData then
		local v9, v10 = pcall(HttpService.JSONEncode, HttpService, p2.CustomData)
		if v9 then
			Configuration:SetAttribute("CustomData", v10)
		end
	end
	Configuration.Parent = p1._contributionsFolder
	p1._replicatedSlots[v8] = os.clock()
end
function t._onContributionReceived(p1, p2) --[[ _onContributionReceived | Line: 514 | Upvalues: IS_SERVER (copy) ]]
	if not (IS_SERVER and p1.Initialised) then
		return
	end
	p1:_addContribution(p2)
	local v1 = tonumber(p2.Amount) or 0
	if not (v1 > 0) then
		return
	end
	p1.DisplayProgress = p1.DisplayProgress + v1
	p1:_replicateAttribute("Progress", p1.DisplayProgress)
	p1.ProgressChangedSignal:Fire(p1.DisplayProgress)
end
function t._onMilestoneCompleted(p1, p2) --[[ _onMilestoneCompleted | Line: 528 | Upvalues: IS_SERVER (copy) ]]
	if not (IS_SERVER and p1.Initialised) then
		return
	end
	if p1.CompletedMilestones[p2] then
		return
	end
	local v1 = p1:GetMilestone(p2)
	if not v1 then
		return
	end
	p1.CompletedMilestones[p2] = true
	p1:_replicateMilestones()
	p1.MilestoneReachedSignal:Fire(p2, v1)
	if v1.Percent == 100 then
		if p1.Config.OnGoalCompleted then
			task.spawn(p1.Config.OnGoalCompleted, p1)
		end
		if p1._serviceConfig and p1._serviceConfig.OnGoalCompleted then
			task.spawn(p1._serviceConfig.OnGoalCompleted, p1)
		end
		p1.GoalCompletedSignal:Fire()
	end
	if p1.Config.OnMilestoneReached then
		task.spawn(p1.Config.OnMilestoneReached, p1, p2, v1)
	end
	if not (p1._serviceConfig and p1._serviceConfig.OnMilestoneReached) then
		return
	end
	task.spawn(p1._serviceConfig.OnMilestoneReached, p1, p2, v1)
end
function t._onMilestonesReceived(p1, p2) --[[ _onMilestonesReceived | Line: 563 | Upvalues: IS_SERVER (copy) ]]
	if not (IS_SERVER and p2) then
		return
	end
	for v1, v2 in p2 do
		if not p1.CompletedMilestones[v2] then
			p1:_onMilestoneCompleted(v2)
		end
	end
end
function t._reapplyRemoteConfig(p1) --[[ _reapplyRemoteConfig | Line: 574 | Upvalues: IS_SERVER (copy), v5 (copy), v2 (copy) ]]
	if not IS_SERVER then
		return
	end
	local v1 = v5.GetRemoteConfigurations()[p1.Name]
	if not v1 then
		return
	end
	p1.Config = v2.Merge(v1, p1._goalConfigOverride or {})
	if v1.Target and v1.Target ~= p1.Config.Target then
		p1:SetTarget(v1.Target)
	end
	if v1.Active == nil or v1.Active == p1:IsActive() then
		return
	end
	p1:SetActive(v1.Active)
end
function t._loadInitialProgress(p1) --[[ _loadInitialProgress | Line: 595 | Upvalues: v6 (copy) ]]
	if p1._memoryStore then
		task.spawn(function() --[[ Line: 607 | Upvalues: p1 (copy), v6 (ref) ]]
			local v1 = p1.Name .. "_Milestones"
			local v2, v3
			while true do
				local v4
				v4, v2 = p1._memoryStore:Get(v1)
				local v5
				v5, v3 = p1._memoryStore:Get(p1.Name)
				if v4 and v5 then
					break
				end
				warn("\226\154\160\239\184\143 CommunityGoal, Failed to load initial state, retrying...", p1.Name, "Milestones:", v4, "Progress:", v5)
				task.wait(5)
			end
			if v2 and type(v2) == "table" then
				for v62, v7 in v2 do
					p1.CompletedMilestones[v7] = true
				end
			end
			p1:_replicateMilestones()
			if not v3 then
				print("\240\159\142\175 CommunityGoal, Loaded initial state", p1.Name, "Progress: " .. p1.Progress, "Target: " .. p1:GetTarget())
				v6.WaitForInitialised(p1._serviceConfig.GamebeastConfigKey)
				p1:_reapplyRemoteConfig()
				p1.Initialised = true
				p1:_replicateAttribute("Initialised", true)
				p1.InitialisedSignal:Fire(true)
				return
			end
			local Progress = p1.Progress
			p1.Progress = math.max(tonumber(v3) or 0, p1:_getMinimumProgress())
			p1.DisplayProgress = p1.Progress
			p1:_checkMilestones(Progress, p1.Progress)
			p1:_replicateAttribute("Progress", p1.DisplayProgress)
			p1.ProgressChangedSignal:Fire(p1.DisplayProgress)
			print("\240\159\142\175 CommunityGoal, Loaded initial state", p1.Name, "Progress: " .. p1.Progress, "Target: " .. p1:GetTarget())
			v6.WaitForInitialised(p1._serviceConfig.GamebeastConfigKey)
			p1:_reapplyRemoteConfig()
			p1.Initialised = true
			p1:_replicateAttribute("Initialised", true)
			p1.InitialisedSignal:Fire(true)
		end)
	else
		task.spawn(function() --[[ Line: 597 | Upvalues: v6 (ref), p1 (copy) ]]
			v6.WaitForInitialised(p1._serviceConfig.GamebeastConfigKey)
			p1:_reapplyRemoteConfig()
			p1.Initialised = true
			p1:_replicateAttribute("Initialised", true)
			p1.InitialisedSignal:Fire(true)
		end)
	end
end
function t._syncToMemoryStore(p1) --[[ _syncToMemoryStore | Line: 649 ]]
	if not p1._memoryStore then
		return nil, nil
	end
	local v1 = nil
	if p1.LocalProgress > 0 then
		local LocalProgress = p1.LocalProgress
		p1.LocalProgress = 0
		local v2, v3 = p1._memoryStore:Update(p1.Name, p1._serviceConfig.MemoryStoreExpiration, function(p1) --[[ Line: 663 | Upvalues: LocalProgress (copy) ]]
			return (p1 or 0) + LocalProgress
		end)
		if v2 and v3 then
			v1 = v3
		end
	else
		local v4, v5 = p1._memoryStore:Get(p1.Name)
		if v4 and v5 then
			v1 = v5
		end
	end
	local v7, v8 = p1._memoryStore:Get(p1.Name .. "_Milestones")
	local v9 = nil
	if v7 and v8 and type(v8) == "table" then
		v9 = v8
	end
	return v1, v9
end
function t._onProgressReceived(p1, p2) --[[ _onProgressReceived | Line: 687 | Upvalues: IS_SERVER (copy), IS_STUDIO (copy) ]]
	if not IS_SERVER then
		return
	end
	local v2 = math.max(tonumber(p2) or 0, p1:_getMinimumProgress())
	if v2 <= p1.Progress then
		p1.DisplayProgress = math.max(p1.DisplayProgress, p1.Progress)
		p1:_replicateAttribute("Progress", p1.DisplayProgress)
		return
	end
	local Progress = p1.Progress
	p1.Progress = v2
	p1:_checkMilestones(Progress, p1.Progress)
	p1.DisplayProgress = math.max(p1.DisplayProgress, p1.Progress)
	p1:_replicateAttribute("Progress", p1.DisplayProgress)
	if IS_STUDIO then
		print("\240\159\142\175 CommunityGoal, Updated progress", p1.Name, "Progress: " .. p1.Progress, "Target: " .. p1:GetTarget())
	end
	p1.ProgressChangedSignal:Fire(p1.DisplayProgress)
end
function t._wouldCrossMilestone(p1, p2) --[[ _wouldCrossMilestone | Line: 713 ]]
	local v1 = p1.Config.Target or 0
	if v1 <= 0 then
		return false
	end
	local v4 = math.clamp(math.floor(p1.Progress / v1 * 100), 0, 100)
	local v6 = math.clamp(math.floor(p2 / v1 * 100), 0, 100)
	for v8, v9 in p1.Config.Milestones or {} do
		if not p1.CompletedMilestones[v8] and (v9.Percent and (v9.Percent <= v6 and v4 < v9.Percent)) then
			return true
		end
	end
	return false
end
function t._checkMilestones(p1, p2, p3) --[[ _checkMilestones | Line: 730 ]]
	local v1 = p1.Config.Target or 0
	if not (v1 <= 0) then
		local v3 = math.clamp(math.floor(p2 / v1 * 100), 0, 100)
		p1:_checkMilestonesWithPercent(v3, (math.clamp(math.floor(p3 / v1 * 100), 0, 100)))
	end
end
function t._checkMilestonesWithPercent(p1, p2, p3) --[[ _checkMilestonesWithPercent | Line: 742 | Upvalues: IS_SERVER (copy), v5 (copy) ]]
	for v2, v3 in p1.Config.Milestones or {} do
		local Percent = v3.Percent
		if Percent and (not p1.CompletedMilestones[v2] and (Percent <= p3 and p2 < Percent)) then
			p1.CompletedMilestones[v2] = true
			p1:_replicateMilestones()
			p1.MilestoneReachedSignal:Fire(v2, v3)
			if IS_SERVER and p1._memoryStore then
				p1:_persistMilestones()
				v5._publishMilestoneCompleted(p1.Name, v2)
			end
			if Percent == 100 then
				if p1.Config.OnGoalCompleted then
					task.spawn(p1.Config.OnGoalCompleted, p1)
				end
				if IS_SERVER and (p1._serviceConfig and p1._serviceConfig.OnGoalCompleted) then
					task.spawn(p1._serviceConfig.OnGoalCompleted, p1)
				end
				p1.GoalCompletedSignal:Fire()
			end
			if IS_SERVER and p1.Config.OnMilestoneReached then
				task.spawn(p1.Config.OnMilestoneReached, p1, v2, v3)
			end
			if IS_SERVER and (p1._serviceConfig and p1._serviceConfig.OnMilestoneReached) then
				task.spawn(p1._serviceConfig.OnMilestoneReached, p1, v2, v3)
			end
		end
	end
end
function t._getMinimumProgress(p1) --[[ _getMinimumProgress | Line: 779 ]]
	local v1 = p1.Config.Target or 0
	if v1 <= 0 then
		return 0
	end
	local v2 = 0
	for v4, v5 in p1.Config.Milestones or {} do
		if p1.CompletedMilestones[v4] and v2 < v5.Percent then
			v2 = v5.Percent
		end
	end
	return math.ceil(v2 / 100 * v1)
end
function t._replicateAttribute(p1, p2, p3) --[[ _replicateAttribute | Line: 794 | Upvalues: IS_SERVER (copy) ]]
	if IS_SERVER and p1.ReplicationInstance then
		p1.ReplicationInstance:SetAttribute(p2, p3)
	end
end
function t._replicateMilestones(p1) --[[ _replicateMilestones | Line: 801 | Upvalues: IS_SERVER (copy), HttpService (copy) ]]
	if not (IS_SERVER and p1.ReplicationInstance) then
		return
	end
	p1.ReplicationInstance:SetAttribute("Completed", p1:IsCompleted())
	local v2, v3 = pcall(HttpService.JSONEncode, HttpService, (p1:GetCompletedMilestones()))
	p1.ReplicationInstance:SetAttribute("CompletedMilestones", if v2 and v3 then v3 else "[]")
end
function t._persistMilestones(p1) --[[ _persistMilestones | Line: 811 ]]
	if p1._memoryStore then
		local v2 = p1:GetCompletedMilestones()
		p1._memoryStore:Update(p1.Name .. "_Milestones", p1._serviceConfig.MemoryStoreExpiration, function(p1) --[[ Line: 817 | Upvalues: v2 (copy) ]]
			local t = {}
			if p1 and type(p1) == "table" then
				for v1, v22 in p1 do
					t[v22] = true
				end
			end
			for v3, v4 in v2 do
				t[v4] = true
			end
			local t2 = {}
			for v5 in t do
				t2[#t2 + 1] = v5
			end
			table.sort(t2)
			return t2
		end)
	end
end
function t._replicateState(p1) --[[ _replicateState | Line: 836 | Upvalues: IS_SERVER (copy), HttpService (copy) ]]
	if not (IS_SERVER and p1.ReplicationInstance) then
		return
	end
	p1.ReplicationInstance:SetAttribute("Type", p1.Config.Type or "")
	p1.ReplicationInstance:SetAttribute("Progress", p1.DisplayProgress)
	p1.ReplicationInstance:SetAttribute("Target", p1.Config.Target or 0)
	p1.ReplicationInstance:SetAttribute("Active", p1.Config.Active ~= false)
	p1.ReplicationInstance:SetAttribute("Initialised", p1.Initialised)
	p1.ReplicationInstance:SetAttribute("Completed", p1:IsCompleted())
	local v3, v4 = pcall(HttpService.JSONEncode, HttpService, (p1:GetCompletedMilestones()))
	p1.ReplicationInstance:SetAttribute("CompletedMilestones", if v3 and v4 then v4 else "[]")
end
return t