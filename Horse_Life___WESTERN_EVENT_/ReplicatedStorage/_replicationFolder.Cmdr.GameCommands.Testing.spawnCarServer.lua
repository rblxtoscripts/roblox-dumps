-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("CarService")
return function(p1) --[[ Line: 6 | Upvalues: v1 (copy) ]]
	if v1.SpawnCar(p1.Executor) then
		return "Car spawned!"
	else
		return "Failed to spawn car. Make sure you\'re not on a horse and not on cooldown."
	end
end