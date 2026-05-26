-- https://lua.expert/
debug.setmemorycategory("PLAYERWRAPPER")
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
game:GetService("SocialService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local v1 = RunService:IsServer()
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v2 = Sonar("Signal")
local v3 = Sonar("Maid")
local v4 = Sonar("TimeUtils")
local v5 = Sonar("MembershipService")
local v6 = Sonar("RemoteUtils")
local v7 = if v1 then Sonar("DataService").new("PlayerData") else nil
local v8 = Sonar("MuteService", "Server")
local v9 = Sonar("Octree")
local v10 = Sonar("WebhookManager", "Server")
local v11 = Sonar("FriendsService")
local v12 = Sonar("State")
local v13 = Sonar("PlaceTypeService")
local v14 = Sonar("Constants")
local CharacterTag = v14.CharacterTag
local v15 = v1 and game:GetService("ServerStorage"):WaitForChild("SettingsTemplate")
local v16 = v12.fromAttribute(Workspace, "ModViewEnabled")
local v17 = v1 and game:GetService("ServerStorage"):WaitForChild("DataStorage")
local LocalPlayer = game:GetService("Players").LocalPlayer
local PlayerWrappers = v14.PlayerWrappers
local v18 = v9.new("Players", 4, 4000)
local function yieldForData(p1) --[[ yieldForData | Line: 49 | Upvalues: v13 (copy), v1 (copy) ]]
	if v13.IsMarketWorld() then
		return p1.Player:WaitForChild("Data")
	end
	if not (v1 or p1.IsLocalPlayer) then
		return nil
	end
	return p1.PlayerGui:WaitForChild("Data")
end
function t.new(p1, p2) --[[ new | Line: 61 | Upvalues: t (copy), v3 (copy), LocalPlayer (copy), v8 (copy), v4 (copy), v1 (copy), v17 (copy), v15 (copy), v2 (copy), ReplicatedStorage (copy), v18 (copy), v13 (copy), Sonar (copy), v11 (copy), v5 (copy), PlayerWrappers (copy), CollectionService (copy), v14 (copy) ]]
	local v32 = setmetatable(p2 or {}, t)
	v32.Maid = v3.new()
	v32.Player = p1
	v32.IsLocalPlayer = p1 == LocalPlayer
	if v8 then
		v8.GetPlayerAndSetMute(v32.Player.UserId, v8.IsPlayerMuted(v32.Player))
	end
	v32.OnRemoved = {}
	v32.LastAutosave = v4.Get()
	v32.PlayerGui = if v32.IsLocalPlayer then v32.Player:WaitForChild("PlayerGui") else v1 and v32.Player:WaitForChild("PlayerGui")
	if v1 then
		v32.Maid:GiveTask(v32.PlayerData.Destroying:Once(function() --[[ Line: 81 | Upvalues: v32 (copy), v17 (ref) ]]
			local v1 = v32.PlayerData:Clone()
			v1.Parent = v17
			v32.PlayerData = v1
		end))
		v32.ReplicationGui = Instance.new("ScreenGui")
		v32.ReplicationGui.Name = "ReplicationGui"
		v32.ReplicationGui.ResetOnSpawn = false
		v32.ReplicationGui.Parent = v32.PlayerGui
		v32.Maid:GiveTask(v32.ReplicationGui)
		v32.RemotesFolder = Instance.new("Folder")
		v32.RemotesFolder.Name = "Remotes"
		v32.RemotesFolder.Parent = p1
		v32.SettingsFolder = v15:Clone()
		v32.SettingsFolder.Name = "Settings"
		v32.SettingsFolder.Parent = p1
		v32.RemoveRequestSignal = v2.new()
		v32.Maid:GiveTask(v32.RemoveRequestSignal)
		v32.RemoveAllRequestsSignal = v2.new()
		v32.Maid:GiveTask(v32.RemoveAllRequestsSignal)
		v32.OnClientLoaded = v2.new()
		v32.Maid:GiveTask(v32.OnClientLoaded)
		local Freecam = p1.PlayerGui:FindFirstChild("Freecam")
		if Freecam then
			Freecam:Destroy()
		end
		local v6 = ReplicatedStorage.Storage.Freecam:Clone()
		v6.Parent = p1.PlayerGui
		v6:FindFirstChildOfClass("LocalScript").Enabled = true
		v32.TerritoryLeftSignal = v2.new()
		v32.Maid:GiveTask(v32.TerritoryLeftSignal)
		task.spawn(function() --[[ Line: 121 | Upvalues: v32 (copy), v18 (ref) ]]
			while v32.Player and v32.Player.Parent do
				task.wait(20)
				if not v32.Character then
					continue
				end
				for v1, v2 in v18:RadiusSearch(v32.Character:GetPivot().p, 650) do
					local v3 = game.Players:FindFirstChild(v2)
					if v3 and v3.Character then
						for v4, v5 in v32.getWrapperFromPlayer(v3).EquippedAnimalsFolder:GetChildren() do
							v5:AddPersistentPlayer(v32.Player)
						end
					end
				end
			end
		end)
	else
		v32.PlayerData = if v13.IsMarketWorld() then v32.Player:WaitForChild("Data") elseif v1 or v32.IsLocalPlayer then v32.PlayerGui:WaitForChild("Data") else nil
		v32.RemotesFolder = p1:WaitForChild("Remotes", 9000000000)
		v32.SettingsFolder = v32.Player:WaitForChild("Settings")
		v32.PermissionsFolder = v32.Player:WaitForChild("Permissions")
		if v32.IsLocalPlayer then
			v32.WorkspaceGui = v32.PlayerGui:WaitForChild("WorkspaceGui")
			v32.ReplicationGui = v32.PlayerGui:WaitForChild("ReplicationGui")
			v32.PlayerModule = Sonar((v32.Player:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule")))
			v32.PlayerControls = v32.PlayerModule:GetControls()
			v32.PlayerCameras = v32.PlayerModule:GetCameras()
		end
		v32.FriendedSignal = v2.new()
		v32.Maid:GiveTask(v32.FriendedSignal)
		v32.UnfriendedSignal = v2.new()
		v32.Maid:GiveTask(v32.UnfriendedSignal)
		if v11.OnFriended then
			v32.Maid:GiveTask(v11.OnFriended:Connect(function(p1) --[[ Line: 195 | Upvalues: v32 (copy) ]]
				if p1 ~= v32.Player then
					return
				end
				v32.FriendedSignal:Fire()
			end))
		end
		if v11.OnUnfriended then
			v32.Maid:GiveTask(v11.OnUnfriended:Connect(function(p1) --[[ Line: 204 | Upvalues: v32 (copy) ]]
				if p1 ~= v32.Player then
					return
				end
				v32.UnfriendedSignal:Fire()
			end))
		end
	end
	if v32.PlayerData then
		v32.FirstJoinTimeValue = v32.PlayerData.Metadata.FirstJoinTime
	end
	v32.PermissionsFolder = v32.Player:WaitForChild("Permissions")
	v32.BadgesFolder = v32.Player:WaitForChild("Badges")
	v32.GamepassFolder = v32.Player:WaitForChild("Gamepasses")
	v32.EquippedAnimalChangedSignal = v2.new()
	v32.Maid:GiveTask(v32.EquippedAnimalChangedSignal)
	v32.EquippedAnimalCountChangedSignal = v2.new()
	v32.Maid:GiveTask(v32.EquippedAnimalCountChangedSignal)
	v32.CurrentAnimalChangedSignal = v2.new()
	v32.Maid:GiveTask(v32.CurrentAnimalChangedSignal)
	v32.EquippedToolChangedSignal = v2.new()
	v32.Maid:GiveTask(v32.EquippedToolChangedSignal)
	if (v1 or v32.IsLocalPlayer) and v1 then
		v32.Maid:GiveTask(function() --[[ Line: 234 | Upvalues: v18 (ref), v32 (copy) ]]
			v18:Remove(v32.Player.Name)
		end)
	end
	v32.ActionValues = {
		BuildMode = v32.SettingsFolder:WaitForChild("BuildMode"),
		CustomiseMode = v32.SettingsFolder:WaitForChild("CustomiseMode"),
		BondMode = v32.SettingsFolder:WaitForChild("BondMode"),
		BossFight = v32.SettingsFolder:WaitForChild("BossFight"),
		Trading = v32.SettingsFolder:WaitForChild("Trading"),
		Trail = v32.SettingsFolder:WaitForChild("Trail"),
		Race = v32.SettingsFolder:WaitForChild("Race"),
		GlobalBossFight = v32.SettingsFolder:WaitForChild("GlobalBossFight"),
		InClub = v32.SettingsFolder:WaitForChild("InClub"),
		Maze = v32.SettingsFolder:WaitForChild("Maze")
	}
	v32.CharacterAddedSignal = v2.new()
	v32.CharacterChangedSignal = v2.new()
	v32.CharacterMaid = v3.new()
	v32.CharacterStateSignals = {}
	v32.Maid:GiveTask(v32.CharacterAddedSignal)
	v32.Maid:GiveTask(p1:GetPropertyChangedSignal("Character"):Connect(function() --[[ Line: 260 | Upvalues: v32 (copy), p1 (copy) ]]
		v32:_updateCharacter(p1.Character)
	end))
	v32.Maid:GiveTask(p1.CharacterRemoving:Connect(function(p1) --[[ Line: 263 ]]
		p1:Destroy()
	end))
	if p1.Character then
		task.spawn(function() --[[ Line: 267 | Upvalues: v32 (copy), p1 (copy) ]]
			v32:_updateCharacter(p1.Character)
		end)
	end
	v32.NestChangedSignal = v2.new()
	v32.Maid:GiveTask(v32.NestChangedSignal)
	v32.MembershipChangedSignal = v2.new()
	v32.Maid:GiveTask(v32.MembershipChangedSignal)
	v32.Maid:GiveTask(v5.MembershipChanged:Connect(function(p1) --[[ Line: 278 | Upvalues: v32 (copy) ]]
		if p1 == v32.Player then
			v32:_setPremiumMembership()
		end
	end))
	v32:_setPremiumMembership(true)
	PlayerWrappers[p1] = v32
	if v1 then
		CollectionService:AddTag(p1, v14.PlayerInitTag)
	elseif v32.IsLocalPlayer then
		v32.Player:SetAttribute("LoadedWrapper", true)
	end
	v32.UGCItems = {}
	return v32
end
function t.Destroy(p1) --[[ Destroy | Line: 298 | Upvalues: PlayerWrappers (copy), t (copy), v1 (copy) ]]
	PlayerWrappers[p1.Player] = nil
	p1.Maid:Destroy()
	pcall(function() --[[ Line: 301 | Upvalues: t (ref), p1 (copy), v1 (ref) ]]
		t.PlayerRemoving:Fire(p1.Player)
		if v1 then
			return
		end
		task.defer(function() --[[ Line: 305 | Upvalues: p1 (ref) ]]
			if not p1.Player then
				return
			end
			p1.Player:Destroy()
		end)
	end)
	p1.Character = nil
	p1.Player = nil
	p1.PlayerData = nil
	for v12, v2 in p1 do
		p1[v12] = nil
	end
	setmetatable(p1, nil)
end
local t2 = {
	LeftLowerArm = true,
	RightLowerArm = true,
	LeftLowerLeg = true,
	RightLowerLeg = true
}
function t._updateCharacter(p1, p2) --[[ _updateCharacter | Line: 337 | Upvalues: v1 (copy), t2 (copy), v18 (copy), CollectionService (copy), CharacterTag (copy), v14 (copy) ]]
	if not p2 then
		return
	end
	p1._animationCache = {}
	p1.Character = p2
	p1.Humanoid = p2:WaitForChild("Humanoid")
	p1.CharacterMaid:DoCleaning()
	p1.Bucking = nil
	p1.CharacterMaid:GiveTask(p1.Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 349 | Upvalues: p1 (copy) ]]
		p1.SeatPart = if p1.Humanoid then p1.Humanoid.SeatPart or nil else nil
	end))
	p1.EquippedAnimals = {}
	if v1 then
		p1.EquippedAnimalsFolder = Instance.new("Model")
		p1.EquippedAnimalsFolder.Name = "Animals"
		p1.EquippedAnimalsFolder.Parent = p2
		for v12, v2 in t2 do
			p2[v12]:AddTag("Lassoable")
		end
	else
		p1.EquippedAnimalsFolder = p2:WaitForChild("Animals")
	end
	p1.EquippedAnimalCount = 0
	for k, v in pairs({ "ChildAdded", "ChildRemoved" }) do
		p1.CharacterMaid:GiveTask(p1.EquippedAnimalsFolder[v]:Connect(function(p12) --[[ Line: 369 | Upvalues: p1 (copy), v (copy) ]]
			p1.EquippedAnimalChangedSignal:Fire(p12.Name)
			if v == "ChildRemoved" then
				p1.EquippedAnimalCount = math.max(p1.EquippedAnimalCount - 1, 0)
			else
				local v3 = p1
				v3.EquippedAnimalCount = v3.EquippedAnimalCount + 1
			end
			p1.EquippedAnimalCountChangedSignal:Fire(p1.EquippedAnimalCount)
		end))
	end
	if v1 or p1.IsLocalPlayer then
		p1.PrimaryPart = p2:WaitForChild("HumanoidRootPart")
		if p1.IsLocalPlayer then
			p1.Head = p2:WaitForChild("Head")
		end
		v18:UpdateFor(p1.Player.Name, p1.PrimaryPart.Position)
		delay(1, function() --[[ Line: 389 | Upvalues: p2 (copy), CollectionService (ref), p1 (copy) ]]
			if p2.Parent then
				CollectionService:AddTag(p1.Humanoid, "Ragdollable")
				p1.CharacterMaid:GiveTask(p1.Humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function() --[[ Line: 393 | Upvalues: p1 (ref), CollectionService (ref) ]]
					if not (p1.Humanoid and p1.Humanoid.SeatPart) then
						return
					end
					CollectionService:RemoveTag(p1.Humanoid, "Ragdoll")
				end))
			end
		end)
	end
	if v1 then
		CollectionService:AddTag(p1.Character, CharacterTag)
	else
		CollectionService:AddTag(p1.Character, "LocalCharacter")
		p1.CharacterDescendants = {}
		local function check(p12) --[[ check | Line: 408 | Upvalues: p1 (copy) ]]
			if p12:IsA("BasePart") then
				table.insert(p1.CharacterDescendants, p12)
			end
		end
		p1.CharacterMaid:GiveTask(p1.Character.DescendantAdded:Connect(function(p12) --[[ Line: 414 | Upvalues: p1 (copy) ]]
			if p12:IsA("BasePart") then
				table.insert(p1.CharacterDescendants, p12)
			end
		end))
		for v3, v4 in p1.Character:GetDescendants() do
			if v4:IsA("BasePart") then
				table.insert(p1.CharacterDescendants, v4)
			end
		end
	end
	local v5 = p1.Humanoid:GetAppliedDescription():GetAccessories(true)
	local UGCBonuses = v14.UGCBonuses
	p1.EquippedUGCAccessories = {}
	for v6, v7 in v5 do
		local v8 = tostring(v7.AssetId)
		if UGCBonuses[v8] then
			table.insert(p1.EquippedUGCAccessories, v8)
		end
	end
	p1.CharacterAddedSignal:Fire()
