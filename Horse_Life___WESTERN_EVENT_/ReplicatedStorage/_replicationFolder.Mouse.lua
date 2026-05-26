-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local Players = game:GetService("Players")
local CurrentCamera = game:GetService("Workspace").CurrentCamera
local v1 = require(game.ReplicatedStorage.Sonar)(script.Parent:WaitForChild("Raycast"))
local function copyArray(p1) --[[ copyArray | Line: 92 ]]
	local v1 = #p1
	local count, count_2, v2 = 1, v1, {}
	while count < count_2 do
		v2[count] = p1[count]
		v2[count_2] = p1[count_2]
		count = count + 1
		count_2 = count_2 - 1
	end
	if v1 % 2 == 1 then
		local v5 = math.ceil(v1 / 2)
		v2[v5] = p1[v5]
	end
	return v2
end
local function planeIntersect(p1, p2, p3, p4) --[[ planeIntersect | Line: 106 ]]
	local v1 = -(p1 - p3):Dot(p4) / p2:Dot(p4)
	return p1 + v1 * p2, v1
end
local function planeSideCheck(p1, p2, p3, p4) --[[ planeSideCheck | Line: 112 ]]
	local v1 = p3:pointToObjectSpace(p1)
	local v2 = p3:vectorToObjectSpace(p2)
	local v3 = next
	local v4, v5 = Enum.NormalId:GetEnumItems()
	for v6, v7 in v3, v4, v5 do
		local v8 = Vector3.FromNormalId(v7)
		local v9 = v8 * p4
		local v10 = v1 + -(v1 - v9):Dot(v8) / v2:Dot(v8) * v2 + v8
		if (v10 - v9):Dot(v8) > 0 and v8:Dot(v2) <= 0 then
			local v11 = next
			local v12, v13 = Enum.NormalId:GetEnumItems()
			local v14 = true
			for v15, v16 in v11, v12, v13 do
				if v6 ~= v15 then
					local v17 = Vector3.FromNormalId(v16)
					if (v10 - v17 * p4):Dot(v17) > 0 then
						v14 = false
						break
					end
				end
			end
			if v14 then
				return v7
			end
		end
	end
end
local function getMouseScreenPos() --[[ getMouseScreenPos | Line: 141 | Upvalues: Players (copy), UserInputService (copy) ]]
	if Players.LocalPlayer then
		return UserInputService:GetMouseLocation() - Vector2.new(0, 36)
	else
		return UserInputService:GetMouseLocation()
	end
end
local function getScreenSize() --[[ getScreenSize | Line: 148 | Upvalues: Players (copy), CurrentCamera (copy) ]]
	if Players.LocalPlayer then
		return CurrentCamera.ViewportSize - Vector2.new(0, 72)
	else
		return CurrentCamera.ViewportSize
	end
end
local function castMouseRay(p1) --[[ castMouseRay | Line: 155 | Upvalues: Players (copy), copyArray (copy), UserInputService (copy), CurrentCamera (copy), v1 (copy), Workspace (copy) ]]
	local TargetFilter = p1.TargetFilter
	if type(TargetFilter) ~= "table" then
		TargetFilter = { TargetFilter }
	end
	local TargetBlackList = p1.TargetBlackList
	if type(TargetBlackList) ~= "table" then
		TargetBlackList = { TargetBlackList }
	end
	if p1.IgnoreCharacter and (Players.LocalPlayer and Players.LocalPlayer.Character) then
		local v12 = if #TargetBlackList > 0 then copyArray(TargetBlackList) or {} else {}
		table.insert(v12, Players.LocalPlayer.Character)
		TargetBlackList = v12
	end
	local v2 = p1.OverridePosition and p1.OverridePosition.Magnitude > 0 and p1.OverridePosition or UserInputService:GetMouseLocation()
	local v3 = CurrentCamera:ViewportPointToRay(v2.x, v2.y, 0)
	local v4 = Ray.new(v3.Origin, v3.Direction.Unit * p1.MaxDistance)
	local v5, v6, v7, v8
	if next(TargetBlackList) then
		local v9, v10, v11, v12 = v1.FindPartOnRayWithBlackAndWhiteList(v4, TargetBlackList, TargetFilter, true, p1.KeepDescendants)
		v5 = v9
		v6 = v10
		v7 = v11
		v8 = v12
	else
		local v13, v14, v15, v16 = Workspace:FindPartOnRayWithWhitelist(v4, TargetFilter, true)
		v5 = v13
		v6 = v14
		v7 = v15
		v8 = v16
	end
	return v5, v6, v7, v8, v3
