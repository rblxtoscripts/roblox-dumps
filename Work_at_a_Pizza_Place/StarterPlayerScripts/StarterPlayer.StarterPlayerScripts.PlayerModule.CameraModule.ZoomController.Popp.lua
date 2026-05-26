-- https://lua.expert/
local Players = game:GetService("Players")
local CurrentCamera = game.Workspace.CurrentCamera
local CommonUtils = script.Parent.Parent.Parent:WaitForChild("CommonUtils")
local UserRaycastPerformanceImprovements = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserRaycastPerformanceImprovements")
local min = math.min
local tan = math.tan
local rad = math.rad
local v1 = Ray.new
local v2 = RaycastParams.new()
v2.IgnoreWater = true
v2.FilterType = Enum.RaycastFilterType.Exclude
local v3 = RaycastParams.new()
v3.IgnoreWater = true
v3.FilterType = Enum.RaycastFilterType.Include
local function getTotalTransparency(p1) --[[ getTotalTransparency | Line: 31 ]]
	return 1 - (1 - p1.Transparency) * (1 - p1.LocalTransparencyModifier)
end
local function eraseFromEnd(p1, p2) --[[ eraseFromEnd | Line: 35 ]]
	for i = #p1, p2 + 1, -1 do
		p1[i] = nil
	end
end
local v4 = nil
local v5 = nil
local function updateProjection() --[[ updateProjection | Line: 42 | Upvalues: CurrentCamera (copy), rad (copy), v5 (ref), tan (copy), v4 (ref) ]]
	local v1 = rad(CurrentCamera.FieldOfView)
	local ViewportSize = CurrentCamera.ViewportSize
	v5 = tan(v1 / 2) * 2
	v4 = ViewportSize.X / ViewportSize.Y * v5
end
CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(updateProjection)
CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateProjection)
local v6 = rad(CurrentCamera.FieldOfView)
local ViewportSize = CurrentCamera.ViewportSize
v5 = tan(v6 / 2) * 2
v4 = ViewportSize.X / ViewportSize.Y * v5
local NearPlaneZ = CurrentCamera.NearPlaneZ
CurrentCamera:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 57 | Upvalues: NearPlaneZ (ref), CurrentCamera (copy) ]]
	NearPlaneZ = CurrentCamera.NearPlaneZ
end)
local t = {}
local tbl = {}
local function refreshIgnoreList() --[[ refreshIgnoreList | Line: 65 | Upvalues: t (ref), tbl (copy) ]]
	local count = 1
	t = {}
	for k, v in pairs(tbl) do
		t[count] = v
		count = count + 1
	end
end
local function playerAdded(p1) --[[ playerAdded | Line: 74 | Upvalues: tbl (copy), t (ref) ]]
	local function characterAdded(p12) --[[ characterAdded | Line: 75 | Upvalues: tbl (ref), p1 (copy), t (ref) ]]
		tbl[p1] = p12
		local count = 1
		t = {}
		for k, v in pairs(tbl) do
			t[count] = v
			count = count + 1
		end
	end
	local function characterRemoving() --[[ characterRemoving | Line: 79 | Upvalues: tbl (ref), p1 (copy), t (ref) ]]
		tbl[p1] = nil
		local count = 1
		t = {}
		for k, v in pairs(tbl) do
			t[count] = v
			count = count + 1
		end
	end
	p1.CharacterAdded:Connect(characterAdded)
	p1.CharacterRemoving:Connect(characterRemoving)
	if not p1.Character then
		return
	end
	tbl[p1] = p1.Character
	local count = 1
	t = {}
	for k, v in pairs(tbl) do
		t[count] = v
		count = count + 1
	end
end
local function playerRemoving(p1) --[[ playerRemoving | Line: 91 | Upvalues: tbl (copy), t (ref) ]]
	tbl[p1] = nil
	local count = 1
	t = {}
	for k, v in pairs(tbl) do
		t[count] = v
		count = count + 1
	end
end
Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(playerRemoving)
for i, v in ipairs(Players:GetPlayers()) do
	playerAdded(v)
end
local count = 1
t = {}
for k, v in pairs(tbl) do
	t[count] = v
	count = count + 1
