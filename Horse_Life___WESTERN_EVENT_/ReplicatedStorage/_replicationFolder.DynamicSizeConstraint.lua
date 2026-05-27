-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
function t.new(p1) --[[ new | Line: 16 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Instance = p1.Instance
	v2.Config = p1
	if not v2.Instance then
		warn("\226\154\160\239\184\143 DynamicSizeConstraint, Instance is required")
		return v2
	end
	v2.Axis = p1.Axis or "Both"
	v2.MaxHeightFraction = p1.MaxHeightFraction or 0.6
	v2.MaxWidthFraction = p1.MaxWidthFraction
	v2.MaxWidthPixels = p1.MaxWidthPixels
	v2.MaxHeightPixels = p1.MaxHeightPixels
	v2.MinHeightFraction = p1.MinHeightFraction
	v2.MinWidthFraction = p1.MinWidthFraction
	v2.Padding = p1.Padding or Vector2.zero
	v2.OnUpdated = {}
	if p1.OnUpdated then
		if type(p1.OnUpdated) == "function" then
			v2.OnUpdated = { p1.OnUpdated }
		else
			v2.OnUpdated = p1.OnUpdated
		end
	end
	local UISizeConstraint = v2.Instance:FindFirstChildOfClass("UISizeConstraint")
	if not UISizeConstraint then
		local UISizeConstraint_2 = Instance.new("UISizeConstraint")
		UISizeConstraint_2.Parent = v2.Instance
		v2.Maid:GiveTask(UISizeConstraint_2)
		UISizeConstraint = UISizeConstraint_2
	end
	v2.SizeConstraint = UISizeConstraint
	v2.ParentInstance = p1.Parent or v2.Instance.Parent
	if v2.ParentInstance then
		v2.Maid:GiveTask(v2.ParentInstance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 60 | Upvalues: v2 (copy) ]]
			v2:_update()
		end))
		v2:_update()
	else
		warn("\226\154\160\239\184\143 DynamicSizeConstraint, No parent found for", v2.Instance.Name)
	end
	return v2
end
function t._update(p1) --[[ _update | Line: 69 ]]
	local AbsoluteSize = p1.ParentInstance.AbsoluteSize
	if AbsoluteSize.X <= 0 or AbsoluteSize.Y <= 0 then
		return
	end
	local v1 = if p1.Axis == "X" then true elseif p1.Axis == "Both" then true else false
	local v2 = if p1.Axis == "Y" then true elseif p1.Axis == "Both" then true else false
	local v3 = (1 / 0)
	local v4 = if v1 and p1.MaxWidthFraction then AbsoluteSize.X * p1.MaxWidthFraction else (1 / 0)
	if v2 then
		v3 = AbsoluteSize.Y * p1.MaxHeightFraction
	end
	local v5 = v4 - p1.Padding.X
	local v6 = v3 - p1.Padding.Y
	if p1.MaxWidthPixels then
		v5 = math.min(v5, p1.MaxWidthPixels)
	end
	if p1.MaxHeightPixels then
		v6 = math.min(v6, p1.MaxHeightPixels)
	end
	local v9 = math.max(v5, 0)
	p1.SizeConstraint.MaxSize = Vector2.new(v9, (math.max(v6, 0)))
	local v11 = 0
	local v12 = if p1.MinWidthFraction then AbsoluteSize.X * p1.MinWidthFraction else 0
	if p1.MinHeightFraction then
		v11 = AbsoluteSize.Y * p1.MinHeightFraction
	end
	if v12 > 0 or v11 > 0 then
		p1.SizeConstraint.MinSize = Vector2.new(v12, v11)
	end
	for v13, v14 in p1.OnUpdated do
		v14(p1, {
			MaxSize = p1.SizeConstraint.MaxSize,
			MinSize = p1.SizeConstraint.MinSize,
			ParentSize = AbsoluteSize
		})
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 129 | Upvalues: v2 (copy) ]]
	v2(p1)
end
return t