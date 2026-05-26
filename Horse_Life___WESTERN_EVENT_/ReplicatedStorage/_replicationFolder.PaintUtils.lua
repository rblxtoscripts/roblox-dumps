-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local v2 = Sonar("Constants")
local Paints = v2.Paints
local v3 = Sonar("Table")
local v4 = Sonar("WeatherService")
return {
	GetRandomPaint = function(p1, p2, p3) --[[ GetRandomPaint | Line: 11 | Upvalues: v4 (copy), v3 (copy), Paints (copy), v2 (copy), v1 (copy) ]]
		local v12 = v4:GetWeather()
		local v32 = v3.Copy(if p3 then p3 else Paints[p1].Paints)
		for v42, v5 in v32 do
			if v5.EventName and v5.EventName ~= v2.EventName then
				v32[v42] = nil
			end
			if v5.WeatherWhitelist and not table.find(v5.WeatherWhitelist, v12) then
				v32[v42] = nil
			end
		end
		return Paints[p1].Paints[v1.getRandomWeightedItem(if v32 then v32 else Paints[p1].Paints, p2)]
	end,
	GetPaint = function(p1, p2) --[[ GetPaint | Line: 27 | Upvalues: Paints (copy) ]]
		if p2 and (Paints[p2] and Paints[p2].Paints[p1]) then
			return Paints[p2].Paints[p1]
		end
		if Paints.AllPaints.Paints[p1] and not p2 then
			return Paints.AllPaints.Paints[p1]
		else
			return nil
		end
	end
}