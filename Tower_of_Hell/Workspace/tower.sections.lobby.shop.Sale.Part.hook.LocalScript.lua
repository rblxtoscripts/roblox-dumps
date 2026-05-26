-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local v1 = game.Players.LocalPlayer:GetMouse()
local HookTerrain = workspace.Terrain:FindFirstChild("HookTerrain")
if not HookTerrain then
	HookTerrain = Instance.new("Attachment")
	HookTerrain.WorldCFrame = CFrame.new(Vector3.new(0, 0, 0), Vector3.new(0, 0, 1.5707964))
	HookTerrain.CFrame = HookTerrain.WorldCFrame
	HookTerrain.Axis = Vector3.new(0, 1, 0)
	HookTerrain.SecondaryAxis = Vector3.new(-1, 0, 0)
	HookTerrain.WorldAxis = HookTerrain.Axis
	HookTerrain.WorldSecondaryAxis = HookTerrain.SecondaryAxis
	HookTerrain.Name = "HookTerrain"
	HookTerrain.Parent = workspace.Terrain
end
local v2 = nil
local v3 = nil
local v4 = nil
local v5 = false
local v6 = 0
local v7 = nil
local v8 = nil
_G.tohhookcooldown = _G.tohhookcooldown or 0
local function getHitCf() --[[ getHitCf | Line: 48 | Upvalues: v1 (copy) ]]
	local UnshotHook = script.Parent.Parent:WaitForChild("hook"):WaitForChild("UnshotHook")
	local Position = v1.Origin.Position
	local v12 = v1.Origin.LookVector * 1000
	local v2 = RaycastParams.new()
	v2.FilterType = Enum.RaycastFilterType.Exclude
	v2.FilterDescendantsInstances = { script.Parent.Parent }
	v2.RespectCanCollide = true
	v2.IgnoreWater = true
	for k, v in pairs(workspace.tower.sections:GetDescendants()) do
		if v:IsA("BasePart") and (not v.CanCollide and v.Transparency == 1) then
			table.insert(v2.FilterDescendantsInstances, v)
		end
	end
	local v3 = workspace:Blockcast(CFrame.new(Position, Position + v12), Vector3.new(0.5, 0.5, 0.5), v12, v2)
	if v3 then
		return CFrame.new(v3.Position, UnshotHook.Position), v3.Instance
	end
end
local function deactivate() --[[ deactivate | Line: 80 | Upvalues: v3 (ref), v4 (ref) ]]
	if not script.Parent:FindFirstChild("Hook") then
		return
	end
	if not v3 then
		return
	end
	script.Parent.RopeConstraint:Destroy()
	script.Parent.Hook:Destroy()
	script.Parent.HookAnchored:Destroy()
	if script.Parent.UnshotHook:FindFirstChild("Skin") then
		script.Parent.UnshotHook.Skin.Transparency = 0
	else
		script.Parent.UnshotHook.Transparency = 0
	end
	script.Parent.ropeStart.Transparency = 1
	if v4 then
		v4.PlatformStand = false
	end
	if v3:FindFirstChild("HookAlign") then
		v3.HookAlign:Destroy()
		v3.HookAttachment:Destroy()
		v3.HookMovement:Destroy()
	end
	if not v4 then
		return
	end
	v4:ChangeState(Enum.HumanoidStateType.Freefall)
