-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("FormatNumber")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("Constants")
local t2 = {
	SprintSpeed = "Agility",
	Speed = "Agility",
	JumpHeight = "Jump",
	Stamina = "Agility",
	StaminaRegen = "Agility",
	TurnSpeed = "Agility",
	BreedCooldown = "Fertility",
	HarvestStrength = "Strength"
}
local v4 = Sonar(v2.Get("UpgradeStats"))
function t.GetUpgradedStat(p1, p2, p3, p4) --[[ GetUpgradedStat | Line: 29 | Upvalues: t2 (copy), t (copy) ]]
	local v2 = p2.Stats[p3]
	if not p2.Upgrades[t2[p3] or p3] then
		return v2 or 1
	end
	return v2 + v2 * t.GetStatUpgradeAmount(p2, p3, if p4 then p4 else t.GetUpgradeValueFromDataValue(p1, p3).Value)
end
function t.GetStatUpgradeAmount(p1, p2, p3) --[[ GetStatUpgradeAmount | Line: 45 | Upvalues: t2 (copy) ]]
	local v2 = p1.Upgrades[t2[p2] or p2]
	if v2[p2] and v2[p2].Increment then
		return v2[p2].Increment * p3
	end
	if v2.Increment then
		return v2.Increment * p3
	end
end
function t.GetUpgradeValueFromDataValue(p1, p2) --[[ GetUpgradeValueFromDataValue | Line: 56 | Upvalues: t2 (copy) ]]
	return p1.Upgrades:FindFirstChild(t2[p2] or p2)
end
function t.CanGiveUpgradePointFromLevel(p1, p2) --[[ CanGiveUpgradePointFromLevel | Line: 61 | Upvalues: v3 (copy) ]]
	return (if p2 then p2 else p1.Level.Value).Value % v3.LevelPerUpgradePoint == 0
end
function t.GetUpgradedStatChanged(...) --[[ GetUpgradedStatChanged | Line: 66 | Upvalues: t (copy) ]]
	return t.GetUpgradeValueFromDataValue(...):GetPropertyChangedSignal("Value")
end
function t.IsDataValueUpgraded(p1) --[[ IsDataValueUpgraded | Line: 70 ]]
	for k, v in pairs(p1.Upgrades:GetChildren()) do
		if v.Value > 0 then
			return true
		end
	end
	return false
end
function t.CanUpgradeStat(p1, p2, p3, p4, p5) --[[ CanUpgradeStat | Line: 79 ]]
	return true
end
function t.CanResetUpgrades(p1, p2, p3) --[[ CanResetUpgrades | Line: 83 ]]
	return true
end
function t.GetTotalUpgradedStats(p1) --[[ GetTotalUpgradedStats | Line: 87 ]]
	local sum = 0
	for k, v in pairs(p1.Upgrades:GetChildren()) do
		sum = sum + v.Value
	end
	return sum
end
function t.FormatUpgradeStat(p1, p2, p3) --[[ FormatUpgradeStat | Line: 95 | Upvalues: v4 (copy), t (copy), v1 (copy) ]]
	local v2 = t.GetStatUpgradeAmount(p1, p2, p3)
	if v4[p2].Multiplier then
		return v1.decimalPlace(v2 * 100, 2) .. "%"
	else
		return v1.suffix(v1.decimalPlace(v2, 2))
	end
end
function t.GetByName(p1) --[[ GetByName | Line: 106 | Upvalues: v4 (copy) ]]
	return v4[p1]
end
function t.GetUpgradeStats() --[[ GetUpgradeStats | Line: 110 | Upvalues: v4 (copy) ]]
	return v4
end
return t