-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("safeDestroy")
local v2 = Sonar("EventUtils")
local v3 = Sonar("Signal")
local v4 = Sonar("StorageUtils")
local v5 = Sonar("FormatNumber")
local v6 = Sonar("NewMissionsService", {
	Deferred = true
})
local v7 = Sonar("AnalyticsService", {
	Deferred = true,
	Context = "Server"
})
local IsServer = Sonar("Constants").IsServer
local v8 = v4.GetConfig("Missions")()
local DescriptionTextPlaceholders = v8.DescriptionTextPlaceholders
local t2 = {}
function t._addTaskToState(p1) --[[ _addTaskToState | Line: 29 | Upvalues: t2 (copy) ]]
	t2[p1.TaskValue] = p1
	local v1 = p1.TaskToKeyMap[p1.TaskData.Type] or {}
	v1[p1.TaskValue] = p1
	p1.TaskToKeyMap[p1.TaskData.Type] = v1
end
function t._removeTaskFromState(p1) --[[ _removeTaskFromState | Line: 37 | Upvalues: t2 (copy) ]]
	t2[p1.TaskValue] = nil
	local v1 = p1.TaskToKeyMap[p1.TaskData.Type] or {}
	v1[p1.TaskValue] = nil
	p1.TaskToKeyMap[p1.TaskData.Type] = v1
end
function t._updateTaskData(p1) --[[ _updateTaskData | Line: 45 ]]
	local v1 = p1.TaskData and p1.TaskData.Type
	p1.TaskData = p1.Mission.MissionData.Tasks[tonumber(p1.TaskValue.Name)]
	p1.RewardData = p1.TaskData.Rewards
	p1.TaskId = tonumber(p1.TaskValue.Name)
	if v1 then
		local v4 = p1.TaskToKeyMap[v1] or {}
		v4[p1.TaskValue] = nil
		p1.TaskToKeyMap[v1] = v4
	end
	local v5 = p1.TaskToKeyMap[p1.TaskData.Type] or {}
	v5[p1.TaskValue] = p1
	p1.TaskToKeyMap[p1.TaskData.Type] = v5
	if not p1.TaskDataChangedSignal then
		return
	end
	p1.TaskDataChangedSignal:Fire()
end
function t.new(p1, p2) --[[ new | Line: 68 | Upvalues: t (copy), Sonar (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Mission = p1
	v2.Maid = v2.Mission.Maid
	v2.TaskToKeyMap = Sonar("PlayerWrapper").getWrapperFromPlayer(v2.Mission.Player).TaskToKeyMap
	v2.TaskValue = p2
	v2.AmountValue = p2.Amount
	v2.UniqueValueValue = p2.UniqueValue
	v2.MissionId = v2.Mission.MissionId
	v2.TaskId = tonumber(p2.Name)
	v2.TaskDataChangedSignal = v3.new()
	local AmountValue = v2.AmountValue.Value
	v2.Maid:GiveTask(v2.AmountValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 88 | Upvalues: v2 (copy), AmountValue (ref) ]]
		if v2.TaskData.OnChange and AmountValue ~= v2.AmountValue.Value then
			v2.TaskData.OnChange(v2.Mission.PlayerWrapper, AmountValue, v2.AmountValue.Value)
		end
		AmountValue = v2.AmountValue.Value
		if not v2:IsComplete() then
			return
		end
		v2:CheckAutoClaim()
	end))
	v2.Maid:GiveTask(v2.TaskValue:GetPropertyChangedSignal("Name"):Connect(function() --[[ Line: 99 | Upvalues: v2 (copy) ]]
		v2:_updateTaskData()
	end))
	v2:_updateTaskData()
	v2:_addTaskToState()
	return v2
end
function t.IsA(p1, p2) --[[ IsA | Line: 109 ]]
	return p2 == "Task"
end
function t.Destroy(p1) --[[ Destroy | Line: 114 | Upvalues: v1 (copy) ]]
	p1:_removeTaskFromState()
	v1(p1)
end
function t.Reset(p1) --[[ Reset | Line: 119 ]]
	if p1.TaskData.GetValue then
		p1.AmountValue.Value = p1.TaskData.GetValue(p1.Mission.PlayerWrapper, p1)
	else
		p1.AmountValue.Value = 0
	end
	p1.TaskValue.UniqueValue.Value = "{}"
	p1.TaskValue.Value = false
end
function t._formatDescriptionText(p1, p2, ...) --[[ _formatDescriptionText | Line: 130 | Upvalues: DescriptionTextPlaceholders (copy) ]]
	local t = { ... }
	return p2:gsub("(%b{})", function(p12) --[[ Line: 132 | Upvalues: DescriptionTextPlaceholders (ref), p1 (copy), t (copy) ]]
		for v1, v2 in DescriptionTextPlaceholders do
			if string.lower(p12) == string.lower("{" .. v1 .. "}") then
				return v2(p1, table.unpack(t))
			end
		end
		return p12
	end)
