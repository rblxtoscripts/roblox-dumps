-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local CoreGui = game:GetService("CoreGui")
local v1 = script.Parent.Parent
local Math = require(v1.Utility.Math)
local Roact = require(v1.Parent.Parent.Packages.Roact)
local getEngineFeatureModelPivotVisual = require(v1.Flags.getEngineFeatureModelPivotVisual)
local Never = Enum.AdornCullingMode.Never
local v3 = Roact.PureComponent:extend("MoveHandleView")
function v3.init(p1) --[[ init | Line: 28 ]] end
function v3.render(p1) --[[ render | Line: 31 | Upvalues: getEngineFeatureModelPivotVisual (copy), Workspace (copy), Roact (copy), Never (copy), CoreGui (copy) ]]
	local Scale = p1.props.Scale
	local v1 = Scale * 4
	local v2 = Scale * 0.1
	local sum = Scale * 0.6
	if getEngineFeatureModelPivotVisual() then
		sum = sum + v1 * (p1.props.Outset or 0)
	end
	local v4 = v1 * 0.25
	if p1.props.Thin then
		v2 = v2 * 0.34
	end
	if p1.props.Hovered then
		v2 = v2 * 1.5
		v4 = v4 * 1.5
	end
	local v5 = p1.props.Axis * CFrame.new(0, 0, -(sum + v1))
	local v7, _ = Workspace.CurrentCamera:WorldToScreenPoint(v5 * Vector3.new(0, 0, -(Scale * 0.2)))
	local t = {}
	if not p1.props.Hovered then
		t.Shaft = Roact.createElement("CylinderHandleAdornment", {
			ZIndex = 0,
			AlwaysOnTop = false,
			Adornee = Workspace.Terrain,
			Radius = v2,
			Height = v1,
			CFrame = p1.props.Axis * CFrame.new(0, 0, -(sum + v1 * 0.5)),
			Color3 = p1.props.Color,
			AdornCullingMode = Never
		})
		if not p1.props.Thin then
			t.Head = Roact.createElement("ConeHandleAdornment", {
				ZIndex = 0,
				AlwaysOnTop = false,
				Adornee = Workspace.Terrain,
				Radius = 3 * v2,
				Height = v4,
				CFrame = v5,
				Color3 = p1.props.Color,
				AdornCullingMode = Never
			})
		end
	end
	if p1.props.AlwaysOnTop then
		local t2 = {
			ZIndex = 0,
			AlwaysOnTop = true,
			Adornee = Workspace.Terrain,
			Radius = v2,
			Height = v1,
			CFrame = p1.props.Axis * CFrame.new(0, 0, -(sum + v1 * 0.5)),
			Color3 = p1.props.Color
		}
		t2.Transparency = if p1.props.Hovered then 0 else 0.45
		t2.AdornCullingMode = Never
		t.DimmedShaft = Roact.createElement("CylinderHandleAdornment", t2)
		if not p1.props.Thin then
			local t3 = {
				ZIndex = 0,
				AlwaysOnTop = true,
				Adornee = Workspace.Terrain,
				Radius = 3 * v2,
				Height = v4,
				CFrame = v5,
				Color3 = p1.props.Color
			}
			t3.Transparency = if p1.props.Hovered then 0 else 0.45
			t3.AdornCullingMode = Never
			t.DimmedHead = Roact.createElement("ConeHandleAdornment", t3)
		end
	elseif not p1.props.Thin then
		t.ScreenBox = Roact.createElement(Roact.Portal, {
			target = CoreGui
		}, {
			MoveToolScreenspaceHandle = Roact.createElement("ScreenGui", {}, {
				Frame = Roact.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundColor3 = p1.props.Color,
					Position = UDim2.new(0, v7.X - 3, 0, v7.Y - 3),
					Size = UDim2.new(0, 6, 0, 6),
					AdornCullingMode = Never
				})
			})
		})
	end
	return Roact.createElement("Folder", {}, t)
end
function v3.hitTest(p1, p2) --[[ hitTest | Line: 125 | Upvalues: getEngineFeatureModelPivotVisual (copy), Workspace (copy), Math (copy) ]]
	local Scale = p1.Scale
	local v1 = Scale * 4
	local v2 = Scale * 0.4
	local sum = Scale * 0.6
	if getEngineFeatureModelPivotVisual() then
		sum = sum + v1 * (p1.Outset or 0)
	end
	local v4 = Scale * 0.2
	local v6 = sum + v1
	if not p1.AlwaysOnTop then
		local v8, _ = Workspace.CurrentCamera:WorldToScreenPoint(p1.Axis * Vector3.new(0, 0, -(sum + v1 + v4)))
		local v9 = Workspace.CurrentCamera:WorldToScreenPoint(p2.Origin)
		if v9.X > v8.X - 3 and (v9.Y > v8.Y - 3 and (v9.X < v8.X + 3 and v9.Y < v8.Y + 3)) then
			return 0
		end
	end
	local v10, v11 = Math.intersectRayRay(p1.Axis.Position, p1.Axis.LookVector, p2.Origin, p2.Direction.Unit)
	if not v10 then
		return nil
	end
	local _, v12 = Math.intersectRayRay(p2.Origin, p2.Direction.Unit, p1.Axis.Position, p1.Axis.LookVector)
	local Magnitude = (p1.Axis.Position + p1.Axis.LookVector * v11 - (p2.Origin + p2.Direction.Unit * v12)).Magnitude
	if Magnitude < v2 and (sum < v11 and v11 < v6) then
		return v12
	end
	if Magnitude < v2 * 3 and (v6 < v11 and v11 < v6 + v1 * 0.25) then
		return v12
	else
		return nil
	end
end
function v3.getHandleDimensionForScale(p1, p2) --[[ getHandleDimensionForScale | Line: 187 | Upvalues: getEngineFeatureModelPivotVisual (copy) ]]
	local v1 = p1 * 4
	local sum = p1 * 0.6
	if getEngineFeatureModelPivotVisual() then
		sum = sum + v1 * (p2 or 0)
	end
	return sum, v1 + v1 * 0.25
end
return v3