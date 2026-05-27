-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2, p3, p4, p5) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	v1.getWrapperFromPlayer(p2):IncrementMission({
		Type = p3,
		Amount = p4,
		Data = { p5 }
	})
	return true, "Incremented mission " .. p3 .. " by " .. p4 .. " for " .. p2.Name
end