end
local t = {
	TargetSurface = function(p1) --[[ TargetSurface | Line: 196 | Upvalues: castMouseRay (copy), planeSideCheck (copy) ]]
		local v1, _, _2, _3, v2 = castMouseRay(p1)
		if v1 and v1.ClassName ~= "Terrain" then
			return planeSideCheck(v2.Origin, v2.Direction, v1.CFrame, v1.Size / 2)
		end
	end,
	UnitRay = function(p1) --[[ UnitRay | Line: 203 | Upvalues: UserInputService (copy), CurrentCamera (copy) ]]
		local v1 = UserInputService:GetMouseLocation()
		return CurrentCamera:ViewportPointToRay(v1.x, v1.y, 0)
	end,
	ViewSizeX = function(p1) --[[ ViewSizeX | Line: 208 | Upvalues: Players (copy), CurrentCamera (copy) ]]
		return (if Players.LocalPlayer then CurrentCamera.ViewportSize - Vector2.new(0, 72) else CurrentCamera.ViewportSize).x
	end,
	ViewSizeY = function(p1) --[[ ViewSizeY | Line: 212 | Upvalues: Players (copy), CurrentCamera (copy) ]]
		return (if Players.LocalPlayer then CurrentCamera.ViewportSize - Vector2.new(0, 72) else CurrentCamera.ViewportSize).y
	end,
	X = function(p1) --[[ X | Line: 216 | Upvalues: Players (copy), UserInputService (copy) ]]
		return (if Players.LocalPlayer then UserInputService:GetMouseLocation() - Vector2.new(0, 36) else UserInputService:GetMouseLocation()).x
	end,
	Y = function(p1) --[[ Y | Line: 220 | Upvalues: Players (copy), UserInputService (copy) ]]
		return (if Players.LocalPlayer then UserInputService:GetMouseLocation() - Vector2.new(0, 36) else UserInputService:GetMouseLocation()).y
	end,
	Target = function(p1) --[[ Target | Line: 224 | Upvalues: castMouseRay (copy) ]]
		local v1, _, _2, _3, _4 = castMouseRay(p1)
		return v1
	end,
	Origin = function(p1) --[[ Origin | Line: 229 | Upvalues: UserInputService (copy), CurrentCamera (copy) ]]
		local v1 = UserInputService:GetMouseLocation()
		local v2 = CurrentCamera:ViewportPointToRay(v1.x, v1.y, 0)
		return CFrame.new(v2.Origin, v2.Origin + v2.Direction)
	end,
	Hit = function(p1) --[[ Hit | Line: 235 | Upvalues: castMouseRay (copy) ]]
		local _, v1, _2, _3, v2 = castMouseRay(p1)
		return CFrame.new(v1, v1 + v2.Direction)
	end,
	ViewSize = function(p1) --[[ ViewSize | Line: 242 | Upvalues: Players (copy), CurrentCamera (copy) ]]
		if Players.LocalPlayer then
			return CurrentCamera.ViewportSize - Vector2.new(0, 72)
		else
			return CurrentCamera.ViewportSize
		end
	end,
	Position = function(p1) --[[ Position | Line: 246 | Upvalues: getMouseScreenPos (copy) ]]
		return getMouseScreenPos()
	end,
	TargetSurfaceNormal = function(p1) --[[ TargetSurfaceNormal | Line: 250 | Upvalues: castMouseRay (copy) ]]
		local _, _2, v1, _3, _4 = castMouseRay(p1)
		return v1
	end,
	TargetMaterial = function(p1) --[[ TargetMaterial | Line: 255 | Upvalues: castMouseRay (copy) ]]
		local _, _2, _3, v1, _4 = castMouseRay(p1)
		return v1
	end
}
local t2 = {}
local t3 = {}
local v2 = setmetatable({}, {
	__mode = "k"
})
function t3.__index(p1, p2) --[[ __index | Line: 266 | Upvalues: t2 (copy), v2 (copy), t (copy) ]]
	local v1 = p2:sub(1, 1):upper() .. p2:sub(2)
	if t2[v1] then
		return t2[v1]
	end
	if v2[p1].readOnly[v1] then
		return v2[p1].readOnly[v1]
	end
	if t[v1] then
		return t[v1](p1)
	end
	if v2[p1].validKey[v1] then
		return rawget(p1, v1)
	end