end
local v8 = nil
local v9 = nil
CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 125 | Upvalues: CurrentCamera (copy), v9 (ref) ]]
	local CameraSubject = CurrentCamera.CameraSubject
	if CameraSubject:IsA("Humanoid") then
		v9 = CameraSubject.RootPart
		return
	end
	v9 = if CameraSubject:IsA("BasePart") then CameraSubject else nil
end)
local function canOcclude(p1) --[[ canOcclude | Line: 136 | Upvalues: v8 (ref) ]]
	return if 1 - (1 - p1.Transparency) * (1 - p1.LocalTransparencyModifier) < 0.25 then p1.CanCollide and (if v8 == (p1:GetRootPart() or p1) then false else not p1:IsA("TrussPart")) else false
end
local t2 = {
	Vector2.new(0.4, 0),
	Vector2.new(-0.4, 0),
	Vector2.new(0, -0.4),
	Vector2.new(0, 0.4),
	Vector2.new(0, 0.2)
}
local function getCollisionPoint(p1, p2) --[[ getCollisionPoint | Line: 164 | Upvalues: UserRaycastPerformanceImprovements (copy), v2 (copy), t (ref), v1 (copy) ]]
	if UserRaycastPerformanceImprovements then
		v2.FilterDescendantsInstances = t
		while true do
			local v12 = workspace:Raycast(p1, p2, v2)
			if v12 then
				if v12.Instance.CanCollide then
					return v12.Position, true
				end
				v2:AddToFilter(v12.Instance)
			end
			if not v12 then
				return p1 + p2, false
			end
		end
	else
		local v22 = #t
		repeat
			local v3, v4 = workspace:FindPartOnRayWithIgnoreList(v1(p1, p2), t, false, true)
			if v3 then
				if v3.CanCollide then
					local v5 = t
					for i = #v5, v22 + 1, -1 do
						v5[i] = nil
					end
					return v4, true
				end
				t[#t + 1] = v3
			end
		until not v3
		local v6 = t
		for j = #v6, v22 + 1, -1 do
			v6[j] = nil
		end
	end
	return p1 + p2, false
end
local function queryPoint(p1, p2, p3, p4) --[[ queryPoint | Line: 202 | Upvalues: t (ref), NearPlaneZ (ref), UserRaycastPerformanceImprovements (copy), v2 (copy), v8 (ref), v3 (copy), v1 (copy) ]]
	debug.profilebegin("queryPoint")
	local v12 = #t
	local v22 = p3 + NearPlaneZ
	local v32 = p1 + p2 * v22
	local v4 = (1 / 0)
	local v5 = (1 / 0)
	local count = 0
	if UserRaycastPerformanceImprovements then
		local v6 = p1
		repeat
			v2.FilterDescendantsInstances = t
			local v7 = workspace:Raycast(v6, v32 - v6, v2)
			local v82
			if v7 then
				v82 = v7.Instance
				local Position = v7.Position
				count = count + 1
				local v9 = if count >= 64 then true else false
				if (if 1 - (1 - v82.Transparency) * (1 - v82.LocalTransparencyModifier) < 0.25 then v82.CanCollide and (if v8 == (v82:GetRootPart() or v82) then false else not v82:IsA("TrussPart")) else false) or v9 then
					v3.FilterDescendantsInstances = { v82 }
					local v11 = workspace:Raycast(v32, Position - v32, v3)
					local Magnitude = (Position - p1).Magnitude
					if v11 and not v9 then
						if if p4 then workspace:Raycast(p4, v32 - p4, v3) or workspace:Raycast(v32, p4 - v32, v3) else nil then
							v5 = Magnitude
						elseif v22 < v4 then
							v4 = Magnitude
						end
					else
						v5 = Magnitude
					end
				end
				v2:AddToFilter(v82)
				v6 = Position - p2 * 0.001
				continue
			end
			v82 = nil
		until v5 < (1 / 0) or not v82
	else
		local v13 = p1
		repeat
			local v14
			local v15, v16 = workspace:FindPartOnRayWithIgnoreList(v1(v13, v32 - v13), t, false, true)
			count = count + 1
			if v15 then
				local v17 = if count >= 64 then true else false
				if (if 1 - (1 - v15.Transparency) * (1 - v15.LocalTransparencyModifier) < 0.25 then v15.CanCollide and (if v8 == (v15:GetRootPart() or v15) then false else not v15:IsA("TrussPart")) else false) or v17 then
					local t2 = { v15 }
					local v19 = workspace:FindPartOnRayWithWhitelist(v1(v32, v16 - v32), t2, true)
					local Magnitude = (v16 - p1).Magnitude
					if v19 and not v17 then
						v14 = if p4 then workspace:FindPartOnRayWithWhitelist(v1(p4, v32 - p4), t2, true) or workspace:FindPartOnRayWithWhitelist(v1(v32, p4 - v32), t2, true) else false
						if v14 then
							v5 = Magnitude
						elseif v22 < v4 then
							v4 = Magnitude
						end
					else
						v5 = Magnitude
					end
				end
				t[#t + 1] = v15
				v13 = v16 - p2 * 0.001
			end
		until v5 < (1 / 0) or not v15
		local v21 = t
		for i = #v21, v12 + 1, -1 do
			v21[i] = nil
		end
	end
	debug.profileend()
	return v4 - NearPlaneZ, v5 - NearPlaneZ
end
local function queryViewport(p1, p2) --[[ queryViewport | Line: 306 | Upvalues: CurrentCamera (copy), v4 (ref), v5 (ref), NearPlaneZ (ref), queryPoint (copy) ]]
	debug.profilebegin("queryViewport")
	local p = p1.p
	local rightVector = p1.rightVector
	local upVector = p1.upVector
	local v1 = -p1.lookVector
	local ViewportSize = CurrentCamera.ViewportSize
	local v2 = (1 / 0)
	local v3 = (1 / 0)
	for i = 0, 1 do
		local v42 = rightVector * ((i - 0.5) * v4)
		for j = 0, 1 do
			local v52, v6 = queryPoint(p + NearPlaneZ * (v42 + upVector * ((j - 0.5) * v5)), v1, p2, CurrentCamera:ViewportPointToRay(ViewportSize.x * i, ViewportSize.y * j).Origin)
			if v6 < v2 then
				v2 = v6
			end
			if v52 < v3 then
				v3 = v52
			end
		end
	end
	debug.profileend()
	return v3, v2
end
local function testPromotion(p1, p2, p3) --[[ testPromotion | Line: 347 | Upvalues: getCollisionPoint (copy), min (copy), queryPoint (copy), t2 (copy) ]]
	debug.profilebegin("testPromotion")
	local p = p1.p
	local rightVector = p1.rightVector
	local upVector = p1.upVector
	local v1 = -p1.lookVector
	debug.profilebegin("extrapolate")
	local Magnitude = (getCollisionPoint(p, p3.posVelocity * 1.25) - p).Magnitude
	for i = 0, min(1.25, p3.rotVelocity.magnitude + Magnitude / p3.posVelocity.magnitude), 0.0625 do
		local v2 = p3.extrapolate(i)
		if p2 <= queryPoint(v2.p, -v2.lookVector, p2) then
			return false
		end
	end
	debug.profileend()
	debug.profilebegin("testOffsets")
	for i, v in ipairs(t2) do
		local v3 = getCollisionPoint(p, rightVector * v.x + upVector * v.y)
		if queryPoint(v3, (p + v1 * p2 - v3).Unit, p2) == (1 / 0) then
			return false
		end
	end
	debug.profileend()
	debug.profileend()
	return true
end
return function(p1, p2, p3) --[[ Popper | Line: 396 | Upvalues: v8 (ref), v9 (ref), queryViewport (copy), testPromotion (copy) ]]
	debug.profilebegin("popper")
	v8 = v9 and v9:GetRootPart() or v9
	local v2, v3 = queryViewport(p1, p2)
	local v4 = if v3 < p2 then v3 else p2
	if v2 < v4 and testPromotion(p1, p2, p3) then
		v4 = v2
	end
	v8 = nil
	debug.profileend()
	return v4
end