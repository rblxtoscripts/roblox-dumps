-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("BossService")
return function(p1) --[[ Line: 6 | Upvalues: v1 (copy) ]]
	if v1:KillBoss() then
		return "Boss killed!"
	else
		return "No active boss found."
	end
end