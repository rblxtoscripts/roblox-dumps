-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("MutationUtils")
local v2 = Sonar("FormatString")
local v3 = Sonar("MathUtils")
local t = {
	FlySprintMultiplier = {
		Name = "Fly Sprint Speed",
		Value = function(p1) --[[ Value | Line: 12 | Upvalues: v3 (copy) ]]
			return "x" .. string.format("%.3f", (v3.roundUp(p1, 0.01)))
		end,
		Difference = function(p1) --[[ Difference | Line: 15 | Upvalues: v3 (copy) ]]
			return string.format("%.3f", (v3.roundUp(p1, 0.01)))
		end
	}
}
local t2 = {
	Wings = {
		Level = 1,
		Description = "Upgrade your wings to Level 2 to be able to fly!",
		UpgradeDescription = "Unlock the ability to use your wings and fly!"
	}
}
return {
	GetUnlockCondition = function(p1, p2) --[[ GetUnlockCondition | Line: 31 | Upvalues: t2 (copy) ]]
		local v1 = t2[p2]
		if not v1 then
			return
		end
		if v1.Level and p1.Level.Value ~= v1.Level then
			return
		end
		return v1
	end,
	GetValue = function(p1, p2, p3) --[[ GetValue | Line: 39 | Upvalues: v1 (copy), v3 (copy) ]]
		return p1 * v3.map((if p3 then p3 else p2.Level.Value) / (v1.GetMutation(p2.Value).MaxLevel or 1), 0, 1, 0, 1, true)
	end,
	FormatStat = function(p1, p2) --[[ FormatStat | Line: 48 | Upvalues: t (copy), v2 (copy), v3 (copy) ]]
		local v1 = t[p1] or {}
		return v1.Name or v2.separateWordsInString(p1), v1.Value and v1.Value(p2) or string.format("%.2f", (v3.roundUp(p2, 0.1)))
	end,
	FormatStatDifference = function(p1, p2) --[[ FormatStatDifference | Line: 55 | Upvalues: t (copy), v3 (copy) ]]
		local v1 = t[p1] or {}
		return v1.Difference and v1.Difference(p2) or string.format("%.2f", (v3.roundUp(p2, 0.1)))
	end
}