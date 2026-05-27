-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("Limited")
return function(p1, p2, p3) --[[ Line: 6 | Upvalues: v1 (copy) ]]
	local v12, v2 = v1:AddStock(p2, p3)
	if v12 then
		return "Added " .. p3 .. " stock to " .. p2 .. ". Total adjustment: " .. v2
	else
		return "Failed to adjust stock for " .. p2
	end
end