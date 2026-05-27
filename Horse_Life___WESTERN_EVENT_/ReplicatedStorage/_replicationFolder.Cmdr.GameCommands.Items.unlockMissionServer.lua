-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2, p3) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	v1.getWrapperFromPlayer(p2).PlayerData.Missions.SpeciesUnlocks[p3].Completed.Value = true
	return "Unlocked " .. p3 .. " for " .. p2.Name
end