-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("FormatTime")
local v4 = Sonar("Signal")
local v5 = Sonar("LoginRewardsService")
local v6 = RunService:IsServer()
function t.new(p1, p2) --[[ new | Line: 20 | Upvalues: t (copy), v1 (copy), v5 (copy), v6 (copy), v3 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.SequenceValue = p1
	v2.PlayerWrapper = p2
	v2.LoginRewardsName = p1.Name
	v2.LoginRewardsData = v5.GetLoginRewardsData(v2.LoginRewardsName)
	v2.UnlockSequence = v5.GetLoginRewardsSequence(v2.LoginRewardsName)
	v2.Repeatable = v2.LoginRewardsData.Repeatable or false
	v2.DoNotLoseProgress = v2.LoginRewardsData.DoNotLoseProgress or false
	v2.SeededPerPlayer = v2.LoginRewardsData.SeededPerPlayer or false
	v2.DelayFirstClaim = v2.LoginRewardsData.DelayFirstClaim or false
	v2.DefaultClaimTime = v2.LoginRewardsData.ClaimTime or 86400
	v2.DefaultGracePeriod = v2.LoginRewardsData.GracePeriod
	if v6 then
		if v2.DelayFirstClaim then
			local LastClaimTime = v2.SequenceValue:FindFirstChild("LastClaimTime")
			if LastClaimTime and LastClaimTime.Value == 0 then
				local v32 = v3.GetTime()
				if type(v2.DelayFirstClaim) == "number" then
					LastClaimTime.Value = v32 - (v2.DefaultClaimTime - v2.DelayFirstClaim)
				else
					LastClaimTime.Value = v32
				end
			end
		end
		if not v2.DoNotLoseProgress then
			local function checkAndResetGracePeriod() --[[ checkAndResetGracePeriod | Line: 53 | Upvalues: v2 (copy) ]]
				if v2:CheckGracePeriod() then
					return
				end
				v2:ResetProgress()
			end
			v2.Maid:GiveTask(v3.OnTimeChanged(checkAndResetGracePeriod))
			if not v2:CheckGracePeriod() then
				v2:ResetProgress()
			end
		end
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 67 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t._runCallbacks(p1, p2, ...) --[[ _runCallbacks | Line: 71 ]]
	if not p1.LoginRewardsData[p2] then
		return
	end
	local v1 = p1.LoginRewardsData[p2]
	for v3, v4 in type(v1) == "function" and { v1 } or v1 do
		v4(p1, p1.PlayerWrapper, ...)
	end
end
function t._getValueOrFunction(p1, p2, p3, ...) --[[ _getValueOrFunction | Line: 82 ]]
	local v1 = p2[p3]
	if type(v1) == "function" then
		return v1(...)
	else
		return v1
	end
end
function t._getLastClaimTime(p1) --[[ _getLastClaimTime | Line: 90 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return 0
	end
	local LastClaimTime = SequenceValue:FindFirstChild("LastClaimTime")
	if LastClaimTime then
		return LastClaimTime.Value
	else
		return 0
	end
end
function t._setLastClaimTime(p1, p2) --[[ _setLastClaimTime | Line: 104 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return
	end
	local LastClaimTime = SequenceValue:FindFirstChild("LastClaimTime")
	if not LastClaimTime then
		return
	end
	LastClaimTime.Value = p2
end
function t.GetStreak(p1) --[[ GetStreak | Line: 116 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return 0
	end
	local Streak = SequenceValue:FindFirstChild("Streak")
	if Streak then
		return Streak.Value
	else
		return 0
	end
end
function t._setStreak(p1, p2) --[[ _setStreak | Line: 130 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return
	end
	local Streak = SequenceValue:FindFirstChild("Streak")
	if Streak then
		Streak.Value = p2
	end
	local LongestStreak = SequenceValue:FindFirstChild("LongestStreak")
	if not (LongestStreak and LongestStreak.Value < p2) then
		return
	end
	LongestStreak.Value = p2
end
function t.GetLongestStreak(p1) --[[ GetLongestStreak | Line: 147 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return 0
	end
	local LongestStreak = SequenceValue:FindFirstChild("LongestStreak")
	if LongestStreak then
		return LongestStreak.Value
	else
		return 0
	end
end
function t._getStreakLostTime(p1) --[[ _getStreakLostTime | Line: 161 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return 0
	end
	local StreakLostTime = SequenceValue:FindFirstChild("StreakLostTime")
	if StreakLostTime then
		return StreakLostTime.Value
	else
		return 0
	end
end
function t._setStreakLostTime(p1, p2) --[[ _setStreakLostTime | Line: 175 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return
	end
	local StreakLostTime = SequenceValue:FindFirstChild("StreakLostTime")
	if not StreakLostTime then
		return
	end
	StreakLostTime.Value = p2
end
function t.GetRepetitions(p1) --[[ GetRepetitions | Line: 187 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return 0
	end
	local Repetitions = SequenceValue:FindFirstChild("Repetitions")
	if Repetitions then
		return Repetitions.Value
	else
		return 0
	end
end
function t._setRepetitions(p1, p2) --[[ _setRepetitions | Line: 201 ]]
	local SequenceValue = p1.SequenceValue
	if not SequenceValue then
		return
	end
	local Repetitions = SequenceValue:FindFirstChild("Repetitions")
	if not Repetitions then
		return
	end
	Repetitions.Value = p2
end
function t._incrementRepetitions(p1) --[[ _incrementRepetitions | Line: 213 ]]
	local v1 = p1:GetRepetitions()
	p1:_setRepetitions(v1 + 1)
	return v1 + 1
end
function t._incrementStreak(p1) --[[ _incrementStreak | Line: 219 ]]
	local v1 = p1:GetStreak()
	p1:_setStreak(v1 + 1)
	return v1 + 1
end
function t._resetStreak(p1) --[[ _resetStreak | Line: 225 | Upvalues: v3 (copy) ]]
	local v1 = p1:GetStreak()
	if v1 > 0 then
		p1:_setStreak(0)
		p1:_setStreakLostTime(v3.GetTime())
		p1:_runCallbacks("OnStreakLost", v1)
	end
	return v1
end
function t._getMaxClaimedTierIndex(p1) --[[ _getMaxClaimedTierIndex | Line: 236 ]]
	local v1 = 0
	for v2 in p1.UnlockSequence.Tracks do
		local v3 = p1.UnlockSequence:GetCurrentTier(p1.PlayerWrapper, v2)
		if v3 and v1 < v3.Index then
			v1 = v3.Index
		end
	end
	return v1
end
function t._checkTimeRequirements(p1, p2) --[[ _checkTimeRequirements | Line: 247 | Upvalues: v3 (copy) ]]
	local v1 = p1.UnlockSequence:GetUnlockTier(p2)
	if not p1:CheckGracePeriod() then
		return false, "GracePeriodExpired"
	end
	local v2 = p1:_getLastClaimTime()
	local v32 = v3.GetTime()
	if v2 == 0 then
		return true
	end
	if p1:_getMaxClaimedTierIndex() >= v1.Index then
		return true
	end
	if v32 - v2 < (v1.ClaimTime or p1.DefaultClaimTime) then
		return false, "ClaimTimeNotReached"
	else
		return true
	end
end
function t.CanClaimTime(p1, p2) --[[ CanClaimTime | Line: 277 ]]
	local v1, v2 = p1:_checkTimeRequirements(p2)
	if v1 == true then
		return true
	end
	if v2 ~= "GracePeriodExpired" then
		return v2
	end
	local v3 = p1.UnlockSequence:GetUnlockTier(p2)
	if v3 and v3.Index == 1 then
		return true
	else
		return "StreakReset"
	end
end
function t.OnClaimed(p1, p2) --[[ OnClaimed | Line: 294 | Upvalues: v3 (copy) ]]
	local Tier = p2.Tier
	local v1 = v3.GetTime()
	local v2 = p1:_getLastClaimTime()
	if if v2 == 0 then true elseif v1 - v2 >= p1.DefaultClaimTime then true else false then
		p1:_setLastClaimTime(v1)
		p1:_incrementStreak()
		p1:_setStreakLostTime(0)
	end
	local v4 = p1.UnlockSequence:GetTrack("Default")
	local v5 = if Tier.Track == "Default" then true else false
	if (if v5 then Tier.Index == #v4.Tiers else v5) and p1.Repeatable then
		p1:_incrementRepetitions()
		p2.CycleCompleted = true
	end
	p2.Streak = p1:GetStreak()
	p2.LongestStreak = p1:GetLongestStreak()
	p2.Repetitions = p1:GetRepetitions()
	p1:_runCallbacks("OnTierClaimed", p2)
end
function t.CheckGracePeriod(p1) --[[ CheckGracePeriod | Line: 324 | Upvalues: v3 (copy) ]]
	if p1.DoNotLoseProgress then
		return true, "Protected"
	end
	local v1 = p1:_getLastClaimTime()
	if v1 == 0 then
		return true, "NeverClaimed"
	end
	local v2 = v3.GetTime() - v1
	local v32 = p1.UnlockSequence:GetNextTierToUnlock(p1.PlayerWrapper)
	if not v32 then
		if not p1.Repeatable then
			return true, "AllTiersClaimed"
		end
		v32 = p1.UnlockSequence:GetTrack("Default").Tiers[1]
	end
	local v4 = v32.ClaimTime or p1.DefaultClaimTime
	local v6 = v4 + (v32.GracePeriod or (p1.DefaultGracePeriod or v4))
	if v6 < v2 then
		return false, "GracePeriodExpired", {
			TimeSinceLastClaim = v2,
			AllowedTime = v6,
			Overage = v2 - v6
		}
	else
		return true, "WithinGracePeriod", {
			TimeSinceLastClaim = v2,
			TimeRemaining = v6 - v2
		}
	end
end
function t.GetClaimableTimestamp(p1) --[[ GetClaimableTimestamp | Line: 364 | Upvalues: v3 (copy) ]]
	local v1 = p1:_getLastClaimTime()
	local v2 = v3.GetTime()
	if v1 == 0 then
		return v2
	end
	local v4 = p1.UnlockSequence:GetNextTierToUnlock(p1.PlayerWrapper)
	if not v4 then
		if not p1.Repeatable then
			return 0
		end
		v4 = p1.UnlockSequence:GetTrack("Default").Tiers[1]
	end
	return v2 + math.max(0, (v4.ClaimTime or p1.DefaultClaimTime) - (v2 - v1))
end
function t.GetGraceExpiresTimestamp(p1) --[[ GetGraceExpiresTimestamp | Line: 389 | Upvalues: v3 (copy) ]]
	local v1 = p1:_getLastClaimTime()
	if v1 == 0 then
		return (1 / 0)
	end
	if p1.DoNotLoseProgress then
		return (1 / 0)
	end
	local v2 = v3.GetTime()
	local v4 = p1.UnlockSequence:GetNextTierToUnlock(p1.PlayerWrapper)
	if not v4 then
		if not p1.Repeatable then
			return (1 / 0)
		end
		v4 = p1.UnlockSequence:GetTrack("Default").Tiers[1]
	end
	local v5 = v4.ClaimTime or p1.DefaultClaimTime
	return v2 + math.max(0, v5 + (v4.GracePeriod or (p1.DefaultGracePeriod or v5)) - (v2 - v1))
end
function t.GetProgress(p1, p2) --[[ GetProgress | Line: 420 | Upvalues: v3 (copy) ]]
	local v1 = p1.UnlockSequence:GetTrack(p2)
	local v2 = p1.UnlockSequence:GetCurrentTier(p1.PlayerWrapper, p2)
	local v32 = p1:GetNextTier(p2)
	local v4 = p1:_getLastClaimTime()
	local v6 = v4 > 0 and v3.GetTime() - v4 or 0
	local v7 = p1:GetClaimableTimestamp()
	local v8 = p1:GetGraceExpiresTimestamp()
	local v9, v10 = p1:CheckGracePeriod()
	local v11 = if v32 and (v9 and p1:_checkTimeRequirements(v32) == true) then if p1.UnlockSequence:GetTierState(p1.PlayerWrapper, v32) == "Unlocked" then true else false else false
	local t = {
		CurrentTier = v2,
		NextTier = v32,
		TotalTiers = #v1.Tiers
	}
	t.ClaimedTiers = v2 and v2.Index or 0
	t.LastClaimTime = v4
	t.TimeSinceLastClaim = v6
	t.ClaimableTimestamp = v7
	t.GraceExpiresTimestamp = v8
	t.CanClaimNow = v11
	t.WithinGracePeriod = v9
	t.GraceStatus = v10
	t.Streak = p1:GetStreak()
	t.LongestStreak = p1:GetLongestStreak()
	t.Repetitions = p1:GetRepetitions()
	t.CanRestoreStreak = p1:CanRestoreStreak() == true
	t.StreakLostTime = p1:_getStreakLostTime()
	return t
end
function t.GetNextTier(p1, p2) --[[ GetNextTier | Line: 467 ]]
	return p1.UnlockSequence:GetNextTierToUnlock(p1.PlayerWrapper, p2)
end
function t.ResetProgress(p1) --[[ ResetProgress | Line: 471 ]]
	local v1 = p1:_resetStreak()
	for v2 in p1.UnlockSequence.Tracks do
		local v3 = p1.UnlockSequence:GetTrackValue(p1.PlayerWrapper, v2)
		if v3 then
			if v3:IsA("IntValue") or v3:IsA("NumberValue") then
				v3.Value = 0
				continue
			end
			local Value = v3:FindFirstChild("Value")
			if Value then
				Value.Value = 0
			end
		end
	end
	p1:_setLastClaimTime(0)
	return v1
end
function t.GetProgressChangedSignal(p1, p2) --[[ GetProgressChangedSignal | Line: 493 | Upvalues: v4 (copy) ]]
	local v1 = v4.new()
	local v2 = p1.UnlockSequence:GetProgressChangedSignal(p1.PlayerWrapper, p2)
	if v2 then
		v1:GiveTask(v2:Connect(function() --[[ Line: 498 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
	end
	local SequenceValue = p1.SequenceValue
	if SequenceValue then
		local Streak = SequenceValue:FindFirstChild("Streak")
		if Streak then
			v1:GiveTask(Streak:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 507 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
		end
		local LastClaimTime = SequenceValue:FindFirstChild("LastClaimTime")
		if LastClaimTime then
			local function onLastClaimTimeChanged() --[[ onLastClaimTimeChanged | Line: 514 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end
			v1:GiveTask(LastClaimTime:GetPropertyChangedSignal("Value"):Connect(onLastClaimTimeChanged))
		end
		local StreakLostTime = SequenceValue:FindFirstChild("StreakLostTime")
		if StreakLostTime then
			v1:GiveTask(StreakLostTime:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 523 | Upvalues: v1 (copy) ]]
				v1:Fire()
			end))
		end
	end
	return v1
end
function t.CanRestoreStreak(p1) --[[ CanRestoreStreak | Line: 533 ]]
	if not p1.LoginRewardsData.RestoreStreak then
		return false, "RestoreStreakDisabled"
	end
	if p1.DoNotLoseProgress then
		return false, "DoNotLoseProgressEnabled"
	end
	if p1:GetStreak() >= p1:GetLongestStreak() then
		return false, "NoStreakToRestore"
	end
	if p1:_getStreakLostTime() == 0 then
		return false, "StreakNotLost"
	else
		return true
	end
end
function t.RestoreStreak(p1) --[[ RestoreStreak | Line: 563 | Upvalues: v3 (copy) ]]
	local v1, v2 = p1:CanRestoreStreak()
	if not v1 then
		return false, v2
	end
	local v32 = p1:GetLongestStreak()
	local v4 = v3.GetTime()
	p1:_setStreak(v32)
	p1:_setStreakLostTime(0)
	p1:_setLastClaimTime(v4)
	local v5 = #p1.UnlockSequence:GetTrack("Default").Tiers
	if p1.Repeatable then
		p1:_setRepetitions((math.floor((v32 - 1) / v5)))
		local v6 = (v32 - 1) % v5 + 1
		for v7 in p1.UnlockSequence.Tracks do
			local v8 = p1.UnlockSequence:GetTrackValue(p1.PlayerWrapper, v7)
			if v8 then
				if v8:IsA("IntValue") or v8:IsA("NumberValue") then
					v8.Value = v6
					continue
				end
				local Value = v8:FindFirstChild("Value")
				if Value then
					Value.Value = v6
				end
			end
		end
	else
		local v9 = math.min(v32, v5)
		for v10 in p1.UnlockSequence.Tracks do
			local v11 = p1.UnlockSequence:GetTrackValue(p1.PlayerWrapper, v10)
			if v11 then
				if v11:IsA("IntValue") or v11:IsA("NumberValue") then
					v11.Value = v9
					continue
				end
				local Value = v11:FindFirstChild("Value")
				if Value then
					Value.Value = v9
				end
			end
		end
	end
	p1:_runCallbacks("OnStreakRestored", v32)
	return true, v32
end
function t.GetRestoreStreakInfo(p1) --[[ GetRestoreStreakInfo | Line: 633 ]]
	local v1, v2 = p1:CanRestoreStreak()
	local t = {}
	t.CanRestore = v1 == true
	t.Reason = v2
	t.CurrentStreak = p1:GetStreak()
	t.LongestStreak = p1:GetLongestStreak()
	return t
end
return t