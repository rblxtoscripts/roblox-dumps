-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local v1 = require(ReplicatedStorage:WaitForChild("Sonar"))("StorageUtils")
local v2 = v1.GetConfig("LensFlare")()
local v3 = v1.GetFromPath(v2.AssetsPath)()
local NUMBER_OF_RAYCASTS = v2.NUMBER_OF_RAYCASTS
local RAYCAST_RADIUS = v2.RAYCAST_RADIUS
local TRANSPARENCY_THRESHOLD = v2.TRANSPARENCY_THRESHOLD
local v4 = Vector2.new(1920, 1080)
local SunDistance = v2.SunDistance
local SunFlareStyle = v2.SunFlareStyle
local SUN_EXPOSURE_ADJUSTMENT = v2.SUN_EXPOSURE_ADJUSTMENT
local SUN_EXPOSURE_TIME = v2.SUN_EXPOSURE_TIME
local SUN_BRIGHTNESS_THRESHOLD = v2.SUN_BRIGHTNESS_THRESHOLD
local SUN_ANGLE_THRESHOLD = v2.SUN_ANGLE_THRESHOLD
local t = {
	ColorBlend = 0,
	Position = Vector3.new(1, 1, 1),
	PositionMult = 1,
	Rotates = false,
	SizeFade = NumberSequence.new(1),
	SquashFade = NumberSequence.new(0),
	TransparencyFade = NumberSequence.new(0)
}
local v5 = table.create(NUMBER_OF_RAYCASTS)
local t2 = {
	LensFlareStrength = 1,
	LensFlareDistance = 0,
	LensFlareColor = false
}
local t3 = { "Size", "Squash", "Transparency", "LocalTransparencyModifier", "Color", "Rotation", "ZOffset", "Lifetime" }
for i = 1, NUMBER_OF_RAYCASTS do
	local v6 = 6.283185307179586 * ((i - 1) / NUMBER_OF_RAYCASTS)
	v5[i] = { math.cos(v6) * RAYCAST_RADIUS, math.sin(v6) * RAYCAST_RADIUS }
