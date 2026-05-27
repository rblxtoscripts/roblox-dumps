-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	v1.getWrapperFromPlayer(p2).PlayerData.ExtraSpeciesUnlocks.Pastrequine.Value = true
	return "Unlocked"
end