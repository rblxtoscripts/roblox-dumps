-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local Tails = Sonar("Constants").Tails
local v2 = Sonar("Table")
local v3 = Sonar("WeatherService")
return {
	GetRandomTail = function(p1, p2, p3) --[[ GetRandomTail | Line: 11 | Upvalues: v3 (copy), v2 (copy), Tails (copy), v1 (copy) ]]
		local v12 = v3:GetWeather()
		local v32 = v2.Copy(if p3 then p3 else Tails[p1].Tails)
		for v4, v5 in v32 do
			if v5.WeatherWhitelist and not table.find(v5.WeatherWhitelist, v12) then
				v32[v4] = nil
			end
		end
		return Tails[p1].Tails[v1.getRandomWeightedItem(v32, p2)]
	end,
	GetTail = function(p1, p2) --[[ GetTail | Line: 22 | Upvalues: Tails (copy) ]]
		if p2 then
			return Tails[p2].Tails[p1]
		else
			return Tails.AllTails.Tails[p1]
		end
	end
}