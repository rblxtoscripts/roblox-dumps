-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local CurrentCamera = workspace.CurrentCamera
function t.new(p1) --[[ new | Line: 28 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Instance = p1.Instance
	v2.Config = p1
	v2.Layout = (v2.Instance:IsA("UIGridLayout") or v2.Instance:IsA("UIListLayout")) and v2.Instance or v2.Instance.Parent
	v2.Frame = v2.Layout.Parent
	if v2.Frame:IsA("ScrollingFrame") then
		v2.Maid:GiveTask(v2.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 39 | Upvalues: v2 (copy) ]]
			v2:_updateCanvasSize()
		end))
		v2:_updateCanvasSize()
	end
	v2.Maid:GiveTask(task.defer(function() --[[ Line: 45 | Upvalues: v2 (copy) ]]
		v2:_applyConstraint(v2.Layout, v2.Frame)
	end))
	return v2
end
function t._getPaddingValues(p1) --[[ _getPaddingValues | Line: 55 ]]
	local t = {
		Bottom = UDim2.new(0, 0),
		Left = UDim2.new(0, 0),
		Right = UDim2.new(0, 0),
		Top = UDim2.new(0, 0)
	}
	local Padding = p1.Config.Padding
	if Padding then
		t.Bottom = Padding
		t.Left = Padding
		t.Right = Padding
		t.Top = Padding
	end
	return t
end
function t._updateCanvasSize(p1) --[[ _updateCanvasSize | Line: 77 ]]
	local v1 = p1:_getPaddingValues()
	local AbsoluteSize = p1.Frame.AbsoluteSize
	p1.Frame.CanvasSize = UDim2.fromOffset(p1.Layout.AbsoluteContentSize.X + (v1.Left.X.Scale * AbsoluteSize.X + v1.Left.X.Offset + (v1.Right.X.Scale * AbsoluteSize.X + v1.Right.X.Offset)), p1.Layout.AbsoluteContentSize.Y + (v1.Top.Y.Scale * AbsoluteSize.Y + v1.Top.Y.Offset + (v1.Bottom.Y.Scale * AbsoluteSize.Y + v1.Bottom.Y.Offset)))
end
function t._toOffset(p1, p2, p3) --[[ _toOffset | Line: 97 ]]
	return p2.Scale * p3 + p2.Offset
end
function t._absoluteSizeFromUDim2(p1, p2, p3) --[[ _absoluteSizeFromUDim2 | Line: 106 ]]
	return Vector2.new(p1:_toOffset(p2.X, p3.X), p1:_toOffset(p2.Y, p3.Y))
end
function t._addConstraint(p1, p2, p3) --[[ _addConstraint | Line: 117 ]] end
function t._applyConstraint(p1, p2, p3) --[[ _applyConstraint | Line: 145 | Upvalues: CurrentCamera (copy) ]]
	local v1 = if typeof(p2) == "Instance" then p2.ClassName else false
	assert(if v1 == "UIGridLayout" then true else v1 == "UIListLayout", "\226\154\160\239\184\143 ScrollLayoutScale, Invalid layout type: expected UIGridLayout or UIListLayout, got " .. p2:GetFullName())
	local v4 = if p3 then p3 else p1.Frame
	local v5 = if v4:IsA("GuiObject") then v4.AbsoluteSize elseif typeof(p3) == "Vector2" then p3 else CurrentCamera.ViewportSize
	if p2.ClassName == "UIGridLayout" then
		if p2:FindFirstChildOfClass("UIAspectRatioConstraint") or p2:FindFirstChild("UIAspectRatioConstraint") then
			return
		end
		p1:_addConstraint(p2, p1:_absoluteSizeFromUDim2(p2.CellSize, v5))
	else
		p1.Maid:GiveTask(p1.Frame.ChildAdded:Connect(function(p12) --[[ Line: 170 | Upvalues: p1 (copy), v5 (ref) ]]
			if p12:FindFirstChildOfClass("UIAspectRatioConstraint") then
				return
			end
			if p12:IsA("GuiObject") then
				p1:_addConstraint(p12, p1:_absoluteSizeFromUDim2(p12.Size, v5))
			end
		end))
		for i, v in ipairs(v4:GetChildren()) do
			if v:IsA("GuiObject") and not v:FindFirstChildOfClass("UIAspectRatioConstraint") then
				p1:_addConstraint(v, p1:_absoluteSizeFromUDim2(v.Size, v5))
			end
		end
	end
end
function t.ForceUpdateContentSize(p1) --[[ ForceUpdateContentSize | Line: 194 ]]
	p1.Layout.Parent = nil
	task.wait()
	p1.Layout.Parent = p1.Frame
end
function t.Destroy(p1) --[[ Destroy | Line: 201 | Upvalues: v2 (copy) ]]
	v2(p1)
end
return t