-- https://lua.expert/
local t = {}
t.__index = t
local HttpService = game:GetService("HttpService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("Signal")
local v3 = Sonar("WeightedProbability")
local v4 = Sonar("MissionsService")
local v5 = Sonar("TimeSeedClass")
local v6 = Sonar("Table")
local v7 = Sonar("TimeUtils")
local v8 = v1 and Sonar("AnalyticsService")
local v9 = Sonar("StableClubsManager", {
	Deferred = true
})
local v10 = Sonar("DynamicNPCService")
local v11 = Sonar("StableClubsService", {
	Deferred = true
})
local v12 = Sonar("PlaceTypeService")
local v13 = Sonar("Constants")
local v14 = v4.GetType("SpeciesUnlocks")
local v15 = v4.GetType("SpeciesMissions")
local v16 = v4.GetType("EventMissions")
local v17 = v4.GetType("EventStreakMissions")
local v18 = v4.GetType("StoryMissions")
local v19 = v4.GetType("StreakMissions")
local v20 = v4.GetType("LimitedStockUnlocks")
local v21 = v4.GetType("OneTimeMissions")
local v22 = v4.GetType("Achivements")
local v23 = v4.GetType("Milestones")
local v24 = v4.GetType("NpcMissions")
local v25 = v4.GetType("StableClubMissions")
local v26 = v4.GetType("PassMissions")
local v27 = v4.GetType("Tutorial")
local v28 = v4.GetType("WorldMissions")
local v29 = v4.GetType("MiniMissions")
local v30 = Sonar(ReplicatedStorage.Storage.Events.ToyEvent.AutumnEvent)
local v31 = v4.GetType("HourlyMissions")
function t.new(p1) --[[ new | Line: 53 | Upvalues: t (copy), v2 (copy), v1 (copy), v5 (copy), v12 (copy), v4 (copy), v13 (copy), v31 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = p1.Maid
	v22.PlayerWrapper = p1
	v22.PlayerData = p1.PlayerData
	v22.AllMissionsByType = {}
	v22.AllAchievementMissions = {}
	v22.AllMissions = {}
	v22.MissionsChangedSignal = v2.new()
	v22.Maid:GiveTask(v22.MissionsChangedSignal)
	p1.MissionsChangedSignal = v22.MissionsChangedSignal
	v22.MissionStartTimeValue = v22.PlayerData and v22.PlayerData.Missions.MissionStartTime
	v22.SpeciesMissionStartTimeValue = v22.PlayerData and v22.PlayerData.Missions.SpeciesMissionStartTime
	v22.EventMissionsData = p1.EventData and p1.EventData:FindFirstChild("Missions")
	v22.EventStreakMissionsData = p1.EventData and p1.EventData:FindFirstChild("StreakMissions")
	v22.PassMissionsData = p1.EventData and p1.EventData:FindFirstChild("PassMissions")
	v22.HourlyMissionsData = p1.EventData and p1.EventData:FindFirstChild("HourlyMissions")
	if v1 and v22.MissionStartTimeValue.Value <= 0 then
		v22.MissionStartTimeValue.Value = os.time()
	end
	if v1 or p1.IsLocalPlayer then
		local t2 = {
			Start = v22:GetSpeciesMissionStartTime()
		}
		t2.Duration = if v12.IsTestGame() then 600 else 43200
		v22.SpeciesMissionTimer = v5.new(t2)
		v22.Maid:GiveTask(v22.SpeciesMissionTimer)
		v22.Maid:GiveTask(v22.SpeciesMissionStartTimeValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 91 | Upvalues: v22 (copy) ]]
			v22.SpeciesMissionTimer:UpdateStartTime(v22:GetSpeciesMissionStartTime())
		end))
		p1.SpeciesMissionTimer = v22.SpeciesMissionTimer
	end
	if v1 then
		for k, v in pairs(v22.PlayerData.Missions.SpeciesUnlocks:GetChildren()) do
			v22:AddSpeciesUnlockMission(v)
		end
		local LimitedStockUnlocks = v22.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
		if LimitedStockUnlocks then
			v4.RemoveStaleLimitedStockUnlockMissions(p1, v22)
			for k, v in pairs(LimitedStockUnlocks:GetChildren()) do
				v22:AddLimitedStockUnlockMission(v)
			end
			v4.UnpinLimitedStockUnlocksIfOutOfStock(p1)
		end
		for k, v in pairs(v22.PlayerData.Missions.SpeciesMissions:GetChildren()) do
			v22:AddSpeciesMission(v)
		end
		for k, v in pairs(v22.PlayerData.Missions.OneTimeMissions:GetChildren()) do
			v22:AddOneTimeMission(v)
		end
		for k, v in pairs(v22.PlayerData.Missions.NPCMissions:GetChildren()) do
			for v11, v122 in v:GetChildren() do
				v22:AddNpcMission(v122)
			end
		end
		for k, v in pairs(v22.PlayerData.Missions.WorldMissions:GetChildren()) do
			v22:AddWorldMission(v)
		end
		for k, v in pairs(v22.PlayerData.Tutorial.Missions:GetChildren()) do
			v22:AddTutorialMission(v)
		end
		if v13.EventName then
			for k, v in pairs(v22.PlayerData.Events[v13.EventName].MiniQuests:GetChildren()) do
				v22:AddMiniQuestMission(v)
			end
			local v132 = v22.PlayerWrapper.EventData and v22.PlayerWrapper.EventData:FindFirstChild("AutumnEvent")
			if v132 then
				v22:AddAutumnEventMission(v132)
			end
		end
		local function resetStreakRewards() --[[ resetStreakRewards | Line: 149 | Upvalues: v22 (copy), v4 (ref) ]]
			if v22.PlayerData.Missions.StreakMissions.LastMissions.Value == v4.StreakMissionTimer.CurrentSeed then
				return
			end
			v22.PlayerData.Missions.StreakMissions.LastMissions.Value = v4.StreakMissionTimer.CurrentSeed
			v22.PlayerData.Missions.StreakMissions.StreakPoints.Value = 0
			for k, v in pairs(v22.PlayerData.Missions.StreakMissions.ClaimedTiers:GetChildren()) do
				v.Value = false
			end
		end
		v22.Maid:GiveTask(v4.StreakMissionTimer.SeedChanged:Connect(resetStreakRewards))
		resetStreakRewards()
		for k, v in pairs(v22.PlayerData.Missions.StreakMissions.Missions:GetChildren()) do
			v22:AddStreakMission(v)
		end
		local StableClubs = v22.PlayerData.Missions:FindFirstChild("StableClubs")
		if StableClubs then
			v22:AddStableClubMissions(StableClubs)
		end
		for k, v in pairs(v22.PlayerData.Missions.StoryMissions:GetChildren()) do
			for k2, v9 in pairs(v.Stories:GetChildren()) do
				v22:AddStoryMission(v9, v)
			end
		end
		for k, v in pairs(v22.PlayerData.Missions.Achivements:GetChildren()) do
			v22:AddAchievement(v)
		end
		for v142, v15 in v22.PlayerData.Missions.Milestones:GetChildren() do
			for v16, v17 in v15:GetChildren() do
				v22:AddMilestones(v17)
			end
		end
		if v22.EventMissionsData then
			for v18, v19 in v22.EventMissionsData:GetChildren() do
				v22:AddEventMission(v19)
			end
		end
		if v22.PassMissionsData then
			for k, v in pairs(v22.PassMissionsData:GetChildren()) do
				v22:AddPassMission(v)
			end
		end
		if v22.EventStreakMissionsData then
			local function resetEventStreakRewards() --[[ resetEventStreakRewards | Line: 203 | Upvalues: v22 (copy), v4 (ref), p1 (copy) ]]
				if v22.EventStreakMissionsData.LastMissions.Value == v4.EventStreakMissionTimer.CurrentSeed then
					return
				end
				v22.EventStreakMissionsData.LastMissions.Value = v4.EventStreakMissionTimer.CurrentSeed
				v22.EventStreakMissionsData.StreakPoints.Value = 0
				for k, v in pairs(v22.EventStreakMissionsData.ClaimedTiers:GetChildren()) do
					v.Value = false
				end
				p1.EventData.StreakMissions.ClaimedTiers[1].Value = false
			end
			v22.Maid:GiveTask(v4.EventStreakMissionTimer.SeedChanged:Connect(resetEventStreakRewards))
			resetEventStreakRewards()
			for k, v in pairs(v22.EventStreakMissionsData.Missions:GetChildren()) do
				v22:AddEventStreakMission(v)
			end
		end
		if v22.HourlyMissionsData and v31 then
			v22:InitHourlyMissions()
		end
	end
	if v22.EventMissionsData and (v1 or p1.IsLocalPlayer) then
		for k, v in pairs(v22.EventMissionsData:GetDescendants()) do
			v22:ListenForMission(v)
		end
	end
	if v22.EventStreakMissionsData and (v1 or p1.IsLocalPlayer) then
		for k, v in pairs(v22.EventStreakMissionsData:GetDescendants()) do
			v22:ListenForMission(v)
		end
	end
	if v22.HourlyMissionsData and (v1 or p1.IsLocalPlayer) then
		for v20, v21 in v22.HourlyMissionsData:GetDescendants() do
			v22:ListenForMission(v21)
		end
	end
	if v1 or p1.IsLocalPlayer then
		for k, v in pairs(v22.PlayerData.Missions:GetDescendants()) do
			v22:ListenForMission(v)
		end
		local LimitedStockUnlocks = v22.PlayerData.Missions:FindFirstChild("LimitedStockUnlocks")
		if LimitedStockUnlocks then
			v22.Maid:GiveTask(LimitedStockUnlocks.DescendantAdded:Connect(function(p1) --[[ Line: 263 | Upvalues: v22 (copy) ]]
				v22:ListenForMission(p1)
				v22.MissionsChangedSignal:Fire()
			end))
		end
	end
	for k, v in pairs(t) do
		if type(v) == "function" and not p1[k] then
			p1[k] = function(p1, ...) --[[ Line: 278 | Upvalues: v (copy), v22 (copy) ]]
				return v(v22, ...)
			end
		end
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 286 ]]
	setmetatable(p1, nil)
