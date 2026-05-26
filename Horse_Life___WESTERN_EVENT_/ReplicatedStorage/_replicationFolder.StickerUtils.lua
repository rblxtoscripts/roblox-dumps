-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("WeightedProbability")
local v2 = Sonar("Constants")
local v3 = Sonar("Table")
local v4 = Sonar("WeatherService")
return {
	GetRandomSticker = function(p1, p2, p3, p4) --[[ GetRandomSticker | Line: 10 | Upvalues: v2 (copy), v4 (copy), v3 (copy), v1 (copy) ]]
		local Sticker = v2.Sticker
		local v12 = v4:GetWeather()
		if p4 then
			local v32 = v3.Copy(if p3 then p3 else Sticker[p1].Sticker)
			v32.Nothing = nil
			local v42 = v32
			for v5, v6 in v32 do
				if v6.WeatherWhitelist and not table.find(v6.WeatherWhitelist, v12) then
					v42[v5] = nil
				end
			end
			return v42[v1.getRandomWeightedItem(v42, p2)]
		else
			local v8 = v3.Copy(if p3 then p3 else Sticker[p1].Sticker)
			for v9, v10 in v8 do
				if v10.WeatherWhitelist and not table.find(v10.WeatherWhitelist, v12) then
					v8[v9] = nil
				end
			end
			return Sticker[p1].Sticker[v1.getRandomWeightedItem(v8, p2)]
		end
	end,
	GetSticker = function(p1, p2, p3) --[[ GetSticker | Line: 35 | Upvalues: v2 (copy) ]]
		local Sticker = v2.Sticker
		if not p2 then
			return Sticker.AllSticker.Sticker[p1]
		end
		return Sticker[p2].Sticker[p1] or not p3 and Sticker.AllSticker.Sticker.Nothing
	end
}