end
local ParticleEmitter = Instance.new("ParticleEmitter")
local Emit = ParticleEmitter.Emit
local Clear = ParticleEmitter.Clear
local t4 = {}
t4.__index = t4
local function _evalNumberSequence(p1, p2) --[[ _evalNumberSequence | Line: 121 ]]
	if p2 == 0 then
		return p1.Keypoints[1].Value
	end
	if p2 == 1 then
		return p1.Keypoints[#p1.Keypoints].Value
	end
	for i = 1, #p1.Keypoints - 1 do
		local v1 = p1.Keypoints[i]
		local v2 = p1.Keypoints[i + 1]
		if v1.Time <= p2 and p2 < v2.Time then
			return v1.Value + (v2.Value - v1.Value) * ((p2 - v1.Time) / (v2.Time - v1.Time))
		end
	end
	return 0
end
function t4.new(p1, p2, p3) --[[ new | Line: 149 | Upvalues: v3 (copy), t4 (copy), HttpService (copy), t2 (copy), t (copy), t3 (copy), CollectionService (copy), RunService (copy) ]]
	local v1 = v3:FindFirstChild(p2)
	assert(v1, (("LensFlare: No lens flare folder called %* under LensFlare Assets"):format(p2)))
	local v32 = v1:GetChildren()
	local v5 = setmetatable({}, t4)
	local v6 = HttpService:GenerateGUID(false)
	v5._id = v6
	v5.Enabled = true
	v5.Camera = p1
	v5.Part = p3
	v5.Attachments = table.create(#v32)
	v5.FlareEmitters = table.create(#v32)
	v5.Alpha = 0
	v5._forceRecompute = false
	local t5 = {}
	local t6 = {}
	local t7 = {}
	local count = 1
	local t8 = {}
	for v7, v8 in t2 do
		t5[v7] = p3:GetAttribute(v7) or v8
		table.insert(t6, (p3:GetAttributeChangedSignal(v7):Connect(function() --[[ Line: 181 | Upvalues: p3 (copy), v7 (copy), v8 (copy), t5 (copy), v5 (copy) ]]
			t5[v7] = p3:GetAttribute(v7) or v8
			v5._forceRecompute = true
		end)))
	end
	t7[p3] = t5
	for v10, v11 in v32 do
		if v11:IsA("ParticleEmitter") then
			local Attachment = Instance.new("Attachment")
			Attachment.Name = ("LensFlare_%*_%*"):format(p2, v11.Name)
			Attachment.Parent = p1
			v5.Attachments[count] = Attachment
			t8[Attachment] = { Attachment.Position }
			local v12 = Instance.fromExisting(v11)
			v12.ZOffset = 0
			v12.Enabled = false
			v12.Parent = Attachment
			v5.FlareEmitters[count] = v12
			local t9 = {}
			local v14, v15 = (p3:IsA("BasePart") and p3.Color or Color3.new(255/255, 255/255, 255/255)):ToHSV()
			for v16, v17 in t do
				t9[v16] = v12:GetAttribute(v16) or v17
				table.insert(t6, (v12:GetAttributeChangedSignal(v16):Connect(function() --[[ Line: 218 | Upvalues: v12 (copy), v16 (copy), v17 (copy), t9 (copy), v5 (copy), v14 (copy) ]]
					local v1 = v12:GetAttribute(v16) or v17
					t9[v16] = v1
					v5._forceRecompute = true
					if v16 ~= "ColorBlend" then
						return
					end
					t9._color = ColorSequence.new(Color3.fromHSV(v14, v1, 1))
				end)))
			end
			if t9.ColorBlend and t9.ColorBlend > 0 then
				t9._color = ColorSequence.new(Color3.fromHSV(v14, v15 * t9.ColorBlend, 1))
				if p3:IsA("BasePart") then
					table.insert(t6, p3:GetPropertyChangedSignal("Color"):Connect(function() --[[ Line: 240 | Upvalues: p3 (copy), t9 (copy), v5 (copy) ]]
						local v1, v2 = p3.Color:ToHSV()
						t9._color = ColorSequence.new(Color3.fromHSV(v1, v2 * t9.ColorBlend, 1))
						v5._forceRecompute = true
					end))
				end
			end
			local t10 = {}
			for v20, v21 in t3 do
				t10[v21] = v12[v21]
			end
			t7[v12] = t9
			t8[v12] = t10
			count = count + 1
		end
	end
	v5._attributeCache = t7
	v5._attributeConns = t6
	v5._propertyCache = t8
	local v22 = RaycastParams.new()
	local t9 = { p3, CollectionService:GetTagged("IgnoreLensFlare") }
	v22.ExcludeInstances = t9
	v22.IgnoreWater = true
	v5.RaycastParams = v22
	v5._excludeList = t9
	v5._connections = {
		CollectionServiceConn = CollectionService:GetInstanceAddedSignal("IgnoreLensFlare"):Connect(function(p1) --[[ Line: 281 | Upvalues: v5 (copy) ]]
			table.insert(v5._excludeList, p1)
			v5.RaycastParams.ExcludeInstances = v5._excludeList
		end)
	}
	RunService:BindToRenderStep(("LensFlare_%*"):format(v6), Enum.RenderPriority.Camera.Value + 10, function(p1) --[[ Line: 287 | Upvalues: v5 (copy) ]]
		if v5.Enabled then
			v5:Update(p1)
		end
	end)
	return v5
end
function t4.Destroy(p1) --[[ Destroy | Line: 299 | Upvalues: RunService (copy) ]]
	for v1, v2 in p1._connections do
		v2:Disconnect()
	end
	for v3, v4 in p1._attributeConns do
		v4:Disconnect()
	end
	RunService:UnbindFromRenderStep((("LensFlare_%*"):format(p1._id)))
	for v5, v6 in p1.FlareEmitters do
		v6:Destroy()
	end
	for v7, v8 in p1.Attachments do
		v8:Destroy()
	end
	table.clear(p1)
	setmetatable(p1, nil)
end
function t4.Update(p1, p2) --[[ Update | Line: 327 | Upvalues: v4 (copy), v5 (copy), TRANSPARENCY_THRESHOLD (copy), NUMBER_OF_RAYCASTS (copy), Clear (copy), Emit (copy), _evalNumberSequence (copy) ]]
	debug.profilebegin((("LensFlareUpdate_%*"):format(p1._id)))
	local Camera = p1.Camera
	local Part = p1.Part
	local v1 = if Part:IsA("Bone") then Part.TransformedWorldCFrame.Position elseif Part:IsA("Attachment") then Part.WorldPosition else Part.Position
	local v2 = v1 - Camera.CFrame.Position
	local v3 = vector.magnitude(v2)
	local _attributeCache = p1._attributeCache
	local _propertyCache = p1._propertyCache
	local v42 = _attributeCache[Part]
	local LensFlareDistance = v42.LensFlareDistance
	local LensFlareStrength = v42.LensFlareStrength
	if LensFlareStrength and LensFlareStrength <= 0 then
		return
	end
	if LensFlareDistance and (LensFlareDistance > 0 and LensFlareDistance < v3) then
		return
	end
	local v52 = vector.angle(Camera.CFrame.LookVector, v2)
	local sum = math.clamp(v52 / math.rad(Camera.DiagonalFieldOfView) * 2, 0, 1)
	if LensFlareDistance and LensFlareDistance > 0 then
		sum = sum + v3 / LensFlareDistance
	end
	if sum >= 1 then
		return
	end
	local v7 = Camera:WorldToViewportPoint(v1)
	local Origin = Camera:ViewportPointToRay(v7.X, v7.Y, 1).Origin
	local Position = Camera.CFrame:ToObjectSpace(CFrame.new(Origin)).Position
	local v8 = p1.RaycastParams
	local Magnitude = (Camera.ViewportSize / v4).Magnitude
	debug.profilebegin((("LensFlareUpdate_%*_RaycastStep"):format(p1._id)))
	local count = 0
	for v9, v10 in v5 do
		local v13 = Camera:ViewportPointToRay(v7.X + v10[1] * Magnitude, v7.Y + v10[2] * Magnitude, 1)
		local v14 = workspace:Raycast(v13.Origin, v13.Direction * v3, v8)
		if v14 then
			local v15 = v14.Instance
			if v15:IsA("BasePart") and (TRANSPARENCY_THRESHOLD < v15.Transparency or TRANSPARENCY_THRESHOLD < v15.LocalTransparencyModifier) then
				table.insert(p1._excludeList, v15)
				v8.ExcludeInstances = p1._excludeList
				continue
			end
			count = count + 1
		end
	end
	debug.profileend()
	local v16 = count / NUMBER_OF_RAYCASTS
	local Attachments = p1.Attachments
	local FlareEmitters = p1.FlareEmitters
	local v17 = LensFlareStrength * (1 - sum) * (1 - v16)
	local Alpha = p1.Alpha
	if v16 < 1 and sum < 1 then
		if v17 == Alpha and not p1._forceRecompute then
			for v18, v19 in FlareEmitters do
				Clear(v19)
				local v20 = _propertyCache[v19]
				local v21 = NumberRange.new(p2 * 3)
				if v20.Lifetime ~= v21 then
					v19.Lifetime = v21
					v20.Lifetime = v21
				end
				Emit(v19, 1)
			end
			return
		end
		for i = 1, #FlareEmitters do
			local v22 = Attachments[i]
			local v23 = FlareEmitters[i]
			Clear(v23)
			local v24 = _attributeCache[v23]
			local v25 = _propertyCache[v23]
			local _color = v24._color
			local Position_2 = v24.Position
			local PositionMult = v24.PositionMult
			v22.Position = vector.create(Position.X * Position_2.x * PositionMult, Position.Y * Position_2.y * PositionMult, Position.Z)
			local v28 = NumberSequence.new((_evalNumberSequence(v24.SizeFade, sum)))
			local v29 = NumberSequence.new((_evalNumberSequence(v24.SquashFade, sum)))
			local v32 = NumberSequence.new((math.lerp(_evalNumberSequence(v24.TransparencyFade, sum), 1, v16)))
			local v33 = 1 - LensFlareStrength
			if v28 ~= v25.Size then
				v23.Size = v28
				v25.Size = v28
			end
			if v29 ~= v25.Squash then
				v23.Squash = v29
				v25.Squash = v29
			end
			if v32 ~= v25.Transparency then
				v23.Transparency = v32
				v25.Transparency = v32
			end
			if v33 ~= v25.LocalTransparencyModifier then
				v23.LocalTransparencyModifier = 1 - LensFlareStrength
				v25.LocalTransparencyModifier = v33
			end
			local LensFlareColor = v42.LensFlareColor
			if LensFlareColor then
				local v34 = ColorSequence.new(LensFlareColor)
				if v34 ~= v25.Color then
					v23.Color = v34
					v25.Color = v34
				end
			elseif _color and _color ~= v25.Color then
				v23.Color = _color
				v25.Color = _color
			end
			if v24.Rotates then
				local v37 = NumberRange.new((math.deg((math.atan2(Position.Y, Position.X)))))
				if v37 ~= v25.Rotation then
					v23.Rotation = v37
					v25.Rotation = v37
				end
			end
			local v39 = math.min(-v22.Position.Z * 0.8, 0)
			if v39 ~= v25.ZOffset then
				v23.ZOffset = v39
				v25.ZOffset = v39
			end
			local v40 = NumberRange.new(p2 * 3)
			if v25.Lifetime ~= v40 then
				v23.Lifetime = v40
				v25.Lifetime = v40
			end
			Emit(v23, 1)
		end
	end
	p1.Alpha = v17
	debug.profileend()
end
local CurrentCamera = workspace.CurrentCamera
if v2.EnableSunFlare then
	local SunFlareTestPart = Instance.new("Part")
	SunFlareTestPart.Anchored = true
	SunFlareTestPart.CanCollide = false
	SunFlareTestPart.CanQuery = false
	SunFlareTestPart.CanTouch = false
	SunFlareTestPart.Transparency = 0.5
	SunFlareTestPart.Size = Vector3.new(1, 1, 1)
	SunFlareTestPart.Name = "SunFlareTestPart"
	SunFlareTestPart.Parent = workspace
	SunFlareTestPart:SetAttribute("LensFlareStrength", 1)
	local v7 = t4.new(CurrentCamera, SunFlareStyle, SunFlareTestPart)
	local function _updateColor() --[[ _updateColor | Line: 542 | Upvalues: SunFlareTestPart (copy), Lighting (copy) ]]
		SunFlareTestPart.Color = Lighting.ColorShift_Top
	end
	SunFlareTestPart.Color = Lighting.ColorShift_Top
	Lighting:GetPropertyChangedSignal("ColorShift_Top"):Connect(_updateColor)
	local function _updateStrength() --[[ _updateStrength | Line: 549 | Upvalues: Lighting (copy), SUN_ANGLE_THRESHOLD (copy), SUN_BRIGHTNESS_THRESHOLD (copy), v7 (copy), SunFlareTestPart (copy) ]]
		local v2 = math.clamp(Lighting:GetSunDirection().Y * 90 / SUN_ANGLE_THRESHOLD, 0, 1)
		local v4 = v2 * math.clamp(Lighting.Brightness / SUN_BRIGHTNESS_THRESHOLD, 0, 1)
		v7.Enabled = v4 > 0
		SunFlareTestPart:SetAttribute("LensFlareStrength", v4)
	end
	local v9 = math.clamp(Lighting:GetSunDirection().Y * 90 / SUN_ANGLE_THRESHOLD, 0, 1)
	local v11 = v9 * math.clamp(Lighting.Brightness / SUN_BRIGHTNESS_THRESHOLD, 0, 1)
	v7.Enabled = if v11 > 0 then true else false
	SunFlareTestPart:SetAttribute("LensFlareStrength", v11)
	Lighting:GetPropertyChangedSignal("Brightness"):Connect(_updateStrength)
	Lighting:GetPropertyChangedSignal("ClockTime"):Connect(_updateStrength)
	RunService:BindToRenderStep("UpdateLensFlarePart", Enum.RenderPriority.Camera.Value + 9, function() --[[ Line: 564 | Upvalues: SunFlareTestPart (copy), CurrentCamera (copy), Lighting (copy), SunDistance (copy) ]]
		SunFlareTestPart.Position = CurrentCamera.CFrame.Position + Lighting:GetSunDirection() * SunDistance
	end)
	local v13 = 0
	local v14 = 0
	RunService:BindToRenderStep("UpdateExposure", Enum.RenderPriority.Camera.Value + 11, function(p1) --[[ Line: 569 | Upvalues: Lighting (copy), v13 (ref), SUN_EXPOSURE_ADJUSTMENT (copy), v14 (ref), TweenService (copy), v7 (copy), SUN_EXPOSURE_TIME (copy) ]]
		local v1 = Lighting
		v1.ExposureCompensation = v1.ExposureCompensation - v13 * SUN_EXPOSURE_ADJUSTMENT
		local v2, v3 = TweenService:SmoothDamp(v13, v7.Alpha ^ 2, v14, SUN_EXPOSURE_TIME, nil, p1)
		v13 = v2
		v14 = v3
		local v4 = Lighting
		v4.ExposureCompensation = v4.ExposureCompensation + v2 * SUN_EXPOSURE_ADJUSTMENT
	end)
end
local t5 = {}
for v15, v16 in CollectionService:GetTagged("LensFlare") do
	if (v16:IsA("BasePart") or (v16:IsA("Attachment") or v16:IsA("Bone"))) and not t5[v16] then
		t5[v16] = t4.new(CurrentCamera, v16:GetAttribute("LensFlareStyle"), v16)
	end
end
CollectionService:GetInstanceAddedSignal("LensFlare"):Connect(function(p1) --[[ Line: 586 | Upvalues: t5 (copy), t4 (copy), CurrentCamera (copy) ]]
	if not (p1:IsA("BasePart") or (p1:IsA("Attachment") or p1:IsA("Bone"))) then
		return
	end
	if t5[p1] then
		return
	end
	t5[p1] = t4.new(CurrentCamera, p1:GetAttribute("LensFlareStyle"), p1)
end)
CollectionService:GetInstanceRemovedSignal("LensFlare"):Connect(function(p1) --[[ Line: 593 | Upvalues: t5 (copy) ]]
	if not t5[p1] then
		return
	end
	t5[p1]:Destroy()
	t5[p1] = nil
end)
return t4