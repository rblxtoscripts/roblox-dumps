-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2)
	if not v12 then
		return
	end
	local count = 0
	for v2, v3 in v12.PlayerData.Animals:GetChildren() do
		if v3.Species.Value == "Wild" then
			v3:Destroy()
			count = count + 1
		end
	end
	return "Fixed " .. count .. " honses"
end