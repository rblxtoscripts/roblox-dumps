-- https://lua.expert/
local Players = game:GetService("Players")
local t = {
	LIMBS = 2,
	MOVEMENT = 3,
	CORNERS = 4,
	CIRCLE1 = 5,
	CIRCLE2 = 6,
	LIMBMOVE = 7,
	SMART_CIRCLE = 8,
	CHAR_OUTLINE = 9
}
local t2 = {
	Head = true,
	["Left Arm"] = true,
	["Right Arm"] = true,
	["Left Leg"] = true,
	["Right Leg"] = true,
	LeftLowerArm = true,
	RightLowerArm = true,
	LeftUpperLeg = true,
	RightUpperLeg = true
}
local t3 = {
	Vector3.new(1, 1, -1),
	Vector3.new(1, -1, -1),
	Vector3.new(-1, -1, -1),
	Vector3.new(-1, 1, -1)
}
local function AssertTypes(p1, ...) --[[ AssertTypes | Line: 58 ]]
	local t = {}
	local v1 = ""
	for k, v in pairs({ ... }) do
		t[v] = true
		v1 = v1 .. (if v1 == "" then "" else " or ") .. v
	end
	local v3 = type(p1)
	assert(t[v3], v1 .. " type expected, got: " .. v3)
end
local function Det3x3(p1, p2, p3, p4, p5, p6, p7, p8, p9) --[[ Det3x3 | Line: 70 ]]
	return p1 * (p5 * p9 - p6 * p8) - p2 * (p4 * p9 - p6 * p7) + p3 * (p4 * p8 - p5 * p7)
end
local function RayIntersection(p1, p2, p3, p4) --[[ RayIntersection | Line: 78 ]]
	local v1 = p2:Cross(p4)
	local v2 = p3.x - p1.x
	local v3 = p3.y - p1.y
	local v4 = p3.z - p1.z
	local y = p2.y
	local v6 = -p4.y
	local y_2 = v1.y
	local z = p2.z
	local v7 = -p4.z
	local z_2 = v1.z
	local v8 = p2.x * (v6 * z_2 - y_2 * v7) - -p4.x * (y * z_2 - y_2 * z) + v1.x * (y * v7 - v6 * z)
	if v8 == 0 then
		return Vector3.new(0, 0, 0)
	end
	local v10 = -p4.y
	local y_3 = v1.y
	local v11 = -p4.z
	local z_3 = v1.z
	local y_4 = p2.y
	local y_5 = v1.y
	local z_4 = p2.z
	local z_5 = v1.z
	local v13 = p1 + (v2 * (v10 * z_3 - y_3 * v11) - -p4.x * (v3 * z_3 - y_3 * v4) + v1.x * (v3 * v11 - v10 * v4)) / v8 * p2
	local v14 = p3 + (p2.x * (v3 * z_5 - y_5 * v4) - v2 * (y_4 * z_5 - y_5 * z_4) + v1.x * (y_4 * v4 - v3 * z_4)) / v8 * p4
	local v15 = v13 + 0.5 * (v14 - v13)
	if (v14 - v13).Magnitude < 0.25 then
		return v15
	else
		return Vector3.new(0, 0, 0)
	end
end
local BaseOcclusion = require(script.Parent:WaitForChild("BaseOcclusion"))
local v1 = setmetatable({}, BaseOcclusion)
v1.__index = v1
function v1.new() --[[ new | Line: 111 | Upvalues: BaseOcclusion (copy), v1 (copy), t (copy) ]]
	local v3 = setmetatable(BaseOcclusion.new(), v1)
	v3.char = nil
	v3.humanoidRootPart = nil
	v3.torsoPart = nil
	v3.headPart = nil
	v3.childAddedConn = nil
	v3.childRemovedConn = nil
	v3.behaviors = {}
	v3.behaviors[t.LIMBS] = v3.LimbBehavior
	v3.behaviors[t.MOVEMENT] = v3.MoveBehavior
	v3.behaviors[t.CORNERS] = v3.CornerBehavior
	v3.behaviors[t.CIRCLE1] = v3.CircleBehavior
	v3.behaviors[t.CIRCLE2] = v3.CircleBehavior
	v3.behaviors[t.LIMBMOVE] = v3.LimbMoveBehavior
	v3.behaviors[t.SMART_CIRCLE] = v3.SmartCircleBehavior
	v3.behaviors[t.CHAR_OUTLINE] = v3.CharacterOutlineBehavior
	v3.mode = t.SMART_CIRCLE
	v3.behaviorFunction = v3.SmartCircleBehavior
	v3.savedHits = {}
	v3.trackedLimbs = {}
	v3.camera = game.Workspace.CurrentCamera
	v3.enabled = false
	return v3
