-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("UnlockSequenceService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("InstanceUtils")
local v6 = RunService:IsServer()
function t.new(p1, p2) --[[ new | Line: 110 | Upvalues: t (copy), v2 (copy), v6 (copy), v4 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Name = p1
	v22.Config = p2
	v22.Repeatable = v22.Config.Repeatable or false
	v22.ResetOnNewSession = v22.Config.ResetOnNewSession or false
	v22.DefaultPlaytimeRequired = v22.Config.PlaytimeRequired or 900
	local v3 = table.clone(p2)
	v3.ClaimInOrder = false
	v3.AutoClaim = false
	function v3.Data(p1, p2) --[[ Line: 125 | Upvalues: v22 (copy) ]]
		return v22:_getDataFolder(p2)
	end
	v3.Requirements = v3.Requirements or {}
	v3.Requirements.PlaytimeRequired = {
		Get = function(p1, p2) --[[ Get | Line: 131 | Upvalues: v22 (copy) ]]
			return v22:GetCurrentPlaytime(p2)
		end,
		Check = function(p1, p2, p3, p4) --[[ Check | Line: 134 ]]
			return p3.PlaytimeRequired <= p4
		end,
		Changed = function(p1, p2) --[[ Changed | Line: 137 | Upvalues: v22 (copy) ]]
			local v1 = v22:_getPlaytimeValue(p2)
			if v1 then
				return v1:GetPropertyChangedSignal("Value")
			else
				return nil
			end
		end
	}
	local OnClaimed = v3.OnClaimed
	function v3.OnClaimed(p1, p2, p3) --[[ Line: 147 | Upvalues: v22 (copy), OnClaimed (copy) ]]
		v22:_onTierClaimed(p2, p3)
		if not OnClaimed then
			return
		end
		if type(OnClaimed) == "function" then
			OnClaimed(p1, p2, p3)
			return
		end
		if type(OnClaimed) ~= "table" then
			return
		end
		for v3, v4 in OnClaimed do
			v4(p1, p2, p3)
		end
	end
	if p2.Tiers then
		for v5, v62 in p2.Tiers do
			v62.PlaytimeRequired = v62.PlaytimeRequired or v22.DefaultPlaytimeRequired
		end
	end
	if p2.Tracks then
		for v8, v9 in p2.Tracks do
			if v9.Tiers then
				for v10, v11 in v9.Tiers do
					v11.PlaytimeRequired = v11.PlaytimeRequired or v22.DefaultPlaytimeRequired
				end
			end
		end
	end
	if v6 then
		v22.OnTierClaimed = type(v22.Config.OnTierClaimed) == "function" and { v22.Config.OnTierClaimed } or v22.Config.OnTierClaimed
		if not v22.OnTierClaimed then
			v22.OnTierClaimed = {}
		end
		v22.OnRepetitionCompleted = type(v22.Config.OnRepetitionCompleted) == "function" and { v22.Config.OnRepetitionCompleted } or v22.Config.OnRepetitionCompleted
		if not v22.OnRepetitionCompleted then
			v22.OnRepetitionCompleted = {}
		end
		v22.Maid:GiveTask(v4.bindToPlayers({
			OnAdded = function(p1, p2) --[[ OnAdded | Line: 189 | Upvalues: v22 (copy) ]]
				local v1 = v22:_getDataFolder(p2)
				if not v1 then
					warn((("\226\154\160\239\184\143 PlayTimeRewards, Data folder does not exist for player %* (UserId: %*) in sequence \'%*\'"):format(p1.Name, p1.UserId, v22.Name)))
					return
				end
				v22:_initDataFolder(v1)
				if v22.ResetOnNewSession and p2:HasResetPlaySessionOnJoin() then
					v22:ResetProgress(p2)
				end
				local v2 = v22:_getPlaytimeValue(p2)
				if not v2 then
					return
				end
				local v3 = p2.Stats:GetStatChangedSignal("TimePlayed")
				if not v3 then
					return
				end
				p2.Maid:GiveTask(v3:Connect(function() --[[ Line: 211 | Upvalues: v2 (copy) ]]
					v2.Value = v2.Value + 1
				end))
			end
		}))
	end
	v22.UnlockSequence = v1.AddSequence(p1, v3)
	v22.Maid:GiveTask(v22.UnlockSequence)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 225 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._runCallbacks(p1, p2, ...) --[[ _runCallbacks | Line: 229 ]]
	if not p1[p2] then
		return
	end
	for v1, v2 in p1[p2] do
		v2(p1, ...)
	end
end
function t._getDataFolder(p1, p2) --[[ _getDataFolder | Line: 239 | Upvalues: v6 (copy), v5 (copy) ]]
	local v1 = p1:_getValueOrFunction(p1.Config, "Data", p2)
	local v2 = typeof(v1)
	if v2 == "string" then
		v1 = p2.PlayerData:FindFirstChild(v1)
	elseif v2 ~= "Instance" then
		v1 = p2.PlayerData
	end
	local v4 = v1 and v1:FindFirstChild(p1.Name) or nil
	if v4 or not v6 then
		if v4 then
			return v4
		else
			return nil
		end
	elseif v2 == "Instance" then
		return v1
	else
		return v5.Create("Folder", {
			Name = p1.Name,
			Parent = v1
		})
	end
end
function t._getValueOrFunction(p1, p2, p3, ...) --[[ _getValueOrFunction | Line: 274 ]]
	local v1 = p2[p3]
	if type(v1) == "function" then
		return v1(...)
	else
		return v1
	end
end
function t._initDataFolder(p1, p2) --[[ _initDataFolder | Line: 282 | Upvalues: v6 (copy), v5 (copy) ]]
	if not v6 then
		return
	end
	if not p2:FindFirstChild("Playtime") then
		v5.Create("IntValue", {
			Name = "Playtime",
			Value = 0,
			Parent = p2
		})
	end
	if not p2:FindFirstChild("Repetitions") then
		v5.Create("IntValue", {
			Name = "Repetitions",
			Value = 0,
			Parent = p2
		})
	end
	local Tracks = p2:FindFirstChild("Tracks")
	if not Tracks then
		Tracks = v5.Create("Folder", {
			Name = "Tracks",
			Parent = p2
		})
	end
	local t = {}
	if p1.UnlockSequence then
		for v2 in p1.UnlockSequence.Tracks do
			t[v2] = p1.UnlockSequence:GetTrack(v2)
		end
	elseif p1.Config.Tracks then
		for v3, v4 in p1.Config.Tracks do
			t[v3] = v4
		end
	end
	for v52, v62 in t do
		if not Tracks:FindFirstChild(v52) then
			local v7 = v5.Create("Folder", {
				Name = v52,
				Parent = Tracks
			})
			if v62.ProductId then
				v5.Create("BoolValue", {
					Name = "Unlocked",
					Value = false,
					Parent = v7
				})
			end
		end
	end
end
function t._getPlaytimeValue(p1, p2) --[[ _getPlaytimeValue | Line: 343 ]]
	local v1 = p1:_getDataFolder(p2)
	if v1 then
		return v1:FindFirstChild("Playtime")
	else
		return nil
	end
end
function t.GetCurrentPlaytime(p1, p2) --[[ GetCurrentPlaytime | Line: 352 ]]
	local v1 = p1:_getPlaytimeValue(p2)
	if v1 then
		return v1.Value
	else
		return 0
	end
end
function t._setPlaytime(p1, p2, p3) --[[ _setPlaytime | Line: 360 ]]
	local v1 = p1:_getPlaytimeValue(p2)
	if not v1 then
		return
	end
	v1.Value = p3
end
function t.GetRepetitions(p1, p2) --[[ GetRepetitions | Line: 367 ]]
	local v1 = p1:_getDataFolder(p2)
	if not v1 then
		return 0
	end
	local Repetitions = v1:FindFirstChild("Repetitions")
	if Repetitions then
		return Repetitions.Value
	else
		return 0
	end
end
function t._setRepetitions(p1, p2, p3) --[[ _setRepetitions | Line: 381 ]]
	local v1 = p1:_getDataFolder(p2)
	if not v1 then
		return
	end
	local Repetitions = v1:FindFirstChild("Repetitions")
	if not Repetitions then
		return
	end
	Repetitions.Value = p3
end
function t._incrementRepetitions(p1, p2) --[[ _incrementRepetitions | Line: 393 ]]
	local v1 = p1:GetRepetitions(p2)
	p1:_setRepetitions(p2, v1 + 1)
	return v1 + 1
end
function t._areAllTiersClaimed(p1, p2) --[[ _areAllTiersClaimed | Line: 399 ]]
	for v1 in p1.UnlockSequence.Tracks do
		for v2, v3 in p1.UnlockSequence:GetTrack(v1).Tiers do
			if not p1.UnlockSequence:IsTierClaimed(p2, v3) then
				return false
			end
		end
	end
	return true
end
function t._onTierClaimed(p1, p2, p3) --[[ _onTierClaimed | Line: 411 ]]
	p3.Playtime = p1:GetCurrentPlaytime(p2)
	p3.Repetitions = p1:GetRepetitions(p2)
	p1:_runCallbacks("OnTierClaimed", p2, p3)
	if not (p1.Repeatable and p1:_areAllTiersClaimed(p2)) then
		return
	end
	p1:_incrementRepetitions(p2)
	p3.RepetitionCompleted = true
	p1:_runCallbacks("OnRepetitionCompleted", p2, p3)
	for v1 in p1.UnlockSequence.Tracks do
		local v2 = p1.UnlockSequence:_getClaimedDataFolder(p2, v1)
		if v2 then
			v2:ClearAllChildren()
		end
	end
	p1:_setPlaytime(p2, 0)
end
function t.ResetProgress(p1, p2) --[[ ResetProgress | Line: 434 ]]
	for v1 in p1.UnlockSequence.Tracks do
		local v2 = p1.UnlockSequence:_getClaimedDataFolder(p2, v1)
		if v2 then
			v2:ClearAllChildren()
		end
	end
	p1:_setPlaytime(p2, 0)
end
function t.GetTimeUntilTier(p1, p2, p3) --[[ GetTimeUntilTier | Line: 445 ]]
	local v1 = p1.UnlockSequence:GetUnlockTier(p3)
	local v2 = p1:GetCurrentPlaytime(p2)
	return math.max(0, (v1.PlaytimeRequired or p1.DefaultPlaytimeRequired) - v2)
end
function t.GetProgress(p1, p2, p3) --[[ GetProgress | Line: 454 ]]
	local v1 = p1.UnlockSequence:GetTrack(p3)
	local v2 = p1:GetCurrentPlaytime(p2)
	local count = 0
	local count_2 = 0
	for v3, v4 in v1.Tiers do
		if p1.UnlockSequence:IsTierClaimed(p2, v4) then
			count = count + 1
		end
		if v4.PlaytimeRequired <= v2 then
			count_2 = count_2 + 1
		end
	end
	local v5 = nil
	for v6, v7 in v1.Tiers do
		if not p1.UnlockSequence:IsTierClaimed(p2, v7) and (not v5 or v7.PlaytimeRequired < v5.PlaytimeRequired) then
			v5 = v7
		end
	end
	local t = {
		CurrentPlaytime = v2,
		TotalTiers = #v1.Tiers,
		ClaimedTiers = count,
		AvailableTiers = count_2,
		UnclaimedAvailable = count_2 - count,
		NextUnclaimedTier = v5
	}
	t.TimeUntilNextTier = v5 and p1:GetTimeUntilTier(p2, v5) or 0
	t.AllClaimed = if count == #v1.Tiers then true else false
	t.Repetitions = p1:GetRepetitions(p2)
	return t
end
function t.FormatTime(p1, p2) --[[ FormatTime | Line: 494 ]]
	local v1 = math.floor(p2 / 3600)
	local v2 = math.floor(p2 % 3600 / 60)
	local v3 = p2 % 60
	if v1 > 0 then
		return string.format("%dh %dm", v1, v2)
	end
	if v2 > 0 then
		return string.format("%dm %ds", v2, v3)
	else
		return string.format("%ds", v3)
	end
end
function t.GetTrack(p1, p2) --[[ GetTrack | Line: 508 ]]
	return p1.UnlockSequence:GetTrack(p2)
end
function t.UnlockTrack(p1, p2) --[[ UnlockTrack | Line: 512 ]]
	return p1.UnlockSequence:UnlockTrack(p2)
end
function t.GetTracks(p1) --[[ GetTracks | Line: 516 ]]
	return p1.UnlockSequence:GetTracks()
end
function t.GetTiers(p1, p2) --[[ GetTiers | Line: 520 ]]
	return p1.UnlockSequence:GetTiers(p2)
end
function t.GetTier(p1, p2) --[[ GetTier | Line: 524 ]]
	return p1.UnlockSequence:GetUnlockTier(p2)
end
function t.GetUnlockTier(p1, p2) --[[ GetUnlockTier | Line: 528 ]]
	return p1.UnlockSequence:GetUnlockTier(p2)
end
function t.GetTierState(p1, p2, p3) --[[ GetTierState | Line: 532 ]]
	return p1.UnlockSequence:GetTierState(p2, p3)
end
function t.IsTierClaimed(p1, p2, p3) --[[ IsTierClaimed | Line: 536 ]]
	return p1.UnlockSequence:IsTierClaimed(p2, p3)
end
function t.IsTierUnlocked(p1, p2, p3) --[[ IsTierUnlocked | Line: 540 ]]
	return p1.UnlockSequence:IsTierUnlocked(p2, p3)
end
function t.IsTierClaimable(p1, p2, p3) --[[ IsTierClaimable | Line: 544 ]]
	return p1.UnlockSequence:IsTierClaimable(p2, p3)
end
function t.GetCurrentTier(p1, p2, p3) --[[ GetCurrentTier | Line: 548 ]]
	return p1.UnlockSequence:GetCurrentTier(p2, p3)
end
function t.GetNextTierToUnlock(p1, p2, p3) --[[ GetNextTierToUnlock | Line: 552 ]]
	return p1.UnlockSequence:GetNextTierToUnlock(p2, p3)
end
function t.CanClaim(p1, p2, p3) --[[ CanClaim | Line: 556 ]]
	return p1.UnlockSequence:CanClaim(p2, p3)
end
function t.Claim(p1, p2, p3) --[[ Claim | Line: 560 ]]
	return p1.UnlockSequence:Claim(p2, p3)
end
function t.ClaimOrPromptPurchase(p1, p2, p3) --[[ ClaimOrPromptPurchase | Line: 564 ]]
	return p1.UnlockSequence:ClaimOrPromptPurchase(p2, p3)
end
function t.GetTierChangedSignal(p1, p2, p3) --[[ GetTierChangedSignal | Line: 568 ]]
	return p1.UnlockSequence:GetTierChangedSignal(p2, p3)
end
function t.GetTiersChangedSignal(p1, p2, p3) --[[ GetTiersChangedSignal | Line: 572 ]]
	return p1.UnlockSequence:GetTiersChangedSignal(p2, p3)
end
function t.GetProgressChangedSignal(p1, p2, p3) --[[ GetProgressChangedSignal | Line: 576 ]]
	return p1.UnlockSequence:GetProgressChangedSignal(p2, p3)
end
function t.GetTierRewards(p1, p2, p3) --[[ GetTierRewards | Line: 580 ]]
	local v1 = p1.UnlockSequence:GetUnlockTier(p3)
	local Rewards = v1.Rewards
	if p1.Config.Rewards then
		if type(p1.Config.Rewards) == "function" then
			return p1.Config.Rewards(p1, v1)
		end
		Rewards = p1.Config.Rewards
	end
	return Rewards
end
return t