end
function t.Ragdoll(p1, p2) --[[ Ragdoll | Line: 437 | Upvalues: CollectionService (copy) ]]
	if not p1.Humanoid then
		return
	end
	if CollectionService:HasTag(p1.Humanoid, "Ragdoll") or p2 then
		local LastRagdoll = p1.LastRagdoll
		p1.LastRagdoll = nil
		CollectionService:RemoveTag(p1.Humanoid, "Ragdoll")
		if not LastRagdoll then
			return
		end
		wait(0.25)
	else
		if p1.Humanoid.Sit then
			p1.Humanoid.Jump = true
			p1.Humanoid.Sit = false
		end
		p1.Humanoid:AddTag("Ragdoll")
		p1.LastRagdoll = tick()
	end
end
function t.FlingPlayer(p1, p2) --[[ FlingPlayer | Line: 454 ]]
	if p1.Bucking or p1.Humanoid and p1.Humanoid:HasTag("Ragdoll") then
		return
	end
	local v1 = if p2 then p2 else {}
	local v2 = v1.forceMultiplier or math.random(3, 5)
	local direction = v1.direction
	if not direction then
		local v3 = math.random() * math.pi * 2
		direction = Vector3.new(math.cos(v3), 0, (math.sin(v3)))
	end
	local upwardForce = v1.upwardForce
	if not upwardForce then
		upwardForce = Vector3.new(0, math.random(1, 2) / 10, 0)
	end
	local v8 = v1.angularMultiplier or math.random(-1, 1)
	local v9 = v1.ragdollDuration or 2
	local v10 = v1.bodyForceDuration or 0.15
	local v11 = if v1.autoRagdoll == false then false else true
	p1.Bucking = true
	local Character = p1.Character
	if not (Character and Character.PrimaryPart) then
		return
	end
	if v11 then
		p1:Ragdoll()
		task.wait()
	end
	local BodyForce = Character.Head:FindFirstChildOfClass("BodyForce")
	local v12 = BodyForce or Instance.new("BodyForce", Character.Head)
	v12.Force = (direction + upwardForce) * Character.PrimaryPart.AssemblyMass * workspace.Gravity * v2
	if not BodyForce then
		local v13 = math.random(-1, 1)
		local v14 = math.random(-1, 1)
		Character.PrimaryPart:ApplyAngularImpulse(Vector3.new(v13, v14, math.random(-1, 1)).Unit * v8)
	end
	task.spawn(function() --[[ Line: 489 | Upvalues: v10 (copy), v12 (copy), v11 (copy), v9 (copy), p1 (copy), Character (copy) ]]
		task.wait(v10)
		if v12 and v12.Parent then
			v12:Destroy()
		end
		if v11 and v10 < v9 then
			task.wait(v9 - v10)
			p1:Ragdoll(true)
		end
		task.wait(0.1)
		p1.Bucking = Character.Head:FindFirstChildOfClass("BodyForce")
	end)
