-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("LightingService")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("Binder")
local v5 = Sonar("StorageUtils")
local v6 = Sonar("WeatherService")
Sonar("Constants")
local v7 = Sonar("PlaceTypeService")
local CurrentCamera = Workspace.CurrentCamera
local v8 = v2.GetClient()
local v9 = ""
local v10 = nil
local v11 = nil
local v12 = 0
local v13 = v3.GetRemoteEvent("InteractZoneTimeReport")
local function reportRegionTime(p1) --[[ reportRegionTime | Line: 33 | Upvalues: v13 (copy) ]]
	if p1 and p1 ~= "" then
		v13:FireServer(p1)
	end
end
local v14 = ReplicatedStorage.Storage.Assets.WeatherPart:Clone()
v14.Parent = workspace.CurrentCamera
local Regions = Workspace:WaitForChild("Regions")
local v15 = if v7.IsMarketWorld() then nil else v3.GetRemoteEvent("UpdateZone")
local function update(p1) --[[ update | Line: 48 ]]
	p1.Position = p1.Position * Vector3.new(1, 0, 1) + Vector3.new(0, 0, 0)
	p1.Size = p1.Size * Vector3.new(1, 0, 1)
end
Regions.ChildAdded:Connect(update)
for v16, v17 in Regions:GetChildren() do
	v17.Position = v17.Position * Vector3.new(1, 0, 1) + Vector3.new(0, 0, 0)
	v17.Size = v17.Size * Vector3.new(1, 0, 1)
end
local v18 = Sonar(v5.Get("Zones"))
local t = {}
t.__index = t
local t2 = {}
function t.new(p1) --[[ new | Line: 67 | Upvalues: t (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2.Weather = v2:_getWeather()
	p1:GetAttributeChangedSignal("Weather"):Connect(function() --[[ Line: 73 | Upvalues: v2 (copy) ]]
		v2.Weather = v2:_getWeather()
	end)
	t2[p1] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 81 | Upvalues: t2 (copy) ]]
	t2[p1.Object] = nil
end
function t.GetZoneFromObject(p1) --[[ GetZoneFromObject | Line: 85 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t._getWeather(p1) --[[ _getWeather | Line: 89 | Upvalues: v18 (copy) ]]
	local v1 = v18[p1.Object.Name]
	if v1 and v1.OverrideWeather then
		return p1.Object.Name
	else
		return p1.Object:GetAttribute("Weather") or "Clear Skies"
	end
end
local v19 = nil
local v20 = nil
local v21 = nil
local function ApplyZoneSettings(p1, p2) --[[ ApplyZoneSettings | Line: 103 | Upvalues: v9 (ref), v10 (ref), v6 (copy), v21 (ref), t (copy), v19 (ref), v20 (ref), v1 (copy), v18 (copy) ]]
	local applyingsettingsforzone = if p1 then p1.Name else p1
	if not applyingsettingsforzone then
		v9 = nil
		v10 = nil
		v6:ClearZoneWeather()
		v21 = nil
	end
	local v12 = t.GetZoneFromObject(p1)
	local v2 = if v12 then v12:_getWeather() else ""
	if (not p1 or p1 and (v19 and p1.Name ~= v19.Name)) and v20 then
		v1.setLightingMode(v20.LightingPreset or "", false)
		v20 = nil
		return
	end
	if not v18[applyingsettingsforzone] or v9 == applyingsettingsforzone and not p2 then
		return
	end
	v19 = p1
	local v4 = v18[applyingsettingsforzone]
	v9 = applyingsettingsforzone
	v10 = v12 or nil
	v1.setLightingMode(v4.LightingPreset or "", true)
	v6:SetZoneWeather(v2)
	v21 = v2
	v20 = v4
	print("Applying settings for zone:", applyingsettingsforzone, v2)
end
local v22 = nil
local function disconnectZone() --[[ disconnectZone | Line: 146 | Upvalues: v22 (ref) ]]
	if not v22 then
		return
	end
	v22:Disconnect()
end
local function UpdatePlayerZone() --[[ UpdatePlayerZone | Line: 152 | Upvalues: v8 (copy), CurrentCamera (copy), v9 (ref), v11 (ref), v12 (ref), v13 (copy), Regions (copy), v22 (ref), ApplyZoneSettings (copy), v15 (ref) ]]
	if not v8.MovedToSpawn then
		return
	end
	if CurrentCamera:GetAttribute("Override") then
		return
	end
	if v9 and (v9 ~= "" and (v11 and tick() - v12 >= 60)) then
		local v1 = v9
		if v1 and v1 ~= "" then
			v13:FireServer(v1)
		end
		v12 = tick()
		v11 = tick()
	end
	local CameraSubject = CurrentCamera.CameraSubject
	if CameraSubject and CameraSubject:IsA("Humanoid") then
		CameraSubject = CameraSubject.Parent.PrimaryPart.CFrame
	elseif not CameraSubject then
		CameraSubject = workspace.CurrentCamera.CFrame
	end
	local v3 = RaycastParams.new()
	v3.IncludeInstances = Regions:GetChildren()
	local v4 = workspace:Raycast(CameraSubject.Position * Vector3.new(1, 0, 1) + Vector3.new(0, 0.5, 0), Vector3.new(0, -1, 0), v3)
	if v4 and v4.Instance.Parent == Regions then
		local v5 = v4.Instance.Name
		if v5 == v9 then
			return
		end
		if v9 and (v9 ~= "" and v11) then
			local v6 = v9
			if v6 and v6 ~= "" then
				v13:FireServer(v6)
			end
			v11 = nil
		end
		v11 = tick()
		if v22 then
			v22:Disconnect()
		end
		ApplyZoneSettings(v4.Instance)
		v22 = v4.Instance:GetAttributeChangedSignal("Weather"):Connect(function() --[[ Line: 185 | Upvalues: ApplyZoneSettings (ref), v4 (copy) ]]
			ApplyZoneSettings(v4.Instance, true)
		end)
		if v15 then
			v15:FireServer(v5)
		end
	else
		if v9 and (v9 ~= "" and v11) then
			local v7 = v9
			if v7 and v7 ~= "" then
				v13:FireServer(v7)
			end
			v11 = nil
		end
		if v9 ~= nil and v15 then
			v15:FireServer("Town")
		end
		if v22 then
			v22:Disconnect()
		end
		ApplyZoneSettings(nil)
	end
end
function t.GetCurrentWeather() --[[ GetCurrentWeather | Line: 207 | Upvalues: v10 (ref) ]]
	return if v10 then v10:_getWeather() or "Clear Skies" else "Clear Skies"
end
local function init() --[[ init | Line: 212 | Upvalues: v4 (copy), t (copy), v14 (ref), UpdatePlayerZone (copy) ]]
	v4.new("Zone", t):Init()
	game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 215 | Upvalues: v14 (ref) ]]
		v14.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.p) * CFrame.new(0, 10, 0)
	end)
	while true do
		UpdatePlayerZone()
		task.wait(1)
	end
end
task.spawn(init)
return t