-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = RunService:IsServer()
local t = {}
t.__index = t
local t2 = {}
function t.new(p1) --[[ new | Line: 19 | Upvalues: t (copy), v2 (copy), v3 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	if not p1:IsDescendantOf(workspace) then
		return v22
	end
	v22._object = p1
	v22._pos = p1:GetPivot().p
	local v32 = p1:IsA("BasePart") and p1.Size.Magnitude * 1.4 or (p1:IsA("Model") and p1:GetExtentsSize().Magnitude * 1.4 or nil)
	v22._radius = p1:GetAttribute("Radius") or (if v32 then v32 else 200)
	if not v3 then
		v22._zone = v22:_createZone()
		v22.Maid:GiveTask(v22._zone)
	end
	t2[p1] = v22
	v22.Maid:GiveTask(function() --[[ Line: 43 | Upvalues: t2 (ref), p1 (copy) ]]
		t2[p1] = nil
	end)
	return v22
end
function t._createZone(p1) --[[ _createZone | Line: 50 ]]
	local Part = Instance.new("Part")
	Part.Shape = Enum.PartType.Ball
	Part.Material = Enum.Material.Neon
	Part.Color = Color3.new(255/255, 0/255, 0/255)
	Part.Size = Vector3.new(0, 0, 0)
	Part.Transparency = 1
	Part.CanCollide = false
	Part.CanTouch = false
	Part.CanQuery = false
	Part.CastShadow = false
	Part.Anchored = true
	Part.Position = p1._object.Position
	Part:AddTag("NoBuild")
	p1._size = Vector3.new(p1._radius * 2, p1._radius * 2, p1._radius * 2)
	local _ = p1._size.Y <= 1000
	local NoBuildZones = workspace.Terrain.Builds:FindFirstChild("NoBuildZones")
	if not NoBuildZones then
		local NoBuildZones_2 = Instance.new("Folder")
		NoBuildZones_2.Name = "NoBuildZones"
		NoBuildZones_2.Parent = workspace.Terrain.Builds
		NoBuildZones = NoBuildZones_2
	end
	Part.Parent = NoBuildZones
	return Part
end
function t.EnableAll(p1) --[[ EnableAll | Line: 83 | Upvalues: t2 (copy), TweenService (copy) ]]
	for v1, v2 in t2 do
		TweenService:Create(v2._zone, TweenInfo.new(0.35, Enum.EasingStyle.Bounce), {
			Transparency = 0.65,
			Size = v2._size
		}):Play()
		v2._zone.CanQuery = true
	end
end
function t.DisableAll(p1) --[[ DisableAll | Line: 91 | Upvalues: t2 (copy), TweenService (copy) ]]
	for v1, v2 in t2 do
		TweenService:Create(v2._zone, TweenInfo.new(0.2), {
			Transparency = 1,
			Size = Vector3.new(0, 0, 0)
		}):Play()
		v2._zone.CanQuery = false
	end
end
function t.IsInZone(p1, p2) --[[ IsInZone | Line: 98 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		if (p2 - v2._pos).Magnitude <= v2._radius then
			return true
		end
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 106 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Init() --[[ Init | Line: 112 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("NoBuildZone", t):Init()
end
t.Init()
return t