end
function t.CheckAutoClaim(p1) --[[ CheckAutoClaim | Line: 142 | Upvalues: IsServer (copy) ]]
	if not IsServer then
		return
	end
	if not p1.TaskData.AutoClaim then
		return
	end
	if not p1:IsComplete() or p1:IsClaimed() then
		return
	end
	p1:Claim()
end
function t.Claim(p1) --[[ Claim | Line: 157 | Upvalues: v6 (copy), v2 (copy), v7 (copy) ]]
	if p1:IsClaimed() then
		return
	end
	if not p1:IsComplete() then
		return
	end
	p1.TaskValue.Value = true
	if p1.TaskData.OnComplete then
		p1.TaskData.OnComplete(p1.Mission.PlayerWrapper, p1.TaskData)
	end
	for v1, v22 in v6.GlobalTaskCompletedCallbacks do
		v2.safeCall(v22, p1.Mission.PlayerWrapper, p1)
	end
	if p1.TaskData.Rewards then
		p1.Mission.PlayerWrapper.NewMissionsWrapper:GiveRewards(p1)
	end
	if v7 then
		local t = {
			{
				Key = "MissionName",
				Value = p1:GetAnalyticsName()
			}
		}
		t[2] = #p1:GetIdentifier() > 0 and {
			Key = "MissionId",
			Value = p1:GetIdentifier()
		} or nil
		v7.ReportDesignEvent(p1.Mission.Player, "CompleteMissionTask", t, 0)
	end
	p1.Mission:CheckAutoClaim()
	return true
end
function t.CheckFunction(p1, p2) --[[ CheckFunction | Line: 193 ]]
	if p1.TaskData.Check then
		return p1.TaskData.Check(p1.Mission.PlayerWrapper, p1, table.unpack(p2))
	else
		return true
	end
end
function t.IsValueUnique(p1, p2) --[[ IsValueUnique | Line: 202 | Upvalues: v2 (copy), HttpService (copy) ]]
	local v1 = v2.safeCall(HttpService.JSONDecode, HttpService, p1.UniqueValueValue.Value) or {}
	if table.find(v1, p2) then
		return false
	end
	table.insert(v1, p2)
	p1.UniqueValueValue.Value = v2.safeCall(HttpService.JSONEncode, HttpService, v1) or p1.UniqueValueValue.Value
	return true
end
function t.GetReward(p1) --[[ GetReward | Line: 219 ]]
	return p1.Mission:GetReward(p1)
end
function t.GetAnalyticsName(p1) --[[ GetAnalyticsName | Line: 225 ]]
	return p1.Mission.MissionNameValue.Value .. "-Task-" .. p1.TaskValue.Name
end
function t.CanIncrementTask(p1, p2) --[[ CanIncrementTask | Line: 230 ]]
	local v1 = p1:IsComplete()
	if p1.TaskData.GetValue then
		return not v1 or p1.TaskData.CanLoseGoal
	else
		if v1 then
			local AutoClaim = p1.TaskData.AutoClaim
			if AutoClaim and p1:IsClaimed() then
				return false
			end
			if not AutoClaim then
				return false
			end
		end
		if p1.Mission.MissionData.CompleteTasksInOrder then
			local v3 = p1.Mission:GetPreviousTask(p1)
			if v3 and not v3:IsComplete() then
				return false
			end
		end
		local v4 = p2.Data or {}
		if not p1.Mission:CanIncrementMission(v4) then
			return false
		end
		if not p1:CheckFunction(v4) then
			return false
		end
		if not p1.TaskData.UniqueValues then
			return true
		end
		if not p2.UniqueValue then
			warn((("Unique value required for %* task #%*"):format(p1.Mission.MissionName, p1.TaskValue.Name)))
			return false
		end
		if p1:IsValueUnique(p2.UniqueValue) then
			return true
		else
			return false
		end
	end
end
function t.SetValue(p1, p2) --[[ SetValue | Line: 277 ]]
	p1.AmountValue.Value = math.clamp(p2, 0, (p1:GetGoalAmount()))
end
function t.GetGoToAction(p1) --[[ GetGoToAction | Line: 281 ]]
	return p1.TaskData.GoToAction or p1.Mission:GetGoToAction()
end
function t.GoTo(p1, ...) --[[ GoTo | Line: 285 | Upvalues: IsServer (copy) ]]
	assert(not IsServer, "Task:GoTo can only be called on the client")
	local v2 = p1:GetGoToAction()
	if v2 then
		v2(p1.Mission.PlayerWrapper, p1, ...)
	end
end
function t.GetIdentifier(p1) --[[ GetIdentifier | Line: 296 ]]
	return p1.Mission:GetIdentifier()
