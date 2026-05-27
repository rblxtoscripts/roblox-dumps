-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("AnimalDataService")
local v2 = Sonar("DataUtils")
local v3 = Sonar("EventUtils")
local v4 = Sonar("FormatTime")
local v5 = Sonar("Maid")
local v6 = Sonar("NewMissionsService", {
	Deferred = true
})
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("Signal")
local v9 = Sonar("StorageUtils")
local v10 = Sonar("TableUtils")
local v11 = Sonar("Task", {
	Deferred = true
})
local v12 = Sonar("WeightedProbability")
local v13 = Sonar("AnalyticsService", {
	Deferred = true,
	Context = "Server"
})
local v14 = Sonar("Constants")
local IsClient = v14.IsClient
local IsServer = v14.IsServer
local v15 = v9.GetConfig("Events")()
local v17 = v15.EventsData[v15.Event]
local v18 = if v17 then v17.Data.DropSets or {} else {}
local t2 = {}
local t3 = {}
function t.new(p1) --[[ new | Line: 45 | Upvalues: t2 (copy), t (ref), Players (copy), v6 (copy), v7 (copy), v5 (copy), v8 (copy), IsClient (copy), IsServer (copy), t3 (copy) ]]
	local v1 = t2[p1]
	if v1 then
		return v1
	end
	local v2 = p1:GetAttributes()
	local v3 = next(v2) and true or false
	local v52 = setmetatable({}, t)
	local v62 = nil
	for v72, v82 in v2 do
		v52[v72] = v82
		p1:SetAttribute(v72, nil)
	end
	local v10 = (if v62 then v62 else p1:FindFirstAncestorWhichIsA("Player")) or Players:FindFirstChild(p1.Parent.Parent.Name)
	local UserId = v10.UserId
	v52.MissionValue = p1
	v52.ClaimedValue = p1.Claimed
	v52.ExpiredValue = p1.Expired
	v52.ExpireTimeValue = p1.ExpireTime
	v52.IdentifierValue = p1.Identifier
	v52.MissionNameValue = p1.MissionName
	v52.RepetitionsValue = p1.Repetitions
	v52.RewardSeedValue = p1.RewardSeed
	v52.MissionId = v52.MissionNameValue.Value
	v52.MissionName = v52.MissionNameValue.Value
	v52.MissionData = v6.GetMissionData(v52.MissionName)
	v52.RewardData = v52.MissionData.Rewards
	v52.TaskCount = math.min(#v52.MissionData.Tasks, v52.MissionData.TaskPool or (1 / 0))
	v52.Player = v10
	v52.UserId = UserId
	v52.PlayerWrapper = v7.getWrapperFromPlayer(v10)
	v52.PlayerData = v52.PlayerWrapper.PlayerData
	v52.RewardData = v52.MissionData.Rewards
	if v52.RewardData and not next(v52.RewardData) then
		v52.RewardData = nil
	end
	v52.TimeSeed = v52.MissionData.TimeSeed
	v52.Maid = v5.new()
	v52.RemovedSignal = v8.new()
	v52.Maid:GiveTask(function() --[[ Line: 98 | Upvalues: v52 (copy) ]]
		v52.Removing = true
		v52.RemovedSignal:Fire(v52)
	end)
	v52.Maid:GiveTask(v52.RemovedSignal)
	v52.Maid:GiveTask(v52.MissionValue.Destroying:Once(function() --[[ Line: 104 | Upvalues: v52 (copy) ]]
		v52:Destroy()
	end))
	v52:_reconcileTasks()
	if IsClient then
		v52.Maid:GiveTask(v52.ExpiredValue.Changed:Connect(function() --[[ Line: 111 | Upvalues: v52 (copy) ]]
			v52:SetExpired(v52.ExpiredValue.Value)
		end))
	end
	if IsServer then
		if v3 then
			v52:Reset(true)
		end
		if v52.RewardSeedValue.Value == 0 then
			v52.RewardSeedValue.Value = Random.new():NextInteger(100000000000000, 900000000000000)
		end
	end
	t2[p1] = v52
	t3[UserId] = t3[UserId] or {}
	t3[UserId][p1] = v52
	return v52
end
function t._getTaskIndices(p1, p2) --[[ _getTaskIndices | Line: 134 | Upvalues: v10 (copy) ]]
	local v1 = p1.MissionData.AllowedTasks and p1.MissionData.AllowedTasks(p1.PlayerWrapper)
	local Tasks = p1.MissionData.Tasks
	local t = {}
	local v3 = if p2 then p2 else {}
	for i = 1, #Tasks do
		if not (v3.ExcludeUsedIndices and p1.MissionValue:FindFirstChild(i)) and (not v1 or table.find(v1, Tasks[i])) then
			table.insert(t, i)
		end
	end
	if v3.Shuffle then
		if p1.MissionData.UniqueTasks then
			v10.Shuffle(t)
			local t2 = {}
			local t3 = {}
			for v4, v5 in t do
				local Type = Tasks[v5].Type
				if not t2[Type] then
					t2[Type] = true
					table.insert(t3, v5)
				end
			end
			return t3
		end
		v10.Shuffle(t)
	end
	return t
end
function t._reconcileTasks(p1) --[[ _reconcileTasks | Line: 180 | Upvalues: v6 (copy), IsServer (copy), v2 (copy), v10 (copy), v11 (copy) ]]
	local v1 = v6.GetTasksFromMissionValue(p1.MissionValue)
	local t = {}
	if IsServer then
		while #v1 > p1.TaskCount do
			v1[#v1]:Destroy()
			table.remove(v1, #v1)
		end
		local v3 = p1:_getTaskIndices({
			ExcludeUsedIndices = true,
			Shuffle = (p1.MissionData.TaskPool and true or false) and (if p1:GetRepetitions() == 0 then true else p1.MissionData.ReshuffleOnRepeat)
		})
		for i = #v1 + 1, p1.TaskCount do
			local v4 = v2.CreateDataValueFromType("Tasks")
			v4.Name = table.remove(v3, 1)
			v4.Parent = p1.MissionValue
			t[v4] = true
			table.insert(v1, v4)
		end
		for v5, v62 in v1 do
			if not (tonumber(v62.Name) <= #p1.MissionData.Tasks) then
				v62.Name = table.remove(v3, 1)
				t[v62] = true
			end
		end
	end
	p1.TaskValues = v10.Map(v1, function(p12, p2) --[[ Line: 215 | Upvalues: v11 (ref), p1 (copy), IsServer (ref), t (copy) ]]
		local v1 = v11.new(p1, p2)
		if IsServer and t[p2] then
			v1:Reset(true)
		end
		return v1
	end)
end
function t.CheckAutoClaim(p1) --[[ CheckAutoClaim | Line: 227 | Upvalues: IsServer (copy) ]]
	if not IsServer then
		return
	end
	if not p1.MissionData.AutoClaim then
		return
	end
	if not p1:IsComplete() or p1:IsClaimed() then
		return
	end
	p1:Claim()
end
function t.CheckDependentMissions(p1) --[[ CheckDependentMissions | Line: 242 | Upvalues: v6 (copy) ]]
	if not (p1:IsComplete() or p1:GetRepetitions() > 0) then
		return
	end
	for v1, v2 in p1:GetDependentMissions() do
		if not v6.GetMissionData(v2).TemplateMission then
			p1.PlayerWrapper.NewMissionsWrapper:GiveMission(v2)
		end
	end
end
function t.Claim(p1) --[[ Claim | Line: 258 | Upvalues: v6 (copy), v3 (copy), v13 (copy) ]]
	if p1:IsClaimed() then
		return
	end
	if not p1:IsComplete() then
		return
	end
	p1.PlayerWrapper.NewMissionsWrapper:GiveRewards(p1)
	if p1.MissionData.OnComplete then
		p1.MissionData.OnComplete(p1.PlayerWrapper, p1)
	end
	for v1, v2 in v6.GlobalMissionCompletedCallbacks do
		v3.safeCall(v2, p1.PlayerWrapper, p1)
	end
	p1.ClaimedValue.Value = true
	local v32 = if p1.MissionData.Repeatable then p1:Repeat() else false
	if not v32 then
		p1:CheckDependentMissions()
	end
	if p1.MissionData.TemplateMission and not v32 then
		local v5 = true
		if (if v5 then if p1.MissionData.Repeatable == nil then true else false else v5) and (if p1.MissionData.Replayable == nil then true else false) and (if p1.MissionData.KeepDataValueOnComplete == nil then true else false) then
			p1.MissionValue:Destroy()
		end
	end
	if not v13 then
		return true
	end
	local v9 = if string.find(p1.MissionData.Category or "", "Event") ~= nil then "EventMission" else "CompleteMission"
	local t = {
		{
			Key = "MissionName",
			Value = p1.MissionName
		}
	}
	local v10, v11
	if #p1:GetIdentifier() > 0 then
		v10 = {
			Key = "MissionId",
			Value = p1:GetIdentifier()
		}
		v11 = v9
	else
		v10 = nil
		v11 = v9
	end
	t[2] = v10
	v13.ReportDesignEvent(p1.Player, v11, t, 0)
	return true
end
function t.ArePrerequisitesMet(p1) --[[ ArePrerequisitesMet | Line: 316 ]]
	for v1, v2 in p1:GetRequiredMissions() do
		if not (v2.MissionData.Replayable and v2:GetRepetitions() > 0) then
			local v4 = v2:GetState()
			if v2.MissionData.AutoClaim then
				if v4 ~= "Complete" and v4 ~= "Claimed" then
					return false
				end
				continue
			end
			if v4 ~= "Claimed" then
				return false
			end
		end
	end
	return true
end
function t.GetPrerequisitesMetChangedSignal(p1) --[[ GetPrerequisitesMetChangedSignal | Line: 344 | Upvalues: v8 (copy) ]]
	local v1 = p1:GetRequiredMissions()
	local v2 = v8.new()
	for v3, v4 in v1 do
		local v5 = v2:GiveTask(v4:GetStateChangedSignal())
		v5:GiveTask(v5:Connect(function() --[[ Line: 352 | Upvalues: v2 (copy) ]]
			v2._maid._thread = task.defer(function() --[[ Line: 353 | Upvalues: v2 (ref) ]]
				v2:Fire()
			end)
		end))
	end
	return v2
end
function t.GetChangedSignal(p1) --[[ GetChangedSignal | Line: 363 | Upvalues: v8 (copy) ]]
	local v1 = v8.new()
	local t = {}
	local t2 = {}
	for v2, v3 in {
		p1.ExpiredValue.Changed,
		p1.ClaimedValue:GetPropertyChangedSignal("Value"),
		p1.ExpireTimeValue:GetPropertyChangedSignal("Value"),
		p1.MissionValue:GetPropertyChangedSignal("Value"),
		p1.RepetitionsValue:GetPropertyChangedSignal("Value")
	} do
		table.insert(t, (v1:GiveTask(v3)))
	end
	for v5, v6 in p1.TaskValues do
		table.insert(t2, (v1:GiveTask(v6:GetChangedSignal(true))))
	end
	local function onChanged() --[[ onChanged | Line: 385 | Upvalues: v1 (copy) ]]
		v1._maid._thread = task.defer(function() --[[ Line: 386 | Upvalues: v1 (ref) ]]
			v1:Fire()
		end)
	end
	for v82, v9 in { t, t2 } do
		for v10, v11 in v9 do
			v1:GiveTask(v11:Connect(onChanged))
		end
	end
	return v1
end
function t.GetDependentMissions(p1) --[[ GetDependentMissions | Line: 400 | Upvalues: v6 (copy) ]]
	if p1._dependentMissions then
		return p1._dependentMissions
	end
	local t = {}
	for v1, v2 in v6.GetAllMissions() do
		if v2.RequiredMissions and table.find(v2.RequiredMissions, p1.MissionName) then
			table.insert(t, v1)
		end
	end
	p1._dependentMissions = t
	return t
end
function t.GetExpireTime(p1) --[[ GetExpireTime | Line: 417 ]]
	return if p1.ExpireTimeValue.Value > 0 then p1.ExpireTimeValue.Value else nil
end
function t.GetRepetitions(p1) --[[ GetRepetitions | Line: 428 ]]
	return p1.RepetitionsValue.Value
end
function t.GetRepetitionsChangedSignal(p1) --[[ GetRepetitionsChangedSignal | Line: 433 ]]
	return p1.RepetitionsValue:GetPropertyChangedSignal("Value")
end
function t.GetRequiredMissions(p1) --[[ GetRequiredMissions | Line: 438 | Upvalues: t (ref) ]]
	local v1 = nil
	local t2 = {}
	for v3, v4 in (if v1 then v1 else p1.MissionData.RequiredMissions) or {} do
		local v5 = t.GetMissionForPlayer(p1.Player, v4)
		if v5 then
			table.insert(t2, v5)
			continue
		end
		warn((("Failed to find required mission for %* required mission: %*"):format(p1.MissionName, v4)))
	end
	return t2
end
function t.GetState(p1) --[[ GetState | Line: 460 ]]
	if p1:IsClaimed() then
		return "Claimed"
	end
	if p1:IsComplete() then
		return "Complete"
	else
		return "Incomplete"
	end
end
function t.GetStateChangedSignal(p1) --[[ GetStateChangedSignal | Line: 471 | Upvalues: v8 (copy) ]]
	local v1 = p1:GetState()
	local v2 = v8.new()
	v2:GiveTask(v2:GiveTask(p1:GetChangedSignal()):Connect(function() --[[ Line: 476 | Upvalues: p1 (copy), v1 (ref), v2 (copy) ]]
		local v12 = p1:GetState()
		if v12 == v1 then
			return
		end
		v1 = v12
		v2._maid._thread = task.defer(function() --[[ Line: 482 | Upvalues: v2 (ref), v12 (copy) ]]
			v2:Fire(v12)
		end)
	end))
	return v2
end
function t.GetTasks(p1) --[[ GetTasks | Line: 492 ]]
	return p1.TaskValues
end
function t.GetType(p1) --[[ GetType | Line: 497 ]]
	return p1.MissionData.Category
end
function t.IsClaimed(p1) --[[ IsClaimed | Line: 502 ]]
	return p1.ClaimedValue.Value
end
function t.IsComplete(p1) --[[ IsComplete | Line: 507 ]]
	for v1, v2 in p1.TaskValues do
		if not v2:IsComplete() then
			return false
		end
	end
	return true
end
function t.IsExpired(p1) --[[ IsExpired | Line: 518 | Upvalues: v4 (copy) ]]
	local v1 = p1:GetExpireTime()
	local v3 = nil or true
	return (if v3 then if v1 == nil then false else true else v3) and v1 <= v4.GetTime()
end
function t.Reset(p1, p2) --[[ Reset | Line: 531 | Upvalues: IsServer (copy), v4 (copy) ]]
	if not IsServer then
		return
	end
	local v1 = Random.new()
	local v3 = (if p1.RepetitionsValue.Value > 0 then p1.MissionData.ResetTimeToCompleteOnRepeat else false) or p2
	p1.ClaimedValue.Value = false
	p1.MissionValue.Value = 0
	p1.RewardSeedValue.Value = v1:NextInteger(100000000000000, 900000000000000)
	if v3 then
		p1:SetExpireTime(nil)
	end
	if p2 then
		p1.RepetitionsValue.Value = 0
	end
	p1:ResetTasks(p2)
	if p1.TimeSeed then
		p1.MissionValue.Value = p1.TimeSeed:GetEndTime()
	end
	if p1.MissionData.TimeToComplete and v3 then
		p1:SetExpireTime(v4.GetTime() + p1.MissionData.TimeToComplete)
	end
	if not p1.MissionData.OnReset then
		return
	end
	p1.MissionData.OnReset(p1.PlayerWrapper)
end
function t.ResetTasks(p1, p2) --[[ ResetTasks | Line: 570 | Upvalues: IsServer (copy), v6 (copy) ]]
	if not IsServer then
		return
	end
	local v1 = v6.GetTasksFromMissionValue(p1.MissionValue)
	if p1.MissionData.TaskPool or (p2 or p1.MissionData.ReshuffleOnRepeat) then
		local v2 = p1:_getTaskIndices({
			Shuffle = true
		})
		for v3, v4 in v1 do
			v4.Name = v2[v3]
		end
	end
	local KeepInProgressTasksOnComplete = p1.MissionData.KeepInProgressTasksOnComplete
	local t = {}
	for v5, v62 in p1.TaskValues do
		local v8 = tonumber(v62.TaskValue.Name)
		if KeepInProgressTasksOnComplete and not (v62:IsInProgress() and KeepInProgressTasksOnComplete) then
			v62:Reset(true)
		end
		t[v8] = v62
	end
	p1.TaskValues = t
end
function t.SetExpired(p1, p2) --[[ SetExpired | Line: 604 | Upvalues: IsServer (copy) ]]
	local v1 = p2 and true or false
	if p1.ExpiredValue.Value ~= v1 or not IsServer then
		p1.ExpiredValue.Value = v1
	end
end
function t.SetExpireTime(p1, p2) --[[ SetExpireTime | Line: 617 ]]
	p1.ExpireTimeValue.Value = p2 or -1
	p1:SetExpired(p1:IsExpired())
end
function t.CanIncrementMission(p1, p2) --[[ CanIncrementMission | Line: 626 ]]
	if not p1:ArePrerequisitesMet() then
		return false
	end
	if p1.MissionData.UnlockTime and DateTime.now().UnixTimestamp < p1.MissionData.UnlockTime.UnixTimestamp then
		return false
	end
	if p1.MissionData.Check then
		return p1.MissionData.Check(p1.PlayerWrapper, p1, table.unpack(p2))
	else
		return not p1:IsExpired()
	end
end
function t.GetGoToAction(p1) --[[ GetGoToAction | Line: 655 ]]
	return p1.MissionData.GoToAction
end
function t.GetIdentifier(p1) --[[ GetIdentifier | Line: 660 ]]
	return p1.IdentifierValue.Value
end
function t.GetPreviousTask(p1, p2) --[[ GetPreviousTask | Line: 665 ]]
	local count = 0
	local v1 = nil
	while true do
		count = count + 1
		local v2 = p1.TaskValues[count]
		if not v2 then
			break
		end
		if v2 == p2 then
			break
		end
		v1 = v2
	end
	return v1
end
function t._resolveDropSetItems(p1, p2) --[[ _resolveDropSetItems | Line: 683 | Upvalues: v18 (copy) ]]
	local t = {}
	local t2 = {}
	for v1, v2 in p2 do
		local v3 = v18[v2]
		if v3 then
			for v4, v5 in v3 do
				local v6 = if typeof(v5) == "table" then v5.Name or v5[1] else v5
				if v6 and not t[v6] then
					t[v6] = true
					table.insert(t2, v6)
				end
			end
		end
	end
	table.sort(t2)
	return t2
end
function t.GetReward(p1, p2) --[[ GetReward | Line: 706 | Upvalues: v12 (copy), v1 (copy) ]]
	local v13 = p2 or p1
	if not v13.RewardData then
		return nil
	end
	local v4
	if typeof(v13.RewardData[1]) == "table" then
		local v5 = p1.TimeSeed and p1.TimeSeed.CurrentSeed
		v4 = if v5 then v13.RewardData[v12.getRandomFromTable(v13.RewardData, v5)] else v12.getRandomFromTable(v13.RewardData)
	else
		v4 = v13.RewardData
	end
	if not v4 or typeof(v4) ~= "table" then
		return nil
	end
	local v8 = nil
	local ExtraRewardData = ((if v8 then v8 else p1.MissionData) or p1.Mission.MissionData).ExtraRewardData
	local RewardSeedValue = p1.RewardSeedValue.Value
	local v10 = Random.new(RewardSeedValue)
	local t = {}
	for v122, v132 in v4 do
		local v11
		if ExtraRewardData and ExtraRewardData[v122] then
			v11 = {}
			for v14, v15 in ExtraRewardData[v122] do
				v11[v14] = v15
			end
			v11.Seed = RewardSeedValue
		else
			v11 = nil
		end
		if v11 and v11.DefaultToRewardsIfAlreadyOwned then
			local v16 = p1.PlayerWrapper:GetItemValue(v122)
			if if v16 then v16.Value > 0 else false then
				local v18 = nil
				local v19 = if v18 then v18 else v11.Rewards or nil
				local v20 = v19 and v19.Rewards or nil
				if v20 then
					for v21, v22 in v20 do
						local IncludesDropSets = v22.IncludesDropSets
						local v24 = p1:_resolveDropSetItems(if IncludesDropSets then IncludesDropSets else {})
						if #v24 ~= 0 then
							table.insert(t, {
								Name = v24[v10:NextInteger(1, #v24)],
								Amount = v22.Amount or 1
							})
						end
					end
					if v1.GetByName(v122) and v11 then
						table.insert(t, {
							RewardType = "Species",
							Name = v122,
							Amount = v132,
							ExtraData = v11
						})
						continue
					end
					table.insert(t, {
						Name = v122,
						Amount = v132
					})
				end
			else
				if v1.GetByName(v122) and v11 then
					table.insert(t, {
						RewardType = "Species",
						Name = v122,
						Amount = v132,
						ExtraData = v11
					})
					continue
				end
				table.insert(t, {
					Name = v122,
					Amount = v132
				})
			end
		else
			if v1.GetByName(v122) and v11 then
				table.insert(t, {
					RewardType = "Species",
					Name = v122,
					Amount = v132,
					ExtraData = v11
				})
				continue
			end
			table.insert(t, {
				Name = v122,
				Amount = v132
			})
		end
	end
	return t
end
function t.GetRemovedSignal(p1) --[[ GetRemovedSignal | Line: 818 ]]
	return p1.RemovedSignal
end
function t.GetGoalProgress(p1) --[[ GetGoalProgress | Line: 823 ]]
	local v1 = #p1.TaskValues
	if v1 == 0 then
		return 0
	else
		return p1:GetTotalTasksCompleted() / v1
	end
end
function t.GetTotalTasksCompleted(p1) --[[ GetTotalTasksCompleted | Line: 832 ]]
	local count = 0
	for v1, v2 in p1.TaskValues do
		if v2:IsComplete() or v2:IsClaimed() then
			count = count + 1
		end
	end
	return count
end
function t.Repeat(p1) --[[ Repeat | Line: 843 ]]
	local RepetitionsValue = p1.RepetitionsValue
	RepetitionsValue.Value = RepetitionsValue.Value + 1
	if not p1.MissionData.Replayable and (typeof(p1.MissionData.Repeatable) == "number" and p1.RepetitionsValue.Value >= p1.MissionData.Repeatable) then
		return false
	end
	p1:RestartTimers()
	return true
end
function t.Replay(p1) --[[ Replay | Line: 861 ]]
	if p1.MissionData.Replayable then
		local RepetitionsValue = p1.RepetitionsValue
		RepetitionsValue.Value = RepetitionsValue.Value + 1
		p1:RestartTimers()
		return true
	end
end
function t.RestartTimers(p1) --[[ RestartTimers | Line: 873 | Upvalues: IsServer (copy), v4 (copy) ]]
	assert(IsServer, "Mission:RestartTimers can only be called on the server")
	if not (p1.MissionData.Repeatable or p1.MissionData.Replayable) then
		return
	end
	if p1.TimeSeed then
		p1.MissionValue.Value = p1.TimeSeed:GetEndTime()
		return
	end
	if p1.MissionData.RestartTime then
		p1.MissionValue.Value = v4.GetTime() + p1.MissionData.RestartTime
	else
		p1:Reset()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 890 | Upvalues: t2 (copy), t3 (copy) ]]
	p1.Maid:Destroy()
	t2[p1.MissionValue] = nil
	local v1 = t3[p1.UserId]
	if v1 then
		v1[p1.MissionValue] = nil
	end
	setmetatable(p1, nil)
end
function t.GetAllMissions() --[[ GetAllMissions | Line: 905 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetAllMissionsForPlayer(p1) --[[ GetAllMissionsForPlayer | Line: 910 | Upvalues: t3 (copy) ]]
	local v1 = t3[p1.UserId]
	return if v1 then v1 else {}
end
function t.GetMissionForPlayer(p1, p2) --[[ GetMissionForPlayer | Line: 920 | Upvalues: t (ref) ]]
	for v2, v3 in t.GetAllMissionsForPlayer(p1) do
		if v3.MissionName == p2 then
			return v3
		end
	end
	return nil
end
return t