end
function t.GetSpeciesMissionStartTime(p1) --[[ GetSpeciesMissionStartTime | Line: 290 ]]
	if p1.SpeciesMissionStartTimeValue.Value <= 0 then
		return os.time() + 31536000
	else
		return p1.SpeciesMissionStartTimeValue.Value
	end
end
function t.ListenForMission(p1, p2) --[[ ListenForMission | Line: 298 ]]
	if p2:IsA("BoolValue") then
		p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 302 | Upvalues: p1 (copy) ]]
			p1.MissionsChangedSignal:Fire()
		end))
	end
end
function t.IncrementMission(p1, p2) --[[ IncrementMission | Line: 307 ]]
	local v1, v2 = pcall(function() --[[ Line: 308 | Upvalues: p1 (copy), p2 (copy) ]]
		local v1 = tick()
		p1.IncrementingMission = v1
		if p1.AllMissionsByType[p2.Type] then
			for v2, v3 in p1.AllMissionsByType[p2.Type] do
				if p1:_canIncrementMission(p2, v3) then
					if v3.MissionValue:FindFirstChild("TargetAmount") then
						v3.MissionValue.Amount.Value = math.min(v3.MissionValue.TargetAmount.Value, v3.MissionValue.Amount.Value + p2.Amount)
						continue
					end
					v3.MissionValue.Amount.Value = math.min(v3.Amount, v3.MissionValue.Amount.Value + p2.Amount)
				end
			end
		end
		for v6, v7 in p1.AllMissions do
			for v8, v9 in v7 do
				if p1:_canIncrementMission(p2, v9) then
					if v9.MissionValue:FindFirstChild("TargetAmount") then
						v9.MissionValue.Amount.Value = math.min(v9.MissionValue.TargetAmount.Value, v9.MissionValue.Amount.Value + p2.Amount)
						continue
					end
					v9.MissionValue.Amount.Value = math.min(v9.Amount, v9.MissionValue.Amount.Value + p2.Amount)
				end
			end
		end
		for v12, v13 in p1.AllAchievementMissions do
			for v14, v15 in v13 do
				if p1:_canIncrementAchievement(p2, v15) then
					v15.MissionValue.Amount.Value = math.min(v15.Amount, v15.MissionValue.Amount.Value + p2.Amount)
				end
			end
		end
		if p1.IncrementingMission ~= v1 then
			return
		end
		p1.IncrementingMission = false
	end)
	if v1 then
		return
	end
	warn("[MissionsHandler] IncrementMission failed:", v2, p2.Type)
end
function t._canIncrementAchievement(p1, p2, p3) --[[ _canIncrementAchievement | Line: 371 ]]
	if not p3.Type then
		return
	end
	if p2.Type ~= p3.Type then
		return
	end
	if not p3.Check then
		return true
	end
	p2.Data = p2.Data or {}
	if p3.Check(p2.Data[1], p2.Data[2], p2.Data[3]) then
		return true
	end
end
function t._canIncrementMission(p1, p2, p3) --[[ _canIncrementMission | Line: 390 ]]
	if not p3.Active then
		return false, "NotActive"
	end
	if not p3.Type then
		return false, "NoType"
	end
	if p2.Type ~= p3.Type then
		return
	end
	if not p3.Check then
		return true
	end
	p2.Data = p2.Data or {}
	if p3.Check(p2.Data[1], p2.Data[2], p2.Data[3], p2.Data[4], p1.PlayerWrapper) then
		return true
	end
end
function t.DecodeRewards(p1, p2) --[[ DecodeRewards | Line: 420 | Upvalues: HttpService (copy) ]]
	local v1, v2 = pcall(function() --[[ Line: 421 | Upvalues: HttpService (ref), p2 (copy) ]]
		return HttpService:JSONDecode(p2.Reward.Value)
	end)
	return v1 and v2
end
function t._createMissionInfo(p1, p2, p3) --[[ _createMissionInfo | Line: 427 ]]
	return {
		Type = p2.Type,
		Amount = p2.Amount,
		Check = p2.Check,
		MissionValue = p3
	}
end
function t._checkAllMissionsCompleted(p1, p2, p3) --[[ _checkAllMissionsCompleted | Line: 436 ]]
	for v1, v2 in p2.Missions:GetChildren() do
		if p3 then
			local find = table.find
			if not find(p3, (tonumber(v2.Name))) then
				continue
			end
		end
		if not v2.Value then
			return false
		end
	end
	return true
end
function t._setOverallCompleted(p1, p2, p3, p4) --[[ _setOverallCompleted | Line: 448 ]]
	if p2.Value then
		return
	end
	local v1 = p1:_checkAllMissionsCompleted(p3)
	p2.Value = v1
	if not (v1 and p4) then
		return
	end
	p4()
end
function t._waitForIncrementingMission(p1) --[[ _waitForIncrementingMission | Line: 459 ]]
	if not p1.IncrementingMission then
		return
	end
	repeat
		task.wait()
	until not p1.IncrementingMission
end
function t._addMissionToType(p1, p2, p3) --[[ _addMissionToType | Line: 467 ]]
	if not p1.AllMissionsByType[p2] then
		p1.AllMissionsByType[p2] = {}
	end
	table.insert(p1.AllMissionsByType[p2], p3)
end
function t._addMissionToAchievement(p1, p2, p3) --[[ _addMissionToAchievement | Line: 474 ]]
	if not p1.AllAchievementMissions[p2] then
		p1.AllAchievementMissions[p2] = {}
	end
	table.insert(p1.AllAchievementMissions[p2], p3)
end
function t._handleMissionCompletion(p1, p2, p3, p4) --[[ _handleMissionCompletion | Line: 481 ]]
	if p2.Value then
		return
	end
	p2.Value = p2.Amount.Value >= p3.Amount
end
function t._generateMissionRewards(p1, p2, p3, p4) --[[ _generateMissionRewards | Line: 489 | Upvalues: v3 (copy), v13 (copy), HttpService (copy) ]]
	local t = {}
	for k, v in pairs(p3.Rewards) do
		t[k] = v
	end
	local t2 = {}
	for i = 1, p4 or 1 do
		local v1 = v3.getRandomWeightedItem(t)
		local v2 = t[v1]
		if v2.PullTable then
			local v32 = v3.getRandomFromTable(v2.PullTable)
			t[v1] = nil
			local t3 = {
				Name = v32,
				Amount = v2.Amount or 1
			}
			local _ = v2.Theme == "Random"
			local v4 = math.random()
			t3.Theme = v4 <= (v2.ThemeChance or v13.RandomEquipmentDropThemeChance) and v3.getRandomWeightedItem(v13.RandomEquipmentDropThemes) or nil
			table.insert(t2, t3)
			continue
		end
		t[v1] = nil
		table.insert(t2, v1)
	end
	p2.Reward.Value = HttpService:JSONEncode(t2)
end
function t.CheckMissionRewards(p1, p2, p3) --[[ CheckMissionRewards | Line: 519 ]]
	if not p2:FindFirstChild("Reward") then
		return
	end
	if p2.Reward.Value ~= "" then
		return
	end
	p1:_generateMissionRewards(p2, p3, p3.RewardAmount)
end
function t.GetMissionRewards(p1, p2, p3) --[[ GetMissionRewards | Line: 529 ]]
	p1:_generateMissionRewards(p2, p3, p3.RewardAmount)
end
function t.ResetMissions(p1, p2, p3, p4, p5) --[[ ResetMissions | Line: 533 ]]
	if p2:IsA("BoolValue") then
		p2.Value = false
	end
	if p2:FindFirstChild("Started") then
		p2.Started.Value = false
	end
	p2.Completed.Value = false
	if p2:FindFirstChild("Finished") then
		p2.Finished.Value = false
	end
	if p2:FindFirstChild("Claimed") then
		p2.Claimed.Value = false
	end
	if p2:FindFirstChild("Pinned") then
		p2.Pinned.Value = false
	end
	if p2:FindFirstChild("Reward") and not p5 then
		p1:GetMissionRewards(p2, p3)
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		v.Type.Value = ""
		p1:GenerateMission(p2, v, p3.Missions[tonumber(v.Name)])
	end
