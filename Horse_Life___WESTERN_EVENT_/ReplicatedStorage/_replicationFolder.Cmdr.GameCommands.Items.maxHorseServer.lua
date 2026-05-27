-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local v12 = v1.getWrapperFromPlayer(p2):GetCurrentAnimal()
	if not v12 then
		return "Not currently riding a horse, cannot use command"
	end
	local SlotValue = v12.SlotValue
	for v2, v3 in SlotValue.Upgrades:GetChildren() do
		v3.Value = 20
	end
	SlotValue.Age.Value = 100
	SlotValue.Serial.Value = SlotValue.Serial.Value .. ":AdminGrant"
	return "Gave " .. SlotValue.CustomName.Value .. " max levels and age"
end