-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Roact)
local Math = require(v1.Utility.Math)
local Never = Enum.AdornCullingMode.Never
local v3 = Roact.PureComponent:extend("ScaleHandleView")
local v4 = 0.5
local v5 = 0.75
local v6 = 0.2
local v7 = 1.5
local function getDebugSettingValue(p1, p2) --[[ getDebugSettingValue | Line: 28 | Upvalues: Workspace (copy) ]]
	local v1 = Workspace:FindFirstChild(p1)
	return Workspace:FindFirstChild(p1) and v1.Value * p2 or p2
end
function v3.render(p1) --[[ render | Line: 33 | Upvalues: v7 (ref), Workspace (copy), v4 (ref), v5 (ref), v6 (ref), Roact (copy), Never (copy) ]]
	local ScaleHandleOffset = Workspace:FindFirstChild("ScaleHandleOffset")
	v7 = Workspace:FindFirstChild("ScaleHandleOffset") and ScaleHandleOffset.Value * 1.5 or 1.5
	local ScaleHandleRadius = Workspace:FindFirstChild("ScaleHandleRadius")
	v4 = ScaleHandleRadius and ScaleHandleRadius.Value * 0.5 or 0.5
	local ScaleHandleTransparencyStart = Workspace:FindFirstChild("ScaleHandleTransparencyStart")
	v5 = ScaleHandleTransparencyStart and ScaleHandleTransparencyStart.Value * 0.75 or 0.75
	local ScaleHandleTransparencyEnd = Workspace:FindFirstChild("ScaleHandleTransparencyEnd")
	v6 = ScaleHandleTransparencyEnd and ScaleHandleTransparencyEnd.Value * 0.2 or 0.2
	local t = {}
	local Color = p1.props.Color
	local v52 = p1.props.HandleCFrame * CFrame.new(0, 0, -v7 * p1.props.Scale)
	local v62 = v4 * p1.props.Scale
	if p1.props.Thin then
		v62 = v62 * 0.34
	end
	if not p1.props.Hovered then
		t.HiddenHandle = Roact.createElement("SphereHandleAdornment", {
			AlwaysOnTop = true,
			ZIndex = 1,
			Adornee = Workspace.Terrain,
			CFrame = v52,
			Color3 = Color,
			Radius = v62,
			Transparency = v5,
			AdornCullingMode = Never
		})
	end
	local v72 = v6
	if p1.props.Hovered then
		v62 = v62 * 1.15
		v72 = 0
	end
	t.Handle = Roact.createElement("SphereHandleAdornment", {
		ZIndex = 0,
		Adornee = Workspace.Terrain,
		AlwaysOnTop = p1.props.Hovered,
		CFrame = v52,
		Color3 = Color,
		Radius = v62,
		Transparency = v72,
		AdornCullingMode = Never
	})
	return Roact.createElement("Folder", {}, t)
end
function v3.hitTest(p1, p2) --[[ hitTest | Line: 92 | Upvalues: v4 (ref), v7 (ref), Math (copy) ]]
	local Unit = p2.Unit
	local v42, v5 = Math.intersectRaySphere(Unit.Origin, Unit.Direction, p1.HandleCFrame * Vector3.new(0, 0, -v7 * p1.Scale), v4 * p1.Scale)
	if v42 then
		return v5
	else
		return nil
	end
end
function v3.distanceFromHandle(p1, p2) --[[ distanceFromHandle | Line: 106 | Upvalues: v4 (ref), v7 (ref) ]]
	local v3 = p1.HandleCFrame * Vector3.new(0, 0, -v7 * p1.Scale)
	local Unit = p2.Direction.Unit
	return (v3 - (p2.Origin + Unit * (v3 - p2.Origin):Dot(Unit))).Magnitude - v4 * p1.Scale * 2.5
end
return v3