end
function t.GenerateMission(p1, p2, p3, p4, p5) --[[ GenerateMission | Line: 564 | Upvalues: v6 (copy) ]]
	if not p4 then
		return
	end
	if p4.MissionsByIndex then
		local v1 = v6.Copy(p4.MissionsByIndex)
		local v2
		if p5 or #v1 == 1 then
			v2 = 1
		else
			for k, v in pairs(p2.Missions:GetChildren()) do
				if p4.MissionsByType[v.Type.Value] then
					table.remove(v1, table.find(v1, v.Type.Value))
				end
			end
			v2 = math.random(1, #v1)
		end
		local v4 = v1[v2]
		local v5 = p4.MissionsByType[v4]
		p3.Amount.Value = 0
		p3.Type.Value = v4
		if p3:FindFirstChild("Claimed") then
			p3.Claimed.Value = false
		end
		if p3:FindFirstChild("TargetAmount") then
			p3.TargetAmount.Value = v5.Amount
		end
		p3.Value = false
		if p4.Rewards and p3:FindFirstChild("Reward") then
			p1:GetMissionRewards(p3, p4)
		end
	else
		p3.Amount.Value = 0
		p3.Type.Value = ""
		if p3:FindFirstChild("TargetAmount") then
			p3.TargetAmount.Value = p4.Amount
		end
		if p3:FindFirstChild("Claimed") then
			p3.Claimed.Value = false
		end
		p3.Value = false
	end
end
function t.AddEventMission(p1, p2) --[[ AddEventMission | Line: 612 | Upvalues: v16 (copy), v13 (copy) ]]
	local v1 = v16[p2.Name]
	local function checkAndResetMission() --[[ checkAndResetMission | Line: 616 | Upvalues: p2 (copy), v13 (ref) ]]
		if not (p2.Completed.Value and p2.Claimed.Value) then
			return
		end
		local CompletedAt = p2.CompletedAt.Value
		if not (CompletedAt > 0 and workspace:GetServerTimeNow() >= CompletedAt + v13.CurrentEvent.MiniQuestCooldown) then
			return
		end
		p2.Completed.Value = false
		p2.Claimed.Value = false
		p2.CompletedAt.Value = 0
		for v1, v2 in p2.Missions:GetChildren() do
			v2.Value = false
			v2.Amount.Value = 0
		end
	end
	checkAndResetMission()
	p1.Maid:GiveTask(task.spawn(function() --[[ Line: 639 | Upvalues: checkAndResetMission (copy) ]]
		while true do
			task.wait(15)
			checkAndResetMission()
		end
	end))
	local Completed = p2.Completed
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 648 | Upvalues: p1 (copy), Completed (copy), p2 (copy), v1 (copy) ]]
		p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 649 | Upvalues: v1 (ref), p1 (ref) ]]
			if not v1.RunOnComplete then
				return
			end
			v1.RunOnComplete(p1)
		end)
	end
	local function unpinAllMissions() --[[ unpinAllMissions | Line: 656 | Upvalues: p2 (copy) ]]
		if not p2.Claimed.Value then
			return
		end
		for v1, v2 in p2.Missions:GetChildren() do
			if v2:FindFirstChild("Pinned") and v2.Pinned.Value then
				v2.Pinned.Value = false
			end
		end
	end
	p1.Maid:GiveTask(p2.Claimed:GetPropertyChangedSignal("Value"):Connect(unpinAllMissions))
	unpinAllMissions()
	local v2 = v1.Requires and p1.EventMissionsData:FindFirstChild(v1.Requires)
	for v3, v4 in p2.Missions:GetChildren() do
		local v5 = v1.Missions[v4.Name]
		local v6 = p1:_createMissionInfo(v5, v4)
		local function getActive() --[[ getActive | Line: 674 | Upvalues: v4 (copy), v2 (copy) ]]
			if v4.Value then
				return
			end
			if not v2 then
				return true
			end
			local CompletedCount = v2:FindFirstChild("CompletedCount")
			if CompletedCount and CompletedCount.Value >= 1 then
				return true
			end
			if v2.Claimed.Value then
				return true
			end
		end
		p1:_addMissionToType(v5.Type, v6)
		local function setCompleted(p12) --[[ setCompleted | Line: 692 | Upvalues: v4 (copy), p1 (copy), v5 (copy), v6 (copy), v2 (copy) ]]
			if p12 and (v4:FindFirstChild("Claimed") and v4.Claimed.Value) then
				v4.Value = true
			end
			p1:_handleMissionCompletion(v4, v5)
			p1:_waitForIncrementingMission()
			local v22
			if v4.Value then
				v22 = nil
			elseif v2 then
				local CompletedCount = v2:FindFirstChild("CompletedCount")
				v22 = if CompletedCount and CompletedCount.Value >= 1 or v2.Claimed.Value then true else nil
			else
				v22 = true
			end
			v6.Active = v22
			if not (v6.Active and (v5.CompleteOnUnlock and v5.CompleteOnUnlock(p1.PlayerWrapper))) then
				return
			end
			p1:IncrementMission({
				Type = v5.Type,
				Amount = v5.Amount
			})
		end
		p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(v4:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
		p1.Maid:GiveTask(v4.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		if v2 then
			p1.Maid:GiveTask(v2.Claimed:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			local CompletedCount = v2:FindFirstChild("CompletedCount")
			if CompletedCount then
				p1.Maid:GiveTask(CompletedCount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			end
		end
		setCompleted(true)
	end
	p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 649 | Upvalues: v1 (copy), p1 (copy) ]]
		if not v1.RunOnComplete then
			return
		end
		v1.RunOnComplete(p1)
	end)
end
function t.AddMiniQuestMission(p1, p2) --[[ AddMiniQuestMission | Line: 724 | Upvalues: v29 (copy), v1 (copy), v8 (copy) ]]
	local v12 = p2.Name
	local v2 = v29[tonumber(v12)]
	if not v2 then
		warn("No MiniQuest data found for:", v12)
		return
	end
	local Completed = p2.Completed
	if v1 and not Completed.Value then
		v8.GamebeastPlayerMarker(p1.PlayerWrapper.Player, "MiniQuest", {
			{
				Key = "Status",
				Value = "Started"
			},
			{
				Key = "MissionId",
				Value = v12
			}
		}, 1)
	end
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 743 | Upvalues: p1 (copy), Completed (copy), p2 (copy), v2 (copy) ]]
		p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 744 | Upvalues: v2 (ref), p1 (ref) ]]
			if not v2.RunOnComplete then
				return
			end
			v2.RunOnComplete(p1)
		end)
	end
	local function unpinAllMissions() --[[ unpinAllMissions | Line: 751 | Upvalues: p2 (copy) ]]
		if not p2.Claimed.Value then
			return
		end
		for v1, v2 in p2.Missions:GetChildren() do
			if v2:FindFirstChild("Pinned") and v2.Pinned.Value then
				v2.Pinned.Value = false
			end
		end
	end
	p1.Maid:GiveTask(p2.Claimed:GetPropertyChangedSignal("Value"):Connect(unpinAllMissions))
	unpinAllMissions()
	for v3, v4 in p2.Missions:GetChildren() do
		local v5 = v2.Missions[v4.Name]
		if v5 then
			local v6 = p1:_createMissionInfo(v5, v4)
			local function getActive() --[[ getActive | Line: 771 | Upvalues: v2 (copy), v4 (copy) ]]
				if v2.UnlockDate and workspace:GetServerTimeNow() < v2.UnlockDate then
					return
				end
				if v4.Value then
				else
					return true
				end
			end
			p1:_addMissionToType(v5.Type, v6)
			local function setCompleted(p12) --[[ setCompleted | Line: 785 | Upvalues: v4 (copy), p1 (copy), v5 (copy), v6 (copy), v2 (copy) ]]
				if p12 and v4.Claimed.Value then
					v4.Value = true
				end
				p1:_handleMissionCompletion(v4, v5)
				p1:_waitForIncrementingMission()
				v6.Active = if v2.UnlockDate and workspace:GetServerTimeNow() < v2.UnlockDate then nil elseif v4.Value then nil else true
				if not (v6.Active and (v5.CompleteOnUnlock and v5.CompleteOnUnlock(p1.PlayerWrapper))) then
					return
				end
				p1:IncrementMission({
					Type = v5.Type,
					Amount = v5.Amount
				})
			end
			p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			p1.Maid:GiveTask(v4:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
			p1.Maid:GiveTask(v4.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			setCompleted(true)
		end
	end
	p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 744 | Upvalues: v2 (copy), p1 (copy) ]]
		if not v2.RunOnComplete then
			return
		end
		v2.RunOnComplete(p1)
	end)
end
function t.AddAutumnEventMission(p1, p2) --[[ AddAutumnEventMission | Line: 810 | Upvalues: v30 (copy) ]]
	if not (v30 and v30[1]) then
		return
	end
	local v1 = v30[1]
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 817 | Upvalues: p2 (copy) ]]
		local v1 = true
		for v2, v3 in p2.Missions:GetChildren() do
			if not v3.Value then
				v1 = false
				break
			end
		end
		p2.Value = v1
	end
	for v2, v3 in p2.Missions:GetChildren() do
		local v5 = v1.Missions[tonumber(v3.Name)]
		if v5 then
			local v6 = p1:_createMissionInfo(v5, v3)
			local function getActive() --[[ getActive | Line: 836 | Upvalues: v3 (copy), p2 (copy) ]]
				if v3.Value then
				else
					return p2.Started.Value
				end
			end
			p1:_addMissionToType(v6.Type, v6)
			local function setCompleted() --[[ setCompleted | Line: 845 | Upvalues: p1 (copy), v3 (copy), v5 (copy), v6 (copy), p2 (copy) ]]
				p1:_handleMissionCompletion(v3, v5)
				v6.Active = if v3.Value then nil else p2.Started.Value
			end
			p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 850 | Upvalues: v6 (copy), v3 (copy), p2 (copy) ]]
				v6.Active = if v3.Value then nil else p2.Started.Value
			end))
			p1.Maid:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
			p1.Maid:GiveTask(v3.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			p1:_handleMissionCompletion(v3, v5)
			v6.Active = if v3.Value then nil else p2.Started.Value
		end
	end
	local v8 = true
	for v9, v10 in p2.Missions:GetChildren() do
		if not v10.Value then
			v8 = false
			break
		end
	end
	p2.Value = v8
end
function t.AddPassMission(p1, p2) --[[ AddPassMission | Line: 861 | Upvalues: v26 (copy) ]]
	local v1 = v26[p2.Name]
	local Completed = p2.Completed
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 866 | Upvalues: p1 (copy), Completed (copy), p2 (copy), v1 (copy) ]]
		p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 867 | Upvalues: v1 (ref), p1 (ref), p2 (ref) ]]
			for k2, v in pairs(v1.Rewards) do
				p1.PlayerWrapper:GiveItem({
					Source = "EventPassMission",
					IgnoreLimit = true,
					Name = v.Name,
					Amount = v.Amount or 1
				})
			end
			p2.Pinned.Value = false
		end)
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v2 = v1.Missions[v.Name]
		local v3 = p1:_createMissionInfo(v2, v)
		v3.IsEventMission = true
		local function getActive() --[[ getActive | Line: 889 | Upvalues: v (copy), v1 (copy), p1 (copy) ]]
			if v.Value then
				return
			end
			if not (v1.Bonus and v1.PointsNeeded) then
				return true
			end
			local count = 0
			for v12, v2 in p1.PassMissionsData:GetChildren() do
				if v2.Completed.Value then
					count = count + 1
				end
			end
			if count < v1.PointsNeeded then
				return false
			else
				return true
			end
		end
		p1:_addMissionToType(v2.Type, v3)
		local function setCompleted(p12) --[[ setCompleted | Line: 915 | Upvalues: v (copy), p1 (copy), v2 (copy), v3 (copy), getActive (copy) ]]
			if p12 and v.Claimed.Value then
				v.Value = true
			end
			p1:_handleMissionCompletion(v, v2)
			v.Completed.Value = v.Value
			p1:_waitForIncrementingMission()
			v3.Active = getActive()
			if not (v3.Active and (v2.CompleteOnUnlock and v2.CompleteOnUnlock(p1.PlayerWrapper))) then
				return
			end
			p1:IncrementMission({
				Type = v2.Type,
				Amount = v2.Amount
			})
		end
		p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
		p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		if v1.Bonus and v1.PointsNeeded then
			for v4, v5 in p1.PassMissionsData:GetChildren() do
				p1.Maid:GiveTask(v5.Completed:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 943 | Upvalues: v3 (copy), getActive (copy) ]]
					v3.Active = getActive()
				end))
			end
		end
		setCompleted(true)
	end
	p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 867 | Upvalues: v1 (copy), p1 (copy), p2 (copy) ]]
		for k2, v in pairs(v1.Rewards) do
			p1.PlayerWrapper:GiveItem({
				Source = "EventPassMission",
				IgnoreLimit = true,
				Name = v.Name,
				Amount = v.Amount or 1
			})
		end
		p2.Pinned.Value = false
	end)
