-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("PlayerWrapper")
return function(p1, p2, p3) --[[ Line: 8 | Upvalues: v1 (copy) ]]
	local ExtraStorageSlots = v1.getWrapperFromPlayer(p2).PlayerData.ExtraStorageSlots
	ExtraStorageSlots.Value = ExtraStorageSlots.Value + p3
end