end
function t._isSpawnedIn(p1) --[[ _isSpawnedIn | Line: 504 ]]
	if not p1.Player.Character then
		return
	end
	return p1.Player.Character.Parent == workspace.Characters
end
function t.yieldForCharacter(p1) --[[ yieldForCharacter | Line: 510 ]]
	repeat
		wait()
	until p1.Character and p1.PrimaryPart
	return p1.Character
end
function t.GetSignal(p1, p2) --[[ GetSignal | Line: 517 | Upvalues: v2 (copy) ]]
	if not p1.Signals then
		p1.Signals = {}
	end
	if not p1.Signals[p2] then
		p1.Signals[p2] = v2.new()
		p1.Maid:GiveTask(p1.Signals[p2])
	end
	return p1.Signals[p2]
end
function t.GetSetting(p1, p2) --[[ GetSetting | Line: 529 ]]
	return p1.SettingsFolder[p2].Value
end
function t._setPremiumMembership(p1, p2) --[[ _setPremiumMembership | Line: 535 | Upvalues: v5 (copy) ]]
	p1.HasRobloxPremium = v5.HasPlayerGotPremium(p1.Player)
	if not p2 then
		p1.MembershipChangedSignal:Fire(p1.HasRobloxPremium)
	end
end
function t.GetPremiumOwnership(p1) --[[ GetPremiumOwnership | Line: 544 ]]
	return p1.HasRobloxPremium