end
script.Parent.Activated:Connect(function() --[[ Line: 112 | Upvalues: deactivate (copy), v4 (ref), v3 (ref), getHitCf (copy), HookTerrain (ref), v7 (ref) ]]
	if script.Parent:FindFirstChild("Hook") then
		deactivate()
		return
	end
	if _G.tohhookcooldown > tick() then
		return
	end
	if not (v4 and v3) then
		return
	end
	local v1, v2 = getHitCf()
	if not v2 then
		return
	end
	local HookAttachment = script.Parent.Handle.HookAttachment
	local v42 = math.abs(v1.Y - HookAttachment.WorldPosition.Y)
	local magnitude = (v1.p - HookAttachment.WorldPosition).magnitude
	local v5 = (v42 * 2 + magnitude) * 0.333
	if script.Parent.Range.Value < v42 then
		return
	end
	local Skin = script.Parent.UnshotHook:FindFirstChild("Skin")
	v4.PlatformStand = true
	local HookAttachment_2 = Instance.new("Attachment")
	HookAttachment_2.Name = "HookAttachment"
	HookAttachment_2.Axis = Vector3.new(0, 1, 0)
	HookAttachment_2.SecondaryAxis = v3.CFrame.lookVector
	HookAttachment_2.Parent = v3
	local HookAlign = Instance.new("AlignOrientation")
	HookAlign.Name = "HookAlign"
	HookAlign.RigidityEnabled = true
	HookAlign.PrimaryAxisOnly = false
	HookAlign.Attachment0 = HookAttachment_2
	HookAlign.Attachment1 = HookTerrain
	HookAlign.Parent = v3
	local HookMovement = Instance.new("VectorForce")
	HookMovement.Name = "HookMovement"
	HookMovement.Attachment0 = HookAttachment_2
	HookMovement.RelativeTo = Enum.ActuatorRelativeTo.World
	HookMovement.Parent = v3
	local HookAnchored = Instance.new("Part")
	HookAnchored.Name = "HookAnchored"
	if Skin and Skin:FindFirstChild("offset") then
		HookAnchored.CFrame = v1 * Skin.offset.Value
	else
		HookAnchored.CFrame = v1
	end
	HookAnchored.Size = Vector3.new(2, 2, 2)
	HookAnchored.CanCollide = false
	HookAnchored.Anchored = false
	HookAnchored.Transparency = 1
	HookAnchored.Parent = script.Parent
	local ManualWeld = Instance.new("ManualWeld")
	ManualWeld.Part0 = HookAnchored
	ManualWeld.Part1 = v2
	ManualWeld.C0 = HookAnchored.CFrame:Inverse() * v2.CFrame
	ManualWeld.Parent = HookAnchored
	local Attachment = Instance.new("Attachment")
	Attachment.Position = Vector3.new(0, 0, -1.1)
	Attachment.Parent = HookAnchored
	local Hook
	if Skin then
		local v72 = Skin:Clone()
		Skin.Transparency = 1
		Hook = v72
	else
		local v8 = script.Parent.UnshotHook:Clone()
		script.Parent.UnshotHook.Transparency = 1
		Hook = v8
	end
	Hook:ClearAllChildren()
	script.Parent.ropeStart.Transparency = 0
	Hook.Name = "Hook"
	Hook.Parent = script.Parent
	local Attachment_2 = Instance.new("Attachment")
	Attachment_2.Orientation = Vector3.new(0, 0, 0)
	Attachment_2.Position = Vector3.new(0, 0.1, -0.6)
	Attachment_2.Parent = Hook
	Hook.CFrame = Attachment.WorldCFrame * Attachment_2.CFrame:inverse()
	local AlignPosition = Instance.new("AlignPosition")
	AlignPosition.RigidityEnabled = true
	AlignPosition.Attachment1 = Attachment
	AlignPosition.Attachment0 = Attachment_2
	AlignPosition.Parent = Hook
	local AlignOrientation = Instance.new("AlignOrientation")
	AlignOrientation.RigidityEnabled = true
	AlignOrientation.Attachment1 = Attachment
	AlignOrientation.Attachment0 = Attachment_2
	AlignOrientation.Parent = Hook
	local RopeConstraint = Instance.new("RopeConstraint")
	if Skin and Skin:GetAttribute("ropeOffset") then
		local RopeOffsetAttachment = Attachment_2:Clone()
		RopeOffsetAttachment.Name = "RopeOffsetAttachment"
		RopeOffsetAttachment.Position = RopeOffsetAttachment.Position + Skin:GetAttribute("ropeOffset")
		RopeOffsetAttachment.Parent = Hook
		RopeConstraint.Attachment0 = RopeOffsetAttachment
	else
		RopeConstraint.Attachment0 = Attachment_2
	end
	RopeConstraint.Attachment1 = HookAttachment
	RopeConstraint.Length = magnitude
	RopeConstraint.Visible = true
	if script.Parent.UnshotHook:FindFirstChild("Skin") and script.Parent.UnshotHook.Skin:FindFirstChild("ropeColor") then
		RopeConstraint.Color = BrickColor.new(script.Parent.UnshotHook.Skin.ropeColor.Value)
	else
		RopeConstraint.Color = BrickColor.new("Smoky grey")
	end
	RopeConstraint.Thickness = 0.3
	RopeConstraint.Parent = script.Parent
	game:GetService("TweenService"):Create(RopeConstraint, TweenInfo.new((magnitude - v5) * 0.1), {
		Length = v5
	}):Play()
	v7 = v2.Changed:Connect(function(p1) --[[ Line: 235 | Upvalues: v2 (copy), deactivate (ref) ]]
		if (p1 ~= "Parent" or v2:IsDescendantOf(workspace)) and (p1 ~= "CanCollide" or v2.CanCollide) then
			return
		end
		deactivate()
	end)
end)
script.Parent.Equipped:Connect(function() --[[ Line: 244 | Upvalues: v1 (copy), v6 (ref), v2 (ref), v4 (ref), v3 (ref), v8 (ref), v5 (ref) ]]
	v1.Icon = "rbxassetid://4770792736"
	v6 = v6 + 1
	if v2 then
		return
	end
	v2 = script.Parent.Parent
	v4 = v2.Humanoid
	v3 = v2.HumanoidRootPart
	v8 = v4.StateChanged:Connect(function(p1, p2) --[[ Line: 253 | Upvalues: v5 (ref) ]]
		if p2 == Enum.HumanoidStateType.Landed or (p2 == Enum.HumanoidStateType.Running or p2 == Enum.HumanoidStateType.RunningNoPhysics) then
			v5 = false
		end
	end)
end)
function unequip() --[[ unequip | Line: 260 | Upvalues: v8 (ref), v1 (copy), deactivate (copy) ]]
	if not v8 then
		v1.Icon = ""
		deactivate()
		return
	end
	v8:Disconnect()
	v8 = nil
	v1.Icon = ""
	deactivate()
