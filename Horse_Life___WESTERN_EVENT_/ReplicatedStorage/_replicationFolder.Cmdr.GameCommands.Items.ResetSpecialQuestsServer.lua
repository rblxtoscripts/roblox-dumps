-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2)
	if not v12 then
		return
	end
	local count = 0
	for v2, v3 in v12.PlayerData.Missions.Knox:GetChildren() do
		v3:Destroy()
		count = count + 1
	end
	for v4, v5 in v12.PlayerData.Minimites:GetChildren() do
		v5.Value = false
	end
	p2:Kick("Rejoin for new quests")
	return "Reset " .. count .. " Quests"
end