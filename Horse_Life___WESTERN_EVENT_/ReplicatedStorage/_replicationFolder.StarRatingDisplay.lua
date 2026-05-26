-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("FormatNumber")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("EventUtils")
local v5 = Sonar("Maid")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 39 | Upvalues: t (copy), v5 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v5.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 StarRatingDisplay, Instance is required for star rating display")
		return v2
	end
	v2.Increment = v2.Config.Increment or 0.5
	if v2.Config.Changed then
		v2.Changed = v4.getConnectionEvents(v2.Config.Changed)
		for v3, v42 in v2.Changed do
			v2.Maid:GiveTask(v42:Connect(function() --[[ Line: 55 | Upvalues: v2 (copy) ]]
				v2:Update()
			end))
		end
	end
	v2:Update()
	return v2
end
function t.Update(p1) --[[ Update | Line: 65 | Upvalues: v1 (copy) ]]
	local v12 = p1:GetStars()
	for v2, v3 in p1.Instance:GetChildren() do
		local v5 = tonumber(v3.Name)
		local v6 = v1.FindElement(v3, "UIGradient")
		if v5 then
			local v7 = math.clamp(v12 - v5 + 1, 0, 1)
			if v7 == 0 then
				v6.Enabled = true
				v6.Transparency = NumberSequence.new(0)
				continue
			end
			if v7 == 1 then
				v6.Enabled = false
				continue
			end
			v6.Enabled = true
			v6.Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(v7, 1),
				NumberSequenceKeypoint.new(v7, 0),
				NumberSequenceKeypoint.new(1, 0)
			})
		end
	end
end
function t.GetStars(p1) --[[ GetStars | Line: 93 | Upvalues: v2 (copy) ]]
	return v2.roundToNearestMultiple(p1:_getStars(), p1.Increment)
end
function t._getStars(p1) --[[ _getStars | Line: 98 ]]
	if typeof(p1.Config.Get) == "number" then
		return p1.Config.Get
	end
	if typeof(p1.Config.Get) == "function" then
		return p1.Config.Get(p1)
	else
		warn("\226\154\160\239\184\143 StarRatingDisplay, Get is not a number or function")
		return -1
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 109 | Upvalues: v3 (copy) ]]
	v3(p1)
end
return t