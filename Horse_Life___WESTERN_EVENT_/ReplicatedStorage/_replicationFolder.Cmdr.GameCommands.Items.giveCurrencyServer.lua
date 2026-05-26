-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("ItemDataService")
return function(p1, p2, p3, p4) --[[ Line: 9 | Upvalues: v2 (copy), v1 (copy) ]]
	local v12 = v2.GetByName(p3)
	if v12 then
		v1.getWrapperFromPlayer(p2):GiveItem({
			Source = "AdminCommands",
			ApplyModifiers = true,
			ItemType = v12.ItemType,
			Name = p3,
			Amount = p4
		})
		return "Gave " .. p2.Name .. " " .. p4 .. " " .. p3
	end
end