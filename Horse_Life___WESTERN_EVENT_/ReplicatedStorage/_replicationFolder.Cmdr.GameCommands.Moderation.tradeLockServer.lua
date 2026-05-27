-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("TradeLockService")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	if v1.Lock(tostring(p2), -1, false) then
		return ("Successfully tradelocked user (%*)"):format(p2)
	else
		return ("Failed to tradelock user (%*)"):format(p2)
	end
end