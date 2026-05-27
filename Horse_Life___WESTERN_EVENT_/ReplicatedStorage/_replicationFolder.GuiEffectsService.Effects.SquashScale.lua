-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("spr")
local t = {
	SquashX = 0.7,
	StretchY = 1.25,
	Damping = 0.5,
	Frequency = 8,
	DampingOut = 0.5,
	FrequencyOut = 8
}
return function(p1, p2) --[[ Line: 15 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = p1.Instance
	if not v12 then
		warn("SquashScale effect requires an Instance")
		return
	end
	local Size = v12.Size
	local v2 = p1.SquashX or t.SquashX
	local v3 = p1.StretchY or t.StretchY
	local v4 = p1.Damping or t.Damping
	local v5 = p1.Frequency or t.Frequency
	local v6 = p1.DampingOut or t.DampingOut
	local v7 = p1.FrequencyOut or t.FrequencyOut
	v1.target(v12, v4, v5, {
		Size = UDim2.new(Size.X.Scale * v2, Size.X.Offset * v2, Size.Y.Scale * v3, Size.Y.Offset * v3)
	})
	v1.completed(v12, function() --[[ Line: 39 | Upvalues: v1 (ref), v12 (copy), v6 (copy), v4 (copy), v7 (copy), v5 (copy), Size (copy) ]]
		v1.target(v12, v6 or v4, v7 or v5, {
			Size = Size
		})
	end)
	return function() --[[ Line: 43 | Upvalues: v1 (ref), v12 (copy), Size (copy) ]]
		v1.stop(v12, "Size")
		v12.Size = Size
	end
end