end
function t.GetFirstJoinTime(p1) --[[ GetFirstJoinTime | Line: 550 ]]
	if p1.FirstJoinTimeValue.Value == 0 then
		return p1.Player.UserId
	else
		return p1.FirstJoinTimeValue.Value
	end
end
function t.GiveMission(p1, p2, p3) --[[ GiveMission | Line: 566 | Upvalues: Sonar (copy) ]]
	return Sonar("Missions").Create(p1, p2, p3)
end
function t.GetCurrentCharacter(p1) --[[ GetCurrentCharacter | Line: 570 ]]
	return p1.Character
end
function t._loadAnimation(p1, p2) --[[ _loadAnimation | Line: 574 | Upvalues: v14 (copy) ]]
	if not p1._animationCache[p2] then
		local Animation = Instance.new("Animation")
		Animation.Name = p2
		Animation.AnimationId = v14.Poses[p2]
		p1._animationCache[p2] = p1.Character.Humanoid:LoadAnimation(Animation)
		p1._animationCache[p2].Priority = Enum.AnimationPriority.Action3
		Animation:Destroy()
	end
	return p1._animationCache[p2]
end
function t.PlayPose(p1, p2) --[[ PlayPose | Line: 586 ]]
	local v1 = p1._animationCache[p2] or p1:_loadAnimation(p2)
	if p2 == "Sit" then
		v1.Priority = Enum.AnimationPriority.Idle
	end
	v1:Play()