end
function t.AddAchievement(p1, p2) --[[ AddAchievement | Line: 956 | Upvalues: v22 (copy) ]]
	local v3 = v22[tonumber(p2.Name)]
	local function setCompleted(p12, p22) --[[ setCompleted | Line: 959 | Upvalues: p2 (copy), p1 (copy), v3 (copy) ]]
		if not (p12 and p2.Claimed.Value) then
			p1:_handleMissionCompletion(p2, v3)
			p1:_waitForIncrementingMission()
			return
		end
		p2.Value = true
		p1:_handleMissionCompletion(p2, v3)
		p1:_waitForIncrementingMission()
	end
	p1.Maid:GiveTask(p2.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
	if p2.Claimed.Value then
		p2.Value = true
	end
	p1:_handleMissionCompletion(p2, v3)
	p1:_waitForIncrementingMission()
	p1:_addMissionToAchievement(v3.Type, (p1:_createMissionInfo(v3, p2)))
	p1:GenerateMission(p2, v3)
end
function t.AddMilestones(p1, p2) --[[ AddMilestones | Line: 977 | Upvalues: v23 (copy) ]]
	local v3 = v23[p2.Type.Value][tonumber(p2.Name)]
	local function setCompleted(p12, p22) --[[ setCompleted | Line: 980 | Upvalues: p2 (copy), p1 (copy), v3 (copy) ]]
		if p12 and p2.Claimed.Value then
			p2.Value = true
		end
		p1:_handleMissionCompletion(p2, v3)
		p1:_waitForIncrementingMission()
	end
	p1.Maid:GiveTask(p2.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
	if p2.Claimed.Value then
		p2.Value = true
	end
	p1:_handleMissionCompletion(p2, v3)
	p1:_waitForIncrementingMission()
	p1:_addMissionToAchievement(v3.Type, (p1:_createMissionInfo(v3, p2)))
	p1:GenerateMission(p2, v3)
end
function t.AddSpeciesMission(p1, p2) --[[ AddSpeciesMission | Line: 998 | Upvalues: v15 (copy), v8 (copy), v7 (copy) ]]
	local Completed = p2.Completed
	local Finished = p2.Finished
	local v1 = v15.Missions[p2.Name]
	local function setFinished() --[[ setFinished | Line: 1003 | Upvalues: Completed (copy), Finished (copy), p1 (copy), v8 (ref) ]]
		if not Completed.Value then
			return
		end
		if Finished.Value then
			return
		end
		Finished.Value = true
		local NewMissionsWrapper = p1.PlayerWrapper.NewMissionsWrapper
		if NewMissionsWrapper then
			NewMissionsWrapper:IncrementMission("CompleteAnySpeciesQuest", {
				Data = {}
			})
		end
		v8.ReportResourceEvent(p1.PlayerWrapper.Player, "Source", "SpeciesMission", "ReplayMission", "SpeciesMissions", 1)
		p1:IncrementMission({
			Type = "SpeciesReplay",
			Amount = 1
		})
	end
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1024 | Upvalues: Completed (copy), setFinished (copy), p2 (copy), p1 (copy) ]]
		if not Completed.Value then
			local v1 = true
			for k, v in pairs(p2.Missions:GetChildren()) do
				if not v.Value then
					v1 = false
				end
			end
			Completed.Value = v1
			if not v1 then
				return
			end
			local NewMissionsWrapper = p1.PlayerWrapper.NewMissionsWrapper
			if NewMissionsWrapper then
				NewMissionsWrapper:IncrementMission("CompleteAnySpeciesQuest", {
					Data = {}
				})
			end
			p1:IncrementMission({
				Type = "CompleteMission",
				Amount = 1,
				Data = { "SpeciesMission", p2.Name }
			})
			p1.PlayerWrapper:IncrementStat({
				Type = "ReplayQuestsCompleted",
				Amount = 1
			})
		end
		setFinished()
	end
	local function attemptToReset() --[[ attemptToReset | Line: 1058 | Upvalues: p2 (copy), p1 (copy), Completed (copy), v1 (copy) ]]
		if p2.Value == p1.SpeciesMissionTimer.CurrentSeed then
			return
		end
		local v12 = if p2.Started.Value and p2.Value > 0 then true else Completed.Value
		p2.Value = p1.SpeciesMissionTimer.CurrentSeed
		if p2:FindFirstChild("Reward") then
			p1:GetMissionRewards(p2, v1)
		end
		if v12 then
			p1:ResetMissions(p2, v1, true, true)
		end
		for k, v in pairs(p2.Missions:GetChildren()) do
			if v:FindFirstChild("Pinned") and v.Pinned.Value and p2.Value ~= p1.SpeciesMissionTimer.CurrentSeed then
				v.Pinned.Value = false
			end
		end
	end
	local function setMissionTimer() --[[ setMissionTimer | Line: 1082 | Upvalues: p1 (copy), p2 (copy), v7 (ref) ]]
		if not (p1.SpeciesMissionStartTimeValue.Value <= 0 and p2.Started.Value) then
			return
		end
		p1.SpeciesMissionStartTimeValue.Value = v7.Get() - 1
	end
	p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(setMissionTimer))
	if p1.SpeciesMissionStartTimeValue.Value <= 0 and p2.Started.Value then
		p1.SpeciesMissionStartTimeValue.Value = v7.Get() - 1
	end
	local v2 = p2.Missions:FindFirstChild("1")
	local v4 = v1.Missions[tonumber(v2.Name)]
	if v4.MissionsByType and not v4.MissionsByType[v2.Type.Value] then
		p1:GenerateMission(p2, v2, v4, true)
	end
	local t = {
		MissionValue = v2
	}
	if not p1.AllMissions[p2.Name] then
		p1.AllMissions[p2.Name] = {}
	end
	p1.AllMissions[p2.Name][v2] = t
	local function hasStarted() --[[ hasStarted | Line: 1106 | Upvalues: p2 (copy) ]]
		return p2.Started.Value
	end
	local function getActive() --[[ getActive | Line: 1109 | Upvalues: v2 (copy), t (copy), p2 (copy), p1 (copy) ]]
		if v2.Value then
			return
		end
		if not t.Type then
			return
		end
		if p2.Value == p1.SpeciesMissionTimer.CurrentSeed then
			return p2.Started.Value
		end
	end
	local function setCompleted(p12) --[[ setCompleted | Line: 1122 | Upvalues: t (copy), v2 (copy), p2 (copy), p1 (copy) ]]
		if not t.Type then
			return
		end
		if v2.TargetAmount.Value <= 0 then
			return
		end
		if p12 and v2.Claimed.Value then
			v2.Value = true
		end
		if not v2.Value then
			v2.Value = v2.Amount.Value >= v2.TargetAmount.Value
		end
		t.Active = if v2.Value or (not t.Type or p2.Value ~= p1.SpeciesMissionTimer.CurrentSeed) then nil else p2.Started.Value
	end
	p1.Maid:GiveTask(v2.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
	p1.Maid:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(setCompleted))
	if t.Type and not (v2.TargetAmount.Value <= 0) then
		if v2.Claimed.Value then
			v2.Value = true
		end
		if not v2.Value then
			v2.Value = v2.Amount.Value >= v2.TargetAmount.Value
		end
		t.Active = if v2.Value or (not t.Type or p2.Value ~= p1.SpeciesMissionTimer.CurrentSeed) then nil else p2.Started.Value
	end
	local function setMission(p12) --[[ setMission | Line: 1142 | Upvalues: v4 (copy), v2 (copy), p2 (copy), t (copy), p1 (copy) ]]
		local v1 = v4.MissionsByType and v4.MissionsByType[v2.Type.Value] or v4
		if not v1 then
			return
		end
		if not v1.Type then
			return
		end
		if not p2.Started.Value then
			return
		end
		t.Type = v1.Type
		t.Check = v1.Check
		t.Active = if v2.Value or (not t.Type or p2.Value ~= p1.SpeciesMissionTimer.CurrentSeed) then nil else p2.Started.Value
	end
	p1.Maid:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
	p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(setMission))
	p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setMission))
	p1.Maid:GiveTask(v2.Type:GetPropertyChangedSignal("Value"):Connect(setMission))
	p1.Maid:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(setMission))
	local v72 = v4.MissionsByType and v4.MissionsByType[v2.Type.Value] or v4
	if v72 and (v72.Type and p2.Started.Value) then
		t.Type = v72.Type
		t.Check = v72.Check
		t.Active = if v2.Value or (not t.Type or p2.Value ~= p1.SpeciesMissionTimer.CurrentSeed) then nil else p2.Started.Value
	end
	p1:CheckMissionRewards(p2, v1)
	attemptToReset()
	for k, v in pairs(p2.Missions:GetChildren()) do
		p1.Maid:GiveTask(v.Claimed:GetPropertyChangedSignal("Value"):Connect(attemptToReset))
	end
	p1.Maid:GiveTask(p2.Claimed:GetPropertyChangedSignal("Value"):Connect(attemptToReset))
	p1.Maid:GiveTask(p1.SpeciesMissionTimer.SeedChanged:Connect(attemptToReset))
	setOverallCompleted()
