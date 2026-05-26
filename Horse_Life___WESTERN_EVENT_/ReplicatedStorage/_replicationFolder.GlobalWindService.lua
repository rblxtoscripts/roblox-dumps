-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("MathUtils")
local t = {}
local t2 = {
	Fog = {
		Min = 0,
		Max = 0,
		Frequency = 0,
		BumpAmplitude = 0,
		BumpFrequency = 0
	},
	Rain = {
		Min = 6,
		Max = 10,
		Frequency = 0.5,
		BumpAmplitude = 1.5,
		BumpFrequency = 2
	},
	["Clear Skies"] = {
		Min = 2.5,
		Max = 7,
		Frequency = 0.5,
		BumpAmplitude = 1,
		BumpFrequency = 2
	},
	Thunderstorm = {
		Min = 7.5,
		Max = 20,
		Frequency = 1,
		BumpAmplitude = 1.5,
		BumpFrequency = 3.5
	},
	["Wind Storm"] = {
		Min = 15,
		Max = 30,
		Frequency = 5,
		BumpAmplitude = 8,
		BumpFrequency = 1
	}
}
local v2 = t2["Clear Skies"]
local function updateInfo() --[[ updateInfo | Line: 49 | Upvalues: v2 (ref), t2 (copy) ]]
	v2 = t2[game.Lighting:GetAttribute("Weather")] or t2["Clear Skies"]
	return v2
end
v2 = t2[game.Lighting:GetAttribute("Weather")] or t2["Clear Skies"]
function getNumber() --[[ getNumber | Line: 56 | Upvalues: v2 (ref) ]]
	local v22 = (math.sin(os.clock() * v2.Frequency) + 1) / 2 * (v2.Max - v2.Min) + v2.Min
	return v22 + math.sin(os.clock() * v2.BumpFrequency) * v2.BumpAmplitude
end
local v4 = nil
local v5 = nil
function t.SetWindOverride(p1, p2, p3) --[[ SetWindOverride | Line: 74 | Upvalues: v4 (ref), v5 (ref) ]]
	v4 = p2
	v5 = p3
end
local v6 = 0
local v7 = 0
local v8 = Vector3.new(0, 0, 0)
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 82 | Upvalues: v6 (ref), v7 (ref), v4 (ref), v5 (ref), v8 (ref), v1 (copy) ]]
	v6 = v6 + 0.001
	v7 = v7 + math.random() * 0.1
	local v12 = getNumber()
	local v62 = Vector3.new(math.sin(v6 % 360), 0, (math.cos(v6 % 360))) * v12
	local v9 = v8:lerp(v4 and v4.Unit * (v5 or v62.Magnitude) * 2 or v62, 0.1)
	if not v1.IsNAN(v9) then
		workspace.GlobalWind = v9
		v8 = v9
	end
end)
game.Lighting:GetAttributeChangedSignal("Weather"):Connect(updateInfo)
return t