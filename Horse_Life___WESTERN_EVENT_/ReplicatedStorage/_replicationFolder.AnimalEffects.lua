-- https://lua.expert/
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(game.ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local LocalPlayer = game.Players.LocalPlayer
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("MathUtils")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("Signal")
local v6 = Sonar("AnimalData")
local v7 = Sonar("SettingsService")
local v8 = Sonar("Octree")
local v9 = Sonar("InputTypeDetector")
local v10 = Sonar("spr")
local v11 = Sonar("Constants")
local v12 = Sonar("AnimalCosmetics")
local v13 = Sonar("AnimalOverhead")
local v14 = Sonar("InteractMenu")
local v15 = Sonar("IssueResponseClient")
local v16 = Sonar("AnimalDataService")
local v17 = Sonar("NotificationsClient")
Sonar("Constants")
local v18 = Sonar("TutorialService")
local v19 = LocalPlayer:GetMouse()
local v20 = v9.IsMobileInputType()
local v21 = v4.GetRemoteEvent("Unseat")
local t = {}
t.__index = t
function t.GetWrapper(p1) --[[ GetWrapper | Line: 39 | Upvalues: v2 (copy) ]]
	if not p1.Wrapper then
		p1.Wrapper = v2.getWrapperFromPlayer(p1.Player) or false
	end
	return p1.Wrapper
end
local v22 = v2.GetClient()
local v23 = v9.IsMobileInputType()
local t2 = {}
local t3 = {}
local v24 = nil
local AnimalRenderBin = Instance.new("Folder", game.ReplicatedStorage)
AnimalRenderBin.Name = "AnimalRenderBin"
local v25 = v8.new("LocalAnimals", 2, 512)
local v26 = Vector3.new(0, 0, 0)
local Particles = game.ReplicatedStorage.Storage.Assets.Particles
local function isTail(p1) --[[ isTail | Line: 61 ]]
	local v1 = p1:lower()
	local v2 = v1:sub(0, 1) == "t"
	return if v2 then tonumber(v1:sub(2)) else v2
end
local function isNeck(p1) --[[ isNeck | Line: 67 ]]
	local v1 = p1:lower()
	local v2 = v1:sub(0, 1) == "n"
	return if v2 then tonumber(v1:sub(2)) else v2
end
local function isWaist(p1) --[[ isWaist | Line: 73 ]]
	return p1:lower() == "waist"
end
local function addSecondaryJoints(p1) --[[ addSecondaryJoints | Line: 79 | Upvalues: Particles (copy), v13 (copy) ]]
	if not p1.Root then
		return
	end
	if p1._destroyed then
		return
	end
	if not p1._isRendered then
		return
	end
	p1._madeJoints = true
	p1.Tails = {}
	p1.Neck = {}
	p1.Body = {}
	p1.MiddleBody = {}
	p1.LowerBody = {}
	p1.Feet = {}
	p1.Waist = {}
	p1.DeloadParts = {}
	p1.Noses = {}
	p1.Jaw = nil
	local function addTail(p12) --[[ addTail | Line: 103 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Bone") then
			return
		end
		local v1 = p12.Name:lower()
		local v2 = v1:sub(0, 1) == "t"
		if not (v2 and tonumber(v1:sub(2))) then
			return
		end
		p1.Tails[#p1.Tails + 1] = { p12, p12.Transform }
	end
	local function addNeck(p12) --[[ addNeck | Line: 117 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Bone") then
			return
		end
		local v1 = p12.Name:lower()
		local v2 = v1:sub(0, 1) == "n"
		if not (v2 and tonumber(v1:sub(2))) then
			return
		end
		p1.Neck[#p1.Neck + 1] = { p12, p12.Transform }
	end
	local function addBody(p12) --[[ addBody | Line: 131 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Bone") then
			return
		end
		local v1 = p12.Name
		if v1 == "UpperBody" or v1 == "Root" then
			p1.Body[#p1.Body + 1] = { p12, p12.Transform }
			return
		end
		if v1 == "MiddleBody" then
			p1.MiddleBody[#p1.MiddleBody + 1] = { p12, p12.Transform }
			return
		end
		if v1 == "LowerBody" then
			p1.LowerBody[#p1.LowerBody + 1] = { p12, p12.Transform }
			return
		end
		if not (v1:lower() == "waist") then
			return
		end
		p1.Waist[#p1.Waist + 1] = { p12, p12.Transform }
	end
	local function addFoot(p1) --[[ addFoot | Line: 144 ]]
		local _ = p1:IsA("BasePart")
	end
	local function addNose(p12) --[[ addNose | Line: 149 | Upvalues: Particles (ref), p1 (copy) ]]
		if not p12:IsA("Attachment") then
			return
		end
		if p12.Name ~= "Nose" then
			return
		end
		local v1 = Particles.Breath:Clone()
		v1.Enabled = false
		v1.Parent = p12
		p1.Noses[#p1.Noses + 1] = v1
	end
	local function addHead(p12) --[[ addHead | Line: 158 | Upvalues: p1 (copy), v13 (ref) ]]
		if not p12:IsA("Bone") then
			return
		end
		if p12.Name ~= "Head" or p1.Head then
			return
		end
		p1.Head = p12
		p1.Maid:GiveTask(v13.new(p1))
	end
	local function setTouch() --[[ setTouch | Line: 167 | Upvalues: p1 (copy) ]]
		p1.Root.CanTouch = true
	end
	p1.Root.CanTouch = true
	local function addDeloadPart(p12) --[[ addDeloadPart | Line: 171 | Upvalues: p1 (copy) ]]
		if p12:HasTag("StreamableMeshObject") then
			p1.DeloadParts[#p1.DeloadParts + 1] = p12
		end
		if p1.IsLocal or not p12:IsA("BasePart") then
			return
		end
		p12.CanCollide = false
		p12.CanTouch = false
		p12.CanQuery = false
	end
	p1.Maid:GiveTask(p1.Model.DescendantAdded:Connect(function(p12) --[[ Line: 183 | Upvalues: addTail (copy), addNeck (copy), addBody (copy), Particles (ref), p1 (copy), v13 (ref) ]]
		addTail(p12)
		addNeck(p12)
		addBody(p12)
		p12:IsA("BasePart")
		if p12:IsA("Attachment") and p12.Name == "Nose" then
			local v1 = Particles.Breath:Clone()
			v1.Enabled = false
			v1.Parent = p12
			p1.Noses[#p1.Noses + 1] = v1
		end
		if p12:IsA("Bone") and (p12.Name == "Head" and not p1.Head) then
			p1.Head = p12
			p1.Maid:GiveTask(v13.new(p1))
		end
		if p12:HasTag("StreamableMeshObject") then
			p1.DeloadParts[#p1.DeloadParts + 1] = p12
		end
		if p1.IsLocal or not p12:IsA("BasePart") then
			return
		end
		p12.CanCollide = false
		p12.CanTouch = false
		p12.CanQuery = false
	end))
	for k, v in pairs(p1.Model:GetDescendants()) do
		addTail(v)
		addNeck(v)
		addBody(v)
		v:IsA("BasePart")
		if v:IsA("Attachment") and v.Name == "Nose" then
			local v1 = Particles.Breath:Clone()
			v1.Enabled = false
			v1.Parent = v
			p1.Noses[#p1.Noses + 1] = v1
		end
		if v:IsA("Bone") and (v.Name == "Head" and not p1.Head) then
			p1.Head = v
			p1.Maid:GiveTask(v13.new(p1))
		end
		if v:HasTag("StreamableMeshObject") then
			p1.DeloadParts[#p1.DeloadParts + 1] = v
		end
		if not p1.IsLocal and v:IsA("BasePart") then
			v.CanCollide = false
			v.CanTouch = false
			v.CanQuery = false
		end
	end
	p1._rigged = true
end
local v27 = true
function t._updateParent(p1, p2) --[[ _updateParent | Line: 211 | Upvalues: v20 (copy), v27 (ref), AnimalRenderBin (copy) ]]
	if p1._destroyed then
		return
	end
	if not p2 and tick() < (p1._nextParentUpdate or 0) then
		return
	end
	p1._nextParentUpdate = tick() + 0.25
	local v1 = p1.Model.Parent
	local OriginalParent = p1.OriginalParent
	p1._isRendered = true
	if not p1.IsLocal then
		if (if v20 then 80 else 200) < p1._lastDistance then
			p1._isRendered = false
		end
		if not (p1.IsRiding or v27) then
			OriginalParent = AnimalRenderBin
		end
	end
	if p2 or p1.IsRiding then
		OriginalParent = p1.OriginalParent
	end
	if not ((if p2 then 0 else 1.5) < tick() - (p1._lastReparent or 0)) or v1 == OriginalParent then
		return
	end
	p1._lastReparent = tick()
	p1.Model.Parent = OriginalParent
end
function t.new(p1) --[[ new | Line: 250 | Upvalues: t (copy), Players (copy), v2 (copy), v6 (copy), Sonar (copy), v16 (copy), v1 (copy), LocalPlayer (copy), v25 (copy), v5 (copy), RunService (copy), v22 (copy), v21 (copy), v24 (ref), t2 (copy), v12 (copy), v14 (copy), v18 (copy), v4 (copy), v17 (copy), v15 (copy), v7 (copy), UserInputService (copy), v11 (copy) ]]
	local v23 = setmetatable({}, t)
	v23.Model = p1
	v23.Seat = p1:WaitForChild("Seat")
	v23.RiderSeat = p1:WaitForChild("RiderSeat")
	v23.Player = Players:FindFirstChild(p1.Parent.Parent.Name)
	v23.Wrapper = v2.getWrapperFromPlayer(v23.Player) or false
	v23.Species = p1:WaitForChild("Data"):GetAttribute("Species")
	v23.Root = p1:WaitForChild("HumanoidRootPart")
	v23.PrimaryPart = v23.Model.PrimaryPart
	v23.NextLookUpdate = tick() + 0.25
	v23.Data = v6.GetOrCreateAnimalData(p1, v23.Player)
	v23.AnimalData = v23.Data
	v23.AnimalInstance = Sonar("Animal").GetAnimalFromModel(v23.Model)
	v23.SpeciesData = v16.GetByName(v23.Species)
	v23._lastDistance = 9000000000
	v23._isRendered = false
	v23.Maid = v1.new()
	v23.Maid:GiveTask(v23.Data)
	v23.IsLocal = v23.Player == LocalPlayer
	if not v23.IsLocal then
		local Eyelid = p1:FindFirstChild("Eyelid")
		if Eyelid then
			Eyelid:Destroy()
		end
	end
	v23.LastWalkCycleRefresh = tick() + 1
	v23.NextOctreeUpdate = tick() + 3
	v25:Add(v23, v23.Root.Position)
	local v3 = true
	v23.NeckVector = Instance.new("Vector3Value")
	v23.Maid:GiveTask(v23.NeckVector)
	v23.VelocityVector = Instance.new("Vector3Value")
	v23.Maid:GiveTask(v23.VelocityVector)
	if v23.IsLocal then
		v23.Blink = v23.Model:WaitForChild("Eye")
	end
	v23.StepSignal = v5.new()
	v23.Maid:GiveTask(v23.StepSignal)
	v23.StepSignal:Connect(function() --[[ Line: 311 | Upvalues: v23 (copy) ]]
		v23:UpdateSecondaryMotors()
	end)
	v23.HeartbeatSignal = v5.new()
	v23.Maid:GiveTask(v23.HeartbeatSignal)
	v23.HeartbeatSignal:Connect(function(p1) --[[ Line: 318 | Upvalues: v23 (copy), v3 (ref) ]]
		if v23.IsLocal then
			v23:Step(p1)
			return
		end
		v3 = not v3
		if v3 then
			v23:Step(p1)
		end
	end)
	if v23.IsLocal then
		v23.Maid:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 327 | Upvalues: v23 (copy) ]]
			v23.HeartbeatSignal:Fire(p1)
		end))
	end
	v23.RootSize = v23.Root.Size
	v23.OriginalParent = v23.Model.Parent
	local v42 = tick()
	local function unseatPassenger() --[[ unseatPassenger | Line: 337 | Upvalues: v23 (copy), LocalPlayer (ref), v22 (ref), v42 (ref), v21 (ref) ]]
		if not v23.AreWeSeated and (v23.RiderSeat.Occupant ~= LocalPlayer.Character.Humanoid and LocalPlayer.Character.Humanoid.SeatPart ~= v23.RiderSeat) then
			return
		end
		v22:StopPose("Sit")
		LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
		v23.AreWeSeated = false
		if tick() - v42 < 0.1 then
			return
		end
		v42 = tick()
		v21:FireServer()
	end
	local function updateRider() --[[ updateRider | Line: 349 | Upvalues: v23 (copy), LocalPlayer (ref), v24 (ref), unseatPassenger (copy) ]]
		local Occupant = v23.Seat.Occupant
		local SeatPart = LocalPlayer.Character.Humanoid.SeatPart
		if SeatPart then
			SeatPart = SeatPart:IsDescendantOf(v23.Model)
		end
		v23.AreWeSeated = SeatPart
		if Occupant then
			v23.IsRiding = if Occupant == v23.Player.Character.Humanoid then true else SeatPart
			if v23.IsLocal then
				v24 = v23
			end
			v23:_updateParent(true)
		else
			v23.IsRiding = nil
			if v23.IsLocal then
				v24 = nil
			end
			if not v23.AreWeSeated then
				return
			end
			unseatPassenger()
		end
	end
	v23.Maid:GiveTask((v23.Seat:GetPropertyChangedSignal("Occupant"):Connect(updateRider)))
	updateRider()
	t2[p1] = v23
	v23.Cosmetics = v12.new(v23.Model)
	v23.Maid:GiveTask(v23.Cosmetics)
	v23.EyeColorAnimations = {}
	task.wait()
	v23:_updateParent()
	v23.SeatAttach = p1.Seat.Attachment
	v23.SeatAttach:SetAttribute("OriginalOffset", v23.SeatAttach.Position)
	local function updateSeatOffset() --[[ updateSeatOffset | Line: 389 | Upvalues: p1 (copy), v23 (copy) ]]
		local v1 = p1:GetAttribute("SeatOffset")
		local v2 = v23.SeatAttach:GetAttribute("OriginalOffset")
		if not v2 then
			return
		end
		if v1 then
			v23.SeatAttach.Position = v2 - v1
			return
		end
		v23.SeatAttach.Position = v2
	end
	v23.Maid:GiveTask(p1:GetAttributeChangedSignal("SeatOffset"):Connect(updateSeatOffset))
	local v62 = p1:GetAttribute("SeatOffset")
	local v72 = v23.SeatAttach:GetAttribute("OriginalOffset")
	if v72 and v62 then
		v23.SeatAttach.Position = v72 - v62
	elseif v72 then
		v23.SeatAttach.Position = v72
	end
	if v23.IsLocal then
		v23.Maid:GiveTask(v23.Model:GetAttributeChangedSignal("HeadLock"):Connect(function() --[[ Line: 551 | Upvalues: v23 (copy) ]]
			v23.HeadLocked = v23.Model:GetAttribute("HeadLock")
		end))
		v23.HeadLocked = v23.Model:GetAttribute("HeadLock")
	else
		v23.InteractMenu = v14.new(v23.PrimaryPart:WaitForChild("MiddleBody"):WaitForChild("UpperBody"), {
			SetOpenPosition = true,
			Scale = 0.65,
			Hint = function() --[[ Hint | Line: 407 | Upvalues: v23 (copy) ]]
				return "Interact with\n" .. v23.Player.DisplayName .. "\'s Horse"
			end,
			HintSize = UDim2.new(7, 0, 1.3, 0),
			CanFocus = function() --[[ CanFocus | Line: 413 ]]
				return true
			end,
			Visibility = function() --[[ Visibility | Line: 417 | Upvalues: v18 (ref), v23 (copy) ]]
				if _G.HideHorseInteracts then
					return false
				end
				if v18.GetGameState("OtherHorseInteract") then
					return v23.IsRiding
				else
					return false
				end
			end
		})
		v23.InteractMenu:_addOption({
			Hint = function() --[[ Hint | Line: 428 | Upvalues: v22 (ref) ]]
				return "Feed Item", if v22.EquippedTool then v22.EquippedTool.ToolData.Image or "rbxassetid://16190522266" else "rbxassetid://16190522266"
			end,
			HintChanged = v22.EquippedToolChangedSignal,
			Visibility = function() --[[ Visibility | Line: 434 | Upvalues: v22 (ref) ]]
				local EquippedTool = v22.EquippedTool
				if not EquippedTool then
					return
				end
				return EquippedTool.ToolData.ItemType == "Food"
			end,
			Run = function() --[[ Run | Line: 439 | Upvalues: v22 (ref), Sonar (ref), v23 (copy), v4 (ref), v17 (ref), v15 (ref) ]]
				local EquippedTool = v22.EquippedTool
				if not EquippedTool or EquippedTool.ToolData.ItemType ~= "Food" then
					Sonar("NotificationsClient").Notify({
						Message = "You haven\'t got any food equipped!",
						Preset = "Red",
						Type = "NoFoodFeed"
					})
					return
				end
				local v1 = v23.Model.Data:GetAttribute("ID")
				if not v1 then
					Sonar("NotificationsClient").Notify({
						Message = "Could not find horse data!",
						Preset = "Red"
					})
					return
				end
				local v2 = v4.GetRemoteFunction("FeedOtherPlayerHorseRemote"):InvokeServer(v23.Player.UserId, v1, EquippedTool.ToolData.Name)
				if v2 == true then
					local v3 = game.ReplicatedStorage.Storage.SFX.Feeding:GetChildren()
					v3[math.random(1, #v3)]:Play()
					v17.Notify({
						Preset = "Green",
						Type = "FeedOtherHorseSuccess",
						Message = "You have fed " .. v23.Player.DisplayName .. "\'s horse!"
					})
				else
					v15.NotifyIssue(v2, v23.Player)
				end
			end
		})
		v23.InteractMenu:_addOption({
			Hint = "CoRide",
			Image = "rbxassetid://18923578518",
			Visibility = function() --[[ Visibility | Line: 483 | Upvalues: v23 (copy), LocalPlayer (ref), v22 (ref), v24 (ref) ]]
				if not v23:GetWrapper() then
					return false
				end
				if not v23.IsRiding then
					return false
				end
				if LocalPlayer.Character.Humanoid.SeatPart then
					return false
				end
				if v23.RiderSeat.Occupant then
					return false
				end
				if v22:IsInAction("Maze") then
					return false
				end
				if v24 then
					return false
				else
					return not (v23.SpeciesData and v23.SpeciesData.ToyHorse)
				end
			end,
			Run = function() --[[ Run | Line: 507 | Upvalues: v24 (ref), v15 (ref), v23 (copy), v7 (ref), v22 (ref), Sonar (ref), LocalPlayer (ref), unseatPassenger (copy), UserInputService (ref), v11 (ref) ]]
				if v24 then
					v15.NotifyIssue("CannotCoRideWhileOnHorse", v23.Player)
					return
				end
				if v23.SpeciesData and v23.SpeciesData.ToyHorse then
					v15.NotifyIssue("ToyHorseCannotCoRide", v23.Player)
					return
				end
				local v1 = v7.GetRequestStatusForPlayer(v22, v23:GetWrapper(), "CoRide")
				if v1 ~= true then
					v15.NotifyIssue("Ride" .. v1, v23.Player)
					return
				end
				Sonar("CharacterSprintService"):StopCrouching()
				repeat
					v23.RiderSeat:Sit(LocalPlayer.Character.Humanoid)
					task.wait()
				until LocalPlayer.Character.Humanoid.SeatPart
				v22:PlayPose("Sit")
				LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("SeatPart"):Once(function() --[[ Line: 530 | Upvalues: unseatPassenger (ref) ]]
					unseatPassenger()
				end)
				UserInputService.JumpRequest:Once(function() --[[ Line: 533 | Upvalues: unseatPassenger (ref) ]]
					unseatPassenger()
				end)
				LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Jump"):Once(function() --[[ Line: 536 | Upvalues: unseatPassenger (ref) ]]
					unseatPassenger()
				end)
				v23.Maid:GiveTask(v11.RaceStartedSignal:Connect(function() --[[ Line: 539 | Upvalues: unseatPassenger (ref) ]]
					unseatPassenger()
				end))
				v23.Maid:GiveTask(v23:GetWrapper():OnActionChanged("Race"):Connect(function() --[[ Line: 542 | Upvalues: unseatPassenger (ref) ]]
					unseatPassenger()
				end))
			end
		})
		v23.Maid:GiveTask(v23.InteractMenu)
	end
	return v23
end
local v28 = false
function t.Step(p1, p2) --[[ Step | Line: 561 | Upvalues: addSecondaryJoints (copy), v23 (copy), v10 (copy), v28 (ref), v26 (ref) ]]
	if p1._destroyed then
		return
	end
	if not (p1.Data and p1.Data.Get) then
		return
	end
	p1:_updateOctree()
	p1:_updateParent()
	if p1._rigged then
		if not p1._isRendered then
			return
		end
		if v23 and not p1.IsLocal then
			return
		end
		p1.LocalVelocity = p1.LocalVelocity or Vector3.new(0, 0, 0)
		p1.LerpLocalVelocity = p1.LerpLocalVelocity or Vector3.new(0, 0, 0)
		local v1 = p1.Root.AssemblyAngularVelocity or Vector3.new(0, 0, 0)
		local v4 = p1.Root.CFrame:VectorToObjectSpace((Vector3.new(v1.X, math.clamp(v1.Y, -3, 3), v1.Z)))
		p1.LerpLocalVelocity = p1.LerpLocalVelocity:lerp(v4, 0.05)
		if p1.IsLocal then
			v10.target(p1.VelocityVector, 0.35, 1, {
				Value = v4
			})
			p1.LocalVelocity = p1.VelocityVector.Value
		else
			p1.LocalVelocity = p1.LerpLocalVelocity
		end
		v28 = p1.IsLocal or not v28
		if p1.IsLocal then
			v26 = p1.Root.Position
		end
		if p1.IsLocal and (p1.Blink and (p1._lastDistance and (p1._lastDistance < 50 and tick() >= (p1._nextBreath or 0)))) then
			p1._nextBreath = tick() + math.random(4, 6)
			for v6, v7 in p1.Noses do
				v7.Enabled = true
				task.delay(0.5, function() --[[ Line: 627 | Upvalues: v7 (copy) ]]
					v7.Enabled = false
				end)
			end
		end
		p1:_updateEyeColorAnimations()
	else
		if not p1._isRendered or p1._madeJoints then
			return
		end
		addSecondaryJoints(p1)
	end
end
function t._updateOctree(p1) --[[ _updateOctree | Line: 653 | Upvalues: v25 (copy) ]]
	if tick() < p1.NextOctreeUpdate then
		return
	end
	local Character = p1.Player.Character
	p1.Character = Character
	if not Character then
		return
	end
	p1.OriginalParent = Character.Animals
	p1._lastPosition = p1._isRendered and p1.Root.Position or Character:GetPivot().p
	p1._lastDistance = (workspace.CurrentCamera.CFrame.p - p1._lastPosition).Magnitude
	p1.NextOctreeUpdate = p1._lastDistance < 700 and tick() + 1 or tick() + 1.75
	v25:UpdateFor(p1, p1._lastPosition)
end
local function rotateGlobal(p1, p2, p3) --[[ rotateGlobal | Line: 673 ]]
	return p1 * CFrame.fromAxisAngle(p1:VectorToObjectSpace(p3), p2)
end
function t.SetHeadTarget(p1, p2) --[[ SetHeadTarget | Line: 678 ]] end
function t._rotateJaw(p1, p2) --[[ _rotateJaw | Line: 682 ]] end
local function updateNeck(p1, p2) --[[ updateNeck | Line: 686 | Upvalues: Sonar (copy), CurrentCamera (copy), v19 (copy), v10 (copy), v3 (copy) ]]
	if not p2 then
		return
	end
	if not p1.AnimalInstance then
		p1.AnimalInstance = Sonar("Animal").GetAnimalFromModel(p1.Model)
		if not p1.AnimalInstance then
			return
		end
	end
	debug.profilebegin("Update Neck")
	local v1 = p1.HeadLocked and p1.Root.CFrame:PointToObjectSpace(p1.HeadLocked).Unit or (p1.IsRiding and p1.Root.CFrame:PointToObjectSpace((CurrentCamera.CFrame * CFrame.new(0, 0, -750)).p).Unit or p1.Root.CFrame:PointToObjectSpace(p1.Player.Character.PrimaryPart.Position).Unit)
	local v2 = #p1.Neck
	local v32, v4
	if v1 then
		v32 = -math.atan2(v1.x, -v1.z)
		v4 = math.asin(v1.y)
	else
		v32 = p1.Model.LookDirectionX.Value / 127
		v4 = p1.Model.LookDirectionY.Value / 127
	end
	if p1.AnimalInstance then
		if p1.SpeciesData.DoNotMoveNeckWhenSitting == true then
			p1.CannotUpdateNeck = p1.AnimalInstance.AfkPose == "Lay"
		else
			p1.CannotUpdateNeck = false
		end
	end
	if _G.HidePlayersAndAnimals or p1.CannotUpdateNeck == true then
		v4 = 0
		v32 = 0
	elseif p2 and (math.abs(v32) > 2.2 and not p1.HeadLocked) then
		if p1.IsRiding then
			local ViewportSize = workspace.CurrentCamera.ViewportSize
			local X = ViewportSize.X
			local Y = ViewportSize.Y
			local p = (CurrentCamera.CFrame * CFrame.new((v19.X - X / 2) / X * 100, -(v19.Y - Y / 2) / Y * 100, 0)).p
			p1._lastMouseFollowPosition = p
			local Unit = p1.Root.CFrame:PointToObjectSpace(p).Unit
			local v9 = math.asin(Unit.y)
			v32 = -math.atan2(Unit.x, -Unit.z)
			v4 = v9
		else
			v4 = 0
			v32 = 0
		end
	end
	p1._lastHorizontal = p1._lastHorizontal or 0
	p1._lastVertical = p1._lastVertical or 0
	v10.target(p1.NeckVector, 0.8, 1.25, {
		Value = Vector3.new(v4 / v2, v32 / v2, 0)
	})
	p1._lastHorizontal = p2 and p1.NeckVector.Value.Y or v3.lerp(p1._lastHorizontal, v32 / v2, 0.05)
	p1._lastVertical = p2 and p1.NeckVector.Value.X or v3.lerp(p1._lastVertical, v4 / v2, 0.05)
	if p1._lastHorizontal == 0 and p1._lastVertical == 0 then
		return
	end
	for k, v in pairs(p1.Neck) do
		local v13 = v[1].Parent
		if v13 then
			local v14 = Vector3.new(0, 1, 0)
			local UpVector = p1.Root.CFrame.UpVector
			local UpVector_2 = v13.WorldCFrame.UpVector
			local v15 = if UpVector_2:Dot(v14) >= UpVector:Dot(v14) then UpVector_2 else UpVector
			local v16 = v[1]
			local v17 = v13.WorldCFrame:Inverse()
			local v18 = v13.WorldCFrame * v[2]
			local v192 = v18:VectorToObjectSpace(v15)
			v16.Transform = v16.Transform * (v17 * (v18 * CFrame.fromAxisAngle(v192, p1._lastHorizontal)) * CFrame.Angles(-p1._lastVertical, 0, 0))
		end
	end
	debug.profileend()
end
function t.UpdateSecondaryMotors(p1) --[[ UpdateSecondaryMotors | Line: 790 | Upvalues: v23 (copy), CurrentCamera (copy), updateNeck (copy) ]]
	if not p1.LocalVelocity then
		return
	end
	local IsLocal = p1.IsLocal
	if not IsLocal and v23 then
		return
	end
	if not p1._isRendered then
		return
	end
	local Root = p1.Root
	if not Root then
		return
	end
	local _, v1 = CurrentCamera:WorldToViewportPoint(Root.Position)
	if not v1 then
		return
	end
	for k, v in pairs(p1.Tails) do
		local v2 = -12
		local v3 = 26
		if p1.ExtraTails then
			v2 = v2 * 1.5
			v3 = v3 * 1.5
		end
		local v4 = v[1]
		v4.Transform = v4.Transform * CFrame.Angles(math.rad(p1.LocalVelocity.X) * v2, -math.rad(p1.LocalVelocity.Y * v3) / #p1.Tails, math.rad(p1.LocalVelocity.Y * v3) / #p1.Tails)
	end
	local v9 = IsLocal and p1.VelocityVector.Value or p1.LerpLocalVelocity
	for k, v in pairs(p1.Body) do
		local v10 = v[1]
		v10.Transform = v10.Transform * CFrame.Angles(math.rad(v9.X * 20), math.rad(v9.Y * 4.5), (math.rad(v9.Y * 3)))
	end
	for k, v in pairs(p1.MiddleBody) do
		local v16 = v[1]
		v16.Transform = v16.Transform * CFrame.Angles(math.rad(v9.X * 10), math.rad(v9.Y * -6.5), (math.rad(v9.Y * 0)))
	end
	for k, v in pairs(p1.LowerBody) do
		local v22 = v[1]
		v22.Transform = v22.Transform * CFrame.Angles(math.rad(v9.X * 10), math.rad(v9.Y * -5.5), (math.rad(v9.Y * 1)))
	end
	if p1.CannotUpdateNeck then
		return
	end
	updateNeck(p1, IsLocal)
end
function t._updateEyeColorAnimations(p1) --[[ _updateEyeColorAnimations | Line: 859 | Upvalues: CurrentCamera (copy), v1 (copy) ]]
	if not (p1.Cosmetics and p1.Cosmetics.AddedMutations) then
		return
	end
	local v12 = nil
	for v2, v3 in p1.Cosmetics.AddedMutations do
		if v3.Mutation.Eyecolor1 and v3.Mutation.Eyecolor2 then
			v12 = v3
			break
		end
	end
	if v12 then
		local _isRendered = p1._isRendered
		if _isRendered and not p1.IsLocal then
			local _, v4 = CurrentCamera:WorldToViewportPoint(p1.Root.Position)
			_isRendered = if v4 then if p1._lastDistance < 200 then true else false else v4
		end
		local Eye = p1.Cosmetics.TagRegionsToInstanceMap.Eye
		if not Eye then
			return
		end
		for v6, v7 in Eye.Instances do
			if _isRendered then
				if not p1.EyeColorAnimations[v6] then
					local v8 = v1.new()
					p1.EyeColorAnimations[v6] = {
						UseColor1 = true,
						Maid = v8,
						LastChange = tick()
					}
					v8:GiveTask(task.spawn(function() --[[ Line: 902 | Upvalues: p1 (copy), v6 (copy), v12 (ref) ]]
						while p1.EyeColorAnimations[v6] do
							task.wait(2)
							if not p1.EyeColorAnimations[v6] then
								break
							end
							local v1 = p1.EyeColorAnimations[v6]
							v1.UseColor1 = not v1.UseColor1
							v6.Color = v1.UseColor1 and v12.Mutation.Eyecolor1 or v12.Mutation.Eyecolor2
						end
					end))
				end
				continue
			end
			if p1.EyeColorAnimations[v6] then
				p1.EyeColorAnimations[v6].Maid:Destroy()
				p1.EyeColorAnimations[v6] = nil
			end
		end
	else
		for v9, v10 in p1.EyeColorAnimations do
			v10.Maid:Destroy()
			p1.EyeColorAnimations[v9] = nil
		end
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 921 | Upvalues: v22 (copy), t2 (copy), v25 (copy) ]]
	p1._destroyed = true
	if p1.AreWeSeated then
		v22:StopPose("Sit")
	end
	t2[p1.Model] = nil
	v25:Remove(p1)
	p1.ObjectTransparencies = nil
	for v1, v2 in p1.EyeColorAnimations do
		v2.Maid:Destroy()
	end
	p1.EyeColorAnimations = nil
	p1.Maid:Destroy()
	p1.Model = nil
	p1.Data = nil
	p1.Root = nil
	p1.Player = nil
	setmetatable(p1, nil)
end
function t.GetAnimalsNearby(p1, p2, p3) --[[ GetAnimalsNearby | Line: 944 | Upvalues: v25 (copy) ]]
	return v25:RadiusSearch(p3, p2 or 100)
end
function t.GetAnimalFromModel(p1) --[[ GetAnimalFromModel | Line: 948 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
(function() --[[ init | Line: 952 | Upvalues: v18 (copy), v7 (copy), v22 (copy), v27 (ref), v11 (copy), RunService (copy), t3 (ref), v25 (copy), CurrentCamera (copy), v26 (ref), v23 (copy), Sonar (copy), v24 (ref), t (copy) ]]
	local function getCanShowAnimals() --[[ getCanShowAnimals | Line: 953 | Upvalues: v18 (ref), v7 (ref), v22 (ref) ]]
		local v1 = v18.GetGameState("ShowPlayerAnimals")
		if v1 == nil or v1 then
			return v7.GetSetting(v22, "ShowPlayerAnimals")
		else
			return v1
		end
	end
	local function setCanShowAnimals() --[[ setCanShowAnimals | Line: 961 | Upvalues: v27 (ref), v18 (ref), v7 (ref), v22 (ref) ]]
		local v1 = v18.GetGameState("ShowPlayerAnimals")
		v27 = if v1 == nil or v1 then v7.GetSetting(v22, "ShowPlayerAnimals") else v1
	end
	v11.GameStateChangedSignal:Connect(setCanShowAnimals)
	v7.GetSettingChangedSignal(v22, "ShowPlayerAnimals"):Connect(setCanShowAnimals)
	local v1 = v18.GetGameState("ShowPlayerAnimals")
	v27 = if v1 == nil or v1 then v7.GetSetting(v22, "ShowPlayerAnimals") else v1
	local v3 = tick() + 60
	local v4 = 0
	local v5 = 0
	local v6 = 0
	local v72 = 0
	local v8 = false
	RunService.Heartbeat:Connect(function(p1) --[[ Line: 972 | Upvalues: v72 (ref), t3 (ref), v25 (ref), CurrentCamera (ref), v26 (ref), v23 (ref), v4 (ref), v5 (ref), v3 (ref), v6 (ref), v8 (ref), Sonar (ref) ]]
		if tick() - v72 >= 5 then
			v72 = tick()
			t3 = v25:GetNearestWithMax(CurrentCamera.CFrame.p:lerp(v26, 0.5), if v23 then 3 else 5, 100)
		end
		v4 = v4 + 1
		v5 = v5 + p1
		if not (v3 <= tick()) then
			return
		end
		v6 = 1 / (v5 / v4)
		v5 = 0
		v4 = 0
		v3 = tick() + 60
		if not (v6 < 25) or v8 then
			return
		end
		v8 = true
		Sonar("NotificationsClient").Notify({
			Preset = "Yellow",
			Message = "If your device is running slowly or crashing, try toggling Show Player Horses in Settings"
		})
	end)
	RunService.Stepped:Connect(function() --[[ Line: 999 | Upvalues: t3 (ref), v24 (ref) ]]
		local t = {}
		for v1, v2 in t3 do
			if v2.StepSignal and not v2._destroyed then
				t[v2] = true
				v2.StepSignal:Fire()
			end
		end
		if not v24 or (t[v24] or v24._destroyed) then
			return
		end
		v24.StepSignal:Fire()
	end)
	RunService.Heartbeat:Connect(function(p1) --[[ Line: 1017 | Upvalues: t3 (ref) ]]
		for v1, v2 in t3 do
			if v2.HeartbeatSignal and not (v2._destroyed or v2.IsLocal) then
				v2.HeartbeatSignal:Fire(p1)
			end
		end
	end)
	Sonar("Binder").new(v11.AnimalTag, t):Init()
end)()
return t