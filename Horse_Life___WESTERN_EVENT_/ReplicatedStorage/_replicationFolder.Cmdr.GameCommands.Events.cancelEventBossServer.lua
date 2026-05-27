-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("GlobalBossFightService")
return function(p1) --[[ Line: 6 | Upvalues: v1 (copy) ]]
	v1:CancelFight()
	return "Global boss fight cancelled across all servers!"
end