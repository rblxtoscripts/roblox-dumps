-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("TimeSeed")
local v3 = Sonar("DataStore", "Server")
local v4 = Sonar("DataUtils")
local v5 = Sonar("Signal")
local v6 = Sonar("TableUtils")
local v7 = Sonar("FormatTime")
local v8 = game:GetService("RunService"):IsServer()
local v9 = game:GetService("RunService"):IsStudio()
local v10 = v1.GetConfig("GlobalLeaderboard")()
local v11 = "Live" .. "-" .. v10.DataStorePrefix
local v12 = Sonar("PreviousLeaderboardFetcher")
function t.new(p1) --[[ new | Line: 29 | Upvalues: t (copy), v5 (copy), v8 (copy), v2 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Leaderboard = {}
	v22.LeaderboardChangedSignal = v5.new()
	v22.AddParticipationSignal = v5.new()
	v22.PreviousLeaderboards = {}
	if v8 then
		v22.LeaderboardFolder = Instance.new("Configuration")
		v22.LeaderboardFolder.Name = p1.Name
		if v22:_hasDuration() then
			v22.RefreshTimer = v2.new({
				DoNotDeferSeedInit = true,
				Duration = p1.Duration,
				Start = p1.StartTime,
				End = p1.EndTime,
				OnSeedChanged = function(...) --[[ OnSeedChanged | Line: 56 | Upvalues: v22 (copy) ]]
					if v22:_hasEndTime() then
						if v22:_hasReachedEndTime() then
							v22:Ended(...)
						end
					else
						v22:RollOver(...)
					end
				end
			})
			v22.RefreshTimer.TimeChanged:Connect(function() --[[ Line: 71 | Upvalues: v22 (copy) ]]
				if v22:_hasReachedStartTime() then
					v22:Started()
					return
				end
				if not v22:_hasReachedIntermissionTime() then
					return
				end
				v22:Intermission()
			end)
		end
		v22:_initLeaderboard()
		v22.LeaderboardFolder.Parent = p1.Parent
	else
		v22.LeaderboardFolder = p1.Parent:WaitForChild(p1.Name)
	end
	v22.LeaderboardFolder:GetAttributeChangedSignal("Scores"):Connect(function() --[[ Line: 87 | Upvalues: v22 (copy) ]]
		v22:_decodeLeaderboard()
	end)
	v22:_decodeLeaderboard()
	return v22
end
function t._hasDuration(p1) --[[ _hasDuration | Line: 95 ]]
	return (p1.Duration or (p1.StartTime or p1.EndTime)) and true or false
end
function t._hasEndTime(p1) --[[ _hasEndTime | Line: 102 ]]
	return p1.EndTime and true or false
end
function t._getSeed(p1) --[[ _getSeed | Line: 109 ]]
	if not p1.RefreshTimer then
		return 1
	end
	if p1:_hasEndTime() then
		return math.clamp(p1.RefreshTimer.CurrentSeed, 0, 2)
	else
		return p1.RefreshTimer.CurrentSeed
	end
end
function t._getScope(p1, p2) --[[ _getScope | Line: 126 | Upvalues: v11 (copy) ]]
	local v1 = if p2 then p2 else p1:_getSeed()
	local v2 = if p1:_hasEndTime() then math.min(1, v1) else v1
	return ("%*-%*"):format(v11, p1.Id) .. (if v2 then "-" .. v2 else "")
end
function t._getIntermissionStartTime(p1) --[[ _getIntermissionStartTime | Line: 139 | Upvalues: v10 (copy) ]]
	local v1 = p1:_getEndTime()
	if v1 then
		return v1 - v10.IntermissionTime
	end
end
function t._getEndTime(p1) --[[ _getEndTime | Line: 150 ]]
	local EndTime = p1.EndTime
	if not EndTime and p1.RefreshTimer then
		EndTime = p1.RefreshTimer.EndTime
	end
	return EndTime
end
function t._getStartTime(p1) --[[ _getStartTime | Line: 158 ]]
	local StartTime = p1.StartTime
	if not StartTime and p1.RefreshTimer then
		StartTime = p1.RefreshTimer.StartTime
	end
	return StartTime
end
function t._hasReachedIntermissionTime(p1) --[[ _hasReachedIntermissionTime | Line: 166 | Upvalues: v10 (copy) ]]
	if not p1:_hasReachedStartTime() then
		return false
	end
	if p1:_hasReachedEndTime() then
		return false
	end
	if not p1.RefreshTimer then
		return false
	end
	return p1.RefreshTimer:GetTime() <= v10.IntermissionTime
end
function t._hasReachedStartTime(p1) --[[ _hasReachedStartTime | Line: 184 | Upvalues: v7 (copy) ]]
	local v1 = p1:_getStartTime()
	if not v1 then
		return true
	end
	return v1 <= v7.GetTime()
end
function t._hasReachedEndTime(p1) --[[ _hasReachedEndTime | Line: 192 | Upvalues: v7 (copy) ]]
	if not p1.EndTime then
		return
	end
	local v1 = p1:_getEndTime()
	if not v1 then
		return false
	end
	return v1 <= v7.GetTime()
end
function t._initLeaderboard(p1, p2) --[[ _initLeaderboard | Line: 204 | Upvalues: v3 (copy) ]]
	p1.DataStore = v3.new(p1:_getScope(), {
		OrderedDataStore = true
	})
	if p1:_hasReachedEndTime() then
		p1:Ended()
	elseif p1:_hasReachedIntermissionTime() then
		p1:Intermission()
	elseif p1:_hasReachedStartTime() then
		p1:Started()
	else
		p1.LeaderboardFolder:SetAttribute("Intermission", false)
		p1.LeaderboardFolder:SetAttribute("Started", false)
		p1.LeaderboardFolder:SetAttribute("Ended", false)
	end
	p1.LeaderboardFolder:SetAttribute("StartTime", p1:_getStartTime())
	p1.LeaderboardFolder:SetAttribute("IntermissionStartTime", p1:_getIntermissionStartTime())
	p1.LeaderboardFolder:SetAttribute("EndTime", p1:_getEndTime())
	p1.LeaderboardFolder:SetAttribute("Scores", nil)
end
function t._getLeaderboardByUserId(p1, p2) --[[ _getLeaderboardByUserId | Line: 247 | Upvalues: v6 (copy) ]]
	local t = {}
	for v1, v2 in p2 do
		t[v2.UserId] = v6.MergeOriginal(v2, {
			Position = v1
		})
	end
	return t
end
function t._fetchPreviousLeaderboard(p1, p2, p3) --[[ _fetchPreviousLeaderboard | Line: 255 | Upvalues: v12 (copy), v10 (copy) ]]
	if p1.PreviousLeaderboards[p2] then
		p3(p1.PreviousLeaderboards[p2])
	else
		v12.Enqueue({
			{
				DataStoreName = p1:_getScope(p2),
				MaxEntries = v10.MaxEntriesShownOnLeaderboard,
				OnResult = function(p12) --[[ OnResult | Line: 267 | Upvalues: p1 (copy), p2 (copy), p3 (copy) ]]
					local v1 = p1:_getLeaderboardByUserId(p12)
					p1.PreviousLeaderboards[p2] = v1
					p3(v1)
				end
			}
		})
	end
end
function t._resetPlayerScore(p1, p2, p3) --[[ _resetPlayerScore | Line: 275 | Upvalues: v4 (copy) ]]
	local v1 = p1:_getLastRefreshValue(p2)
	if not v1 then
		warn("\226\154\160\239\184\143 GlobalLeaderboard, No LastRefresh data value found in", p2.Player.Name, p1.Id)
		return
	end
	if v1.Value == p1:_getSeed() then
		return
	end
	local v2 = if p1:_getSeed() == v1.Value then false else true
	local v3 = p1:GetPendingScoreValue(p2)
	local v42 = p1:GetLastSyncedScoreValue(p2)
	local v5 = p1:_getLastSyncedValue(p2)
	if v42.Value > 0 then
		local v6 = v4.CreateDataValueFromType("PreviousLeaderboardScore")
		v6.Name = v1.Value
		v6.Value = v42.Value
		v6.Parent = p3.Previous
	end
	if not v2 then
		v1.Value = p1:_getSeed()
		v5.Value = -1
		return
	end
	v3.Value = 0
	v42.Value = 0
	v1.Value = p1:_getSeed()
	v5.Value = -1
end
function t._decodeLeaderboard(p1, p2) --[[ _decodeLeaderboard | Line: 320 | Upvalues: HttpService (copy) ]]
	p1.Leaderboard = {}
	local v1 = if p2 then p2 else p1.LeaderboardFolder:GetAttribute("Scores") and HttpService:JSONDecode(p1.LeaderboardFolder:GetAttribute("Scores"))
	if v1 then
		for v2, v3 in v1 do
			local v4 = string.split(v3, "_")
			local v6 = tonumber(v4[1], 16)
			p1.Leaderboard[v2] = {
				UserId = v6,
				Score = tonumber(v4[2], 16)
			}
		end
	end
	p1.LeaderboardChangedSignal:Fire()
end
function t.GetId(p1, p2) --[[ GetId | Line: 341 ]]
	local v1 = if p2 then p2 else p1:_getSeed()
	return p1.Id .. (if v1 then "-" .. v1 or "" else "")
end
function t.GetEndTimeForSeed(p1, p2) --[[ GetEndTimeForSeed | Line: 346 ]]
	return p1.RefreshTimer:_getEndTime(if p2 then p2 else p1:_getSeed())
end
function t._getDataFolder(p1, p2) --[[ _getDataFolder | Line: 351 ]]
	local v1 = p1.GlobalLeaderboard:_getDataFolder(p2)
	if v1 then
		return v1:FindFirstChild(p1.Name)
	else
		return nil
	end
end
function t._getLastRefreshValue(p1, p2) --[[ _getLastRefreshValue | Line: 359 ]]
	local v1 = p1:_getDataFolder(p2)
	if v1 then
		return v1:FindFirstChild("LastRefresh")
	else
		return nil
	end
end
function t._getLastSyncedValue(p1, p2) --[[ _getLastSyncedValue | Line: 367 ]]
	local v1 = p1:_getDataFolder(p2)
	if v1 then
		return v1:FindFirstChild("LastSynced")
	else
		return nil
	end
end
function t.GetLastSyncedScoreValue(p1, p2) --[[ GetLastSyncedScoreValue | Line: 375 ]]
	local v1 = p1:_getDataFolder(p2)
	if v1 then
		return v1:FindFirstChild("LastScore")
	else
		return nil
	end
end
function t.GetPendingScoreValue(p1, p2) --[[ GetPendingScoreValue | Line: 383 ]]
	local v1 = p1:_getDataFolder(p2)
	if v1 then
		return v1:FindFirstChild("Score")
	else
		return nil
	end
end
function t.PlayerAdded(p1, p2, p3) --[[ PlayerAdded | Line: 392 | Upvalues: v4 (copy) ]]
	local v1 = p1:_getDataFolder(p2)
	if not v1 then
		v1 = v4.CreateDataValueFromType("TimeFrameLeaderboard")
		v1.Name = p1.Name
		v1.Parent = p3
	end
	for v2, v3 in v4.GetDataValueFromType("TimeFrameLeaderboard"):GetChildren() do
		if not v1:FindFirstChild(v3.Name) then
			v3:Clone().Parent = v1
		end
	end
	if p1.ExpireTime then
		v1.ExpireTime.Value = p1.ExpireTime
	end
	if p1.RefreshTimer then
		p2.Maid:GiveTask(p1.AddParticipationSignal:Connect(function() --[[ Line: 418 | Upvalues: p1 (copy), p2 (copy), v1 (ref) ]]
			p1:_resetPlayerScore(p2, v1)
		end))
		p1:_resetPlayerScore(p2, v1)
	end
	local function handleParticipation(p12, p22) --[[ handleParticipation | Line: 425 | Upvalues: p1 (copy), p2 (copy) ]]
		local v2 = tonumber(p12.Name)
		if v2 then
			p1:_fetchPreviousLeaderboard(v2, function(p13_2) --[[ Line: 431 | Upvalues: p2 (ref), p1 (ref), p12 (copy), p22 (copy) ]]
				if p2.Removed or not p2.Player.Parent then
					return
				end
				local v1 = p13_2[p2.Player.UserId]
				local t2 = {
					Leaderboard = p1,
					Score = p12.Value
				}
				t2.Position = if v1 then v1.Position or nil else nil
				t2.Seed = p12.Name
				if p1.GlobalLeaderboard:CreateRewards(p2, t2) ~= true then
					return
				end
				if not p22 then
					task.wait()
				end
				p12:Destroy()
			end)
		end
	end
	p2.Maid:GiveTask(v1.Previous.ChildAdded:Connect(handleParticipation))
	for v42, v5 in v1.Previous:GetChildren() do
		local v7 = tonumber(v5.Name)
		if v7 then
			local v8 = true
			p1:_fetchPreviousLeaderboard(v7, function(p13_2) --[[ Line: 431 | Upvalues: p2 (copy), p1 (copy), v5 (copy), v8 (copy) ]]
				if p2.Removed or not p2.Player.Parent then
					return
				end
				local v1 = p13_2[p2.Player.UserId]
				local t2 = {
					Leaderboard = p1,
					Score = v5.Value
				}
				t2.Position = if v1 then v1.Position or nil else nil
				t2.Seed = v5.Name
				if p1.GlobalLeaderboard:CreateRewards(p2, t2) ~= true then
					return
				end
				if not v8 then
					task.wait()
				end
				v5:Destroy()
			end)
		end
	end
end
function t.Update(p1) --[[ Update | Line: 469 | Upvalues: v10 (copy), HttpService (copy), v9 (copy) ]]
	if not p1:HasStarted() then
		return
	end
	local v1, v2 = p1.DataStore:GetSorted(p1.GlobalLeaderboard.Config.LowestScoreFirst or false, v10.MaxEntriesShownOnLeaderboard)
	if not v2 then
		warn("\226\154\160\239\184\143 GlobalLeaderboard, Unable to refresh Leaderboard " .. p1.Id .. " due to DataStore failure: " .. tostring(v1))
		return
	end
	local t = {}
	for k, v in pairs(v1) do
		local format = string.format
		t[k] = format("%x", tonumber(v.key) or 0) .. "_" .. string.format("%x", v.value or 0)
	end
	p1.LastLeaderboardUpdate = tick()
	p1.LeaderboardFolder:SetAttribute("Scores", HttpService:JSONEncode(t))
	if not v9 then
		return
	end
	print("\240\159\143\134 GlobalLeaderboard, Updated leaderboard", p1.Id, t)
end
function t.IsInIntermission(p1) --[[ IsInIntermission | Line: 499 ]]
	return p1.LeaderboardFolder:GetAttribute("Intermission")
end
function t.HasStarted(p1) --[[ HasStarted | Line: 503 ]]
	return p1.LeaderboardFolder:GetAttribute("Started")
end
function t.HasEnded(p1) --[[ HasEnded | Line: 507 ]]
	return p1.LeaderboardFolder:GetAttribute("Ended")
end
function t._addPreviousLeaderboard(p1, p2) --[[ _addPreviousLeaderboard | Line: 511 | Upvalues: v10 (copy) ]]
	if p1.LastLeaderboardUpdate and (tick() - p1.LastLeaderboardUpdate <= v10.IntermissionTime and (p1.Leaderboard and next(p1.Leaderboard))) then
		p1.PreviousLeaderboards[p2] = p1:_getLeaderboardByUserId(p1.Leaderboard)
	end
	p1.AddParticipationSignal:Fire(p2)
end
function t.Started(p1, p2) --[[ Started | Line: 529 ]]
	if not p1.LeaderboardFolder:GetAttribute("Started") then
		p1.LeaderboardFolder:SetAttribute("Started", true)
	end
end
function t.Ended(p1, p2, p3) --[[ Ended | Line: 536 ]]
	if p1.LeaderboardFolder:GetAttribute("Ended") then
		return
	end
	p1.LeaderboardFolder:SetAttribute("Ended", true)
	p1.LeaderboardFolder:SetAttribute("Intermission", false)
	if not p2 or p3 then
		return
	end
	if p2 - 1 ~= 1 then
		return
	end
	p1:_addPreviousLeaderboard(p2 - 1)
end
function t.Intermission(p1, p2) --[[ Intermission | Line: 559 ]]
	if not p1.LeaderboardFolder:GetAttribute("Intermission") then
		p1.LeaderboardFolder:SetAttribute("Intermission", true)
	end
end
function t.RollOver(p1, p2, p3) --[[ RollOver | Line: 566 ]]
	if not p3 then
		p1:_addPreviousLeaderboard(p2 - 1)
		p1:_initLeaderboard()
	end
end
function t.UpdatePlayer(p1, p2) --[[ UpdatePlayer | Line: 580 ]]
	if p1:IsInIntermission() then
		return
	end
	if not p1:HasStarted() then
		return
	end
	if p2.Removed then
		return
	end
	if not p1.DataStore then
		return
	end
	local v1 = p1:GetPendingScoreValue(p2)
	if not v1 then
		return
	end
	if v1.Value <= 0 then
		return false
	end
	local v2 = p1:_getLastSyncedValue(p2)
	if not v2 then
		return false
	end
	local v3 = p1:GetLastSyncedScoreValue(p2)
	if not v3 then
		return false
	end
	local v4 = p1:_getSeed()
	if v2.Value == v4 then
		return false
	end
	local _, v5 = p1.DataStore:Set(tostring(p2.Player.UserId), v1.Value)
	if v5 then
		v3.Value = v1.Value
		v2.Value = v4
	else
		warn("\226\154\160\239\184\143 GlobalLeaderboard, Unable to update score for", p2.Player, p1.Id)
	end
	return true
end
function t.CanIncrementScore(p1, p2, p3) --[[ CanIncrementScore | Line: 638 ]]
	if p1:IsInIntermission() then
		print("Intermission")
		return false
	end
	if not p1:HasStarted() then
		print("Not Started")
		return false
	end
	local v1 = p1:GetPendingScoreValue(p2)
	if not v1 then
		print("No ScoreValue")
		return false
	end
	local v2 = p1:_getLastRefreshValue(p2)
	if not v2 then
		print("No LastRefreshValue")
		return false
	end
	local v3 = p1:_getLastSyncedValue(p2)
	if not v3 then
		print("No LastSyncedValue")
		return false
	end
	if p1.RefreshTimer and v2.Value ~= p1:_getSeed() then
		print("LastRefreshValue ~= CurrentSeed")
		return false
	end
	if p1.GlobalLeaderboard.Config.CanIncrement and not p1.GlobalLeaderboard.Config.CanIncrement(p2, p3) then
		return false
	end
	if p1.GlobalLeaderboard.Config.KeepHighest then
		if p3.Amount <= v1.Value then
			return false
		end
	elseif p1.GlobalLeaderboard.Config.KeepLowest and (v1.Value > 0 and p3.Amount >= v1.Value) then
		return false
	end
	return true, v1, v3
end
function t.IncrementScore(p1, p2, p3) --[[ IncrementScore | Line: 698 | Upvalues: v9 (copy) ]]
	local v1, v2, v3 = p1:CanIncrementScore(p2, p3)
	if v1 ~= true then
		return
	end
	if p1.GlobalLeaderboard.Config.KeepHighest or p1.GlobalLeaderboard.Config.KeepLowest then
		v2.Value = p3.Amount
	else
		v2.Value = v2.Value + p3.Amount
	end
	v3.Value = -1
	if not v9 then
		return true
	end
	print("\240\159\143\134 GlobalLeaderboard, Incremented score for", p2.Player, p1.Id, p3.Amount)
	return true
end
function t.GetLeaderboardChangedSignal(p1) --[[ GetLeaderboardChangedSignal | Line: 718 ]]
	return p1.LeaderboardChangedSignal
end
function t.GetLeaderboard(p1) --[[ GetLeaderboard | Line: 722 ]]
	return p1.Leaderboard or {}
end
function t.GetStartTime(p1) --[[ GetStartTime | Line: 726 ]]
	if p1.RefreshTimer then
		return p1:_getStartTime()
	else
		return p1.LeaderboardFolder:GetAttribute("StartTime")
	end
end
function t.GetStartTimeChangedSignal(p1) --[[ GetStartTimeChangedSignal | Line: 733 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer.SeedChanged
	else
		return p1.LeaderboardFolder:GetAttributeChangedSignal("StartTime")
	end
end
function t.GetEndTimeChangedSignal(p1) --[[ GetEndTimeChangedSignal | Line: 740 ]]
	if p1.RefreshTimer then
		return p1.RefreshTimer.SeedChanged
	else
		return p1.LeaderboardFolder:GetAttributeChangedSignal("EndTime")
	end
end
function t.GetEndTime(p1) --[[ GetEndTime | Line: 748 ]]
	if p1.RefreshTimer then
		return p1:_getEndTime()
	else
		return p1.LeaderboardFolder:GetAttribute("EndTime")
	end
end
function t.GetIntermissionStartTime(p1) --[[ GetIntermissionStartTime | Line: 756 ]]
	if p1.RefreshTimer then
		return p1:_getIntermissionStartTime()
	else
		return p1.LeaderboardFolder:GetAttribute("IntermissionStartTime")
	end
end
function t.GetIntermissionStartTimeChangedSignal(p1) --[[ GetIntermissionStartTimeChangedSignal | Line: 763 ]]
	return p1.LeaderboardFolder:GetAttributeChangedSignal("IntermissionStartTime")
end
return t