end
function t.AddSpeciesUnlockMission(p1, p2) --[[ AddSpeciesUnlockMission | Line: 1178 | Upvalues: v14 (copy) ]]
	local Completed = p2.Completed
	local v1 = v14.Missions[p2.Name]
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1182 | Upvalues: p1 (copy), Completed (copy), p2 (copy) ]]
		p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 1183 | Upvalues: p1 (ref), p2 (ref) ]]
			local NewMissionsWrapper = p1.PlayerWrapper.NewMissionsWrapper
			if not NewMissionsWrapper then
				return
			end
			NewMissionsWrapper:IncrementMission("CompleteAnySpeciesQuest", {
				Data = {}
			})
			NewMissionsWrapper:IncrementMission("CompleteSpecificSpeciesQuest", {
				Data = { p2.Name }
			})
		end)
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v3 = v1.Missions[tonumber(v.Name)]
		local v4 = p1:_createMissionInfo(v3, v)
		local function getActive() --[[ getActive | Line: 1196 | Upvalues: v (copy), p2 (copy) ]]
			if v.Value then
			else
				return p2.Started.Value
			end
		end
		p1:_addMissionToType(v3.Type, v4)
		local function setCompleted(p12) --[[ setCompleted | Line: 1206 | Upvalues: v (copy), p1 (copy), v3 (copy), p2 (copy), v4 (copy) ]]
			if p12 and v.Claimed.Value then
				v.Value = true
			end
			local t = {
				progressionStatus = "Complete",
				progression01 = "SpeciesUnlock",
				progression02 = p2.Name
			}
			t.progression03 = "Mission" .. tonumber(v.Name)
			p1:_handleMissionCompletion(v, v3, t)
			v4.Active = if v.Value then nil else p2.Started.Value
			if not (v4.Active and v3.CompleteOnUnlock) then
				return
			end
			local v7, v8 = v3.CompleteOnUnlock(p1.PlayerWrapper)
			if v7 ~= true then
				return
			end
			p1:IncrementMission({
				Type = v3.Type,
				Amount = v3.Amount,
				Data = v8
			})
		end
		if p2:FindFirstChild("Started") then
			p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		end
		p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
		p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		setCompleted(true)
	end
	p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 1183 | Upvalues: p1 (copy), p2 (copy) ]]
		local NewMissionsWrapper = p1.PlayerWrapper.NewMissionsWrapper
		if not NewMissionsWrapper then
			return
		end
		NewMissionsWrapper:IncrementMission("CompleteAnySpeciesQuest", {
			Data = {}
		})
		NewMissionsWrapper:IncrementMission("CompleteSpecificSpeciesQuest", {
			Data = { p2.Name }
		})
	end)
end
function t.AddLimitedStockUnlockMission(p1, p2) --[[ AddLimitedStockUnlockMission | Line: 1242 | Upvalues: v20 (copy), v1 (copy) ]]
	local Completed = p2.Completed
	local Variant = p2:FindFirstChild("Variant")
	local v12 = Variant and Variant.Value or "Default"
	local v2 = v20.GetMissions(v12)
	local v3 = v20.GetMissionIndices(v12)
	if not v2 then
		return
	end
	local t = {}
	for i, v in ipairs(v3) do
		t[v] = true
	end
	if v1 then
		local Pinned = p2:FindFirstChild("Pinned")
		if Pinned and Pinned:IsA("BoolValue") then
			Pinned.Value = false
		end
		for k, v in pairs(p2.Missions:GetChildren()) do
			local v5 = tonumber(v.Name)
			if not (v5 and t[v5]) then
				v:Destroy()
			end
		end
	end
	local Claimed = p2:FindFirstChild("Claimed")
	local v6 = Completed.Value or (if Claimed then Claimed.Value else Claimed)
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1275 | Upvalues: Completed (copy), v3 (copy), p2 (copy) ]]
		if Completed.Value then
			return
		end
		for i, v in ipairs(v3) do
			local v1 = p2.Missions:FindFirstChild((tostring(v)))
			if not (v1 and v1.Value) then
				Completed.Value = false
				return
			end
		end
		Completed.Value = true
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v8 = v2[tonumber(v.Name)]
		if v8 then
			if v1 and not v:FindFirstChild("Pinned") then
				local Pinned = Instance.new("BoolValue")
				Pinned.Name = "Pinned"
				Pinned.Parent = v
			end
			if v1 and (v6 and v:FindFirstChild("Pinned")) then
				v.Pinned.Value = false
			end
			local v9 = p1:_createMissionInfo(v8, v)
			local function getActive() --[[ getActive | Line: 1306 | Upvalues: v (copy), p2 (copy) ]]
				if v.Value then
				else
					return p2.Started.Value
				end
			end
			p1:_addMissionToType(v8.Type, v9)
			local function setCompleted(p12) --[[ setCompleted | Line: 1315 | Upvalues: v (copy), p1 (copy), v8 (copy), p2 (copy), v9 (copy) ]]
				if p12 and v.Claimed.Value then
					v.Value = true
				end
				local t = {
					progressionStatus = "Complete",
					progression01 = "LimitedStockUnlock",
					progression02 = p2.Name
				}
				t.progression03 = "Mission" .. tonumber(v.Name)
				p1:_handleMissionCompletion(v, v8, t)
				v9.Active = if v.Value then nil else p2.Started.Value
			end
			if p2:FindFirstChild("Started") then
				p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			end
			p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
			p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			setCompleted(true)
		end
	end
	setOverallCompleted()
end
function t.RemoveLimitedStockUnlockMission(p1, p2) --[[ RemoveLimitedStockUnlockMission | Line: 1340 ]]
	for k, v in pairs(p2.Missions:GetChildren()) do
		for v1, v2 in p1.AllMissionsByType do
			for i = #v2, 1, -1 do
				if v2[i].MissionValue == v then
					table.remove(v2, i)
				end
			end
		end
	end
	p2:Destroy()
end
function t.AddOneTimeMission(p1, p2) --[[ AddOneTimeMission | Line: 1353 | Upvalues: v21 (copy) ]]
	local Completed = p2.Completed
	local v1 = v21.Missions[p2.Name]
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1357 | Upvalues: p1 (copy), Completed (copy), p2 (copy) ]]
		p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 1358 ]] end)
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v3 = v1.Missions[tonumber(v.Name)]
		local v4 = p1:_createMissionInfo(v3, v)
		local function getActive() --[[ getActive | Line: 1366 | Upvalues: v (copy) ]]
			return not v.Value
		end
		p1:_addMissionToType(v3.Type, v4)
		local function setCompleted(p12) --[[ setCompleted | Line: 1372 | Upvalues: v (copy), p1 (copy), v3 (copy), p2 (copy), v4 (copy) ]]
			if p12 and v.Claimed.Value then
				v.Value = true
			end
			p1:_handleMissionCompletion(v, v3, {
				progressionStatus = "Complete",
				progression01 = "OneTimeSubMissionCompletion",
				progression02 = p2.Name,
				progression03 = v3.Type
			})
			v4.Active = not v.Value
			if not (v4.Active and (v3.CompleteOnUnlock and v3.CompleteOnUnlock(p1.PlayerWrapper))) then
				return
			end
			p1:IncrementMission({
				Type = v3.Type,
				Amount = v3.Amount
			})
		end
		p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
		p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		setCompleted(true)
	end
	p1:_setOverallCompleted(Completed, p2, function() --[[ Line: 1358 ]] end)
