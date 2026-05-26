-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local Whiskers = Sonar("Constants").Whiskers
local v2 = Sonar("Table")
local v3 = Sonar("WeatherService")
return {
	GetRandomWhisker = function(p1, p2, p3, p4) --[[ GetRandomWhisker | Line: 11 | Upvalues: v3 (copy), v2 (copy), Whiskers (copy), v1 (copy) ]]
		local v12 = v3:GetWeather()
		if p4 then
			local v32 = v2.Copy(if p3 then p3 else Whiskers[p1].Whiskers)
			v32.Nothing = nil
			local v4 = v32
			for v5, v6 in v32 do
				if v6.WeatherWhitelist and not table.find(v6.WeatherWhitelist, v12) then
					v4[v5] = nil
				end
			end
			return v4[v1.getRandomWeightedItem(v4, p2)]
		else
			local v8 = v2.Copy(if p3 then p3 else Whiskers[p1].Whiskers)
			for v9, v10 in v8 do
				if v10.WeatherWhitelist and not table.find(v10.WeatherWhitelist, v12) then
					v8[v9] = nil
				end
			end
			return Whiskers[p1].Whiskers[v1.getRandomWeightedItem(v8, p2)]
		end
	end,
	GetWhisker = function(p1, p2, p3) --[[ GetWhisker | Line: 35 | Upvalues: Whiskers (copy) ]]
		if not p2 then
			return Whiskers.AllWhiskers.Whiskers[p1]
		end
		return Whiskers[p2].Whiskers[p1] or not p3 and Whiskers.AllWhiskers.Whiskers.Nothing
	end
}