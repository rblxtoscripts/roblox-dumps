-- https://lua.expert/
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Maid")
local v4 = Sonar("InteractMenu")
local v5 = v2.GetClient()
local LocalPlayer = Players.LocalPlayer
local v6 = v3.new()
local t2 = {}
local function Raycast(p1, p2, p3) --[[ Raycast | Line: 20 ]]
	local v1 = RaycastParams.new()
	v1.ExcludeInstances = if p3 then p3 else {}
	local v3 = workspace:Raycast(p1, p2, v1)
	if v3 then
		return v3.Instance, v3.Position, v3.Normal
	else
		return nil, p1 + p2, Vector3.new(0, 1, 0)
	end
end
local function CalculateMass(p1) --[[ CalculateMass | Line: 31 ]]
	local sum = 0
	for v1, v2 in p1:GetChildren() do
		if v2:IsA("BasePart") then
			sum = sum + v2:GetMass() * 196.2
		end
	end
	return sum
end
local function StartDriving(p1) --[[ StartDriving | Line: 41 | Upvalues: v6 (copy), LocalPlayer (copy), CalculateMass (copy), Raycast (copy), RunService (copy) ]]
	v6:DoCleaning()
	local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
	local Chassis = p1.Chassis
	local Configurations = p1.Configurations
	local DriveSeat = p1.DriveSeat
	local v1 = CalculateMass(p1)
	local v2 = v1 * Configurations.Suspension.Value
	local v3 = v2 / Configurations.Bounce.Value
	local zero = Vector2.zero
	local BodyVelocity = Instance.new("BodyVelocity")
	BodyVelocity.Velocity = Vector3.new(0, 0, 0)
	BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
	BodyVelocity.Parent = Chassis
	v6:GiveTask(BodyVelocity)
	local BodyAngularVelocity = Instance.new("BodyAngularVelocity")
	BodyAngularVelocity.AngularVelocity = Vector3.new(0, 0, 0)
	BodyAngularVelocity.MaxTorque = Vector3.new(0, 0, 0)
	BodyAngularVelocity.Parent = Chassis
	v6:GiveTask(BodyAngularVelocity)
	v6:GiveTask(DriveSeat:GetPropertyChangedSignal("Steer"):Connect(function() --[[ Line: 70 | Upvalues: zero (ref), DriveSeat (copy) ]]
		zero = Vector2.new(DriveSeat.Steer, zero.Y)
	end))
	v6:GiveTask(DriveSeat:GetPropertyChangedSignal("Throttle"):Connect(function() --[[ Line: 74 | Upvalues: zero (ref), DriveSeat (copy) ]]
		zero = Vector2.new(zero.X, DriveSeat.Throttle)
	end))
	local t = {}
	local v4 = 0
	local v5 = 0
	for v62, v7 in p1:GetChildren() do
		if v7.Name == "Thruster" then
			local WheelWeld = v7:FindFirstChild("WheelWeld")
			if WheelWeld then
				local t2 = {
					Weld = WheelWeld,
					Thruster = v7
				}
				t2.IsFront = if (Chassis.CFrame:Inverse() * v7.CFrame).Z < 0 then true else false
				t2.OriginalC0Pos = WheelWeld.C0.Position
				table.insert(t, t2)
			end
		end
	end
	local function UpdateThruster(p12) --[[ UpdateThruster | Line: 94 | Upvalues: v6 (ref), Raycast (ref), Configurations (copy), p1 (copy), v2 (copy), Chassis (copy), v3 (copy) ]]
		local BodyThrust = p12:FindFirstChild("BodyThrust")
		if not BodyThrust then
			local BodyThrust_2 = Instance.new("BodyThrust")
			BodyThrust_2.Parent = p12
			v6:GiveTask(BodyThrust_2)
			BodyThrust = BodyThrust_2
		end
		local v1, v22 = Raycast(p12.Position, p12.CFrame:VectorToWorldSpace(Vector3.new(0, -1, 0)) * Configurations.Height.Value, { p1 })
		local Magnitude = (v22 - p12.Position).Magnitude
		if v1 and v1.CanCollide then
			BodyThrust.Force = Vector3.new(0, (Configurations.Height.Value - Magnitude) ^ 2 * (v2 / Configurations.Height.Value ^ 2), 0)
			BodyThrust.Force = BodyThrust.Force - Vector3.new(0, (p12.CFrame:ToObjectSpace(CFrame.new(Chassis:GetVelocityAtPosition(p12.Position) + p12.Position)).Position * v3).Y, 0)
			return
		end
		BodyThrust.Force = Vector3.new(0, 0, 0)
	end
	local function UpdateWheelVisuals() --[[ UpdateWheelVisuals | Line: 123 | Upvalues: zero (ref), v4 (ref), t (copy), v5 (ref) ]]
		v4 = v4 + (-zero.X * 0.5235987755982988 - v4) * 0.15
		for v1, v2 in t do
			local v3 = if v2.IsFront then v4 or 0 else 0
			local v42 = CFrame.Angles(0, v3, 0) * CFrame.Angles(v5, 0, 0)
			v2.Weld.C0 = CFrame.new(v2.OriginalC0Pos) * v42
		end
	end
	local function IsGrounded() --[[ IsGrounded | Line: 135 | Upvalues: Raycast (ref), Chassis (copy), Configurations (copy), p1 (copy) ]]
		local v1 = Raycast((Chassis.CFrame * CFrame.new(0, 0, Chassis.Size.Z / 2 - 1)).Position, Chassis.CFrame:VectorToWorldSpace(Vector3.new(0, -1, 0)) * (Configurations.Height.Value + 0.2), { p1 })
		return if v1 == nil then false else v1.CanCollide
	end
	v6:GiveTask(RunService.Heartbeat:Connect(function(p12) --[[ Line: 144 | Upvalues: DriveSeat (copy), v6 (ref), Humanoid (copy), Chassis (copy), v5 (ref), IsGrounded (copy), zero (ref), Configurations (copy), BodyVelocity (copy), v1 (copy), BodyAngularVelocity (copy), p1 (copy), UpdateThruster (copy), UpdateWheelVisuals (copy) ]]
		if not DriveSeat:IsDescendantOf(workspace) then
			v6:DoCleaning()
			return
		end
		if Humanoid.SeatPart ~= DriveSeat then
			v6:DoCleaning()
			return
		end
		local v12 = Chassis.CFrame:VectorToObjectSpace(Chassis.AssemblyLinearVelocity)
		local v2 = -v12.Z
		v5 = v5 + v2 / 1.2 * p12
		Chassis.AssemblyLinearVelocity = Chassis.AssemblyLinearVelocity + Chassis.CFrame:VectorToWorldSpace((Vector3.new(-v12.X * 0.85, 0, 0))) * p12 * 10
		if IsGrounded() then
			if zero.Y == 0 then
				BodyVelocity.MaxForce = Vector3.new(v1 / 2, v1 / 4, v1 / 2)
			else
				Chassis.AssemblyLinearVelocity = Chassis.AssemblyLinearVelocity:Lerp(Chassis.CFrame.LookVector * zero.Y * Configurations.Speed.Value, 0.1)
				BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
			end
			if math.abs(v2) > 2 then
				Chassis.AssemblyAngularVelocity = Chassis.AssemblyAngularVelocity:Lerp(Chassis.CFrame:VectorToWorldSpace((Vector3.new(0, -zero.X * (if v2 > 0 then 1 else -1) * Configurations.TurnSpeed.Value, 0))), 0.15)
				BodyAngularVelocity.MaxTorque = Vector3.new(0, 0, 0)
			else
				BodyAngularVelocity.MaxTorque = Vector3.new(v1 / 4, v1 / 2, v1 / 4)
			end
		else
			BodyVelocity.MaxForce = Vector3.new(0, 0, 0)
			BodyAngularVelocity.MaxTorque = Vector3.new(0, 0, 0)
		end
		for v17, v18 in p1:GetChildren() do
			if v18.Name == "Thruster" then
				UpdateThruster(v18)
			end
		end
		UpdateWheelVisuals()
	end))