end
function t.AddStoryMission(p1, p2, p3) --[[ AddStoryMission | Line: 1402 | Upvalues: v18 (copy) ]]
	local Completed = p2.Completed
	local Stories = v18.Chapters[tonumber(p3.Name)].Stories
	local v3 = Stories[tonumber(p2.Name)]
	local v5 = p3.Stories:FindFirstChild(tonumber(p2.Name) + 1)
	local v8 = p3.Parent:FindFirstChild(tonumber(p3.Name) + 1)
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1409 | Upvalues: p1 (copy), p2 (copy), v5 (copy), Completed (copy), p3 (copy), v8 (copy) ]]
		local v1 = p1:_checkAllMissionsCompleted(p2)
		if v1 and (v5 and not v5.Unlocked.Value) then
			v5.Unlocked.Value = true
		end
		if Completed.Value then
			return
		end
		Completed.Value = v1
		if not v1 then
			return
		end
		local v2 = true
		for k, v in pairs(p3.Stories:GetChildren()) do
			if not v.Completed.Value then
				v2 = false
			end
		end
		if v2 and (v8 and not v8.Unlocked.Value) then
			v8.Unlocked.Value = true
			v8.Stories:FindFirstChild("1").Unlocked.Value = true
		end
		if p3.Completed.Value then
			return
		end
		p3.Completed.Value = v2
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v10 = v3.Missions[tonumber(v.Name)]
		local v12 = p2.Missions:FindFirstChild(tonumber(v.Name) - 1)
		local v13 = p1:_createMissionInfo(v10, v)
		local function hasStarted() --[[ hasStarted | Line: 1459 | Upvalues: p2 (copy) ]]
			return p2.Started.Value
		end
		local function getActive() --[[ getActive | Line: 1463 | Upvalues: v (copy), p3 (copy), v12 (copy), p2 (copy) ]]
			if v.Value then
				return
			end
			if not p3.Unlocked.Value then
				return
			end
			if v12 and not v12.Value then
				return
			end
			if not p2.Unlocked.Value then
				return
			end
			if p2.Started.Value then
				return p2.Started.Value
			end
		end
		p1:_addMissionToType(v10.Type, v13)
		local function setCompleted(p12) --[[ setCompleted | Line: 1487 | Upvalues: p1 (copy), v (copy), v10 (copy), p2 (copy), v13 (copy), p3 (copy), v12 (copy) ]]
			p1:_handleMissionCompletion(v, v10, {
				progressionStatus = "Complete",
				progression01 = "StorySubMissionCompletion",
				progression02 = p2.Name,
				progression03 = v10.Type
			})
			p1:_waitForIncrementingMission()
			v13.Active = if v.Value or (not p3.Unlocked.Value or (v12 and not v12.Value or not (p2.Unlocked.Value and p2.Started.Value))) then nil else p2.Started.Value
		end
		if v12 then
			p1.Maid:GiveTask(v12:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		end
		p1.Maid:GiveTask(p2.Unlocked:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(p3.Unlocked:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
		setCompleted(true)
	end
	setOverallCompleted()
end
function t.AddStreakMission(p1, p2) --[[ AddStreakMission | Line: 1511 | Upvalues: v19 (copy), v4 (copy) ]]
	local Completed = p2.Completed
	local v2 = v19.Missions[tonumber(p2.Name)]
	local v42 = v19.Missions[tonumber(p2.Name) - 1]
	local v5 = v42
	if v5 then
		v5 = p1.PlayerData.Missions.StreakMissions.Missions[tonumber(p2.Name) - 1]
	end
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1519 | Upvalues: Completed (copy), p2 (copy) ]]
		if Completed.Value then
			return
		end
		local v1 = true
		for k, v in pairs(p2.Missions:GetChildren()) do
			if not v.Value then
				v1 = false
			end
		end
		Completed.Value = v1
	end
	local function attemptToReset() --[[ attemptToReset | Line: 1531 | Upvalues: p2 (copy), v4 (ref), p1 (copy), v2 (copy), v42 (copy) ]]
		if p2.Value == v4.DailyStreakMissionTimer.CurrentSeed then
			return
		end
		p2.Value = v4.DailyStreakMissionTimer.CurrentSeed
		p1:ResetMissions(p2, v2, true)
		for k, v in pairs(p2.Missions:GetChildren()) do
			if v:FindFirstChild("Pinned") and v.Pinned.Value then
				local v1 = false
				if v42 then
					local v3 = p1.PlayerData.Missions.StreakMissions.Missions[tonumber(p2.Name) - 1]
					if v3 and not v3.Completed.Value then
						v1 = true
					end
				end
				if v1 then
					v.Pinned.Value = false
				end
			end
		end
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v8 = v2.Missions[tonumber(v.Name)]
		if v8 then
			if v8.MissionsByType and not v8.MissionsByType[v.Type.Value] then
				p1:GenerateMission(p2, v, v8)
			end
			local t = {
				MissionValue = v
			}
			if not p1.AllMissions[p2.Name] then
				p1.AllMissions[p2.Name] = {}
			end
			p1.AllMissions[p2.Name][v] = t
			local function getActive() --[[ getActive | Line: 1580 | Upvalues: v (copy), t (copy), p2 (copy), v4 (ref), v42 (copy), v5 (copy) ]]
				if v.Value then
					return
				end
				if not t.Type then
					return
				end
				if p2.Value ~= v4.DailyStreakMissionTimer.CurrentSeed then
					return
				end
				if v42 then
					return v5.Completed.Value
				else
					return true
				end
			end
			local function setCompleted(p12) --[[ setCompleted | Line: 1597 | Upvalues: t (copy), v (copy), p1 (copy), p2 (copy), v4 (ref), v42 (copy), v5 (copy) ]]
				if not t.Type then
					return
				end
				if v.TargetAmount.Value <= 0 then
					return
				end
				if p12 and v.Claimed.Value then
					v.Value = true
				end
				if not v.Value then
					v.Value = v.Amount.Value >= v.TargetAmount.Value
					if v.Value then
						local StreakPoints = p1.PlayerData.Missions.StreakMissions.StreakPoints
						StreakPoints.Value = StreakPoints.Value + 1
						p1:IncrementMission({
							Type = "CompleteMission",
							Amount = 1,
							Data = { "DailyStreakMission" }
						})
					end
				end
				if p1.IncrementingMission then
					repeat
						task.wait()
					until not p1.IncrementingMission
				end
				t.Active = if v.Value or (not t.Type or p2.Value ~= v4.DailyStreakMissionTimer.CurrentSeed) then nil elseif v42 then v5.Completed.Value else true
			end
			p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			setCompleted(true)
			local function setMission(p1) --[[ setMission | Line: 1631 | Upvalues: v8 (copy), v (copy), t (copy), p2 (copy), v4 (ref), v42 (copy), v5 (copy) ]]
				local v1 = v8.MissionsByType and v8.MissionsByType[v.Type.Value] or v8
				if not v1 then
					return
				end
				if not v1.Type then
					return
				end
				t.Type = v1.Type
				t.Check = v1.Check
				t.Active = if v.Value or (not t.Type or p2.Value ~= v4.DailyStreakMissionTimer.CurrentSeed) then nil elseif v42 then v5.Completed.Value else true
			end
			p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
			p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setMission))
			p1.Maid:GiveTask(v.Type:GetPropertyChangedSignal("Value"):Connect(setMission))
			p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setMission))
			if v5 then
				p1.Maid:GiveTask(v5.Completed:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			end
			local v9 = v8.MissionsByType and v8.MissionsByType[v.Type.Value] or v8
			if v9 and v9.Type then
				t.Type = v9.Type
				t.Check = v9.Check
				t.Active = if v.Value or (not t.Type or p2.Value ~= v4.DailyStreakMissionTimer.CurrentSeed) then nil elseif v42 then v5.Completed.Value else true
			end
			p1:CheckMissionRewards(v, v8)
		end
	end
	attemptToReset()
	for k, v in pairs(p2.Missions:GetChildren()) do
		p1.Maid:GiveTask(v.Claimed:GetPropertyChangedSignal("Value"):Connect(attemptToReset))
	end
	p1.Maid:GiveTask(v4.DailyStreakMissionTimer.SeedChanged:Connect(attemptToReset))
	if Completed.Value then
		return
	end
	local v11 = true
	for k, v in pairs(p2.Missions:GetChildren()) do
		if not v.Value then
			v11 = false
		end
	end
	Completed.Value = v11
end
function t.InitHourlyMissions(p1) --[[ InitHourlyMissions | Line: 1666 | Upvalues: v4 (copy) ]]
	local HourlyMissionsData = p1.HourlyMissionsData
	local function resetHourlyMissions() --[[ resetHourlyMissions | Line: 1669 | Upvalues: v4 (ref), HourlyMissionsData (copy), p1 (copy) ]]
		local CurrentSeed = v4.HourlyMissionTimer.CurrentSeed
		if HourlyMissionsData.Seed.Value == CurrentSeed then
			return
		end
		for v1, v2 in HourlyMissionsData.Missions:GetChildren() do
			v4.ProcessHourlyMissionClaim(p1.PlayerWrapper, (tonumber(v2.Name)))
		end
		HourlyMissionsData.Seed.Value = CurrentSeed
		HourlyMissionsData.Completed.Value = false
		for v42, v5 in HourlyMissionsData.Missions:GetChildren() do
			v5.Amount.Value = 0
			v5.Value = false
			v5.Claimed.Value = false
		end
		local v6 = v4.GenerateHourlyMissions(CurrentSeed)
		for v7, v8 in HourlyMissionsData.Missions:GetChildren() do
			local v10 = v6[tonumber(v8.Name)]
			if v10 then
				v8.TargetAmount.Value = v10.Amount
				v8.Type.Value = v10.Type
				v8.Pinned.Value = false
				for v11, v12 in v8.Rewards:GetChildren() do
					v12:Destroy()
				end
				for v13, v14 in v10.Reward do
					local v15 = Instance.new("IntValue")
					v15.Name = v14.Name
					v15.Value = v14.Amount
					v15.Parent = v8.Rewards
				end
			end
		end
		v4.AutopinHourlyMissions(p1.PlayerWrapper)
	end
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1715 | Upvalues: HourlyMissionsData (copy) ]]
		if HourlyMissionsData.Completed.Value then
			return
		end
		local v1 = true
		for v2, v3 in HourlyMissionsData.Missions:GetChildren() do
			if not v3.Value then
				v1 = false
				break
			end
		end
		HourlyMissionsData.Completed.Value = v1
	end
	resetHourlyMissions()
	p1.Maid:GiveTask(v4.HourlyMissionTimer.SeedChanged:Connect(resetHourlyMissions))
	for v1, v2 in HourlyMissionsData.Missions:GetChildren() do
		p1:AddHourlyMission(v2)
		p1.Maid:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
	end
	setOverallCompleted()
