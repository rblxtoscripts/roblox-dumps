-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("WeatherService")
return function(p1, p2) --[[ Line: 6 | Upvalues: v1 (copy) ]]
	if string.lower(p2) == "clear" then
		v1:ClearWeatherOverride()
		return "Weather override cleared. Resuming normal weather cycle."
	else
		v1:SetWeatherOverride(p2)
		return "Weather override set to: " .. p2
	end
end