end
function t.StopPose(p1, p2) --[[ StopPose | Line: 594 ]]
	local v1 = p1._animationCache[p2]
	if not v1 then
		return
	end
	v1:Stop()
end
function t.YieldForCurrentCharacter(p1, p2) --[[ YieldForCurrentCharacter | Line: 601 ]]
	local v1 = if p2 then tick() + p2 else nil
	if not p1:GetCurrentCharacter() then
		repeat
			wait()
		until p1:GetCurrentCharacter() or v1 and v1 <= tick()
	end
	return p1:GetCurrentCharacter()
end
function t.YieldForNoCurrentCharacter(p1, p2) --[[ YieldForNoCurrentCharacter | Line: 615 ]]
	local v1 = if p2 then tick() + p2 else nil
	if p1:GetCurrentCharacter() then
		repeat
			wait()
		until not p1:GetCurrentCharacter() or v1 and v1 <= tick()
	end
	return not p1:GetCurrentCharacter()
end
function t.AddCharacterRemovingCallback(p1, p2) --[[ AddCharacterRemovingCallback | Line: 630 ]]
	local v1 = p1:GetCurrentCharacter()
	if not v1 then
		return
	end
	v1.Maid:GiveTask(p2)
end
function t.getCharacterFromModel(p1) --[[ getCharacterFromModel | Line: 638 | Upvalues: PlayerWrappers (copy) ]]
	for k, v in pairs(PlayerWrappers) do
		if p1 == k.Character then
			return v:GetCurrentCharacter()
		end
	end
end
function t.GetCurrentSlot(p1) --[[ GetCurrentSlot | Line: 647 | Upvalues: v1 (copy) ]]
	if v1 then
		return p1.CurrentSlot
	else
		return p1.SlotValue.Value
	end
