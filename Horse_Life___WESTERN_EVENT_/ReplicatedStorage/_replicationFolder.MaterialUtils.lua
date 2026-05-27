-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local Materials = Sonar("Constants").Materials
local v2 = Sonar("Table")
local v3 = Sonar("WeatherService")
return {
	GetRandomMaterial = function(p1, p2, p3) --[[ GetRandomMaterial | Line: 11 | Upvalues: Materials (copy), v3 (copy), v2 (copy), v1 (copy) ]]
		local v12 = Materials[p2 or "Horse"]
		local v22 = Materials[p2 or "Horse"] and v12.MaterialsMapped or nil
		local v32 = v12 and v12.Materials or nil
		local v4 = v22 and (v22[p1] or v22.All) or nil
		local v5
		if v4 then
			local v6 = v3:GetWeather()
			local v7 = v2.Copy(v4)
			for v8, v9 in v7 do
				if v9.WeatherWhitelist and not table.find(v9.WeatherWhitelist, v6) then
					v7[v8] = nil
				end
			end
			v5 = v32[v1.getRandomWeightedItem(v7, p3)]
		else
			v5 = nil
		end
		return v5
	end,
	GetMaterial = function(p1, p2) --[[ GetMaterial | Line: 49 | Upvalues: Materials (copy) ]]
		if not p2 then
			return Materials.AllMaterials.Materials[p1]
		end
		local v1 = Materials[p2] and Materials[p2].Materials or nil
		return if v1 then v1[p1] or nil else nil
	end
}