-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local Manes = Sonar("Constants").Manes
local v2 = Sonar("Table")
local v3 = Sonar("WeatherService")
return {
	GetRandomMane = function(p1, p2, p3) --[[ GetRandomMane | Line: 11 | Upvalues: v3 (copy), v2 (copy), Manes (copy), v1 (copy) ]]
		local v12 = v3:GetWeather()
		local v32 = v2.Copy(if p3 then p3 else Manes[p1].Manes)
		for v4, v5 in v32 do
			if v5.WeatherWhitelist and not table.find(v5.WeatherWhitelist, v12) then
				v32[v4] = nil
			end
		end
		return Manes[p1].Manes[v1.getRandomWeightedItem(v32, p2)]
	end,
	GetMane = function(p1, p2) --[[ GetMane | Line: 22 | Upvalues: Manes (copy) ]]
		if p2 then
			return Manes[p2].Manes[p1]
		else
			return Manes.AllManes.Manes[p1]
		end
	end
}