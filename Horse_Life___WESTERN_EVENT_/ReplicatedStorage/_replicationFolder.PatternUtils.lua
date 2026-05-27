-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local v2 = Sonar("Constants")
local v3 = Sonar("Table")
local v4 = Sonar("WeatherService")
local Patterns = v2.Patterns
return {
	GetRandomPattern = function(p1, p2, p3) --[[ GetRandomPattern | Line: 11 | Upvalues: v4 (copy), v3 (copy), Patterns (copy), v2 (copy), v1 (copy) ]]
		local v12 = v4:GetWeather()
		local v32 = v3.Copy(if p3 then p3 else Patterns[p1].Patterns)
		for v42, v5 in v32 do
			if v5.EventName and v5.EventName ~= v2.EventName then
				v32[v42] = nil
			end
			if v5.WeatherWhitelist and not table.find(v5.WeatherWhitelist, v12) then
				v32[v42] = nil
			end
		end
		return Patterns[p1].Patterns[v1.getRandomWeightedItem(if v32 then v32 else Patterns[p1].Patterns, p2)]
	end,
	GetPattern = function(p1, p2) --[[ GetPattern | Line: 27 | Upvalues: Patterns (copy) ]]
		if p2 and (Patterns[p2] and Patterns[p2].Patterns[p1]) then
			return Patterns[p2].Patterns[p1]
		end
		if Patterns.AllPatterns.Patterns[p1] and not p2 then
			return Patterns.AllPatterns.Patterns[p1]
		end
	end
}