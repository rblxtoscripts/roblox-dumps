-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("spr")
local t = {
	TransparencyDamping = 1,
	TransparencyFrequency = 2,
	ThicknessDamping = 1,
	ThicknessMultiple = 2,
	Color = nil,
	WaitTime = 0.75,
	PulseAmount = nil
}
return function(p1, p2) --[[ Line: 16 | Upvalues: t (copy), v1 (copy) ]]
	local v12 = p2.FindElement(p1.Instance, "PulseStroke")
	if not v12 then
		return
	end
	local v2 = p1.TransparencyDamping or t.TransparencyDamping
	local v3 = p1.TransparencyFrequency or t.TransparencyFrequency
	local v4 = p1.ThicknessDamping or t.ThicknessDamping
	local v5 = p1.ThicknessFrequency or v3 - 0.2
	local v6 = p1.ThicknessMultiple or t.ThicknessMultiple
	local v7 = p1.Color or t.Color
	local v8 = p1.WaitTime or t.WaitTime
	local v9 = p1.PulseAmount or t.PulseAmount
	local function RunPulse() --[[ RunPulse | Line: 31 | Upvalues: v12 (copy), v6 (copy), v7 (copy), v1 (ref), v2 (copy), v3 (copy), v4 (copy), v5 (copy) ]]
		local v13 = v12:Clone()
		local v22 = v13.Thickness * v6
		v13.Thickness = 0
		v13.Enabled = true
		if v7 then
			v13.Color = v7
		end
		v13.Parent = v12.Parent
		v1.target(v13, v2, v3, {
			Transparency = 1
		})
		v1.target(v13, v4, v5, {
			Thickness = v22
		})
		v1.completed(v13, function() --[[ Line: 44 | Upvalues: v13 (copy) ]]
			v13:Destroy()
		end)
	end
	return task.spawn(function() --[[ Line: 49 | Upvalues: v9 (copy), RunPulse (copy), v8 (copy) ]]
		if v9 then
			for i = 1, v9 do
				RunPulse()
				if i < v9 then
					task.wait(v8)
				end
			end
			return
		end
		while true do
			RunPulse()
			task.wait(v8)
		end
	end)
end