end
function t.Increment(p1, p2) --[[ Increment | Line: 301 ]]
	local v1 = if p2 then p2 else {}
	if not p1:CanIncrementTask(v1) then
		return false
	end
	local v2, v3
	if p1.TaskData.GetValue then
		v2, v3 = p1.TaskData.GetValue(p1.Mission.PlayerWrapper, p1, v1), v1
	else
		v2 = p1.AmountValue.Value + (v1.Amount or 1)
		v3 = v1
	end
	p1:SetValue(v2)
	if not v3.OnIncremented then
		return true
	end
	v3.OnIncremented(p1, v2)
	return true
end
function t.IsComplete(p1) --[[ IsComplete | Line: 324 ]]
	return p1.AmountValue.Value >= p1:GetGoalAmount()
end
function t.IsClaimed(p1) --[[ IsClaimed | Line: 328 ]]
	return p1.TaskValue.Value
end
function t.IsInProgress(p1) --[[ IsInProgress | Line: 332 ]]
	return not p1:IsClaimed() and p1:GetGoalProgress() > 0
end
function t.IsClaimable(p1) --[[ IsClaimable | Line: 336 ]]
	return if p1:GetState() == "Complete" then not p1.TaskData.AutoClaim else false
end
function t.GetGoalProgress(p1) --[[ GetGoalProgress | Line: 340 ]]
	return p1:GetAmount() / p1:GetGoalAmount()
end
function t.GetGoalAmount(p1) --[[ GetGoalAmount | Line: 345 ]]
	return p1.TaskData.GetAmount and p1.TaskData.GetAmount(p1.Mission.PlayerWrapper, p1) or p1.TaskData.Amount
end
function t.GetAmount(p1) --[[ GetAmount | Line: 349 ]]
	return p1.AmountValue.Value
end
function t.GetDisplayAmount(p1) --[[ GetDisplayAmount | Line: 353 ]]
	return p1:_formatNumber(p1:GetAmount())
end
function t.GetDisplayGoalAmount(p1) --[[ GetDisplayGoalAmount | Line: 357 ]]
	return p1:_formatNumber(p1:GetGoalAmount())
end
function t._formatNumber(p1, p2) --[[ _formatNumber | Line: 361 ]]
	local Format = p1.TaskData.Format
	return typeof(Format) == "string" and string.format(Format, p2) or (typeof(Format) == "function" and Format(p2) or tostring(p2))
end
function t.GetAmountChangedSignal(p1) --[[ GetAmountChangedSignal | Line: 368 ]]
	return p1.AmountValue:GetPropertyChangedSignal("Value")
end
function t.GetClaimChangedSignal(p1) --[[ GetClaimChangedSignal | Line: 372 ]]
	return p1.TaskValue:GetPropertyChangedSignal("Value")
end
function t.GetType(p1) --[[ GetType | Line: 376 ]]
	return p1.TaskData.Type
end
function t.GetDescription(p1, p2) --[[ GetDescription | Line: 380 | Upvalues: v8 (copy), v5 (copy) ]]
	local v3 = (if p2 then p2 else {}).ShortDescription and p1.TaskData.ShortDescription or (v8.PresetDescriptions[p1.TaskData.Description or p1:GetType()] or p1.TaskData.Description)
	local v4 = p1:GetGoalAmount()
	if type(v3) == "table" then
		v3 = v4 > 1 and v3.Plural or (v3.Singular or v3)
	elseif type(v3) == "function" then
		v3 = v3(p1.Mission.PlayerWrapper, p1)
	end
	return string.format(p1:_formatDescriptionText(v3, v4), v5.suffix(v4))
end
function t.GetImage(p1) --[[ GetImage | Line: 402 | Upvalues: v8 (copy) ]]
	local Image = p1.TaskData.Image
	if type(Image) == "function" then
		Image = Image(p1.Mission.PlayerWrapper, p1)
	end
	if not Image then
		Image = v8.TypeImages[p1:GetType()]
	end
	return Image or ""
end
function t.GetState(p1) --[[ GetState | Line: 415 ]]
	if p1:IsClaimed() then
		return "Claimed"
	end
	if p1:IsComplete() then
		return "Complete"
	else
		return "Incomplete"
	end
end
function t.GetChangedSignal(p1, p2) --[[ GetChangedSignal | Line: 425 | Upvalues: v3 (copy) ]]
	local v1 = v3.new()
	v1:GiveTask(p1:GetClaimChangedSignal():Connect(function() --[[ Line: 428 | Upvalues: v1 (copy) ]]
		v1:Fire()
	end))
	v1:GiveTask(p1:GetAmountChangedSignal():Connect(function() --[[ Line: 431 | Upvalues: v1 (copy) ]]
		v1:Fire()
	end))
	v1:GiveTask(p1.TaskDataChangedSignal:Connect(function() --[[ Line: 434 | Upvalues: v1 (copy) ]]
		v1:Fire()
	end))
	if not p2 then
		v1:GiveTask(p1.Mission:GetRepetitionsChangedSignal():Connect(function() --[[ Line: 439 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
	end
	return v1
end
function t.GetAllTasks() --[[ GetAllTasks | Line: 448 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetTaskByValue(p1) --[[ GetTaskByValue | Line: 453 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
return t