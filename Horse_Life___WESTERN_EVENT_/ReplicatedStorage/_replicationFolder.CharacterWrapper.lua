-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("Signal")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("PlayerWrapper")
local v5 = Sonar("Octree")
local v6 = Sonar("StorageUtils").GetConfig("CharacterWrapper")()
local CharacterTagName = v6.CharacterTagName
local OctreeUpdateRate = v6.OctreeUpdateRate
local v7 = RunService:IsServer()
local v8 = v5.new(v6.OctreeName, v6.OctreeDepth, v6.OctreeSize)
local v9 = 0
function t._init(p1) --[[ _init | Line: 44 | Upvalues: v1 (copy), Players (copy), v2 (copy), v8 (copy) ]]
	p1.CharacterMaid = v1.new()
	p1.Maid:GiveTask(p1.CharacterMaid)
	p1.IsLocalPlayer = p1.Player == Players.LocalPlayer
	p1.CharacterRemovingCallbacks = {}
	p1.CharacterAddedSignal = v2.new()
	p1.Maid:GiveTask(p1.CharacterAddedSignal)
	p1.CurrentCharacterChangedSignal = v2.new()
	p1.Maid:GiveTask(p1.CurrentCharacterChangedSignal)
	p1.PlayerWrapper:SetProperty("CurrentCharacterChangedSignal", p1.CurrentCharacterChangedSignal)
	p1.Maid:GiveTask(p1.Player:GetPropertyChangedSignal("Character"):Connect(function(p12) --[[ Line: 61 | Upvalues: p1 (copy) ]]
		p1:_updateCharacter(p1.Player.Character)
	end))
	task.spawn(function() --[[ Line: 65 | Upvalues: p1 (copy) ]]
		if not p1.Player.Character then
			return
		end
		p1:_updateCharacter(p1.Player.Character)
	end)
	p1.Maid:GiveTask(p1.Player.ChildAdded:Connect(function(p12) --[[ Line: 72 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Backpack") then
			return
		end
		p1:_updateBackpack(p12)
	end))
	if p1.Player:FindFirstChild("Backpack") then
		p1:_updateBackpack(p1.Player.Backpack)
	end
	if not p1.PlayerWrapper:IsLocalOrServer() then
		return
	end
	p1.Maid:GiveTask(function() --[[ Line: 83 | Upvalues: v8 (ref), p1 (copy) ]]
		v8:Remove(p1.Player)
	end)
end
function t.new(p1) --[[ new | Line: 94 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2:_init()
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 108 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._bindCharacterParts(p1, p2) --[[ _bindCharacterParts | Line: 115 ]]
	if not p2 then
		return
	end
	local tbl = {
		HumanoidRootPart = "PrimaryPart",
		Head = "Head",
		Humanoid = "Humanoid"
	}
	local function updatePart(p12, p2) --[[ updatePart | Line: 126 | Upvalues: tbl (copy), p1 (copy) ]]
		local v1 = tbl[p12]
		if not v1 then
			return
		end
		p1[v1] = p2
		p1.PlayerWrapper:SetProperty(v1, p2)
	end
	local function handlePartRemoved(p12) --[[ handlePartRemoved | Line: 135 | Upvalues: tbl (copy), p1 (copy) ]]
		local v1 = tbl[p12.Name]
		if not v1 then
			return
		end
		p1[v1] = nil
		p1.PlayerWrapper:SetProperty(v1, nil)
	end
	p1.CharacterMaid:GiveTask(p2.ChildAdded:Connect(function(p12) --[[ Line: 144 | Upvalues: tbl (copy), p1 (copy) ]]
		local v1 = tbl[p12.Name]
		if not v1 then
			return
		end
		p1[v1] = p12
		p1.PlayerWrapper:SetProperty(v1, p12)
	end))
	p1.CharacterMaid:GiveTask(p2.ChildRemoved:Connect(function(p12) --[[ Line: 148 | Upvalues: tbl (copy), p1 (copy) ]]
		local v1 = tbl[p12.Name]
		if not v1 then
			return
		end
		p1[v1] = nil
		p1.PlayerWrapper:SetProperty(v1, nil)
	end))
	for k in pairs(tbl) do
		local v1 = p2:FindFirstChild(k)
		if v1 then
			local v2 = tbl[k]
			if v2 then
				p1[v2] = v1
				p1.PlayerWrapper:SetProperty(v2, v1)
			end
		end
	end
end
function t._updateCharacter(p1, p2) --[[ _updateCharacter | Line: 164 | Upvalues: RunService (copy), v8 (copy), CollectionService (copy), CharacterTagName (copy) ]]
	p1.CharacterMaid:DoCleaning()
	if not p2 then
		return
	end
	p1.Character = p2
	p1.PlayerWrapper:SetProperty("Character", p2)
	p1.CharacterMaid:GiveTask(function() --[[ Line: 173 | Upvalues: p1 (copy) ]]
		for k, v in pairs(p1.CharacterRemovingCallbacks) do
			v()
		end
	end)
	p1:_bindCharacterParts(p2)
	if p1.PlayerWrapper:IsLocalOrServer() then
		if RunService:IsServer() then
			p1.Character.ModelStreamingMode = Enum.ModelStreamingMode.Atomic
			p1.Character.Archivable = true
		end
		if p1.PrimaryPart then
			v8:UpdateFor(p1.Player, p1.PrimaryPart.Position)
		end
	end
	if p1.PlayerWrapper.IsLocalPlayer then
		p1.PlayerWrapper:GetControls():Enable()
	end
	if RunService:IsServer() then
		CollectionService:AddTag(p2, CharacterTagName)
	end
	p1.CharacterAddedSignal:Fire()
end
function t._updateBackpack(p1, p2) --[[ _updateBackpack | Line: 209 ]]
	if p2 then
		p1.Backpack = p2
		p1.PlayerWrapper:SetProperty("Backpack", p2)
	end
end
function t.AddCharacterRemovingCallback(p1, p2) --[[ AddCharacterRemovingCallback | Line: 219 ]]
	p1.CharacterRemovingCallbacks[p2] = true
end
function t.RemoveCharacterRemovingCallback(p1, p2) --[[ RemoveCharacterRemovingCallback | Line: 226 ]]
	p1.CharacterRemovingCallbacks[p2] = nil
end
function t.GetCharacter(p1) --[[ GetCharacter | Line: 233 ]]
	return p1.Character
end
function t.YieldForCharacter(p1) --[[ YieldForCharacter | Line: 240 ]]
	repeat
		task.wait()
	until p1.Character
	return p1.Character
end
function t.GetCurrentCharacter(p1) --[[ GetCurrentCharacter | Line: 250 ]]
	return p1.CurrentCharacter
end
function t.YieldForCurrentCharacter(p1) --[[ YieldForCurrentCharacter | Line: 257 ]]
	local v1
	repeat
		task.wait()
		v1 = p1:GetCurrentCharacter()
	until v1
	return v1
end
function t.GetHumanoid(p1) --[[ GetHumanoid | Line: 269 ]]
	return p1.Humanoid
end
function t.YieldForHumanoid(p1) --[[ YieldForHumanoid | Line: 276 ]]
	local v1
	repeat
		task.wait()
		v1 = p1:GetHumanoid()
	until v1
	return v1
end
function t.SetCurrentCharacter(p1, p2) --[[ SetCurrentCharacter | Line: 288 ]]
	p1.PlayerWrapper:SetProperty("CurrentCharacter", p2)
	p1.CurrentCharacter = p2
	p1.CurrentCharacterChangedSignal:Fire()
end
function t.ClearCurrentCharacter(p1, p2) --[[ ClearCurrentCharacter | Line: 297 ]]
	if p1.CurrentCharacter ~= p2 then
		return
	end
	p1:SetCurrentCharacter(nil)
end
function t.GetCurrentCharacterChangedSignal(p1) --[[ GetCurrentCharacterChangedSignal | Line: 306 ]]
	return p1.CurrentCharacterChangedSignal
end
function t.GetCurrentCharacterData(p1) --[[ GetCurrentCharacterData | Line: 313 ]]
	local v1 = p1:GetCurrentCharacter()
	if v1 then
		return v1.CharacterData
	end
end
function t.IsWithinRangeOfPosition(p1, p2, p3) --[[ IsWithinRangeOfPosition | Line: 324 ]]
	return p1:GetDistanceFromCharacter(p2) <= p3
end
function t.GetDistanceFromCharacter(p1, p2) --[[ GetDistanceFromCharacter | Line: 332 ]]
	if p1.PrimaryPart then
		return (p1.PrimaryPart.Position - p2).Magnitude
	else
		return (1 / 0)
	end
end
function t.IsLocalPlayerFromTouched(p1, p2) --[[ IsLocalPlayerFromTouched | Line: 344 | Upvalues: Players (copy) ]]
	if not p2 then
		return false
	end
	local v1 = Players:GetPlayerFromCharacter(p2.Parent)
	if v1 then
		return v1 == Players.LocalPlayer
	else
		return false
	end
end
function t.ResetCamera(p1) --[[ ResetCamera | Line: 358 ]]
	if not p1.PlayerWrapper.IsLocalPlayer then
		warn("\226\154\160\239\184\143 CharacterWrapper, ResetCamera can only be called on the local player to reset camera and replication focus")
		return
	end
	local CurrentCamera = workspace.CurrentCamera
	CurrentCamera.CameraType = Enum.CameraType.Custom
	p1.Player.ReplicationFocus = p1.PrimaryPart
	local v1 = p1:GetCurrentCharacter()
	local v2 = v1 and v1.CameraPart or CurrentCamera:FindFirstChild("CameraPart")
	CurrentCamera.CameraSubject = if v2 then v2 else p1.Humanoid
end
function t.GetPlayersNearby(p1, p2, p3) --[[ GetPlayersNearby | Line: 382 | Upvalues: v8 (copy) ]]
	v8:UpdateFor(p1.Player, (p1.Character and p1.Character.PrimaryPart and p1.Character.PrimaryPart.Position or Vector3.new(0, 0, 0)) * Vector3.new(1, 0, 1))
	local v3 = v8:RadiusSearch((if p3 then p3 else p1.Character and p1.Character.PrimaryPart and p1.Character.PrimaryPart.Position or Vector3.new(0, 0, 0)) * Vector3.new(1, 0, 1), p2 or 100)
	local v4 = table.find(v3, p1.Player)
	if v4 then
		table.remove(v3, v4)
	end
	return v3
end
function t.IsWithinRadius(p1, p2, p3) --[[ IsWithinRadius | Line: 402 | Upvalues: v8 (copy) ]]
	v8:UpdateFor(p1.Player, (p1.Character and p1.Character.PrimaryPart and p1.Character.PrimaryPart.Position or Vector3.new(0, 0, 0)) * Vector3.new(1, 0, 1))
	return table.find(v8:RadiusSearch((if p3 then p3 else p1.Character and p1.Character.PrimaryPart and p1.Character.PrimaryPart.Position or Vector3.new(0, 0, 0)) * Vector3.new(1, 0, 1), p2 or 100), p1.Player) and true or false
end
function t.GetNearbyPlayers(p1) --[[ GetNearbyPlayers | Line: 421 ]]
	return p1.NearbyPlayers or {}
end
function t._updateNearbyPlayers(p1) --[[ _updateNearbyPlayers | Line: 427 | Upvalues: RunService (copy) ]]
	if RunService:IsServer() then
		return
	end
	local v1 = p1:GetNearbyPlayers(500)
	if not p1.NearbyPlayers then
		p1.NearbyPlayers = v1
		return
	end
	local t = {}
	for v2, v3 in v1 do
		t[v3] = true
	end
	local v4 = true
	for v5, v6 in p1.NearbyPlayers do
		if not t[v6] then
			v4 = false
			break
		end
	end
	if v4 then
		p1.NearbyPlayers = v1
	end
end
function t.GetOctree() --[[ GetOctree | Line: 456 | Upvalues: v8 (copy) ]]
	return v8
end
function t.ExitSeat(p1) --[[ ExitSeat | Line: 462 ]]
	local v1 = p1:GetHumanoid()
	if not v1 then
		return
	end
	while v1.SeatPart do
		v1.SeatPart:Sit(nil)
		task.wait()
	end
end
function t.SetHumanoidStateEnabled(p1, p2, p3) --[[ SetHumanoidStateEnabled | Line: 479 ]]
	local v1 = p1:GetHumanoid()
	if not v1 then
		return
	end
	v1:SetStateEnabled(p2, p3)
	if p2 ~= Enum.HumanoidStateType.Seated then
		return
	end
	p1:ExitSeat()
end
function t.Init(p1) --[[ Init | Line: 495 | Upvalues: v8 (copy), v7 (copy), RunService (copy), v9 (ref), OctreeUpdateRate (copy), v4 (copy) ]]
	local function updateOctree(p1) --[[ updateOctree | Line: 496 | Upvalues: v8 (ref) ]]
		v8:UpdateFor(p1.Player, p1.Character and p1.Character.PrimaryPart and p1.Character.PrimaryPart.Position or Vector3.new(0, 0, 0))
	end
	if v7 then
		task.spawn(function() --[[ Line: 519 | Upvalues: v4 (ref), v8 (ref), OctreeUpdateRate (ref) ]]
			while true do
				for k, v in pairs(v4.GetPlayers()) do
					if v:GetCharacter() then
						v8:UpdateFor(v.Player, v.Character and v.Character.PrimaryPart and v.Character.PrimaryPart.Position or Vector3.new(0, 0, 0))
					end
				end
				task.wait(OctreeUpdateRate)
			end
		end)
	else
		RunService.Heartbeat:Connect(function() --[[ Line: 501 | Upvalues: v9 (ref), OctreeUpdateRate (ref), v4 (ref), v8 (ref) ]]
			if not (OctreeUpdateRate < tick() - v9) then
				return
			end
			for k, v in pairs(v4.GetPlayers()) do
				if v:GetCharacter() then
					v8:UpdateFor(v.Player, v.Character and v.Character.PrimaryPart and v.Character.PrimaryPart.Position or Vector3.new(0, 0, 0))
					v:_updateNearbyPlayers()
				end
			end
			v9 = tick()
		end)
	end
end
t:Init()
return t