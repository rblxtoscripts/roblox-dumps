-- https://lua.expert/
local t = {}
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("Color3")
local Colors = Sonar("Constants").Colors
function t.GetColor(p1) --[[ GetColor | Line: 12 | Upvalues: Colors (copy) ]]
	return Colors.MappedColors[p1]
end
function t.DarkenColor(p1, p2) --[[ DarkenColor | Line: 17 | Upvalues: v1 (copy) ]]
	local v12 = p2 or 0.8
	return v1.new(p1.R * v12, p1.G * v12, p1.B * v12)
end
function t.GetRandomColor(p1) --[[ GetRandomColor | Line: 23 | Upvalues: Colors (copy) ]]
	return Colors.ColorData[(p1 and Random.new(p1) or Random.new()):NextInteger(1, #Colors.ColorData)]
end
return t