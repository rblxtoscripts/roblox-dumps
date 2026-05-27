-- https://lua.expert/
local Players = game:GetService("Players")
local CollectionService = game:GetService("CollectionService")
local CurrentCamera = game.Workspace.CurrentCamera
local min = math.min
local tan = math.tan
local rad = math.rad
local v1 = Ray.new
local function getTotalTransparency(p1) --[[ getTotalTransparency | Line: 17 ]]
	return 1 - (1 - p1.Transparency) * (1 - p1.LocalTransparencyModifier)
end
local function eraseFromEnd(p1, p2) --[[ eraseFromEnd | Line: 21 ]]
	for i = #p1, p2 + 1, -1 do
		p1[i] = nil
	end
end
local v2 = nil
local v3 = nil
local function updateProjection() --[[ updateProjection | Line: 28 | Upvalues: CurrentCamera (copy), rad (copy), v3 (ref), tan (copy), v2 (ref) ]]
	local v1 = rad(CurrentCamera.FieldOfView)
	local ViewportSize = CurrentCamera.ViewportSize
	v3 = tan(v1 / 2) * 2
	v2 = ViewportSize.X / ViewportSize.Y * v3
end
CurrentCamera:GetPropertyChangedSignal("FieldOfView"):Connect(updateProjection)
CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(updateProjection)
local v4 = rad(CurrentCamera.FieldOfView)
local ViewportSize = CurrentCamera.ViewportSize
v3 = tan(v4 / 2) * 2
v2 = ViewportSize.X / ViewportSize.Y * v3
local NearPlaneZ = CurrentCamera.NearPlaneZ
CurrentCamera:GetPropertyChangedSignal("NearPlaneZ"):Connect(function() --[[ Line: 43 | Upvalues: NearPlaneZ (ref), CurrentCamera (copy) ]]
	NearPlaneZ = CurrentCamera.NearPlaneZ
end)
local t = {}
local t2 = {}
local function refreshIgnoreList() --[[ refreshIgnoreList | Line: 51 | Upvalues: t (ref), t2 (copy) ]]
	local count = 1
	t = {}
	for k, v in pairs(t2) do
		t[count] = v
		count = count + 1
	end
	local CosmeticMobsFolder = workspace:FindFirstChild("CosmeticMobsFolder")
	local MobFolder = workspace:FindFirstChild("MobFolder")
	if CosmeticMobsFolder then
		table.insert(t, CosmeticMobsFolder)
	end
	if not MobFolder then
		return
	end
	table.insert(t, MobFolder)
end
local function playerAdded(p1) --[[ playerAdded | Line: 69 | Upvalues: t2 (copy), refreshIgnoreList (copy) ]]
	local function characterAdded(p12) --[[ characterAdded | Line: 70 | Upvalues: t2 (ref), p1 (copy), refreshIgnoreList (ref) ]]
		t2[p1] = p12
		refreshIgnoreList()
	end
	local function characterRemoving() --[[ characterRemoving | Line: 74 | Upvalues: t2 (ref), p1 (copy), refreshIgnoreList (ref) ]]
		t2[p1] = nil
		refreshIgnoreList()
	end
	p1.CharacterAdded:Connect(characterAdded)
	p1.CharacterRemoving:Connect(characterRemoving)
	if not p1.Character then
		return
	end
	t2[p1] = p1.Character
	refreshIgnoreList()
end
local function playerRemoving(p1) --[[ playerRemoving | Line: 86 | Upvalues: t2 (copy), refreshIgnoreList (copy) ]]
	t2[p1] = nil
	refreshIgnoreList()
end
Players.PlayerAdded:Connect(playerAdded)
Players.PlayerRemoving:Connect(playerRemoving)
for i, v in ipairs(Players:GetPlayers()) do
	playerAdded(v)
end
refreshIgnoreList()
local v6 = nil
local v7 = nil
CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 120 | Upvalues: CurrentCamera (copy), v7 (ref) ]]
	local CameraSubject = CurrentCamera.CameraSubject
	if CameraSubject:IsA("Humanoid") then
		v7 = CameraSubject.RootPart
		return
	end
	v7 = if CameraSubject:IsA("BasePart") then CameraSubject else nil
end)
local function canOcclude(p1) --[[ canOcclude | Line: 132 | Upvalues: v6 (ref), CollectionService (copy) ]]
	return if 1 - (1 - p1.Transparency) * (1 - p1.LocalTransparencyModifier) < 0.25 then p1.CanCollide and (if v6 == (p1:GetRootPart() or p1) or p1.CollisionGroup ~= "Default" then false else not CollectionService:HasTag(p1, "CameraIgnore")) else false
