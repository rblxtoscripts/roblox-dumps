-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("ColorUtils")
local t = {
	DarkenMultiplier = 0.78,
	WaitTime = 0.3,
	Damping = 1,
	Frequency = 2,
	Tag = nil
}
local t2 = {}
t2.__index = t2
function t2.new(p1, p2) --[[ new | Line: 18 | Upvalues: t2 (copy), t (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t2)
	v22.DarkenMultiplier = p1.DarkenMultiplier or t.DarkenMultiplier
	v22.WaitTime = p1.WaitTime or t.WaitTime
	v22.Damping = p1.Damping or t.Damping
	v22.Frequency = p1.Frequency or t.Frequency
	v22.Running = false
	v22.Entries = {}
	local v7 = p1.Instances or {}
	if p1.Tag and p1.Instance then
		for v8, v9 in p1.Instance:GetDescendants() do
			if v9:HasTag(p1.Tag) then
				table.insert(v7, v9)
			end
		end
	end
	for v10, v11 in v7 do
		local v122 = nil
		if v11:IsA("ImageLabel") or v11:IsA("ImageButton") then
			v122 = "ImageColor3"
		elseif v11:IsA("TextLabel") or (v11:IsA("TextButton") or v11:IsA("TextBox")) then
			v122 = "TextColor3"
		elseif v11:IsA("Frame") then
			v122 = "BackgroundColor3"
		elseif v11:IsA("UIStroke") then
			v122 = "Color"
		end
		if v122 then
			local v13 = v11[v122]
			table.insert(v22.Entries, {
				Instance = v11,
				ColorProperty = v122,
				OriginalColor = v13,
				DarkenedColor = v2.DarkenColor(v13, v22.DarkenMultiplier)
			})
		end
	end
	if #v22.Entries ~= 0 then
		v22.Running = true
		v22.Thread = task.spawn(function() --[[ Line: 67 | Upvalues: v22 (copy), v1 (ref) ]]
			local v12 = false
			while v22.Running do
				v12 = not v12
				for v2, v3 in v22.Entries do
					v1.target(v3.Instance, v22.Damping, v22.Frequency, {
						[v3.ColorProperty] = v12 and v3.DarkenedColor or v3.OriginalColor
					})
				end
				task.wait(v22.WaitTime)
			end
		end)
	end
	return v22
end
function t2.Destroy(p1) --[[ Destroy | Line: 82 | Upvalues: v1 (copy) ]]
	p1.Running = false
	for v12, v2 in p1.Entries do
		if v2.Instance and v2.Instance.Parent then
			v1.target(v2.Instance, p1.Damping, p1.Frequency, {
				[v2.ColorProperty] = v2.OriginalColor
			})
		end
	end
	p1.Entries = {}
end
return function(p1, p2) --[[ Line: 94 | Upvalues: t2 (copy) ]]
	return t2.new(p1, p2)
end