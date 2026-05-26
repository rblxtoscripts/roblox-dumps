-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local NPCs = Sonar(Sonar("StorageUtils").Get("DynamicNPCs")).NPCs
return function(p1, p2, p3) --[[ Line: 11 | Upvalues: NPCs (copy), v1 (copy) ]]
	local v12 = NPCs[p3]
	if v12 then
		v1.getWrapperFromPlayer(p2).PlayerData.DynamicNPCs[p3].Bond.Value = v12.BondPointsForFull
		return "Complete bond for " .. p3 .. " for " .. p2.Name
	else
		return "No NPC found"
	end
end