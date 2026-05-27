-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local v2 = Sonar("Constants")
local v3 = Sonar("Table")
local v4 = Sonar("WeatherService")
local Cosmetics = v2.Cosmetics
return {
	GetRandomCosmetic = function(p1, p2, p3) --[[ GetRandomCosmetic | Line: 11 | Upvalues: v4 (copy), v3 (copy), Cosmetics (copy), v2 (copy), v1 (copy) ]]
		local v12 = v4:GetWeather()
		local v32 = v3.Copy(if p3 then p3 else Cosmetics[p1].Cosmetics)
		for v42, v5 in v32 do
			if v5.EventName and v5.EventName ~= v2.EventName then
				v32[v42] = nil
			end
			if v5.WeatherWhitelist and not table.find(v5.WeatherWhitelist, v12) then
				v32[v42] = nil
			end
		end
		return Cosmetics[p1].Cosmetics[v1.getRandomWeightedItem(if v32 then v32 else Cosmetics[p1].Cosmetics, p2)]
	end,
	GetCosmetic = function(p1, p2) --[[ GetCosmetic | Line: 26 | Upvalues: Cosmetics (copy) ]]
		if p2 and (Cosmetics[p2] and Cosmetics[p2].Cosmetics[p1]) then
			return Cosmetics[p2].Cosmetics[p1]
		end
		if Cosmetics.AllCosmetics.Cosmetics[p1] and not p2 then
			return Cosmetics.AllCosmetics.Cosmetics[p1]
		else
			return nil
		end
	end
}