-- https://lua.expert/
local CurrentCamera = workspace.CurrentCamera
local function toOffset(p1, p2) --[[ toOffset | Line: 16 ]]
	return p1.Scale * p2 + p1.Offset
end
local function absoluteSizeFromUDim2(p1, p2) --[[ absoluteSizeFromUDim2 | Line: 20 ]]
	local v1 = Vector2.new
	local X = p1.X
	local Y = p1.Y
	return v1(X.Scale * p2.X + X.Offset, Y.Scale * p2.Y + Y.Offset)
end
local function addConstraint(p1, p2) --[[ addConstraint | Line: 27 ]]
	local v1 = p1:FindFirstChildOfClass("UIAspectRatioConstraint") or Instance.new("UIAspectRatioConstraint")
	v1.AspectRatio = p2.X / p2.Y
	v1.Parent = p1
end
return function(p1, p2) --[[ Line: 44 | Upvalues: CurrentCamera (copy) ]]
	local v1 = if typeof(p1) == "Instance" then p1.ClassName else false
	assert(if v1 == "UIGridLayout" then true elseif v1 == "UIListLayout" then true else false, ("bad argument #%d to \'LayoutUtil\' (%s expected, got %s)"):format(1, "UIGridLayout or UIListLayout", v1))
	local v3 = if p2 then p2 else p1.Parent
	local v4 = if v3:IsA("GuiObject") then v3.AbsoluteSize elseif typeof(p2) == "Vector2" then p2 else CurrentCamera.ViewportSize
	if p1.ClassName == "UIGridLayout" then
		if p1:FindFirstChildOfClass("UIAspectRatioConstraint") then
			return
		end
		local CellSize = p1.CellSize
		local v5 = Vector2.new
		local X = CellSize.X
		local Y = CellSize.Y
		local v7 = v5(X.Scale * v4.X + X.Offset, Y.Scale * v4.Y + Y.Offset)
		local v8 = p1:FindFirstChildOfClass("UIAspectRatioConstraint") or Instance.new("UIAspectRatioConstraint")
		v8.AspectRatio = v7.X / v7.Y
		v8.Parent = p1
	else
		for i, v in ipairs(v3:GetChildren()) do
			if v:IsA("GuiObject") and not v:FindFirstChildOfClass("UIAspectRatioConstraint") then
				local Size = v.Size
				local v9 = Vector2.new
				local X = Size.X
				local Y = Size.Y
				local v11 = v9(X.Scale * v4.X + X.Offset, Y.Scale * v4.Y + Y.Offset)
				local v12 = v:FindFirstChildOfClass("UIAspectRatioConstraint") or Instance.new("UIAspectRatioConstraint")
				v12.AspectRatio = v11.X / v11.Y
				v12.Parent = v
			end
		end
	end
end