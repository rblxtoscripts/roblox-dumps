-- https://lua.expert/
local t = {}
local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Maid")
local v4 = Sonar("CollisionUtils")
local v5 = RunService:IsServer()
local Car = ReplicatedStorage.Storage.Assets.Car
local t2 = {}
local t3 = {}
local function CalculateMass(p1) --[[ CalculateMass | Line: 23 ]]
	local sum = 0
	for v1, v2 in p1:GetChildren() do
		if v2:IsA("BasePart") then
			sum = sum + v2:GetMass() * 196.2
		end
	end
	return sum
end
local function Raycast(p1, p2, p3) --[[ Raycast | Line: 33 ]]
	local v1 = RaycastParams.new()
	v1.ExcludeInstances = if p3 then p3 else {}
	local v3 = workspace:Raycast(p1, p2, v1)
	if v3 then
		return v3.Instance, v3.Position, v3.Normal
	else
		return nil, p1 + p2, Vector3.new(0, 1, 0)
	end
end
local function RunIdlePhysics(p1) --[[ RunIdlePhysics | Line: 44 | Upvalues: CalculateMass (copy), Raycast (copy), v3 (copy), Players (copy), RunService (copy) ]]
	local Chassis = p1.Chassis
	local Configurations = p1.Configurations
	local BodyPosition = Chassis.BodyPosition
	local BodyGyro = Chassis.BodyGyro
	local v1 = CalculateMass(p1)
	local function UpdateThrusterIdle(p12) --[[ UpdateThrusterIdle | Line: 51 | Upvalues: Raycast (ref), Configurations (copy), p1 (copy) ]]
		local WheelWeld = p12:FindFirstChild("WheelWeld")
		local _, v1 = Raycast(p12.Position, p12.CFrame:VectorToWorldSpace(Vector3.new(0, -1, 0)) * Configurations.Height.Value, { p1 })
		WheelWeld.C0 = CFrame.new(0, -math.min((v1 - p12.Position).Magnitude, Configurations.Height.Value * 0.8) + WheelWeld.Part1.Size.Y / 2, 0)
		if p12.AssemblyLinearVelocity.Magnitude >= 5 and WheelWeld.Part1:FindFirstChild("ParticleEmitter") then
			WheelWeld.Part1.ParticleEmitter.Enabled = true
			return
		end
		if not WheelWeld.Part1:FindFirstChild("ParticleEmitter") then
			return
		end
		WheelWeld.Part1.ParticleEmitter.Enabled = false
	end
	local v2 = v3.new()
	v2:GiveTask(p1.DriveSeat:GetPropertyChangedSignal("Occupant"):Connect(function() --[[ Line: 71 | Upvalues: p1 (copy), Players (ref) ]]
		if p1.DriveSeat.Occupant then
			local Running = p1.EngineBlock:FindFirstChild("Running")
			if Running then
				Running.Pitch = 1
				Running:Play()
			end
			local v1 = Players:GetPlayerFromCharacter(p1.DriveSeat.Occupant.Parent)
			if v1 then
				p1.DriveSeat:SetNetworkOwner(v1)
			end
		else
			local Running = p1.EngineBlock:FindFirstChild("Running")
			if not Running then
				return
			end
			Running:Stop()
		end
	end))
	v2:GiveTask(RunService.Stepped:Connect(function() --[[ Line: 91 | Upvalues: p1 (copy), BodyPosition (copy), BodyGyro (copy), UpdateThrusterIdle (copy), Raycast (ref), Chassis (copy), Configurations (copy), v1 (copy) ]]
		if p1.DriveSeat.Occupant then
			BodyPosition.MaxForce = Vector3.new(0, 0, 0)
			BodyGyro.MaxTorque = Vector3.new(0, 0, 0)
			return
		end
		for v12, v2 in p1:GetChildren() do
			if v2.Name == "Thruster" then
				UpdateThrusterIdle(v2)
			end
		end
		local v3, v4, v5 = Raycast(Chassis.Position, Chassis.CFrame:VectorToWorldSpace(Vector3.new(0, -1, 0)) * Configurations.Height.Value, { p1 })
		if v3 and v3.CanCollide then
			BodyPosition.MaxForce = Vector3.new(v1 / 5, (1 / 0), v1 / 5)
			BodyPosition.Position = (CFrame.new(v4, v4 + v5) * CFrame.new(0, 0, -Configurations.Height.Value + 0.5)).Position
			BodyGyro.MaxTorque = Vector3.new(inf, 0, inf)
			BodyGyro.CFrame = CFrame.new(v4, v4 + v5) * CFrame.Angles(-1.5707963267948966, 0, 0)
		else
			BodyPosition.MaxForce = Vector3.new(0, 0, 0)
			BodyGyro.MaxTorque = Vector3.new(0, 0, 0)
		end
	end))
	v2:GiveTask(p1)
	return v2
end
function t.SpawnCar(p1) --[[ SpawnCar | Line: 125 | Upvalues: v2 (copy), t3 (copy), t2 (copy), Car (copy), v4 (copy), CollectionService (copy), RunIdlePhysics (copy) ]]
	local v1 = v2.getWrapperFromPlayer(p1)
	if not v1 then
		return false
	end
	if v1:GetCurrentAnimal() then
		return false
	end
	if t3[p1] and tick() - t3[p1] < 3 then
		return false
	end
	if t2[p1] then
		t2[p1]:DoCleaning()
		t2[p1] = nil
	end
	local Character = p1.Character
	if not Character then
		return false
	end
	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	if HumanoidRootPart then
		local v22 = HumanoidRootPart.CFrame * CFrame.new(0, 2, -10)
		local v3 = Car:Clone()
		v4.SetCollisionGroupOfModel(v3, "Animals")
		CollectionService:AddTag(v3, "Car")
		v3:SetAttribute("OwnerUserId", p1.UserId)
		v3:PivotTo(v22)
		v3.Parent = workspace
		t2[p1] = RunIdlePhysics(v3)
		t3[p1] = tick()
		return true
	else
		return false
	end
end
local function DespawnCar(p1) --[[ DespawnCar | Line: 170 | Upvalues: t2 (copy) ]]
	if t2[p1] then
		t2[p1]:DoCleaning()
		t2[p1] = nil
		return true
	else
		return false
	end
end
function t.Init() --[[ Init | Line: 180 | Upvalues: v5 (copy), v1 (copy), t2 (copy), t (copy), Players (copy), t3 (copy) ]]
	if v5 then
		v1.GetRemoteFunction("ToggleCarRemote").OnServerInvoke = function(p1) --[[ Line: 185 | Upvalues: t2 (ref), t (ref) ]]
			if not t2[p1] then
				return t.SpawnCar(p1)
			end
			if t2[p1] then
				t2[p1]:DoCleaning()
				t2[p1] = nil
				return true
			else
				return false
			end
		end
		Players.PlayerRemoving:Connect(function(p1) --[[ Line: 193 | Upvalues: t2 (ref), t3 (ref) ]]
			if t2[p1] then
				t2[p1]:DoCleaning()
				t2[p1] = nil
			end
			t3[p1] = nil
		end)
	end
end
t.Init()
return t