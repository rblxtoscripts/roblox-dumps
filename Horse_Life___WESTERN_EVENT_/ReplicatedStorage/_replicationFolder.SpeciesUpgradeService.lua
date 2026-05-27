-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar(Sonar("StorageUtils").Get("SpeciesUpgrades"))
function t.new(p1) --[[ new | Line: 13 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.PlayerWrapper = p1
	return v2
end
function t.GetSpeciesUpgradesData(p1, p2) --[[ GetSpeciesUpgradesData | Line: 21 ]]
	return p1.PlayerWrapper.PlayerData.SpeciesUpgrades:FindFirstChild(p2)
end
function t.GetCurrentLevel(p1, p2, p3) --[[ GetCurrentLevel | Line: 25 ]]
	local v1 = p1:GetSpeciesUpgradesData(p2)
	if v1 then
		return v1[p3].Value
	else
		return 0
	end
end
function t.GetValueForLevel(p1, p2, p3, p4) --[[ GetValueForLevel | Line: 33 | Upvalues: v1 (copy) ]]
	local v12 = v1[p2]
	if not v12 then
		return nil
	end
	local v2 = v12[p3]
	if not v2 then
		return nil
	end
	for v3, v4 in v2 do
		if v4.Level == p4 then
			return v4.Value
		end
	end
	return nil
end
function t.GetCurrentValue(p1, p2, p3) --[[ GetCurrentValue | Line: 49 ]]
	return p1:GetValueForLevel(p2, p3, (p1:GetCurrentLevel(p2, p3)))
end
return t