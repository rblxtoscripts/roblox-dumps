-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("UnlockSequenceService")
local v2 = Sonar("BattlepassService")
local v3 = Sonar("InstanceUtils")
local v4 = Sonar("Constants")
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 17 | Upvalues: t (copy), v2 (copy), v3 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.BattlepassValue = p1
	v22.PlayerWrapper = p2
	v22.BattlepassName = p1.Name
	v22.BattlepassData = v2.GetBattlepassData(v22.BattlepassName)
	v22.UnlockSequence = v2.GetBattlepassSequence(v22.BattlepassName)
	v22.XPValue = v22.BattlepassValue:FindFirstChild("XP")
	if not v22.XPValue then
		v22.XPValue = v3.Create("IntValue", {
			Name = "XP",
			Value = 0,
			Parent = v22.BattlepassValue
		})
	end
	return v22
end
function t.ClaimTier(p1, p2) --[[ ClaimTier | Line: 41 | Upvalues: v4 (copy), v1 (copy) ]]
	if v4.IS_SERVER then
		return false
	else
		return v1.RequestToClaimTier(p2)
	end
end
function t.CanIncrementProgress(p1, p2) --[[ CanIncrementProgress | Line: 52 ]]
	return (not p1.BattlepassData.CanIncrement or p1.BattlepassData.CanIncrement(p2)) and true or false
end
function t.IncrementProgress(p1, p2) --[[ IncrementProgress | Line: 62 ]]
	p1.XPValue.Value = math.min(p1.XPValue.Value + p2, (p1.UnlockSequence:GetMaxAchievableRequiredPoints(p1.PlayerWrapper)))
end
function t.SkipTiers(p1, p2) --[[ SkipTiers | Line: 69 ]]
	for i = 1, p2 or 1 do
		local v1 = p1.UnlockSequence:GetNextTierToUnlock(p1.PlayerWrapper)
		if not v1 then
			break
		end
		p1:IncrementProgress(v1.RequiredPoints)
	end
end
function t.CalculateTier(p1) --[[ CalculateTier | Line: 85 ]]
	local v1 = p1.UnlockSequence:GetCurrentTier(p1.PlayerWrapper)
	return if v1 then v1.Index or 0 else 0
end
function t.GetUnlockSequence(p1) --[[ GetUnlockSequence | Line: 91 ]]
	return p1.UnlockSequence
end
function t.GetActivationTime(p1) --[[ GetActivationTime | Line: 97 ]]
	return p1.BattlepassValue.Value
end
function t.GetExpirationTime(p1) --[[ GetExpirationTime | Line: 103 ]]
	local t = {}
	if p1.BattlepassData.EndTime then
		table.insert(t, p1.BattlepassData.EndTime)
	end
	if p1.BattlepassData.Duration then
		table.insert(t, p1:GetActivationTime() + p1.BattlepassData.Duration)
	end
	return next(t) and math.min(unpack(t)) or nil
end
function t.IsExpired(p1) --[[ IsExpired | Line: 118 ]]
	local v1 = p1:GetExpirationTime()
	return if v1 then v1 <= workspace:GetServerTimeNow() else v1
end
function t.Destroy(p1) --[[ Destroy | Line: 123 ]]
	table.clear(p1)
	setmetatable(p1, nil)
end
return t