end
script.Parent.Unequipped:Connect(unequip)
script.Parent.AncestryChanged:Connect(unequip)
UserInputService.JumpRequest:connect(function() --[[ Line: 273 | Upvalues: v4 (ref), deactivate (copy), v5 (ref), v6 (ref) ]]
	if not script:IsDescendantOf(workspace) then
		return
	end
	if not v4 then
		return
	end
	if not script.Parent:FindFirstChild("Hook") then
		return
	end
	deactivate()
	if v5 then
		v4:ChangeState(Enum.HumanoidStateType.Freefall)
		task.wait(0.4)
		if v6 ~= v6 or not script.Parent:FindFirstChild("Hook") then
			return
		end
	end
	v5 = true
	_G.tohhookcooldown = tick() + 0.85
	v4:ChangeState(Enum.HumanoidStateType.Jumping)
end)
while task.wait(1 / 60) do
	if script.Parent:FindFirstChild("Hook") and (script:IsDescendantOf(workspace) and v4) then
		v3.HookMovement.Force = v4.MoveDirection * script.Parent.SwingForce.Value - v3.Velocity * 8
		if (script.Parent.Hook.AlignPosition.Attachment0.WorldPosition - script.Parent.Hook.AlignPosition.Attachment1.WorldPosition).Magnitude > 1 then
			deactivate()
			script.Parent.ropeStart.snap:Play()
		end
	end
	if script:IsDescendantOf(workspace) then
		if math.abs(v1.Hit.Position.Y - script.Parent.Handle.HookAttachment.WorldPosition.Y) > script.Parent.Range.Value then
			v1.Icon = "rbxassetid://4770792736"
			continue
		end
		v1.Icon = "rbxassetid://4770790320"
	end
end