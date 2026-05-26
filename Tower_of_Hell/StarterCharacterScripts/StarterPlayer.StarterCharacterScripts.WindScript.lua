-- https://lua.expert/
local HumanoidRootPart = script.Parent:WaitForChild("HumanoidRootPart")
local Humanoid = script.Parent:WaitForChild("Humanoid")
local function findNearestPointOnLine(p1, p2, p3) --[[ findNearestPointOnLine | Line: 5 ]]
	return p1 + p2 * (p3 - p1):Dot(p2)
end
local function findNearestPointOnLineArea(p1, p2, p3, p4) --[[ findNearestPointOnLineArea | Line: 10 ]]
	local v1 = p3 - p1
	local v3 = p1 + p2.rightVector * v1:Dot(p2.rightVector)
	local v4 = v1:Dot(p2.lookVector)
	local v5 = v1:Dot(p2.rightVector)
	local v9 = math.max(-p4.X / 2, (math.min(p4.X / 2, v4)))
	return v3 + v9 * p2.lookVector + math.max(-p4.Y / 2, (math.min(p4.Y / 2, v5))) * p2.rightVector
end
HumanoidRootPart.Touched:Connect(function(p1) --[[ Line: 22 | Upvalues: HumanoidRootPart (copy), findNearestPointOnLineArea (copy), Humanoid (copy) ]]
	if not p1:FindFirstChild("WIND") then
		return
	end
	if not p1:FindFirstChild("Attachment") then
		Instance.new("Attachment", p1)
	end
	for k, v in pairs(HumanoidRootPart:GetChildren()) do
		if v.Name == "WindLinearVelocity" and v.Attachment1 == p1.Attachment then
			return
		end
	end
	local WindLinearVelocity = Instance.new("LinearVelocity")
	WindLinearVelocity.VelocityConstraintMode = Enum.VelocityConstraintMode.Line
	WindLinearVelocity.LineVelocity = p1.WIND:GetAttribute("wind_speed")
	WindLinearVelocity.RelativeTo = Enum.ActuatorRelativeTo.Attachment1
	WindLinearVelocity.Attachment0 = HumanoidRootPart.RootAttachment
	WindLinearVelocity.Attachment1 = p1.Attachment
	WindLinearVelocity.Name = "WindLinearVelocity"
	WindLinearVelocity.Parent = HumanoidRootPart
	local WindResistance = Instance.new("LinearVelocity")
	WindResistance.VelocityConstraintMode = Enum.VelocityConstraintMode.Line
	WindResistance.LineVelocity = 0
	WindResistance.RelativeTo = Enum.ActuatorRelativeTo.Attachment1
	WindResistance.Attachment0 = HumanoidRootPart.RootAttachment
	WindResistance.Attachment1 = p1.Attachment
	WindResistance.Name = "WindResistance"
	WindResistance.Parent = WindLinearVelocity
	local v1
	if p1.WIND:GetAttribute("wind_channel_force") then
		v1 = Instance.new("VectorForce")
		v1.ApplyAtCenterOfMass = true
		v1.RelativeTo = Enum.ActuatorRelativeTo.World
		v1.Attachment0 = HumanoidRootPart.RootAttachment
		v1.Parent = WindLinearVelocity
	else
		v1 = nil
	end
	spawn(function() --[[ Line: 60 | Upvalues: WindLinearVelocity (copy), p1 (copy), HumanoidRootPart (ref), WindResistance (copy), v1 (ref), findNearestPointOnLineArea (ref), Humanoid (ref) ]]
		while WindLinearVelocity and WindLinearVelocity.Parent do
			local v12 = p1.CFrame:PointToObjectSpace(HumanoidRootPart.Position)
			local _ = v12.X / p1.Size.X
			local v14 = math.min(math.max(0, (math.min(1, (v12.X + p1.Size.X / 2) / math.min(p1.Size.X / 2, p1.WIND:GetAttribute("wind_falloff_start") or 4)))), (math.max(0, (math.min(1, (p1.Size.X / 2 - v12.X) / math.min(p1.Size.X / 2, p1.WIND:GetAttribute("wind_falloff_end") or 4))))))
			WindLinearVelocity.MaxForce = v14 * p1.WIND:GetAttribute("wind_force")
			WindResistance.MaxForce = v14 * p1.WIND:GetAttribute("wind_force") * (1 - 2.718281828459045 ^ (-0.00003 * p1.WIND:GetAttribute("wind_force")))
			if v1 then
				local v16 = findNearestPointOnLineArea(p1.Position, p1.CFrame, HumanoidRootPart.Position, (p1.WIND:GetAttribute("wind_channel_size"))) - HumanoidRootPart.Position
				local v17 = HumanoidRootPart.Velocity - HumanoidRootPart.Velocity:Dot(p1.CFrame.rightVector) * p1.CFrame.rightVector
				local v18 = p1.WIND:GetAttribute("wind_channel_resistance") or p1.WIND:GetAttribute("wind_channel_force") * (1 - 2.718281828459045 ^ (-0.00001 * p1.WIND:GetAttribute("wind_channel_force")))
				v1.Force = v14 * (v16.Unit * (1 - 2.718281828459045 ^ (-v16.Magnitude)) * p1.WIND:GetAttribute("wind_channel_force") - v17 * v18)
			end
			game:GetService("RunService").Heartbeat:Wait()
			if not (WindLinearVelocity.MaxForce * WindLinearVelocity.Attachment1.WorldAxis.Y > HumanoidRootPart.AssemblyMass * workspace.Gravity) or (Humanoid:GetState() == Enum.HumanoidStateType.Dead or Humanoid:GetState() == Enum.HumanoidStateType.Freefall) then
				continue
			end
			Humanoid:ChangeState(Enum.HumanoidStateType.Freefall)
		end
	end)
end)
HumanoidRootPart.TouchEnded:Connect(function(p1) --[[ Line: 99 | Upvalues: HumanoidRootPart (copy) ]]
	if not p1:FindFirstChild("WIND") then
		return
	end
	for k, v in pairs(HumanoidRootPart:GetTouchingParts()) do
		if v == p1 then
			return
		end
	end
	for k, v in pairs(HumanoidRootPart:GetChildren()) do
		if v.Name == "WindLinearVelocity" and v.Attachment1 == p1.Attachment then
			v:Destroy()
		end
	end
end)