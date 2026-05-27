-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("StableClubsManager")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	v1.AddUniqueName(p2)
	return true, "Restricted club name: " .. p2
end