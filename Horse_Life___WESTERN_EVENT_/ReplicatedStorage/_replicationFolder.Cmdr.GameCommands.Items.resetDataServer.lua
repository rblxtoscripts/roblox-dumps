-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2)
	if v12 then
		v12.PlayerData:ClearAllChildren()
		p2:Kick("Rejoin for new quests")
		return "Reset data!"
	end
end