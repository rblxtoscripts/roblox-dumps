-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
function t.new(p1) --[[ new | Line: 33 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	v2.BoundingInstance = p1.BoundingInstance
	v2.Padding = p1.Padding
	if not v2.Instance then
		warn("\226\154\160\239\184\143 AutomaticFrameSize, Instance is required", p1)
		return v2
	end
	if not v2.BoundingInstance then
		warn("\226\154\160\239\184\143 AutomaticFrameSize, BoundingInstance is required", p1)
		return v2
	end
	if not v2.Instance:IsA("GuiObject") then
		warn("\226\154\160\239\184\143 AutomaticFrameSize, Instance must be a GuiObject", v2.Instance)
		return v2
	end
	if v2.BoundingInstance:IsA("GuiObject") then
		v2:_updateSize()
		v2.Maid:GiveTask(v2.BoundingInstance:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 64 | Upvalues: v2 (copy) ]]
			v2:_updateSize()
		end))
	else
		warn("\226\154\160\239\184\143 AutomaticFrameSize, BoundingInstance must be a GuiObject", v2.BoundingInstance)
	end
	return v2
end
function t._updateSize(p1) --[[ _updateSize | Line: 72 ]]
	if not (p1.Instance and p1.BoundingInstance) then
		return
	end
	local AbsoluteSize = p1.BoundingInstance.AbsoluteSize
	if p1.Config.CanResize and not p1.Config.CanResize(p1, p1.Instance) then
		return
	end
	if not p1.Padding then
		p1.Instance.Size = UDim2.fromOffset(AbsoluteSize.X, AbsoluteSize.Y)
		return
	end
	local v1 = p1.Instance.Parent
	if not (v1 and v1:IsA("GuiObject")) then
		warn("\226\154\160\239\184\143 AutomaticFrameSize, Instance must have a GuiObject parent when Padding is used", p1.Instance)
		return
	end
	local AbsoluteSize_2 = v1.AbsoluteSize
	local v4, v5
	if type(p1.Padding) == "number" then
		local v7 = p1.Padding * math.max(AbsoluteSize_2.X, AbsoluteSize_2.Y)
		v4 = v7 / AbsoluteSize_2.X
		v5 = v7 / AbsoluteSize_2.Y
	else
		local v8 = math.max(AbsoluteSize_2.X, AbsoluteSize_2.Y)
		v4 = p1.Padding.X.Scale * v8 / AbsoluteSize_2.X
		v5 = p1.Padding.Y.Scale * v8 / AbsoluteSize_2.Y
	end
	local Size = p1.Instance.Size
	p1.Instance.Size = UDim2.new(if v4 == 0 then Size.X.Scale else AbsoluteSize.X / AbsoluteSize_2.X + v4, 0, if v5 == 0 then Size.Y.Scale else AbsoluteSize.Y / AbsoluteSize_2.Y + v5, 0)
end
function t.Destroy(p1) --[[ Destroy | Line: 134 | Upvalues: v2 (copy) ]]
	v2(p1)
end
return t