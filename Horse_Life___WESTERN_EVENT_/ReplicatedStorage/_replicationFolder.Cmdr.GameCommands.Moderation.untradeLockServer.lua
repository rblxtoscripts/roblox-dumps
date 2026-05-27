-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("TradeLockService")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	if v1.Unlock(tostring(p2), false) then
		return ("Successfully un-tradelocked user (%*)"):format(p2)
	else
		return ("Failed to un-tradelock user (%*)"):format(p2)
	end
end