-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils")
local v2 = Sonar("TimeSeedClass")
local v3 = Sonar("TimeUtils")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar(v1.Get("AdventCalendar"))
local v6 = Sonar("Constants")
local t = {}
repeat
	wait()
until ReplicatedStorage:WaitForChild("AdventCalendarTime").Value > 0
local v7 = ReplicatedStorage:WaitForChild("AdventCalendarTime").Value
local PresetAmountsByCategory = v6.PresetAmountsByCategory
function t.CanClaimReward(p1, p2) --[[ CanClaimReward | Line: 28 | Upvalues: t (copy), v4 (copy) ]]
	if not t.GetRewardFromIndex(p2) then
		return "NoAdvent"
	end
	local v1 = tonumber(p2)
	if not (if v1 >= 1 then if v1 <= 4 then true else false else false) and t.AdventTimer.CurrentSeed ~= v1 then
		return
	end
	if not p1 then
		p1 = v4.GetClient()
	end
	if p1.EventData.AdventCalendar[p2].Value then
		return "AlreadyClaimed"
	else
		return true
	end
end
function t.HasUnclaimedReward(p1, p2) --[[ HasUnclaimedReward | Line: 47 | Upvalues: t (copy) ]]
	if t.AdventTimer.CurrentSeed <= 0 then
		return "HasNotStarted"
	end
	return t.CanClaimReward(p2, t.AdventTimer.CurrentSeed) == true
end
function t.GetRewardFromIndex(p1) --[[ GetRewardFromIndex | Line: 56 | Upvalues: v5 (copy) ]]
	return v5[tonumber(p1)]
end
function t.HasClaimedAllRewards(p1) --[[ HasClaimedAllRewards | Line: 61 ]]
	for k, v in pairs(p1.EventData.AdventCalendar:GetChildren()) do
		if not v.Value then
			return false
		end
	end
	return true
end
function t.GetCurrentStreak(p1) --[[ GetCurrentStreak | Line: 70 | Upvalues: t (copy) ]]
	local CurrentSeed = t.AdventTimer.CurrentSeed
	local count = 0
	for k, v in pairs(p1.EventData.AdventCalendar:GetChildren()) do
		if not (CurrentSeed < tonumber(v.Name)) then
			if v.Value then
				count = count + 1
				continue
			end
			if CurrentSeed == tonumber(v.Name) then
				break
			end
			count = 0
		end
	end
	return count
end
function t.HasStreakBeenMissed(p1) --[[ HasStreakBeenMissed | Line: 90 | Upvalues: t (copy) ]]
	local CurrentSeed = t.AdventTimer.CurrentSeed
	for k, v in pairs(p1.EventData.AdventCalendar:GetChildren()) do
		if not (CurrentSeed <= tonumber(v.Name) or v.Value) then
			return true
		end
	end
end
function t.GetCurrentMultiplier(p1) --[[ GetCurrentMultiplier | Line: 102 | Upvalues: t (copy) ]]
	return 1 + t.GetCurrentStreak(p1) * 0.1
end
function t.GetRewardAmountForItem(p1, p2) --[[ GetRewardAmountForItem | Line: 109 | Upvalues: PresetAmountsByCategory (copy) ]]
	if type(p1) == "table" and p1.Amount then
		return p1.Amount
	end
	return if p2 then PresetAmountsByCategory[p2.Category] or 1 else 1
end
t.TotalDays = #v5
t.AdventTimer = v2.new({
	Duration = v3.Cycles.Day,
	Start = v7
})
return t