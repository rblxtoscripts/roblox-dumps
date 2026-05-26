-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("RadialConstants")
local v2 = Sonar("RadialTriangle")
local TAU = v1.TAU
local GAP = v1.GAP
local PART_PER_UNIT = v1.PART_PER_UNIT
local CENTER = v1.CENTER
local EXTERIOR_RADIUS = v1.EXTERIOR_RADIUS
local EX_OFFSET = v1.EX_OFFSET
local G_OFFSET = v1.G_OFFSET
local ViewportFrame = Instance.new("ViewportFrame")
ViewportFrame.Ambient = Color3.new(255/255, 255/255, 255/255)
ViewportFrame.LightColor = Color3.new(255/255, 255/255, 255/255)
ViewportFrame.LightDirection = Vector3.new(0, 0, -1)
ViewportFrame.BackgroundTransparency = 1
ViewportFrame.Size = UDim2.new(1, 0, 1, 0)
local Camera = Instance.new("Camera")
Camera.CameraType = Enum.CameraType.Scriptable
Camera.CFrame = CFrame.new()
Camera.FieldOfView = v1.FOV
local function pivotAround(p1, p2, p3) --[[ pivotAround | Line: 32 ]]
	local v1 = p2:Inverse()
	local v2 = next
	local v3, v4 = p1:GetDescendants()
	for v5, v6 in v2, v3, v4 do
		v6.CFrame = p3 * (v1 * v6.CFrame)
	end
end
local function createSection(p1, p2, p3, p4) --[[ createSection | Line: 39 | Upvalues: TAU (copy), GAP (copy), CENTER (copy), v2 (copy) ]]
	local Model = Instance.new("Model")
	local v1 = TAU * p3 / p1 - GAP
	local v22 = v1 / p3
	local v3 = (TAU * p2 / p1 - GAP) / p2
	local v4 = math.ceil(v1 / p4)
	local t = {}
	local v5 = v22 - v3
	local t2 = {}
	for i = 0, v4 do
		t[i + 1] = CENTER * CFrame.fromEulerAnglesXYZ(0, 0, i / v4 * v22) * Vector3.new(p3, 0, 0)
		t2[i + 1] = CENTER * CFrame.fromEulerAnglesXYZ(0, 0, v5 / 2 + i / v4 * v3) * Vector3.new(p2, 0, 0)
	end
	for j = 1, v4 do
		local v7 = t2[j]
		local v8 = t[j + 1]
		v2(Model, t[j], v7, v8)
		v2(Model, v7, v8, t2[j + 1])
	end
	return Model
end
return function(p1, p2, p3, p4) --[[ createRadial | Line: 72 | Upvalues: EXTERIOR_RADIUS (copy), createSection (copy), PART_PER_UNIT (copy), TAU (copy), GAP (copy), ViewportFrame (copy), Camera (copy), CENTER (copy), EX_OFFSET (copy), G_OFFSET (copy) ]]
	local v1 = (1 - p2) * EXTERIOR_RADIUS - 1
	local v2 = createSection(p1, (1 - p2) * EXTERIOR_RADIUS, EXTERIOR_RADIUS, PART_PER_UNIT)
	local v3 = createSection(p1, v1 - 2, v1, PART_PER_UNIT / 2)
	local Frame = Instance.new("Frame")
	local Radial = Instance.new("Frame")
	local Attach = Instance.new("Frame")
	Radial.BackgroundTransparency = 1
	Attach.BackgroundTransparency = 1
	Radial.Size = UDim2.new(1, 0, 1, 0)
	Attach.Size = UDim2.new(1, 0, 1, 0)
	Radial.Name = "Radial"
	Attach.Name = "Attach"
	Attach.Active = true
	Radial.Parent = Frame
	Attach.Parent = Frame
	local v4 = EXTERIOR_RADIUS - p2 * EXTERIOR_RADIUS
	local v5 = TAU * EXTERIOR_RADIUS / p1 / EXTERIOR_RADIUS
	local v6 = (TAU * v4 / p1 - GAP) / v4
	local v8 = math.min((Vector2.new(math.cos(v6), (math.sin(v6))) * v4 - Vector2.new(v4, 0)).Magnitude / (EXTERIOR_RADIUS * 2), 0.18)
	local v9 = 1 - p2 / 2
	local v10 = p3 or 0
	for i = 0, p1 - 1 do
		local v11 = ViewportFrame:Clone()
		local v12 = Camera:Clone()
		v11.CurrentCamera = v12
		v11.Name = i + 1
		local v13 = i / p1 * TAU + v10
		local v14 = v2:Clone()
		local v16 = CENTER * CFrame.fromEulerAnglesXYZ(0, 0, v13 + EX_OFFSET)
		local v17 = CENTER:Inverse()
		local v18 = next
		local v19, v20 = v14:GetDescendants()
		for v21, v22 in v18, v19, v20 do
			v22.CFrame = v16 * (v17 * v22.CFrame)
		end
		v14.Parent = v11
		local v23 = v13 - EX_OFFSET + v5 / 2 + G_OFFSET
		local v24 = -math.cos(v23) / 2 * v9
		local v25 = math.sin(v23) / 2 * v9
		local Frame_2 = Instance.new("Frame")
		Frame_2.Name = i + 1
		Frame_2.BackgroundTransparency = 1
		Frame_2.BackgroundColor3 = Color3.new()
		Frame_2.BorderSizePixel = 0
		Frame_2.AnchorPoint = Vector2.new(0.5, 0.5)
		Frame_2.Position = UDim2.new(0.5 + v24, 0, 0.5 + v25, 0)
		Frame_2.Size = UDim2.new(v8, 0, v8, 0)
		Frame_2.Parent = Attach
		local Click = Instance.new("ImageButton")
		Click.Size = if p4 then p4 else UDim2.new(1.5, 0, 1.5, 0)
		Click.Position = UDim2.new(0.5, 0, 0.5, 0)
		Click.AnchorPoint = Vector2.new(0.5, 0.5)
		Click.BackgroundTransparency = 1
		Click.Image = ""
		Click.ZIndex = 5
		Click.Active = true
		Click.Name = "Click"
		Click.Parent = Frame_2
		v12.Parent = v11
		v11.Parent = Radial
	end
	v2:Destroy()
	local RadialDial = ViewportFrame:Clone()
	RadialDial.CurrentCamera = Camera:Clone()
	RadialDial.Name = "RadialDial"
	local v29 = CENTER * CFrame.fromEulerAnglesXYZ(0, 0, v10 + (-TAU / 4 + GAP / (2 * v1)))
	local v30 = CENTER:Inverse()
	local v31 = next
	local v32, v33 = v3:GetDescendants()
	for v34, v35 in v31, v32, v33 do
		v35.CFrame = v29 * (v30 * v35.CFrame)
	end
	v3.Parent = RadialDial
	RadialDial.Parent = Frame
	Frame.BackgroundTransparency = 1
	Frame.SizeConstraint = Enum.SizeConstraint.RelativeYY
	Frame.Size = UDim2.new(1, 0, 1, 0)
	return Frame
end