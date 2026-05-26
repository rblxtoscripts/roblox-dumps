-- https://lua.expert/
local Workspace = game:GetService("Workspace")
local v1 = script.Parent.Parent
local Roact = require(v1.Parent.Roact)
local Math = require(v1.Utility.Math)
local Never = Enum.AdornCullingMode.Never
local v3 = Roact.PureComponent:extend("RotateHandleView")
local function isMultipleOf90Degrees(p1) --[[ isMultipleOf90Degrees | Line: 32 ]]
	return math.abs(p1 - math.floor(p1 / 1.5707963267948966 + 0.5) * 1.5707963267948966) < 0.001
end
function v3.render(p1) --[[ render | Line: 37 | Upvalues: Roact (copy), Workspace (copy), Never (copy) ]]
	local sum = (4.5 + (p1.props.RadiusOffset or 0)) * p1.props.Scale
	if p1.props.Hovered then
		sum = sum + p1.props.Scale * 0.1
	end
	local v1 = 0.15 * p1.props.Scale
	local t = {}
	if p1.props.Thin then
		v1 = 0 * v1
	end
	if p1.props.Hovered then
		v1 = 1.5 * v1
	end
	local v2 = 0.5 * v1
	t.OnTopHandle = Roact.createElement("CylinderHandleAdornment", {
		AlwaysOnTop = true,
		Transparency = 0.45,
		ZIndex = 0,
		Adornee = Workspace.Terrain,
		CFrame = p1.props.HandleCFrame * CFrame.Angles(p1.props.StartAngle or 0, 1.5707963267948966, 1.5707963267948966),
		Height = v1,
		Radius = sum + v2,
		InnerRadius = sum - v2,
		Color3 = p1.props.Color,
		AdornCullingMode = Never
	})
	t.BrightHandle = Roact.createElement("CylinderHandleAdornment", {
		AlwaysOnTop = false,
		ZIndex = 0,
		Adornee = Workspace.Terrain,
		CFrame = p1.props.HandleCFrame * CFrame.Angles(p1.props.StartAngle or 0, 1.5707963267948966, 1.5707963267948966),
		Height = v1,
		Radius = sum + v2,
		InnerRadius = sum - v2,
		Color3 = p1.props.Color,
		AdornCullingMode = Never
	})
	if p1.props.TickAngle then
		local TickAngle = p1.props.TickAngle
		local v3 = math.ceil(6.283185307179586 / TickAngle)
		local v4 = 0.05 * p1.props.Scale
		local v5 = 0.1 * sum
		local v6 = 0.1 * p1.props.Scale
		local v7 = 0.3 * sum
		local v8, v9, v10
		if p1.props.StartAngle then
			v8 = p1.props.EndAngle - p1.props.StartAngle
			v9 = p1.props.StartAngle
			v10 = true
		else
			v8 = 0
			v10 = false
			v9 = 0
		end
		for i = 1, v3 do
			local v11, v12, v13
			local v14 = math.pi + (i - 1) * TickAngle - v8
			if v10 then
				local v15 = v14 - v9
				v11 = if math.abs(v15 - math.floor(v15 / 1.5707963267948966 + 0.5) * 1.5707963267948966) < 0.001 then true else false
			else
				v11 = v10
			end
			v12 = if v11 and v7 then v7 else v5
			v13 = if v11 and v6 then v6 else v4
			local v17 = p1.props.HandleCFrame * CFrame.Angles(v14, 0, 0) * CFrame.new(0, 0, sum - 0.5 * v5)
			t["Tick" .. tostring(i)] = Roact.createElement("BoxHandleAdornment", {
				AlwaysOnTop = false,
				ZIndex = 0,
				Adornee = Workspace.Terrain,
				CFrame = v17,
				Color3 = p1.props.Color,
				Size = Vector3.new(v13, v13, v12),
				AdornCullingMode = Never
			})
			t["OnTopTick" .. tostring(i)] = Roact.createElement("BoxHandleAdornment", {
				AlwaysOnTop = true,
				Transparency = 0.45,
				ZIndex = 0,
				Adornee = Workspace.Terrain,
				CFrame = v17,
				Color3 = p1.props.Color,
				Size = Vector3.new(v13, v13, v12),
				AdornCullingMode = Never
			})
		end
	end
	if p1.props.StartAngle and p1.props.EndAngle then
		local v18 = 0.5 * (0.3 * sum - 0.1 * sum)
		local sum_2 = p1.props.EndAngle - p1.props.StartAngle
		local StartAngle = p1.props.StartAngle
		if sum_2 > math.pi then
			sum_2 = sum_2 - 6.283185307179586
		end
		if sum_2 < -3.141592653589793 then
			sum_2 = sum_2 + 6.283185307179586
		end
		if sum_2 < 0 then
			sum_2, StartAngle = math.abs(sum_2), StartAngle + sum_2
		end
		if math.abs(sum_2) > 0.001 then
			t.AngleSweepElement = Roact.createElement("CylinderHandleAdornment", {
				Height = 0,
				InnerRadius = 0,
				AlwaysOnTop = true,
				Transparency = 0.6,
				ZIndex = 0,
				Adornee = Workspace.Terrain,
				CFrame = p1.props.HandleCFrame * CFrame.Angles(StartAngle - 1.5707963267948966, 1.5707963267948966, 1.5707963267948966),
				Radius = sum,
				Angle = math.deg(sum_2),
				Color3 = p1.props.Color
			})
		end
		local v20 = 0.08 * p1.props.Scale
		t.EndAngleElement = (function(p12) --[[ createAngleDisplay | Line: 172 | Upvalues: sum (ref), v18 (copy), p1 (copy), Roact (ref), Workspace (ref), v20 (copy) ]]
			local v1 = CFrame.new(0, 0, -(sum + v18) / 2)
			return Roact.createElement("CylinderHandleAdornment", {
				AlwaysOnTop = true,
				ZIndex = 0,
				Adornee = Workspace.Terrain,
				CFrame = p1.props.HandleCFrame * CFrame.Angles(p12, 0, 0) * v1,
				Color3 = p1.props.Color,
				Height = sum + v18,
				Radius = v20 / 2
			})
		end)(p1.props.EndAngle)
	end
	return Roact.createElement("Folder", {}, t)