end
local function OnSeatOccupantChanged() --[[ OnSeatOccupantChanged | Line: 197 | Upvalues: LocalPlayer (copy), v6 (copy), StartDriving (copy) ]]
	local Character = LocalPlayer.Character
	if not Character then
		return
	end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not (Humanoid and Humanoid.SeatPart) then
		v6:DoCleaning()
		return
	end
	local SeatPart = Humanoid.SeatPart
	if not SeatPart or SeatPart.Name ~= "DriveSeat" then
		return
	end
	local v1 = SeatPart.Parent
	if v1 and (v1:FindFirstChild("Chassis") and v1:FindFirstChild("Configurations")) then
		StartDriving(v1)
	end
end
local function IsInCar() --[[ IsInCar | Line: 222 | Upvalues: LocalPlayer (copy) ]]
	local Character = LocalPlayer.Character
	if not Character then
		return false
	end
	local Humanoid = Character:FindFirstChildOfClass("Humanoid")
	if not (Humanoid and Humanoid.SeatPart) then
		return false
	end
	return Humanoid.SeatPart.Name == "DriveSeat"
end
local function SetupCharacter(p1) --[[ SetupCharacter | Line: 236 | Upvalues: OnSeatOccupantChanged (copy) ]]
	p1:WaitForChild("Humanoid"):GetPropertyChangedSignal("SeatPart"):Connect(OnSeatOccupantChanged)