end
function v1.Enable(p1, p2) --[[ Enable | Line: 144 ]]
	p1.enabled = p2
	if p2 then
		return
	end
	p1:Cleanup()
end
function v1.GetOcclusionMode(p1) --[[ GetOcclusionMode | Line: 152 ]]
	return Enum.DevCameraOcclusionMode.Invisicam
end
function v1.LimbBehavior(p1, p2) --[[ LimbBehavior | Line: 157 ]]
	for k, v in pairs(p1.trackedLimbs) do
		p2[#p2 + 1] = k.Position
	end
end
function v1.MoveBehavior(p1, p2) --[[ MoveBehavior | Line: 163 ]]
	for i = 1, 3 do
		local Velocity = p1.humanoidRootPart.Velocity
		p2[#p2 + 1] = p1.humanoidRootPart.Position + (i - 1) * p1.humanoidRootPart.CFrame.lookVector * (Vector3.new(Velocity.X, 0, Velocity.Z).Magnitude / 2)
	end
end
function v1.CornerBehavior(p1, p2) --[[ CornerBehavior | Line: 172 | Upvalues: t3 (copy) ]]
	local v1 = p1.humanoidRootPart.CFrame
	local Position = v1.Position
	local v2 = p1.char:GetExtentsSize() / 2
	p2[#p2 + 1] = Position
	local v3 = v1 - Position
	for i = 1, #t3 do
		p2[#p2 + 1] = Position + v3 * (v2 * t3[i])
	end
end
function v1.CircleBehavior(p1, p2) --[[ CircleBehavior | Line: 183 | Upvalues: t (copy) ]]
	local v1
	if p1.mode == t.CIRCLE1 then
		v1 = p1.humanoidRootPart.CFrame
	else
		local CoordinateFrame = p1.camera.CoordinateFrame
		v1 = CoordinateFrame - CoordinateFrame.Position + p1.humanoidRootPart.Position
	end
	p2[#p2 + 1] = v1.Position
	for i = 0, 9 do
		local v2 = 0.6283185307179586 * i
		local v3 = math.cos(v2)
		p2[#p2 + 1] = v1 * (Vector3.new(v3, math.sin(v2), 0) * 3)
	end
end
function v1.LimbMoveBehavior(p1, p2) --[[ LimbMoveBehavior | Line: 199 ]]
	p1:LimbBehavior(p2)
	p1:MoveBehavior(p2)
end
function v1.CharacterOutlineBehavior(p1, p2) --[[ CharacterOutlineBehavior | Line: 204 ]]
	local unit = p1.torsoPart.CFrame.upVector.unit
	local unit_2 = p1.torsoPart.CFrame.rightVector.unit
	p2[#p2 + 1] = p1.torsoPart.CFrame.p
	p2[#p2 + 1] = p1.torsoPart.CFrame.p + unit
	p2[#p2 + 1] = p1.torsoPart.CFrame.p - unit
	p2[#p2 + 1] = p1.torsoPart.CFrame.p + unit_2
	p2[#p2 + 1] = p1.torsoPart.CFrame.p - unit_2
	if p1.headPart then
		p2[#p2 + 1] = p1.headPart.CFrame.p
	end
	local v2 = CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(p1.camera.CoordinateFrame.lookVector.X, 0, p1.camera.CoordinateFrame.lookVector.Z)))
	local v3 = p1.torsoPart and p1.torsoPart.Position or p1.humanoidRootPart.Position
	local t = { p1.torsoPart }
	if p1.headPart then
		t[#t + 1] = p1.headPart
	end
	for i = 1, 24 do
		local v4 = 6.283185307179586 * i / 24
		local v7 = v2 * (Vector3.new(math.cos(v4), math.sin(v4), 0) * 3)
		local v9 = Vector3.new(v7.X, math.max(v7.Y, -2.25), v7.Z)
		local v11, v12 = game.Workspace:FindPartOnRayWithWhitelist(Ray.new(v3 + v9, -3 * v9), t, false, false)
		if v11 then
			p2[#p2 + 1] = v12 + 0.2 * (v3 - v12).unit
		end
	end
end
function v1.SmartCircleBehavior(p1, p2) --[[ SmartCircleBehavior | Line: 243 | Upvalues: RayIntersection (copy) ]]
	local unit = p1.torsoPart.CFrame.upVector.unit
	local unit_2 = p1.torsoPart.CFrame.rightVector.unit
	p2[#p2 + 1] = p1.torsoPart.CFrame.p
	p2[#p2 + 1] = p1.torsoPart.CFrame.p + unit
	p2[#p2 + 1] = p1.torsoPart.CFrame.p - unit
	p2[#p2 + 1] = p1.torsoPart.CFrame.p + unit_2
	p2[#p2 + 1] = p1.torsoPart.CFrame.p - unit_2
	if p1.headPart then
		p2[#p2 + 1] = p1.headPart.CFrame.p
	end
	local v1 = p1.camera.CFrame - p1.camera.CFrame.p
	local v4 = Vector3.new(0, 0.5, 0) + (p1.torsoPart and p1.torsoPart.Position or p1.humanoidRootPart.Position)
	for i = 1, 24 do
		local v5
		local v6 = 0.2617993877991494 * i - 1.5707963267948966
		local v9 = v4 + v1 * (Vector3.new(math.cos(v6), math.sin(v6), 0) * 2.5)
		local v10 = v9 - p1.camera.CFrame.p
		local v12, v13, v14 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v4, v9 - v4), { p1.char }, false, false)
		if v12 then
			local v15 = v13 + 0.1 * v14.unit
			local v16 = v15 - v4
			local unit_3 = v16:Cross(v10).unit:Cross(v14).unit
			if v16.unit:Dot(-unit_3) < v16.unit:Dot((v15 - p1.camera.CFrame.p).unit) then
				local v17 = RayIntersection(v15, unit_3, v9, v10)
				if v17.Magnitude > 0 then
					local v19, v20, v21 = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v15, v17 - v15), { p1.char }, false, false)
					v5 = if v19 then v20 + 0.1 * v21.unit else v17
				else
					v5 = v15
				end
			else
				v5 = v15
			end
			local v24, v25, _ = game.Workspace:FindPartOnRayWithIgnoreList(Ray.new(v4, v5 - v4), { p1.char }, false, false)
			if v24 then
				v5 = v25 - 0.1 * (v5 - v4).unit
			end
		else
			v5 = v9
		end
		p2[#p2 + 1] = v5
	end
end
function v1.CheckTorsoReference(p1) --[[ CheckTorsoReference | Line: 328 ]]
	if not p1.char then
		return
	end
	p1.torsoPart = p1.char:FindFirstChild("Torso")
	if not p1.torsoPart then
		p1.torsoPart = p1.char:FindFirstChild("UpperTorso")
		if not p1.torsoPart then
			p1.torsoPart = p1.char:FindFirstChild("HumanoidRootPart")
		end
	end
	p1.headPart = p1.char:FindFirstChild("Head")
end
function v1.CharacterAdded(p1, p2, p3) --[[ CharacterAdded | Line: 342 | Upvalues: Players (copy), t2 (copy) ]]
	if p3 ~= Players.LocalPlayer then
		return
	end
	if p1.childAddedConn then
		p1.childAddedConn:Disconnect()
		p1.childAddedConn = nil
	end
	if p1.childRemovedConn then
		p1.childRemovedConn:Disconnect()
		p1.childRemovedConn = nil
	end
	p1.char = p2
	p1.trackedLimbs = {}
	local function childAdded(p12) --[[ childAdded | Line: 358 | Upvalues: t2 (ref), p1 (copy) ]]
		if not p12:IsA("BasePart") then
			return
		end
		if t2[p12.Name] then
			p1.trackedLimbs[p12] = true
		end
		if p12.Name == "Torso" or p12.Name == "UpperTorso" then
			p1.torsoPart = p12
		end
		if p12.Name ~= "Head" then
			return
		end
		p1.headPart = p12
	end
	local function childRemoved(p12) --[[ childRemoved | Line: 374 | Upvalues: p1 (copy) ]]
		p1.trackedLimbs[p12] = nil
		p1:CheckTorsoReference()
	end
	p1.childAddedConn = p2.ChildAdded:Connect(childAdded)
	p1.childRemovedConn = p2.ChildRemoved:Connect(childRemoved)
	for k, v in pairs(p1.char:GetChildren()) do
		if v:IsA("BasePart") then
			if t2[v.Name] then
				p1.trackedLimbs[v] = true
			end
			if v.Name == "Torso" or v.Name == "UpperTorso" then
				p1.torsoPart = v
			end
			if v.Name == "Head" then
				p1.headPart = v
			end
		end
	end
end
function v1.SetMode(p1, p2) --[[ SetMode | Line: 388 | Upvalues: AssertTypes (copy), t (copy) ]]
	AssertTypes(p2, "number")
	for k, v in pairs(t) do
		if v == p2 then
			p1.mode = p2
			p1.behaviorFunction = p1.behaviors[p1.mode]
			return
		end
	end
	error("Invalid mode number")
end
function v1.GetObscuredParts(p1) --[[ GetObscuredParts | Line: 400 ]]
	return p1.savedHits
end
function v1.Cleanup(p1) --[[ Cleanup | Line: 405 ]]
	for k, v in pairs(p1.savedHits) do
		k.LocalTransparencyModifier = v
	end
end
function v1.Update(p1, p2, p3, p4) --[[ Update | Line: 411 ]]
	if p1.enabled and p1.char then
		p1.camera = game.Workspace.CurrentCamera
		if not p1.humanoidRootPart then
			local Humanoid = p1.char:FindFirstChildOfClass("Humanoid")
			if Humanoid and Humanoid.RootPart then
				p1.humanoidRootPart = Humanoid.RootPart
			else
				p1.humanoidRootPart = p1.char:FindFirstChild("HumanoidRootPart")
				if not p1.humanoidRootPart then
					return p3, p4
				end
			end
			local v1 = nil
			v1 = p1.humanoidRootPart.AncestryChanged:Connect(function(p12, p2) --[[ Line: 436 | Upvalues: p1 (copy), v1 (ref) ]]
				if p12 ~= p1.humanoidRootPart or p2 then
					return
				end
				p1.humanoidRootPart = nil
				if not (v1 and v1.Connected) then
					return
				end
				v1:Disconnect()
				v1 = nil
			end)
		end
		if not p1.torsoPart then
			p1:CheckTorsoReference()
			if not p1.torsoPart then
				return p3, p4
			end
		end
		local t = {}
		p1.behaviorFunction(p1, t)
		local t2 = {}
		local t3 = { p1.char }
		local function add(p12) --[[ add | Line: 462 | Upvalues: t2 (copy), p1 (copy) ]]
			t2[p12] = true
			if p1.savedHits[p12] then
				return
			end
			p1.savedHits[p12] = p12.LocalTransparencyModifier
		end
		local count = 0
		local t4 = {}
		local v2 = 0.75
		local v3 = 0.75
		local v6 = p1.camera:GetPartsObscuringTarget({ p1.headPart and p1.headPart.CFrame.p or t[1], p1.torsoPart and p1.torsoPart.CFrame.p or t[2] }, t3)
		local v7 = v6
		for i = 1, #v6 do
			local v8 = v7[i]
			t4[v8] = true
			count = count + 1
			for k, v in pairs(v8:GetChildren()) do
				if v:IsA("Decal") or v:IsA("Texture") then
					count = count + 1
					break
				end
			end
		end
		if count > 0 then
			local v9 = math.pow(0.375 / count + 0.375, 1 / count)
			v2, v3 = v9, math.pow(0.25 / count + 0.25, 1 / count)
		end
		local v11 = p1.camera:GetPartsObscuringTarget(t, t3)
		v12 = v11
		v13 = {}
		for j = 1, #v11 do
			local v14
			local v15 = v12[j]
			v14 = if t4[v15] and v2 then v2 else v3
			v13[v15] = v14
			if v15.Transparency < v13[v15] then
				t2[v15] = true
				if not p1.savedHits[v15] then
					p1.savedHits[v15] = v15.LocalTransparencyModifier
				end
			end
			for k, v in pairs(v15:GetChildren()) do
				if (v:IsA("Decal") or v:IsA("Texture")) and v.Transparency < v13[v15] then
					v13[v] = v13[v15]
					t2[v] = true
					if not p1.savedHits[v] then
						p1.savedHits[v] = v.LocalTransparencyModifier
					end
				end
			end
		end
		for k, v in pairs(p1.savedHits) do
			if t2[k] then
				k.LocalTransparencyModifier = k.Transparency < 1 and (v13[k] - k.Transparency) / (1 - k.Transparency) or 0
				continue
			end
			k.LocalTransparencyModifier = v
			p1.savedHits[k] = nil
		end
	end
	return p3, p4
end
return v1