end
function t3.__newindex(p1, p2, p3) --[[ __newindex | Line: 280 ]]
	return nil
end
function t3.__tostring() --[[ __tostring | Line: 284 ]]
	return "Mouse"
end
t3.__metatable = false
function t2.new(p1) --[[ new | Line: 292 | Upvalues: Workspace (copy), UserInputService (copy), RunService (copy), v2 (copy), t3 (copy) ]]
	local t = {
		TargetFilter = { Workspace },
		TargetBlackList = {},
		IgnoreCharacter = true,
		KeepDescendants = p1 or false,
		MaxDistance = 1000,
		OverridePosition = Vector3.new(0, 0, 0)
	}
	local t2 = {}
	local v1 = Instance.new("BindableEvent")
	local v22 = Instance.new("BindableEvent")
	local v3 = Instance.new("BindableEvent")
	local v4 = Instance.new("BindableEvent")
	local v5 = Instance.new("BindableEvent")
	local v6 = Instance.new("BindableEvent")
	local v7 = Instance.new("BindableEvent")
	local v8 = Instance.new("BindableEvent")
	local v9 = Instance.new("BindableEvent")
	local v10 = Instance.new("BindableEvent")
	local InputBegan = UserInputService.InputBegan
	table.insert(t2, InputBegan:Connect(function(p1, p2) --[[ Line: 315 | Upvalues: v1 (copy), v3 (copy), v5 (copy) ]]
		if p2 then
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseButton1 then
			v1:Fire()
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseButton2 then
			v3:Fire()
			return
		end
		if p1.UserInputType ~= Enum.UserInputType.MouseButton3 then
			return
		end
		v5:Fire()
	end))
	local InputEnded = UserInputService.InputEnded
	table.insert(t2, InputEnded:Connect(function(p1, p2) --[[ Line: 327 | Upvalues: v22 (copy), v4 (copy), v6 (copy) ]]
		if p2 then
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseButton1 then
			v22:Fire()
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseButton2 then
			v4:Fire()
			return
		end
		if p1.UserInputType ~= Enum.UserInputType.MouseButton3 then
			return
		end
		v6:Fire()
	end))
	local InputChanged = UserInputService.InputChanged
	table.insert(t2, InputChanged:Connect(function(p1, p2) --[[ Line: 339 | Upvalues: v8 (copy), v10 (copy), v9 (copy) ]]
		if p2 then
			return
		end
		if p1.UserInputType == Enum.UserInputType.MouseMovement then
			v8:Fire()
			return
		end
		if p1.UserInputType ~= Enum.UserInputType.MouseWheel then
			return
		end
		if p1.Position.z > 0 then
			v10:Fire()
			return
		end
		v9:Fire()
	end))
	local v11 = UserInputService:GetMouseLocation()
	local function f12() --[[ Line: 354 | Upvalues: UserInputService (ref), v11 (ref), v7 (copy) ]]
		local v1 = UserInputService:GetMouseLocation()
		if v1 == v11 then
			v7:Fire()
		end
		v11 = v1
	end
	table.insert(t2, RunService.Heartbeat:Connect(f12))
	v2[t] = {
		readOnly = {
			Button1Down = v1.Event,
			Button1Up = v22.Event,
			Button2Down = v3.Event,
			Button2Up = v4.Event,
			Button3Down = v5.Event,
			Button3Up = v6.Event,
			Idle = v7.Event,
			Move = v8.Event,
			WheelBackward = v9.Event,
			WheelForward = v10.Event
		},
		mouseEvents = t2,
		validKey = {
			TargetFilter = true,
			TargetBlackList = true,
			IgnoreCharacter = true,
			KeepDescendants = true,
			OverridePosition = true
		},
		bindableEvents = {
			v1,
			v22,
			v3,
			v4,
			v5,
			v6,
			v7,
			v8,
			v9,
			v10
		}
	}
	return setmetatable(t, t3)
end
function t2.Destroy(p1) --[[ Destroy | Line: 384 | Upvalues: v2 (copy) ]]
	local v1 = v2[p1]
	local mouseEvents = v1.mouseEvents
	local bindableEvents = v1.bindableEvents
	for i = 1, #mouseEvents do
		mouseEvents[i]:Disconnect()
	end
	for j = 1, #bindableEvents do
		bindableEvents[j]:Destroy()
	end
	v2[p1] = {}
end
return t2