end
function t.SetCurrentSlot(p1, p2) --[[ SetCurrentSlot | Line: 656 | Upvalues: v1 (copy) ]]
	if p2 then
		if v1 then
			p1.CurrentSlot = p1:_getSlotValue(p2)
			p1.SlotValue.Value = p1:_getReplicatedSlotValue(p2)
		end
	else
		p1.CurrentSlot = nil
		p1.SlotValue.Value = nil
	end
end
function t.ResetCameraToPlayer(p1, p2, p3) --[[ ResetCameraToPlayer | Line: 669 | Upvalues: v14 (copy) ]]
	local Camera = workspace.Camera
	Camera.CameraType = Enum.CameraType.Custom
	Camera.CameraSubject = workspace.CurrentCamera:FindFirstChild("CameraPart")
	v14.InCutscene = false
end
function t.YieldForCharacter(p1) --[[ YieldForCharacter | Line: 678 | Upvalues: RunService (copy) ]]
	repeat
		RunService.Heartbeat:Wait()
	until p1.Character and p1.PrimaryPart
	return p1.Character
end
function t.IsLocalOrServer(p1) --[[ IsLocalOrServer | Line: 686 | Upvalues: v1 (copy) ]]
	return p1.IsLocalPlayer or v1
end
function t.SetProperty(p1, p2, p3) --[[ SetProperty | Line: 691 | Upvalues: t (copy) ]]
	if type(p2) ~= "string" then
		warn("\226\154\160\239\184\143 PlayerWrapper, SetProperty key must be a string")
		return false
	end
	if t[p2] == nil then
		p1[p2] = p3
		return true
	else
		warn("\226\154\160\239\184\143 PlayerWrapper, Cannot set class property:", p2)
		return false
	end
end
function t.HasPermission(p1, p2) --[[ HasPermission | Line: 708 ]]
	return p1.PermissionsFolder:WaitForChild(p2, 5).Value
end
function t.GetPermissionChangedSignal(p1, p2) --[[ GetPermissionChangedSignal | Line: 713 ]]
	return p1.PermissionsFolder:WaitForChild(p2):GetPropertyChangedSignal("Value")
end
function t.EnablePlayerControls(p1) --[[ EnablePlayerControls | Line: 718 ]]
	p1.ControlsDisabled = false
	if p1.PlayerControls then
		p1.PlayerControls:Enable()
		game.GuiService.TouchControlsEnabled = true
	end
end
function t.DisablePlayerControls(p1) --[[ DisablePlayerControls | Line: 729 ]]
	if p1.PlayerControls then
		p1.PlayerControls:Disable()
		game.GuiService.TouchControlsEnabled = false
	end
end
function t.SetReplicatedData(p1, p2, p3) --[[ SetReplicatedData | Line: 738 ]]
	p1.ReplicationGui:SetAttribute(p2, p3)
	return p1.ReplicationGui:GetAttribute(p2)
end
function t.GetReplicatedData(p1, p2) --[[ GetReplicatedData | Line: 744 ]]
	return p1.ReplicationGui:GetAttribute(p2)
end
function t.GetReplicatedDataChangedSignal(p1, p2) --[[ GetReplicatedDataChangedSignal | Line: 749 ]]
	return p1.ReplicationGui:GetAttributeChangedSignal(p2)
end
function t.IsLocalPlayerFromTouched(p1, p2) --[[ IsLocalPlayerFromTouched | Line: 754 | Upvalues: Players (copy), LocalPlayer (copy) ]]
	local v1 = Players:GetPlayerFromCharacter(p2.Parent)
	if not v1 then
		return
	end
	if v1 == LocalPlayer then
		return true
	end
end
function t.IsInRange(p1, p2, p3) --[[ IsInRange | Line: 763 ]]
	if not p1.PrimaryPart then
		return
	end
	local Magnitude = (p2 - p1.PrimaryPart.Position).Magnitude
	if Magnitude <= p3 then
		return Magnitude
	end
end
function t.GetCurrentAnimal(p1) --[[ GetCurrentAnimal | Line: 773 ]]
	return p1.CurrentHorse
end
function t.IsCoriding(p1) --[[ IsCoriding | Line: 777 ]]
	if p1.Humanoid and p1.Humanoid.SeatPart then
		return not p1.Humanoid.SeatPart:IsDescendantOf(p1.EquippedAnimalsFolder)
	else
		return false
	end
end
function t.PlayerRemoved(p1) --[[ PlayerRemoved | Line: 787 ]]
	p1.Removed = true
	for k, v in pairs(p1.OnRemoved) do
		local v1, v2 = pcall(v)
		if not v1 then
			warn(p1.Player.Name .. " - Error with OnRemoved function", v2)
		end
	end
end
function t.CanSaveData(p1) --[[ CanSaveData | Line: 798 ]]
	return true