end
function v3.hitTest(p1, p2) --[[ hitTest | Line: 199 | Upvalues: Math (copy) ]]
	local HandleCFrame = p1.HandleCFrame
	local Unit = p2.Unit
	local v1 = (4.5 + (p1.RadiusOffset or 0)) * p1.Scale
	local v2 = 0.6 * p1.Scale
	local RightVector = HandleCFrame.RightVector
	local Position = HandleCFrame.Position
	local v3 = (1 / 0)
	local v4 = false
	local v5 = Position + RightVector * 0.5 * v2
	local v6 = Math.intersectRayPlane(Unit.Origin, Unit.Direction, v5, RightVector)
	if v6 >= 0 and v6 < v3 and math.abs((Unit.Origin + Unit.Direction * v6 - v5).Magnitude - v1) < 0.5 * v2 then
		v3 = v6
		v4 = true
	end
	local v8 = Position - RightVector * 0.5 * v2
	local v9 = Math.intersectRayPlane(Unit.Origin, Unit.Direction, v8, -RightVector)
	if v9 >= 0 and v9 < v3 and math.abs((Unit.Origin + Unit.Direction * v9 - v8).Magnitude - v1) < 0.5 * v2 then
		v3 = v9
		v4 = true
	end
	local v11 = HandleCFrame:PointToObjectSpace(Unit.Origin)
	local v12 = HandleCFrame:VectorToObjectSpace(Unit.Direction)
	local v13, v14 = Math.intersectRayCylinder(v11, v12, v1 - 0.5 * v2, v2)
	if v13 and v14 < v3 then
		v3 = v14
		v4 = true
	end
	local v15, v16 = Math.intersectRayCylinder(v11, v12, v1 + 0.5 * v2, v2)
	if v15 and v16 < v3 then
		v4 = true
		v3 = v16
	end
	if v4 then
		return v3
	else
		return nil
	end
end
return v3