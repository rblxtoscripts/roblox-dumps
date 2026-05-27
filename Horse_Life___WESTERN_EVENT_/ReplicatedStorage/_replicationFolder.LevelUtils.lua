-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = v1 and Sonar("AnalyticsService")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("Constants")
local v5 = Sonar(v3.Get("UpgradeStats"))
local t2 = {
	Stats = function(p1, p2) --[[ Stats | Line: 19 ]]
		return math.floor(25 * p1 ^ 3 + 100 * p1)
	end
}
function t.GetRequiredExperience(p1, p2) --[[ GetRequiredExperience | Line: 24 | Upvalues: t2 (copy) ]]
	return t2[p2 or "Stats"](p1, 1)
end
function t.GetNextLevelExperience(p1, ...) --[[ GetNextLevelExperience | Line: 29 | Upvalues: t (copy) ]]
	return t.GetRequiredExperience(p1 + 1, ...)
end
function t.GetPreviousLevelExperience(p1, ...) --[[ GetPreviousLevelExperience | Line: 33 | Upvalues: t (copy) ]]
	if p1 <= 1 then
		return 0
	else
		return t.GetRequiredExperience(p1 - 1, ...)
	end
end
function t.GiveExperience(p1, p2) --[[ GiveExperience | Line: 40 | Upvalues: t (copy), v4 (copy), v1 (copy), v2 (copy) ]]
	local Slot = p2.Slot
	local Upgrades = Slot:FindFirstChild("Upgrades")
	if not Upgrades then
		return
	end
	local v12 = Upgrades[p2.Stat]
	local v22 = t.GetNextLevelExperience(v12.Value, "Stats")
	local v5 = math.min(p2.Amount * p1:GetWithModifiers({
		Default = 1,
		Name = p2.Stat .. "Experience",
		Slot = Slot
	}), v22 - v12.Experience.Value)
	local Experience = v12.Experience
	Experience.Value = Experience.Value + v5
	local v6, v7 = t.UpdateLevel(Slot, p2.Stat, v22)
	if v6 then
		p1:IncrementStat({
			Type = "HorseSkillLevelUps",
			Amount = v7
		})
		p1:IncrementMission({
			Type = "StatLevelUp",
			Amount = 1,
			Data = { p2.Stat, v12.Value, Slot.Species.Value }
		})
		if p2.Stat == "Bond" then
			p1:IncrementMission({
				Type = "BondLevelUp",
				Amount = 1,
				Data = { p2.Stat, v12.Value, Slot.Species.Value }
			})
		end
		local NewMissionsWrapper = p1.NewMissionsWrapper
		if NewMissionsWrapper then
			NewMissionsWrapper:IncrementMission("LevelAnySpeciesAnySkill", {
				Data = {}
			})
			NewMissionsWrapper:IncrementMission("LevelAnySpeciesSpecificSkill", {
				Data = { p2.Stat }
			})
			NewMissionsWrapper:IncrementMission("LevelSpecificSpeciesAnySkill", {
				Data = { Slot.Species.Value }
			})
			NewMissionsWrapper:IncrementMission("LevelSpecificSpeciesSpecificSkill", {
				Data = { Slot.Species.Value, p2.Stat }
			})
		end
		if v4.EventName then
			local EventCurrencyName = v4.EventCurrencyName
		end
		if v1 and v2 then
			v2.ReportDesignEvent(p1.Player, "HorseStatLevelUp", {
				{
					Key = "Species",
					Value = Slot.Species.Value
				},
				{
					Key = "Stat",
					Value = p2.Stat
				},
				{
					Key = "NewLevel",
					Value = v12.Value
				},
				{
					Key = "LevelDelta",
					Value = v7
				}
			}, v12.Value)
		end
	end
	return v6
end
function t.UpdateLevel(p1, p2, p3) --[[ UpdateLevel | Line: 112 | Upvalues: v5 (copy) ]]
	local v1 = p1.Upgrades[p2]
	local v2 = v1.Value
	if p3 <= v1.Experience.Value then
		v1.Value = math.min(v1.Value + 1, v5[p2].MaxLevel)
		v1.Experience.Value = p3
	end
	return v2 < v1.Value, v1.Value - v2
end
function t.GetTotalSkillLevels(p1) --[[ GetTotalSkillLevels | Line: 123 ]]
	local sum = 0
	for k, v in pairs(p1:WaitForChild("Upgrades"):GetChildren()) do
		sum = sum + v.Value
	end
	return sum
end
return t