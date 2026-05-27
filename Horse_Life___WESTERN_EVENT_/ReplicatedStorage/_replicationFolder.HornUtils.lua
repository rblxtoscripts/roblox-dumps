-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local Horns = Sonar("Constants").Horns
local v2 = Sonar("Table")
local v3 = Sonar("WeatherService")
return {
	GetRandomHorn = function(p1, p2, p3, p4) --[[ GetRandomHorn | Line: 11 | Upvalues: v3 (copy), v2 (copy), Horns (copy), v1 (copy) ]]
		local v12 = v3:GetWeather()
		if p4 then
			local v32 = v2.Copy(if p3 then p3 else Horns[p1].Horns)
			v32.Nothing = nil
			local v4 = v32
			for v5, v6 in v32 do
				if v6.WeatherWhitelist and not table.find(v6.WeatherWhitelist, v12) then
					v4[v5] = nil
				end
			end
			return v4[v1.getRandomWeightedItem(v4, p2)]
		else
			local v8 = v2.Copy(if p3 then p3 else Horns[p1].Horns)
			for v9, v10 in v8 do
				if v10.WeatherWhitelist and not table.find(v10.WeatherWhitelist, v12) then
					v8[v9] = nil
				end
			end
			return Horns[p1].Horns[v1.getRandomWeightedItem(v8, p2)]
		end
	end,
	GetHorn = function(p1, p2, p3) --[[ GetHorn | Line: 35 | Upvalues: Horns (copy) ]]
		if not p2 then
			return Horns.AllHorns.Horns[p1]
		end
		return Horns[p2].Horns[p1] or not p3 and Horns.AllHorns.Horns.Nothing
	end
}