end
function t.CanAutoSave(p1) --[[ CanAutoSave | Line: 803 | Upvalues: v4 (copy) ]]
	if not p1:CanSaveData() then
		return
	end
	if p1.Removed then
		return
	end
	if v4.Get() - p1.LastAutosave < 60 then
	else
		return true
	end
end
function t.Autosave(p1) --[[ Autosave | Line: 811 | Upvalues: v4 (copy), v7 (copy), v13 (copy), RunService (copy), Sonar (copy) ]]
	task.spawn(function() --[[ Line: 812 | Upvalues: p1 (copy), v4 (ref), v7 (ref), v13 (ref), RunService (ref), Sonar (ref) ]]
		p1.LastAutosave = v4.Get()
		p1.Autosaved = false
		local v1 = pcall(function() --[[ Line: 816 | Upvalues: v7 (ref), p1 (ref) ]]
			v7:SaveFolderAsync(p1.Player, p1.PlayerData)
		end)
		p1.Autosaved = true
		if not v1 then
			return
		end
		if p1.NotifiedSave then
			return
		end
		p1.NotifiedSave = true
		if not (v13.IsMarketWorld() or RunService:IsStudio()) then
			return
		end
		Sonar("NotificationsService").NotifyPlayer(p1.Player, "DataSynced")
	end)
end
function t.IsInAction(p1, p2) --[[ IsInAction | Line: 838 ]]
	local v1 = p1.ActionValues[p2]
	if typeof(v1) ~= "Instance" then
		return v1
	end
	if not v1:IsA("StringValue") then
		return v1.Value
	end
	return if #v1.Value > 0 then v1.Value else false
end
function t.SetActionState(p1, p2, p3) --[[ SetActionState | Line: 852 ]]
	local v1 = p1.ActionValues[p2]
	if typeof(v1) ~= "Instance" then
		p1.ActionValues[p2] = p3
		return
	end
	if not v1:IsA("StringValue") then
		v1.Value = p3
		return
	end
	v1.Value = if p3 then tostring(p3) or "" else ""
end
function t.OnActionChanged(p1, p2) --[[ OnActionChanged | Line: 866 ]]
	return p1.ActionValues[p2]:GetPropertyChangedSignal("Value")
end
function t.PushToWebhook(p1, p2, p3) --[[ PushToWebhook | Line: 871 | Upvalues: v1 (copy), v10 (copy) ]]
	if v1 then
		v10:Push(p2, p3, p1)
	end
end
function t.GetABTestState(p1, p2, p3) --[[ GetABTestState | Line: 878 | Upvalues: v13 (copy) ]]
	if v13.IsTestGame() then
		return p3
	else
		return p1.Player:GetAttribute(p2)
	end
end
function t.GetABTestStateChangedSignal(p1, p2) --[[ GetABTestStateChangedSignal | Line: 885 ]]
	return p1.Player:GetAttributeChangedSignal(p2)
end
function t.getWrapperFromPlayer(p1) --[[ getWrapperFromPlayer | Line: 890 | Upvalues: PlayerWrappers (copy) ]]
	return PlayerWrappers[p1]
end
function t.getWrapperFromUserId(p1) --[[ getWrapperFromUserId | Line: 895 | Upvalues: PlayerWrappers (copy) ]]
	for v1, v2 in PlayerWrappers do
		if v2.Player.UserId == p1 then
			return v2
		end
	end
end
function t.getWrapperWithYield(p1) --[[ getWrapperWithYield | Line: 903 | Upvalues: PlayerWrappers (copy) ]]
	local v1 = PlayerWrappers[p1]
	local v2 = tick()
	if not v1 then
		local v3 = nil
		repeat
			if not p1.Parent then
				return nil
			end
			v1 = PlayerWrappers[p1]
			if v1 then
				break
			end
			wait()
			if not v3 and tick() - v2 >= 30 then
				warn("Wrapper.getWrapperWithYield() is yielding", debug.traceback())
				v3 = true
			end
		until v1
	end
	return v1
end
function t.getWrapperWithYieldAndWrappersLoaded(p1) --[[ getWrapperWithYieldAndWrappersLoaded | Line: 923 | Upvalues: t (copy) ]]
	local v1 = t.getWrapperWithYield(p1)
	if not v1 then
		return
	end
	local v2 = tick()
	local v3 = nil
	repeat
		task.wait()
		if not v3 and tick() - v2 >= 30 then
			warn("getWrapperWithYieldAndWrappersLoaded() is yielding", debug.traceback())
			v3 = true
		end
	until v1.WrappersLoaded
	return v1