end
function t.AddHourlyMission(p1, p2) --[[ AddHourlyMission | Line: 1739 | Upvalues: v4 (copy) ]]
	local t = {
		MissionValue = p2
	}
	if not p1.AllMissions.HourlyMissions then
		p1.AllMissions.HourlyMissions = {}
	end
	p1.AllMissions.HourlyMissions[p2] = t
	local function getActive() --[[ getActive | Line: 1749 | Upvalues: p2 (copy), t (copy), p1 (copy), v4 (ref) ]]
		if p2.Value then
			return
		end
		if not t.Type then
			return
		end
		if p1.HourlyMissionsData.Seed.Value == v4.HourlyMissionTimer.CurrentSeed then
			return true
		end
	end
	local function setCompleted() --[[ setCompleted | Line: 1763 | Upvalues: t (copy), p2 (copy), p1 (copy), v4 (ref) ]]
		if not t.Type then
			return
		end
		if p2.TargetAmount.Value <= 0 then
			return
		end
		if not p2.Value then
			p2.Value = p2.Amount.Value >= p2.TargetAmount.Value
		end
		t.Active = if p2.Value or not t.Type then nil elseif p1.HourlyMissionsData.Seed.Value == v4.HourlyMissionTimer.CurrentSeed then true else nil
	end
	local function setMission() --[[ setMission | Line: 1776 | Upvalues: p2 (copy), t (copy), p1 (copy), v4 (ref) ]]
		if p2.Type.Value == "" then
			return
		end
		t.Type = p2.Type.Value
		t.Active = if p2.Value or not t.Type then nil elseif p1.HourlyMissionsData.Seed.Value == v4.HourlyMissionTimer.CurrentSeed then true else nil
	end
	p1.Maid:GiveTask(p2.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
	p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setCompleted))
	p1.Maid:GiveTask(p2.Type:GetPropertyChangedSignal("Value"):Connect(setMission))
	if p2.Type.Value ~= "" then
		t.Type = p2.Type.Value
		t.Active = if p2.Value or not t.Type then nil elseif p1.HourlyMissionsData.Seed.Value == v4.HourlyMissionTimer.CurrentSeed then true else nil
	end
	if not t.Type then
		return
	end
	if p2.TargetAmount.Value <= 0 then
		return
	end
	if not p2.Value then
		p2.Value = p2.Amount.Value >= p2.TargetAmount.Value
	end
	t.Active = if p2.Value or not t.Type then nil elseif p1.HourlyMissionsData.Seed.Value == v4.HourlyMissionTimer.CurrentSeed then true else nil
end
function t.AddStableClubMissions(p1, p2) --[[ AddStableClubMissions | Line: 1791 | Upvalues: v4 (copy), v6 (copy), v25 (copy), v1 (copy), v8 (copy), v11 (copy), v9 (copy) ]]
	local LastMissions = p2.LastMissions
	local CompletedSets = p2.CompletedSets
	local Missions = p2.Missions
	local function pickRandomMissions() --[[ pickRandomMissions | Line: 1796 | Upvalues: v4 (ref), CompletedSets (copy), v6 (ref), v25 (ref) ]]
		local v2 = Random.new(v4.StableClubMissionTimer.CurrentSeed + CompletedSets.Value * 1000)
		local v3 = v6.Copy(v25)
		local t = {}
		for i = 1, 4 do
			if #v3 == 0 then
				break
			end
			local v42 = v2:NextInteger(1, #v3)
			table.insert(t, v3[v42])
			table.remove(v3, v42)
		end
		return t
	end
	local function resetMissions() --[[ resetMissions | Line: 1818 | Upvalues: pickRandomMissions (copy), CompletedSets (copy), Missions (copy) ]]
		local v1 = pickRandomMissions()
		local v2 = 1 + CompletedSets.Value * 1
		for v3, v4 in Missions:GetChildren() do
			local v6 = v1[tonumber(v4.Name)]
			if v6 then
				v4.Amount.Value = 0
				v4.Type.Value = v6.Type
				if v4:FindFirstChild("TargetAmount") then
					local Amount = v6.Amount
					if typeof(Amount) == "NumberRange" then
						Amount = math.random(Amount.Min, Amount.Max)
					end
					v4.TargetAmount.Value = math.ceil(Amount * v2)
				end
				if v4:FindFirstChild("Claimed") then
					v4.Claimed.Value = false
				end
				v4.Value = false
			end
		end
	end
	local function checkAllCompleted() --[[ checkAllCompleted | Line: 1847 | Upvalues: Missions (copy) ]]
		for v1, v2 in Missions:GetChildren() do
			if not v2.Value then
				return false
			end
		end
		return true
	end
	local function onAllCompleted() --[[ onAllCompleted | Line: 1856 | Upvalues: CompletedSets (copy), resetMissions (copy) ]]
		CompletedSets.Value = CompletedSets.Value + 1
		resetMissions()
	end
	local function attemptToReset() --[[ attemptToReset | Line: 1862 | Upvalues: LastMissions (copy), v4 (ref), CompletedSets (copy), resetMissions (copy) ]]
		if LastMissions.Value == v4.StableClubMissionTimer.CurrentSeed then
			return
		end
		CompletedSets.Value = 0
		LastMissions.Value = v4.StableClubMissionTimer.CurrentSeed
		resetMissions()
	end
	local function getActive() --[[ getActive | Line: 1871 ]]
		return true
	end
	for v12, v2 in Missions:GetChildren() do
		local t = {
			MissionValue = v2
		}
		if not p1.AllMissions.StableClubs then
			p1.AllMissions.StableClubs = {}
		end
		p1.AllMissions.StableClubs[v2] = t
		local function setCompleted() --[[ setCompleted | Line: 1885 | Upvalues: t (copy), v2 (copy), v4 (ref), CompletedSets (copy), v25 (ref), v1 (ref), v8 (ref), p1 (copy), v11 (ref), v9 (ref), Missions (copy), resetMissions (copy) ]]
			if not t.Type then
				return
			end
			if v2.TargetAmount.Value <= 0 then
				return
			end
			if not v2.Value then
				v2.Value = v2.Amount.Value >= v2.TargetAmount.Value
				if v2.Value then
					local v6 = v4.GetStableClubMissionData(v4.StableClubMissionTimer.CurrentSeed + CompletedSets.Value * 1000, v25, (tonumber(v2.Name)))
					if v1 then
						v8.GamebeastPlayerMarker(p1.PlayerWrapper.Player, "ClubMissionCompleted", {
							{
								Key = "Type",
								Value = v6.Type
							}
						}, 1)
					end
					if v6.Reward.Name == "ClubPoints" then
						local v82 = v9.GetClubData(v11.GetPlayersClub(p1.PlayerWrapper).Value)
						if v11.ScaleRewardAmount(2000, v82.Capacity) > v82.Milestones.Points then
							v9.AddClubPoints(p1.PlayerWrapper, v6.Reward.Amount, "StableClubMission")
						end
					end
					v2.Claimed.Value = true
					local v92 = true
					for v10, v112 in Missions:GetChildren() do
						if not v112.Value then
							v92 = false
							break
						end
					end
					if v92 then
						CompletedSets.Value = CompletedSets.Value + 1
						resetMissions()
					end
				end
			end
			t.Active = true
		end
		local function setMission() --[[ setMission | Line: 1930 | Upvalues: v2 (copy), v25 (ref), t (copy) ]]
			local Type = v2.Type.Value
			if Type == "" then
				return
			end
			local v1 = nil
			for v22, v3 in v25 do
				if v3.Type == Type then
					v1 = v3
					break
				end
			end
			if v1 then
				t.Type = v1.Type
				t.Check = v1.Check
				t.Active = true
			end
		end
		p1.Maid:GiveTask(v2.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(v2:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(v2.Type:GetPropertyChangedSignal("Value"):Connect(setMission))
		setMission()
		setCompleted()
	end
	if LastMissions.Value ~= v4.StableClubMissionTimer.CurrentSeed then
		CompletedSets.Value = 0
		LastMissions.Value = v4.StableClubMissionTimer.CurrentSeed
		resetMissions()
	end
	p1.Maid:GiveTask(v4.StableClubMissionTimer.SeedChanged:Connect(attemptToReset))
	p1.Maid:GiveTask(LastMissions:GetPropertyChangedSignal("Value"):Connect(attemptToReset))
end
function t.AddEventStreakMission(p1, p2) --[[ AddEventStreakMission | Line: 1965 | Upvalues: v17 (copy), v4 (copy) ]]
	local Completed = p2.Completed
	local v2 = v17.Missions[tonumber(p2.Name)]
	local v42 = v17.Missions[tonumber(p2.Name) - 1]
	local v5 = v42
	if v5 then
		v5 = p1.EventStreakMissionsData.Missions[tonumber(p2.Name) - 1]
	end
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 1973 | Upvalues: Completed (copy), p2 (copy) ]]
		if Completed.Value then
			return
		end
		local v1 = true
		for k, v in pairs(p2.Missions:GetChildren()) do
			if not v.Value then
				v1 = false
			end
		end
		Completed.Value = v1
	end
	local function attemptToReset() --[[ attemptToReset | Line: 1985 | Upvalues: p2 (copy), v4 (ref), p1 (copy), v2 (copy), v42 (copy) ]]
		if p2.Value == v4.EventDailyStreakMissionTimer.CurrentSeed then
			return
		end
		p2.Value = v4.EventDailyStreakMissionTimer.CurrentSeed
		p1:ResetMissions(p2, v2, true)
		p1.EventStreakMissionsData.StreakPoints.Value = 0
		p1.EventStreakMissionsData.ClaimedTiers[1].Value = false
		for k, v in pairs(p2.Missions:GetChildren()) do
			if v:FindFirstChild("Pinned") and v.Pinned.Value then
				local v1 = false
				if v42 then
					local v3 = p1.EventStreakMissionsData.Missions[tonumber(p2.Name) - 1]
					if v3 and not v3.Completed.Value then
						v1 = true
					end
				end
				if v1 then
					v.Pinned.Value = false
				end
			end
		end
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v8 = v2.Missions[tonumber(v.Name)]
		if v8 then
			if v8.MissionsByType and not v8.MissionsByType[v.Type.Value] then
				p1:GenerateMission(p2, v, v8)
			end
			local t = {
				MissionValue = v
			}
			if not p1.AllMissions[p2.Name] then
				p1.AllMissions[p2.Name] = {}
			end
			p1.AllMissions[p2.Name][v] = t
			local function getActive() --[[ getActive | Line: 2037 | Upvalues: v (copy), t (copy), p2 (copy), v4 (ref), v42 (copy), v5 (copy) ]]
				if v.Value then
					return
				end
				if not t.Type then
					return
				end
				if p2.Value ~= v4.EventDailyStreakMissionTimer.CurrentSeed then
					return
				end
				if v42 then
					return v5.Completed.Value
				else
					return true
				end
			end
			local function setCompleted(p12) --[[ setCompleted | Line: 2054 | Upvalues: t (copy), v (copy), p1 (copy), p2 (copy), v4 (ref), v42 (copy), v5 (copy) ]]
				if not t.Type then
					return
				end
				if not t.Amount then
					return
				end
				if p12 and v.Claimed.Value then
					v.Value = true
				end
				if not v.Value then
					v.Value = v.Amount.Value >= t.Amount
					if v.Value then
						local StreakPoints = p1.EventStreakMissionsData.StreakPoints
						StreakPoints.Value = StreakPoints.Value + 1
					end
				end
				if p1.IncrementingMission then
					repeat
						task.wait()
					until not p1.IncrementingMission
				end
				t.Active = if v.Value or (not t.Type or p2.Value ~= v4.EventDailyStreakMissionTimer.CurrentSeed) then nil elseif v42 then v5.Completed.Value else true
			end
			p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			setCompleted(true)
			local function setMission(p1) --[[ setMission | Line: 2082 | Upvalues: v8 (copy), v (copy), t (copy), p2 (copy), v4 (ref), v42 (copy), v5 (copy) ]]
				local v1 = v8.MissionsByType and v8.MissionsByType[v.Type.Value] or v8
				if not v1 then
					return
				end
				if not v1.Type then
					return
				end
				t.Type = v1.Type
				t.Check = v1.Check
				t.Amount = v1.Amount
				t.Active = if v.Value or (not t.Type or p2.Value ~= v4.EventDailyStreakMissionTimer.CurrentSeed) then nil elseif v42 then v5.Completed.Value else true
			end
			p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
			p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Value"):Connect(setMission))
			p1.Maid:GiveTask(v.Type:GetPropertyChangedSignal("Value"):Connect(setMission))
			p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setMission))
			if v5 then
				p1.Maid:GiveTask(v5.Completed:GetPropertyChangedSignal("Value"):Connect(setCompleted))
			end
			local v9 = v8.MissionsByType and v8.MissionsByType[v.Type.Value] or v8
			if v9 and v9.Type then
				t.Type = v9.Type
				t.Check = v9.Check
				t.Amount = v9.Amount
				t.Active = if v.Value or (not t.Type or p2.Value ~= v4.EventDailyStreakMissionTimer.CurrentSeed) then nil elseif v42 then v5.Completed.Value else true
			end
			p1:CheckMissionRewards(v, v8)
		end
	end
	attemptToReset()
	for k, v in pairs(p2.Missions:GetChildren()) do
		p1.Maid:GiveTask(v.Claimed:GetPropertyChangedSignal("Value"):Connect(attemptToReset))
	end
	p1.Maid:GiveTask(v4.EventDailyStreakMissionTimer.SeedChanged:Connect(attemptToReset))
	if Completed.Value then
		return
	end
	local v11 = true
	for k, v in pairs(p2.Missions:GetChildren()) do
		if not v.Value then
			v11 = false
		end
	end
	Completed.Value = v11
