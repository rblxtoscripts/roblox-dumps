-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("spr")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local t = {
	ImageLabel = { "ImageTransparency", "BackgroundTransparency" },
	Frame = { "BackgroundTransparency" },
	TextLabel = { "TextTransparency" },
	UIStroke = { "Transparency" }
}
local t2 = {
	ImageLabel = {
		ImageTransparency = 1,
		BackgroundTransparency = 1
	},
	Frame = {
		BackgroundTransparency = 1
	},
	TextLabel = {
		TextTransparency = 1
	},
	UIStroke = {
		Transparency = 1
	}
}
local t3 = {}
t3.__index = t3
function t3.new(p1, p2) --[[ new | Line: 25 | Upvalues: t3 (copy), v2 (copy), t (copy), t2 (copy) ]]
	local v1 = p1.Instance
	if not v1 then
		return
	end
	local v3 = setmetatable({}, t3)
	v3.Maid = v2.new()
	v3.Config = p1
	v3.GuiEffectsService = p2
	v3.Instance = v1
	v3.Damping = p1.Damping or 1
	v3.Frequency = p1.Frequency or 1.6
	v3.FadeOutDamping = p1.FadeOutDamping or v3.Damping
	v3.FadeOutFrequency = p1.FadeOutFrequency or v3.Frequency
	local v6 = p1.Properties or table.clone(t)
	local v7 = p1.HiddenProperties or table.clone(t2)
	if p1.Exclude then
		v7.Exclude = p1.Exclude
	end
	local t4 = {}
	local t5 = {}
	if p1.Exclude then
		for v8, v9 in p1.Exclude do
			t5[v9] = true
		end
	end
	for v10, v11 in { v1, unpack(v1:GetDescendants()) } do
		if not (t5[v11] or t5[v11.Parent]) then
			local v12 = v6[v11.ClassName]
			if v12 then
				t4[v11] = p2.GetProperties(v11, v12)
			end
		end
	end
	v3.PropertiesIn = t4
	v3.PropertiesOut = p2.SetPropertiesOfDescendants(v1, v7)
	if p1.OffsetPosition then
		local v14 = p2.FindElement(v1, p1.OffsetTarget or "AnimateDownFrame") or v1
		v3.OffsetFrame = v14
		v3.TargetPosition = p1.TargetPosition or v14.Position
		v3.OffsetPosition = p1.OffsetPosition
		v3.OffsetDamping = p1.OffsetDamping or 0.65
		v3.OffsetFrequency = p1.OffsetFrequency or 1.5
		v14.Position = p1.OffsetPosition
	end
	if p1.StartScale ~= nil then
		local v16 = v1:FindFirstChildWhichIsA("UIScale")
		if not v16 then
			local UIScale = Instance.new("UIScale")
			UIScale.Parent = v1
			v3.Maid:GiveTask(UIScale)
			v16 = UIScale
		end
		v3.UIScale = v16
		v3.StartScale = p1.StartScale
		v3.TargetScale = p1.TargetScale or 1
		v3.ScaleDamping = p1.ScaleDamping or v3.Damping
		v3.ScaleFrequency = p1.ScaleFrequency or v3.Frequency
		v16.Scale = v3.StartScale
	end
	if p1.PlayOnInit ~= false then
		v3:FadeIn()
	end
	return v3
end
function t3.FadeIn(p1, p2) --[[ FadeIn | Line: 103 | Upvalues: v1 (copy) ]]
	local v12 = if p2 then p2 else {}
	local v2 = v12.Damping or p1.Damping
	local v3 = v12.Frequency or p1.Frequency
	for v5, v6 in p1.PropertiesIn do
		v1.target(v5, v2, v3, v6)
	end
	if p1.OffsetFrame and not v12.IgnoreOffset then
		v1.target(p1.OffsetFrame, p1.OffsetDamping, p1.OffsetFrequency, {
			Position = p1.TargetPosition
		})
	end
	if not p1.UIScale then
		return
	end
	v1.target(p1.UIScale, p1.ScaleDamping, p1.ScaleFrequency, {
		Scale = p1.TargetScale
	})
end
function t3.FadeOut(p1, p2) --[[ FadeOut | Line: 121 | Upvalues: v1 (copy) ]]
	local v12 = if p2 then p2 else {}
	local v2 = v12.Damping or p1.FadeOutDamping
	local v3 = v12.Frequency or p1.FadeOutFrequency
	local v4 = v12
	for v5, v6 in p1.PropertiesOut do
		v1.target(v5, v2, v3, v6)
	end
	if p1.OffsetFrame and (p1.OffsetPosition and not v4.IgnoreOffset) then
		local t = {}
		t.Position = v4.TargetPosition or p1.OffsetPosition
		v1.target(p1.OffsetFrame, p1.OffsetDamping, p1.OffsetFrequency, t)
	end
	if not p1.UIScale then
		return
	end
	local t = {}
	t.Scale = v4.TargetScale or p1.StartScale
	v1.target(p1.UIScale, p1.ScaleDamping, p1.ScaleFrequency, t)
end
function t3.Destroy(p1) --[[ Destroy | Line: 139 | Upvalues: v1 (copy), v3 (copy) ]]
	for v12 in p1.PropertiesIn do
		v1.stop(v12)
	end
	if p1.UIScale then
		v1.stop(p1.UIScale)
	end
	v3(p1)
end
return function(p1, p2) --[[ Line: 151 | Upvalues: t3 (copy) ]]
	return t3.new(p1, p2)
end