end
function t.GetClient() --[[ GetClient | Line: 940 | Upvalues: v1 (copy), PlayerWrappers (copy), LocalPlayer (copy) ]]
	if v1 then
		return
	end
	local v12 = tick()
	local v2 = PlayerWrappers[LocalPlayer]
	if not v2 then
		local v3 = false
		while true do
			if not v3 and tick() - v12 >= 10 then
				warn("\226\154\160\239\184\143 PlayerWrapper, GetClient is yielding", debug.traceback())
				v3 = true
			end
			v2 = PlayerWrappers[LocalPlayer]
			if v2 then
				return v2
			end
			task.wait()
			if v2 then
				return v2
			end
		end
	end
	return v2
end
function t.GetPlayers() --[[ GetPlayers | Line: 963 | Upvalues: PlayerWrappers (copy) ]]
	return PlayerWrappers
end
function t.bindToPlayers(p1, p2) --[[ bindToPlayers | Line: 968 | Upvalues: t (copy) ]]
	local function playerAdded(p12) --[[ playerAdded | Line: 969 | Upvalues: t (ref), p1 (copy) ]]
		local v1 = t.getWrapperFromPlayer(p12)
		if not v1 then
			return
		end
		if not v1.Loaded then
			return
		end
		if not v1.bindFunctions then
			v1.bindFunctions = {}
		end
		if not v1.bindFunctions[p1] then
			v1.bindFunctions[p1] = true
			p1(p12, v1)
		end
	end
	t.PlayerAdded:Connect(playerAdded)
	if p2 then
		t.PlayerRemoving:Connect(p2)
	end
	for k, v in pairs(t.GetPlayers()) do
		task.spawn(playerAdded, v.Player)
	end
end
v14.PlayerWrappers = PlayerWrappers
t.PlayerLoadedOnClient = v14.PlayerLoadedOnClient
t.PlayerOctree = v18
t.PlayerAdded = v14.PlayerAddedSignal
t.PlayerRemoving = v14.PlayerRemovedSignal
if v1 then
	v6.GetRemoteEvent("ClientLoadedRemote").OnServerEvent:Connect(function(p1) --[[ Line: 1003 | Upvalues: t (copy) ]]
		local v1 = t.getWrapperFromPlayer(p1)
		if v1 then
			v1.OnClientLoaded:Fire()
			t.PlayerLoadedOnClient:Fire(p1)
		end
	end)
	v6.GetRemoteEvent("WildMode").OnServerEvent:Connect(function(p1, p2) --[[ Line: 1012 | Upvalues: t (copy) ]]
		local v1 = t.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		v1.Character:SetAttribute("WildMode", p2)
	end)
	v6.GetRemoteEvent("Unseat").OnServerEvent:Connect(function(p1) --[[ Line: 1020 | Upvalues: t (copy) ]]
		local v1 = t.getWrapperFromPlayer(p1)
		if not v1 then
			return
		end
		local Character = v1.Character
		if not Character then
			return
		end
		local Humanoid = Character.Humanoid
		if not (Humanoid and Humanoid.SeatPart) then
			return
		end
		Humanoid.SeatPart.SeatWeld:Destroy()
	end)
	local function setPosition(p1, p2) --[[ setPosition | Line: 1033 | Upvalues: v18 (copy) ]]
		local v1 = not p1._destroyed and p1.Character or nil
		if not v1 then
			return
		end
		local PrimaryPart = v1.PrimaryPart
		local v2 = (if PrimaryPart then PrimaryPart else v1:FindFirstChildWhichIsA("BasePart", true)) or {
			Position = Vector3.new(0, 0, 0)
		}
		if p2 then
			v18:UpdateFor(p1.Player.Name, v2.Position)
		end
		v1:SetAttribute("P", v2.Position)
	end
	task.spawn(function() --[[ Line: 1052 | Upvalues: PlayerWrappers (copy), setPosition (copy) ]]
		while true do
			for v1, v2 in PlayerWrappers do
				setPosition(v2, true)
			end
			task.wait(1)
		end
	end)
	v16:subscribe(function(p1, p2) --[[ Line: 1062 | Upvalues: PlayerWrappers (copy) ]]
		p2:add(task.spawn(function() --[[ Line: 1063 | Upvalues: p1 (copy), PlayerWrappers (ref) ]]
			if not p1 then
				return
			end
			while true do
				for v1, v2 in PlayerWrappers do
					local v3 = if v2._destroyed then nil else v2.Character or nil
					if v3 then
						local PrimaryPart = v3.PrimaryPart
						v3:SetAttribute("P", ((if PrimaryPart then PrimaryPart else v3:FindFirstChildWhichIsA("BasePart", true)) or {
							Position = Vector3.new(0, 0, 0)
						}).Position)
					end
				end
				task.wait(0.16666666666666666)
			end
		end))
	end)
end
return t