end
function t._getSelectedNpcMissionIndices(p1, p2, p3, p4) --[[ _getSelectedNpcMissionIndices | Line: 2118 | Upvalues: v10 (copy) ]]
	if not p2.MaxMissions then
		return nil
	end
	local t = {}
	for v1 in p2.Missions do
		table.insert(t, (tonumber(v1)))
	end
	if #t <= p2.MaxMissions then
		return nil
	end
	local v3 = Random.new(v10.RefreshTimer.CurrentSeed + string.len(p3) + p4)
	local v4 = table.clone(t)
	local t2 = {}
	for i = 1, p2.MaxMissions do
		local v5 = v3:NextInteger(1, #v4)
		table.insert(t2, v4[v5])
		table.remove(v4, v5)
	end
	return t2
end
function t.AddNpcMission(p1, p2) --[[ AddNpcMission | Line: 2147 | Upvalues: v24 (copy), v7 (copy) ]]
	local v1 = v24[p2.Parent.Name]
	if not v1 then
		return
	end
	local v3 = v1[tonumber(p2.Name)]
	if not v3 then
		return
	end
	local v6 = p1:_getSelectedNpcMissionIndices(v3, p2.Parent.Name, (tonumber(p2.Name)))
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 2159 | Upvalues: p2 (copy), p1 (copy), v6 (copy), v3 (ref) ]]
		if p2.Completed.Value then
			return
		end
		local v1 = p1:_checkAllMissionsCompleted(p2, v6)
		p2.Completed.Value = v1
		if not (v1 and v3.RunOnComplete) then
			return
		end
		v3.RunOnComplete(p1)
	end
	p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2175 | Upvalues: p2 (copy), v7 (ref) ]]
		if not p2.Started.Value then
			return
		end
		p2.StartTime.Value = v7.Get()
	end))
	for v72, v8 in v3.Missions do
		if not v6 or table.find(v6, v72) then
			local v9 = p2.Missions:FindFirstChild((tostring(v72)))
			if v9 and v9:FindFirstChild("Amount") then
				local v10 = p1:_createMissionInfo(v8, v9)
				local function getActive() --[[ getActive | Line: 2193 | Upvalues: v9 (copy), p2 (copy) ]]
					if v9.Value then
					else
						return p2.Started.Value
					end
				end
				p1:_addMissionToType(v10.Type, v10)
				local function setCompleted(p12) --[[ setCompleted | Line: 2203 | Upvalues: v9 (copy), p1 (copy), v8 (copy), p2 (copy), v10 (copy) ]]
					if p12 and v9.Claimed.Value then
						v9.Value = true
					end
					p1:_handleMissionCompletion(v9, v8, {
						progressionStatus = "Complete",
						progression01 = "NpcSubMissionCompletion",
						progression02 = p2.Parent.Name,
						progression03 = v10.Type
					})
					v10.Active = if v9.Value then nil else p2.Started.Value
				end
				p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 2217 | Upvalues: v10 (copy), v9 (copy), p2 (copy) ]]
					v10.Active = if v9.Value then nil else p2.Started.Value
				end))
				p1.Maid:GiveTask(v9:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
				p1.Maid:GiveTask(v9.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
				setCompleted(true)
			end
		end
	end
	if p2.Completed.Value then
		return
	end
	local v11 = p1:_checkAllMissionsCompleted(p2, v6)
	p2.Completed.Value = v11
	if not (v11 and v3.RunOnComplete) then
		return
	end
	v3.RunOnComplete(p1)
end
function t.AddTutorialMission(p1, p2) --[[ AddTutorialMission | Line: 2228 | Upvalues: v27 (copy) ]]
	local Completed = p2.Completed
	local v1 = v27[p2.Name]
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 2232 | Upvalues: p1 (copy), Completed (copy), p2 (copy) ]]
		p1:_setOverallCompleted(Completed, p2)
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v3 = v1.Missions[tonumber(v.Name)]
		local v4 = p1:_createMissionInfo(v3, v)
		local function getActive() --[[ getActive | Line: 2240 | Upvalues: v (copy), p2 (copy) ]]
			return not v.Value and p2.Started.Value
		end
		p1:_addMissionToType(v3.Type, v4)
		local function setCompleted(p12) --[[ setCompleted | Line: 2246 | Upvalues: v (copy), p1 (copy), v3 (copy), v4 (copy), p2 (copy) ]]
			if p12 and v.Claimed.Value then
				v.Value = true
			end
			p1:_handleMissionCompletion(v, v3)
			v4.Active = not v.Value and p2.Started.Value
			if not (v4.Active and (v3.CompleteOnUnlock and v3.CompleteOnUnlock(p1.PlayerWrapper))) then
				return
			end
			p1:IncrementMission({
				Type = v3.Type,
				Amount = v3.Amount
			})
		end
		p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
		p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		setCompleted(true)
	end
	p1:_setOverallCompleted(Completed, p2)
end
function t.AddWorldMission(p1, p2) --[[ AddWorldMission | Line: 2271 | Upvalues: v28 (copy) ]]
	local Completed = p2.Completed
	local v1 = v28[p2.Name][p2.Name]
	local function setOverallCompleted() --[[ setOverallCompleted | Line: 2275 | Upvalues: p1 (copy), Completed (copy), p2 (copy) ]]
		p1:_setOverallCompleted(Completed, p2)
	end
	for k, v in pairs(p2.Missions:GetChildren()) do
		local v3 = v1.Missions[tonumber(v.Name)]
		local v4 = p1:_createMissionInfo(v3, v)
		local function getActive() --[[ getActive | Line: 2283 | Upvalues: v (copy), p2 (copy) ]]
			return not v.Value and p2.Started.Value
		end
		p1:_addMissionToType(v3.Type, v4)
		local function setCompleted(p12) --[[ setCompleted | Line: 2289 | Upvalues: v (copy), p1 (copy), v3 (copy), v4 (copy), p2 (copy) ]]
			if p12 and v.Claimed.Value then
				v.Value = true
			end
			p1:_handleMissionCompletion(v, v3)
			v4.Active = not v.Value and p2.Started.Value
			if not (v4.Active and (v3.CompleteOnUnlock and v3.CompleteOnUnlock(p1.PlayerWrapper))) then
				return
			end
			p1:IncrementMission({
				Type = v3.Type,
				Amount = v3.Amount
			})
		end
		p1.Maid:GiveTask(p2.Started:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		p1.Maid:GiveTask(v:GetPropertyChangedSignal("Value"):Connect(setOverallCompleted))
		p1.Maid:GiveTask(v.Amount:GetPropertyChangedSignal("Value"):Connect(setCompleted))
		setCompleted(true)
	end
	p1:_setOverallCompleted(Completed, p2)
end
return t