end
if LocalPlayer.Character then
	LocalPlayer.Character:WaitForChild("Humanoid"):GetPropertyChangedSignal("SeatPart"):Connect(OnSeatOccupantChanged)
end
LocalPlayer.CharacterAdded:Connect(SetupCharacter)
local function IsLocalPlayerCar(p1) --[[ IsLocalPlayerCar | Line: 246 | Upvalues: LocalPlayer (copy) ]]
	local isUserId = p1:GetAttribute("OwnerUserId") == LocalPlayer.UserId
	return isUserId
end
local function SetupCarInteract(p1) --[[ SetupCarInteract | Line: 250 | Upvalues: v3 (copy), t2 (copy), Players (copy), LocalPlayer (copy), v4 (copy), v5 (copy), v1 (copy) ]]
	local DriveSeat = p1:WaitForChild("DriveSeat")
	local v12 = v3.new()
	t2[p1] = v12
	v12:GiveTask(DriveSeat:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 256 | Upvalues: DriveSeat (copy), Players (ref), LocalPlayer (ref), p1 (copy) ]]
		local Occupant = DriveSeat.Occupant
		if not Occupant then
			return
		end
		local v1 = Players:GetPlayerFromCharacter(Occupant.Parent)
		if not v1 then
			return
		end
		if v1 ~= LocalPlayer then
			return
		end
		local isUserId = p1:GetAttribute("OwnerUserId") == LocalPlayer.UserId
		if isUserId then
			return
		end
		LocalPlayer.Character.Humanoid.Jump = true
	end))
	local v2 = v4.new(DriveSeat, {
		ShowHintLabel = true,
		Hint = "Car",
		GetRange = function() --[[ GetRange | Line: 270 ]]
			return 20
		end,
		Visibility = function() --[[ Visibility | Line: 273 | Upvalues: p1 (copy), LocalPlayer (ref), v5 (ref) ]]
			local isUserId = p1:GetAttribute("OwnerUserId") == LocalPlayer.UserId
			if isUserId then
				local Character = LocalPlayer.Character
				local v1
				if Character then
					local Humanoid = Character:FindFirstChildOfClass("Humanoid")
					v1 = if Humanoid and Humanoid.SeatPart then Humanoid.SeatPart.Name == "DriveSeat" else false
				else
					v1 = false
				end
				isUserId = not v1 and not v5:GetCurrentAnimal()
			end
			return isUserId
		end
	})
	v12:GiveTask(v2)
	v2:_addOption({
		Hint = "Drive",
		Run = function() --[[ Run | Line: 281 | Upvalues: LocalPlayer (ref), DriveSeat (copy) ]]
			local Character = LocalPlayer.Character
			if not Character then
				return
			end
			local Humanoid = Character:FindFirstChildOfClass("Humanoid")
			if not Humanoid then
				return
			end
			if not DriveSeat.Occupant then
				DriveSeat:Sit(Humanoid)
			end
		end,
		Visibility = function() --[[ Visibility | Line: 290 | Upvalues: DriveSeat (copy) ]]
			return not DriveSeat.Occupant
		end
	})
	v2:_addOption({
		Hint = "Despawn",
		Run = function() --[[ Run | Line: 297 | Upvalues: v1 (ref) ]]
			v1.GetRemoteFunction("ToggleCarRemote"):InvokeServer()
		end
	})
	v12:GiveTask(p1.Destroying:Connect(function() --[[ Line: 302 | Upvalues: v12 (copy), t2 (ref), p1 (copy) ]]
		v12:DoCleaning()
		t2[p1] = nil
	end))
end
for v7, v8 in CollectionService:GetTagged("Car") do
	task.spawn(SetupCarInteract, v8)
end
CollectionService:GetInstanceAddedSignal("Car"):Connect(SetupCarInteract)
return {}