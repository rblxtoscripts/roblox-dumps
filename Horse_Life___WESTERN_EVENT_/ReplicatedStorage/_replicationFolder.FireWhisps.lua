-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("InteractMenu")
local v3 = Sonar("RemoteUtils")
local v4 = Sonar("ColorCorrectionUtils")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("CameraShaker")
local LocalPlayer = Players.LocalPlayer
local CurrentCamera = workspace.CurrentCamera
local v7 = v6.new(Enum.RenderPriority.Camera.Value + 1, "FireWispShaker", function(p1) --[[ Line: 31 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v7:Start()
local t2 = {}
local v8 = false
function t.new(p1) --[[ new | Line: 39 | Upvalues: t (copy), v1 (copy), t2 (copy), RunService (copy), v2 (copy), v8 (ref), v3 (copy), v4 (copy), v5 (copy), ReplicatedStorage (copy), v7 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v1.new()
	v22.SpawnArea = p1
	v22.Part = nil
	v22.BodyVelocity = nil
	v22.LastVelocity = Vector3.new(0, 0, 0)
	v22.FloatTime = math.random() * math.pi * 2
	v22.FloatHeight = 15
	v22.FloatSpeed = 5
	v22:CreatePart()
	v22.BodyVelocity = Instance.new("BodyVelocity")
	v22.BodyVelocity.MaxForce = Vector3.new(10000, 10000, 10000)
	v22.BodyVelocity.P = 1250
	v22.BodyVelocity.Parent = v22.Part.Main
	v22.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
	table.insert(t2, v22)
	v22.Maid:GiveTask(RunService.Heartbeat:Connect(function(p1) --[[ Line: 61 | Upvalues: v22 (copy) ]]
		v22:UpdateMovement(p1)
	end))
	v22.Maid:GiveTask(v2.new(v22.Part, {
		Hint = "Collect",
		GetRange = function() --[[ GetRange | Line: 66 ]]
			return 10
		end,
		Run = function() --[[ Run | Line: 70 | Upvalues: v8 (ref), v3 (ref), v22 (copy), v4 (ref), v5 (ref), ReplicatedStorage (ref), v7 (ref) ]]
			if v8 then
				return
			end
			v8 = true
			local v1, v2 = v3.GetRemoteFunction("ClaimKirinWhisp"):InvokeServer()
			if v1 then
				v22:Destroy()
				v4:Tween()
				v5.Notify({
					Message = "You collected a Fire Wisp!",
					Preset = "Green"
				})
				ReplicatedStorage.Storage.SFX.QuestIncrement:Play()
				v7:Shake(v7.Presets.RotationBump)
			else
				v5.Notify({
					Preset = "Red",
					Message = v2
				})
			end
			task.delay(0.5, function() --[[ Line: 95 | Upvalues: v8 (ref) ]]
				v8 = false
			end)
		end
	}))
	return v22
end
function t.CreatePart(p1) --[[ CreatePart | Line: 104 | Upvalues: ReplicatedStorage (copy) ]]
	p1.Part = ReplicatedStorage.Storage.Assets.FireWisp:Clone()
	for v1, v2 in p1.Part:GetChildren() do
		if v2:IsA("BasePart") then
			v2.CustomPhysicalProperties = PhysicalProperties.new(0.1, 0, 0, 1, 1)
		end
	end
	p1.Part:PivotTo(CFrame.new(p1.SpawnArea.Position + Vector3.new(math.random(-20, 20), 0, math.random(-20, 20))))
	p1.Part.Parent = workspace
end
function t.GetWallAvoidanceForce(p1) --[[ GetWallAvoidanceForce | Line: 123 ]]
	local Position = p1.Part:GetPivot().Position
	local Size = p1.SpawnArea.Size
	local Position_2 = p1.SpawnArea.Position
	local v1 = Position.X - (Position_2.X - Size.X / 2)
	local v2 = Position_2.X + Size.X / 2 - Position.X
	local v3 = Position.Z - (Position_2.Z - Size.Z / 2)
	local v4 = Position_2.Z + Size.Z / 2 - Position.Z
	local sum = Vector3.new(0, 0, 0)
	if v1 < 4 then
		sum = sum + Vector3.new(1, 0, 0) * math.pow(1 - v1 / 4, 2)
	end
	if v2 < 4 then
		sum = sum + Vector3.new(-1, 0, 0) * math.pow(1 - v2 / 4, 2)
	end
	if v3 < 4 then
		sum = sum + Vector3.new(0, 0, 1) * math.pow(1 - v3 / 4, 2)
	end
	if v4 < 4 then
		sum = sum + Vector3.new(0, 0, -1) * math.pow(1 - v4 / 4, 2)
	end
	if sum.Magnitude > 0 then
		sum = sum.Unit * 15
	end
	return sum
end
function t.GetWispAvoidanceForce(p1) --[[ GetWispAvoidanceForce | Line: 156 | Upvalues: t2 (copy) ]]
	local Position = p1.Part:GetPivot().Position
	local sum = Vector3.new(0, 0, 0)
	for v1, v2 in t2 do
		if v2 ~= p1 and (v2.Part and v2.Part.Parent) then
			local Position_2 = v2.Part:GetPivot().Position
			local Magnitude = (Position_2 - Position).Magnitude
			if Magnitude < 6 then
				sum = sum + (Position - Position_2).Unit * math.pow(1 - Magnitude / 6, 2)
			end
		end
	end
	if sum.Magnitude > 0 then
		sum = sum.Unit * 20
	end
	return sum
end
function t.UpdateMovement(p1, p2) --[[ UpdateMovement | Line: 180 | Upvalues: LocalPlayer (copy) ]]
	if not (p1.Part and p1.Part.Parent) then
		return
	end
	local Character = LocalPlayer.Character
	if not Character then
		return
	end
	local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then
		return
	end
	local Magnitude = (HumanoidRootPart.Position - p1.Part:GetPivot().Position).Magnitude
	local Position = HumanoidRootPart.Position
	p1.FloatTime = p1.FloatTime + p2 * p1.FloatSpeed
	local v1 = math.sin(p1.FloatTime) * p1.FloatHeight
	local v2 = Vector3.new(0, 0, 0)
	if Magnitude < 30 then
		v2 = (p1.Part:GetPivot().Position - Position).Unit * 40 * math.pow(1 - Magnitude / 30, 2)
	elseif Magnitude > 60 then
		v2 = (Position - p1.Part:GetPivot().Position).Unit * 8
	end
	local Size = p1.SpawnArea.Size
	local Position_2 = p1.SpawnArea.Position
	local v3 = v2 + p1:GetWallAvoidanceForce() + p1:GetWispAvoidanceForce()
	local v4 = p1.Part:GetPivot().Position + v3 * p2
	if v4.X < Position_2.X - Size.X / 2 or v4.X > Position_2.X + Size.X / 2 then
		v3 = Vector3.new(0, v3.Y, v3.Z)
	end
	if v4.Z < Position_2.Z - Size.Z / 2 or v4.Z > Position_2.Z + Size.Z / 2 then
		v3 = Vector3.new(v3.X, v3.Y, 0)
	end
	p1.LastVelocity = p1.LastVelocity:Lerp(Vector3.new(v3.X, v1 - (p1.Part:GetPivot().Position.Y - (Position_2.Y + 1)), v3.Z), 0.1)
	p1.BodyVelocity.Velocity = p1.LastVelocity
end
function t.Destroy(p1) --[[ Destroy | Line: 248 | Upvalues: t2 (copy) ]]
	if p1.BodyVelocity then
		p1.BodyVelocity:Destroy()
	end
	if p1.Part and p1.Part.Parent then
		p1.Part:Destroy()
	end
	p1.Maid:Destroy()
	local v1 = table.find(t2, p1)
	if not v1 then
		return
	end
	table.remove(t2, v1)
end
function t.SpawnWisps(p1) --[[ SpawnWisps | Line: 263 ]] end
function t.Init(p1) --[[ Init | Line: 268 ]] end
t:Init()
return t