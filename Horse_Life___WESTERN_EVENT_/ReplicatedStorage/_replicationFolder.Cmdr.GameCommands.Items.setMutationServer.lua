-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("DataUtils")
local v2 = Sonar(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2, p3) --[[ Line: 11 | Upvalues: v2 (copy), v1 (copy) ]]
	local v12 = v2.getWrapperFromPlayer(p2):GetCurrentAnimal()
	if v12 then
		local SlotValue = v12.SlotValue
		local v22 = v1.CreateDataValueFromType("Mutations")
		v22.Name = v1.getIndexOfValue(SlotValue.Mutations)
		v22.Value = p3
		v22.Level.Value = 1
		v22.Parent = SlotValue.Mutations
		return "Gave " .. SlotValue.CustomName.Value .. " max levels and age"
	else
		return "Not currently riding a horse, cannot use command"
	end
end