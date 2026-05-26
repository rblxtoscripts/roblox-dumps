-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local PhysicsService = game:GetService("PhysicsService")
local SoundService = game:GetService("SoundService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("Signal")
local t = {}
t.__index = t
local v5 = RunService:IsServer()
local v6, v7
if v5 then
	v6 = nil
	v7 = nil
else
	v6 = v3.GetClient()
	local v8 = Sonar("CameraShaker")
	local CurrentCamera = workspace.CurrentCamera
	v7 = v8.new(Enum.RenderPriority.Camera.Value + 1, "BoostShaker", function(p1) --[[ Line: 26 | Upvalues: CurrentCamera (copy) ]]
		CurrentCamera.CFrame = CurrentCamera.CFrame * p1
	end)
	v7:Start()
	t.LassoSignal = v4.new()
end
function t._initServer(p1) --[[ _initServer | Line: 34 | Upvalues: v3 (copy) ]]
	local Object = p1.Object
	p1.HasHumanoid = Object.Parent:FindFirstChild("Humanoid")
	p1.DefaultStates = {
		Anchored = Object.Anchored,
		Massless = Object.Massless,
		RootPriority = Object.RootPriority,
		CustomPhysicalProperties = Object.CustomPhysicalProperties
	}
	p1.LassoedStates = {
		Anchored = false,
		Massless = true,
		RootPriority = -127,
		CustomPhysicalProperties = PhysicalProperties.new(0.15, 0, 0)
	}
	p1.IsLassoed = false
	p1.RopeConstraint = Instance.new("RopeConstraint")
	p1.RopeConstraint.Enabled = false
	p1.RopeConstraint.Visible = true
	p1.RopeAttachment = Instance.new("Attachment")
	p1.RopeAttachment.Name = "RopeAttachment"
	p1.RopeConstraint.Attachment1 = p1.RopeAttachment
	p1.RopeConstraint.Parent = Object
	p1.RopeAttachment.Parent = Object
	p1.Maid:GiveTask(Object:GetAttributeChangedSignal("Lassoer"):Connect(function() --[[ Line: 64 | Upvalues: Object (copy), p1 (copy) ]]
		local v1 = Object:GetAttribute("Lassoer")
		if v1 then
			p1:Lasso(v1)
		else
			p1:Release()
		end
	end))
	p1.Remote = Instance.new("RemoteEvent", Object)
	p1.Remote.OnServerEvent:Connect(function(p12, p2) --[[ Line: 74 | Upvalues: v3 (ref), Object (copy), p1 (copy) ]]
		local v1 = v3.getWrapperFromPlayer(p12)
		if v1._lassoedObject then
			v1._lassoedObject.Object:SetAttribute("Lassoer", nil)
			return
		end
		if p2 then
			Object:SetAttribute("Lassoer", nil)
		else
			p1.LassoerWrapper = v1
			v1._lassoedObject = p1
			Object:SetAttribute("Lassoer", p12.Name)
		end
	end)
end
function t._initClient(p1) --[[ _initClient | Line: 90 ]]
	p1.Remote = p1.Object:WaitForChild("RemoteEvent")
end
function t.new(p1) --[[ new | Line: 95 | Upvalues: t (copy), v2 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Object = p1
	if v5 then
		v22:_initServer()
	else
		v22:_initClient()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 110 ]]
	p1.IsLassoed = nil
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.Lasso(p1, p2) --[[ Lasso | Line: 118 ]]
	local v1 = game.Players:FindFirstChild(p2)
	if not v1 then
		return
	end
	if not v1.Character then
		return
	end
	if (v1.Character:GetPivot().p - p1.Object.Position).Magnitude > 200 then
		return
	end
	p1.IsLassoed = true
	if p1.HasHumanoid then
		if p1.HasHumanoid.SeatPart then
			p1:Release()
			return
		end
		p1.HasHumanoid.PlatformStand = true
		p1.HasHumanoid:AddTag("Ragdoll")
	end
	p1.Maid.LeavingConnection = nil
	p1.Maid.DyingConnection = nil
	p1.Maid.LeavingConnection = v1.AncestryChanged:Once(function() --[[ Line: 148 | Upvalues: p1 (copy) ]]
		p1:Release()
	end)
	for v2, v3 in p1.LassoedStates do
		p1.Object[v2] = v3
	end
	local v4 = v1.Character and v1.Character:FindFirstChild("RightHand")
	if v4 then
		p1.Object:SetNetworkOwner(v1)
		p1.RopeConstraint.Length = (p1.Object.Position - v4.Position).Magnitude + 0.2
		p1.RopeConstraint.Attachment0 = v4:FindFirstChildOfClass("Attachment")
		p1.RopeConstraint.Enabled = true
	else
		warn("Reset due to no right hand/character")
		p1:Release()
	end
end
function t.Release(p1) --[[ Release | Line: 173 ]]
	p1.IsLassoed = false
	if p1.HasHumanoid then
		p1.HasHumanoid:RemoveTag("Ragdoll")
		p1.HasHumanoid.PlatformStand = false
	end
	if p1.LassoerWrapper then
		p1.LassoerWrapper._lassoedObject = nil
		p1.LassoerWrapper = nil
	end
	p1.RopeConstraint.WinchEnabled = false
	p1.RopeConstraint.Attachment0 = nil
	p1.RopeConstraint.Enabled = false
	p1.Object:SetNetworkOwnershipAuto()
	local Object = p1.Object
	Object.Position = Object.Position + Vector3.new(0, 0.5, 0)
	for v1, v2 in p1.DefaultStates do
		if v1 == "Anchored" then
			task.delay(1, function() --[[ Line: 195 | Upvalues: p1 (copy), v1 (copy), v2 (copy) ]]
				p1.Object[v1] = v2
			end)
			continue
		end
		p1.Object[v1] = v2
	end
end
local v9 = nil
local v10 = 100
local v11 = 0
function t.ClientLasso(p1, p2) --[[ ClientLasso | Line: 208 | Upvalues: v6 (ref), v9 (ref), t (copy), v10 (ref), v7 (ref), SoundService (copy), v11 (ref) ]]
	if p2:IsDescendantOf(v6.Character) then
		return
	end
	local Humanoid = p2.Parent:FindFirstChild("Humanoid")
	if Humanoid and Humanoid.SeatPart then
		return
	end
	p2.RemoteEvent:FireServer()
	p1._lastHit = p2
	p2:GetAttributeChangedSignal("Lassoer"):Once(function() --[[ Line: 222 ]] end)
	p2.RopeConstraint:GetPropertyChangedSignal("Attachment0"):Once(function() --[[ Line: 225 | Upvalues: p2 (copy), v6 (ref), v9 (ref), t (ref), v10 (ref) ]]
		p2.RopeConstraint.Color = v6._lastLassoColor or BrickColor.new("Nougat")
		v9 = p2
		t.LassoSignal:Fire(p2)
		v10 = (p2.RopeConstraint.Attachment0.WorldPosition - p2.RopeConstraint.Attachment1.WorldPosition).Magnitude + 0.25
	end)
	v7:Shake(v7.Presets.SmallRotationBump)
	SoundService.Effects.RopeGrab:Play()
	SoundService.Effects.RopeReel:Play()
	if Humanoid then
		task.delay(math.random(5, 10), function() --[[ Line: 239 | Upvalues: p1 (copy) ]]
			p1:ClientRelease()
		end)
	end
	if not game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
		return
	end
	SoundService.Effects.RopeReel.Looped = true
	repeat
		v11 = v11 + task.wait() * 5
	until not game:GetService("UserInputService"):IsMouseButtonPressed(Enum.UserInputType.MouseButton1)
	SoundService.Effects.RopeReel:Stop()
	SoundService.Effects.RopeReel.Looped = false
	warn("stopped retracting")
end
function t.HasLassoedObject(p1) --[[ HasLassoedObject | Line: 256 | Upvalues: v9 (ref) ]]
	return v9
end
function t.ClientRelease(p1) --[[ ClientRelease | Line: 260 | Upvalues: v9 (ref), t (copy), v11 (ref) ]]
	if p1._lastHit then
		v9 = nil
		t.LassoSignal:Fire(nil)
		v11 = 0
		p1._lastHit.RemoteEvent:FireServer(true)
		p1._lastHit = nil
		return true
	end
end
(function() --[[ Init | Line: 277 | Upvalues: v1 (copy), t (copy), PhysicsService (copy), v5 (copy), RunService (copy), v9 (ref), v6 (ref), v10 (ref), v11 (ref) ]]
	v1.new("Lassoable", t):Init()
	pcall(function() --[[ Line: 281 | Upvalues: PhysicsService (ref) ]]
		PhysicsService:RegisterCollisionGroup("Lassoable")
		PhysicsService:CollisionGroupSetCollidable("Lassoable", "Lassoable", false)
		PhysicsService:CollisionGroupSetCollidable("Lassoable", "Animals", false)
		PhysicsService:CollisionGroupSetCollidable("Lassoable", "Characters", false)
	end)
	if v5 then
		return
	end
	RunService.Heartbeat:Connect(function() --[[ Line: 289 | Upvalues: v9 (ref), v6 (ref), v10 (ref), v11 (ref) ]]
		if not v9 then
			return
		end
		local Attachment0 = v9.RopeConstraint.Attachment0
		if Attachment0 and Attachment0:IsDescendantOf(v6.Character) then
			v9.RopeConstraint.Length = math.min((v9.RopeConstraint.Attachment0.WorldPosition - v9.RopeConstraint.Attachment1.WorldPosition).Magnitude + 0.25, v10 - v11)
			return
		end
		v9 = nil
	end)
end)()
return t