-- https://lua.expert/
local VRService = game:GetService("VRService")
local t = {
	"BasePart",
	"Decal",
	"Beam",
	"ParticleEmitter",
	"Trail",
	"Fire",
	"Smoke",
	"Sparkles",
	"Explosion"
}
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local v1, v2 = pcall(function() --[[ Line: 27 ]]
	return UserSettings():IsUserFeatureEnabled("UserHideCharacterParticlesInFirstPerson")
end)
local v3 = v1 and v2
local t2 = {}
t2.__index = t2
function t2.new() --[[ new | Line: 38 | Upvalues: t2 (copy) ]]
	local v2 = setmetatable({}, t2)
	v2.transparencyDirty = false
	v2.enabled = false
	v2.lastTransparency = nil
	v2.descendantAddedConn = nil
	v2.descendantRemovingConn = nil
	v2.toolDescendantAddedConns = {}
	v2.toolDescendantRemovingConns = {}
	v2.cachedParts = {}
	return v2
end
function t2.HasToolAncestor(p1, p2) --[[ HasToolAncestor | Line: 54 ]]
	if p2.Parent == nil then
		return false
	end
	assert(p2.Parent, "")
	return p2.Parent:IsA("Tool") or p1:HasToolAncestor(p2.Parent)
end
function t2.IsValidPartToModify(p1, p2) --[[ IsValidPartToModify | Line: 60 | Upvalues: v3 (ref), t (copy) ]]
	if v3 then
		for v1, v2 in t do
			if p2:IsA(v2) then
				return not p1:HasToolAncestor(p2)
			end
		end
	else
		if not (p2:IsA("BasePart") or p2:IsA("Decal")) then
			return false
		end
		return not p1:HasToolAncestor(p2)
	end
	return false
end
function t2.CachePartsRecursive(p1, p2) --[[ CachePartsRecursive | Line: 76 ]]
	if not p2 then
		return
	end
	if p1:IsValidPartToModify(p2) then
		p1.cachedParts[p2] = true
		p1.transparencyDirty = true
	end
	for k, v in pairs(p2:GetChildren()) do
		p1:CachePartsRecursive(v)
	end
end
function t2.TeardownTransparency(p1) --[[ TeardownTransparency | Line: 88 ]]
	for k, v in pairs(p1.cachedParts) do
		k.LocalTransparencyModifier = 0
	end
	p1.cachedParts = {}
	p1.transparencyDirty = true
	p1.lastTransparency = nil
	if p1.descendantAddedConn then
		p1.descendantAddedConn:disconnect()
		p1.descendantAddedConn = nil
	end
	if p1.descendantRemovingConn then
		p1.descendantRemovingConn:disconnect()
		p1.descendantRemovingConn = nil
	end
	for k, v in pairs(p1.toolDescendantAddedConns) do
		v:Disconnect()
		p1.toolDescendantAddedConns[k] = nil
	end
	for k, v in pairs(p1.toolDescendantRemovingConns) do
		v:Disconnect()
		p1.toolDescendantRemovingConns[k] = nil
	end
end
function t2.SetupTransparency(p1, p2) --[[ SetupTransparency | Line: 114 ]]
	p1:TeardownTransparency()
	if p1.descendantAddedConn then
		p1.descendantAddedConn:disconnect()
	end
	p1.descendantAddedConn = p2.DescendantAdded:Connect(function(p12) --[[ Line: 118 | Upvalues: p1 (copy), p2 (copy) ]]
		if p1:IsValidPartToModify(p12) then
			p1.cachedParts[p12] = true
			p1.transparencyDirty = true
			return
		end
		if not p12:IsA("Tool") then
			return
		end
		if p1.toolDescendantAddedConns[p12] then
			p1.toolDescendantAddedConns[p12]:Disconnect()
		end
		p1.toolDescendantAddedConns[p12] = p12.DescendantAdded:Connect(function(p12) --[[ Line: 126 | Upvalues: p1 (ref) ]]
			p1.cachedParts[p12] = nil
			if not (p12:IsA("BasePart") or p12:IsA("Decal")) then
				return
			end
			p12.LocalTransparencyModifier = 0
		end)
		if p1.toolDescendantRemovingConns[p12] then
			p1.toolDescendantRemovingConns[p12]:disconnect()
		end
		p1.toolDescendantRemovingConns[p12] = p12.DescendantRemoving:Connect(function(p12) --[[ Line: 134 | Upvalues: p2 (ref), p1 (ref) ]]
			wait()
			if not (p2 and (p12 and (p12:IsDescendantOf(p2) and p1:IsValidPartToModify(p12)))) then
				return
			end
			p1.cachedParts[p12] = true
			p1.transparencyDirty = true
		end)
	end)
	if p1.descendantRemovingConn then
		p1.descendantRemovingConn:disconnect()
	end
	p1.descendantRemovingConn = p2.DescendantRemoving:connect(function(p12) --[[ Line: 146 | Upvalues: p1 (copy) ]]
		if not p1.cachedParts[p12] then
			return
		end
		p1.cachedParts[p12] = nil
		p12.LocalTransparencyModifier = 0
	end)
	p1:CachePartsRecursive(p2)
end
function t2.Enable(p1, p2) --[[ Enable | Line: 157 ]]
	if p1.enabled == p2 then
		return
	end
	p1.enabled = p2
end
function t2.SetSubject(p1, p2) --[[ SetSubject | Line: 163 ]]
	local v1 = if p2 and p2:IsA("Humanoid") then p2.Parent else nil
	if p2 and (p2:IsA("VehicleSeat") and p2.Occupant) then
		v1 = p2.Occupant.Parent
	end
	if v1 then
		p1:SetupTransparency(v1)
	else
		p1:TeardownTransparency()
	end
end
function t2.Update(p1, p2) --[[ Update | Line: 178 | Upvalues: CameraUtils (copy), VRService (copy) ]]
	local CurrentCamera = workspace.CurrentCamera
	if not (CurrentCamera and p1.enabled) then
		return
	end
	local magnitude = (CurrentCamera.Focus.p - CurrentCamera.CoordinateFrame.p).magnitude
	local v1 = magnitude < 2 and 1 - (magnitude - 0.5) / 1.5 or 0
	if v1 < 0.5 then
		v1 = 0
	end
	if p1.lastTransparency and (v1 < 1 and p1.lastTransparency < 0.95) then
		local v3 = 2.8 * p2
		v1 = p1.lastTransparency + math.clamp(v1 - p1.lastTransparency, -v3, v3)
	else
		p1.transparencyDirty = true
	end
	local v6 = math.clamp(CameraUtils.Round(v1, 2), 0, 1)
	if not p1.transparencyDirty and p1.lastTransparency == v6 then
		return
	end
	local v7 = v6
	for k, v in pairs(p1.cachedParts) do
		if VRService.VREnabled and VRService.AvatarGestures then
			local t = {
				[Enum.AccessoryType.Hat] = true,
				[Enum.AccessoryType.Hair] = true,
				[Enum.AccessoryType.Face] = true,
				[Enum.AccessoryType.Eyebrow] = true,
				[Enum.AccessoryType.Eyelash] = true
			}
			if k.Parent:IsA("Accessory") and t[k.Parent.AccessoryType] then
				k.LocalTransparencyModifier = v7
			else
				if k.Name == "Head" then
					k.LocalTransparencyModifier = v7
					continue
				end
				k.LocalTransparencyModifier = 0
			end
			continue
		end
		k.LocalTransparencyModifier = v7
	end
	p1.transparencyDirty = false
	p1.lastTransparency = v7
end
return t2