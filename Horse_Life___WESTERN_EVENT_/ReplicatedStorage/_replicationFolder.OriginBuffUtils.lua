-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("WeightedProbability")
local OriginBuffs = v1.OriginBuffs
local t = {}
for v3, v4 in v1.OriginBuffs do
	for v5, v6 in v4 do
		v6.Name = v5
		v6.Origin = v3
		t[v5] = v6
	end
end
return {
	Types = t,
	GetType = function(p1) --[[ Line: 22 | Upvalues: t (copy) ]]
		return t[p1]
	end,
	GetRandomType = function(p1, p2) --[[ Line: 26 | Upvalues: v2 (copy), OriginBuffs (copy) ]]
		return v2.getRandomWeightedItem(OriginBuffs[p1], p2)
	end
}