end
local t3 = {
	Vector2.new(0.4, 0),
	Vector2.new(-0.4, 0),
	Vector2.new(0, -0.4),
	Vector2.new(0, 0.4),
	Vector2.new(0, 0.2)
}
local function getCollisionPoint(p1, p2) --[[ getCollisionPoint | Line: 161 | Upvalues: t (ref), v1 (copy) ]]
	local v12 = #t
	while true do
		local v2, v3 = workspace:FindPartOnRayWithIgnoreList(v1(p1, p2), t, false, true)
		local v4
		if v2 then
			if v2.CanCollide then
				local v5 = t
				for i = #v5, v12 + 1, -1 do
					v5[i] = nil
				end
				return v3, true
			end
			t[#t + 1] = v2
			if not v2 then
				v4 = t
				for j = #t, v12 + 1, -1 do
					t[j] = nil
				end
				return p1 + p2, false
			end
		elseif not v2 then
			v4 = t
			for j = #t, v12 + 1, -1 do
				t[j] = nil
			end
			return p1 + p2, false
		end
	end
end
local function queryPoint(p1, p2, p3, p4) --[[ queryPoint | Line: 183 | Upvalues: t (ref), NearPlaneZ (ref), v1 (copy), v6 (ref), CollectionService (copy) ]]
	debug.profilebegin("queryPoint")
	local v2 = p3 + NearPlaneZ
	local v3, v4, count, v5, v62 = p1, p1 + p2 * v2, 0, (1 / 0), (1 / 0)
	repeat
		local v7
		local v8, v9 = workspace:FindPartOnRayWithIgnoreList(v1(v3, v4 - v3), t, false, true)
		count = count + 1
		if v8 then
			local v10 = if count >= 64 then true else false
			if (if 1 - (1 - v8.Transparency) * (1 - v8.LocalTransparencyModifier) < 0.25 then v8.CanCollide and (if v6 == (v8:GetRootPart() or v8) or v8.CollisionGroup ~= "Default" then false else not CollectionService:HasTag(v8, "CameraIgnore")) else false) or v10 then
				local t2 = { v8 }
				local v122 = workspace:FindPartOnRayWithWhitelist(v1(v4, v9 - v4), t2, true)
				local Magnitude = (v9 - p1).Magnitude
				if v122 and not v10 then
					v7 = if p4 then workspace:FindPartOnRayWithWhitelist(v1(p4, v4 - p4), t2, true) or workspace:FindPartOnRayWithWhitelist(v1(v4, p4 - v4), t2, true) else false
					if v7 then
						v5 = Magnitude
					elseif v2 < v62 then
						v62 = Magnitude
					end
				else
					v5 = Magnitude
				end
			end
			t[#t + 1] = v8
			v3 = v9 - p2 * 0.001
		end
	until v5 < (1 / 0) or not v8
	local v14 = t
	for i = #v14, #t + 1, -1 do
		v14[i] = nil
	end
	debug.profileend()
	return v62 - NearPlaneZ, v5 - NearPlaneZ
end
local function queryViewport(p1, p2) --[[ queryViewport | Line: 243 | Upvalues: CurrentCamera (copy), v2 (ref), v3 (ref), NearPlaneZ (ref), queryPoint (copy) ]]
	debug.profilebegin("queryViewport")
	local p = p1.p
	local rightVector = p1.rightVector
	local upVector = p1.upVector
	local v1 = -p1.lookVector
	local ViewportSize = CurrentCamera.ViewportSize
	local v22 = (1 / 0)
	local v32 = (1 / 0)
	for i = 0, 1 do
		local v4 = rightVector * ((i - 0.5) * v2)
		for j = 0, 1 do
			local v5, v6 = queryPoint(p + NearPlaneZ * (v4 + upVector * ((j - 0.5) * v3)), v1, p2, CurrentCamera:ViewportPointToRay(ViewportSize.x * i, ViewportSize.y * j).Origin)
			if v6 < v32 then
				v32 = v6
			end
			if v5 < v22 then
				v22 = v5
			end
		end
	end
	debug.profileend()
	return v22, v32
end
local function testPromotion(p1, p2, p3) --[[ testPromotion | Line: 284 | Upvalues: getCollisionPoint (copy), min (copy), queryPoint (copy), t3 (copy) ]]
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
	for i, v in ipairs(t3) do
		local v3 = getCollisionPoint(p, rightVector * v.x + upVector * v.y)
		if queryPoint(v3, (p + v1 * p2 - v3).Unit, p2) == (1 / 0) then
			return false
		end
	end
	debug.profileend()
	debug.profileend()
	return true
end
return function(p1, p2, p3) --[[ Popper | Line: 333 | Upvalues: v6 (ref), v7 (ref), queryViewport (copy), testPromotion (copy) ]]
	debug.profilebegin("popper")
	v6 = v7 and v7:GetRootPart() or v7
	local v2, v3 = queryViewport(p1, p2)
	local v4 = if v3 < p2 then v3 else p2
	if v2 < v4 and testPromotion(p1, p2, p3) then
		v4 = v2
	end
	v6 = nil
	debug.profileend()
	return v4
end