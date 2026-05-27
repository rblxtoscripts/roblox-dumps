-- https://lua.expert/
local Sonar = require(game:GetService("ReplicatedStorage").Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("InteractMenu")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("NotificationsClient")
local v6 = Sonar("ColorCorrectionUtils")
local v7 = Sonar("CameraShaker")
local RunService = game:GetService("RunService")
local Royal2025 = Sonar("Constants").Royal2025
local Particles = game.ReplicatedStorage.Storage.Assets.Particles
local v8 = v4.GetRemoteFunction("CollectEgg")
local Camera = workspace.Camera
local v9 = v7.new(Enum.RenderPriority.Camera.Value + 1, "EggHuntMinigame", function(p1) --[[ Line: 20 | Upvalues: Camera (copy) ]]
	Camera.CFrame = Camera.CFrame * p1
end)
v9:Start()
local function SetupShakeAnimation(p1, p2) --[[ SetupShakeAnimation | Line: 25 | Upvalues: RunService (copy) ]]
	local v1 = p2.CFrame
	local v2 = 0
	local v3 = RunService.Heartbeat:Connect(function() --[[ Line: 29 | Upvalues: v2 (ref), RunService (ref), p2 (copy), v1 (copy) ]]
		v2 = v2 + RunService.Heartbeat:Wait()
		p2.CFrame = v1 * CFrame.Angles(0, 0, math.sin(v2 * 8) * 0.1)
	end)
	p1:GiveTask(v3)
	return v3
end
local t = {
	Golden = {
		Model = "GoldenEggModel"
	},
	Bunny = {
		Model = "BunnyEggModel",
		Setup = function(p1, p2, p3, p4) --[[ Setup | Line: 45 | Upvalues: RunService (copy) ]]
			p3.Anchored = false
			p3.CanCollide = true
			p3.CustomPhysicalProperties = PhysicalProperties.new(1, 0.3, 0.5, 1, 1)
			p1:GiveTask((RunService.Heartbeat:Connect(function() --[[ Line: 50 | Upvalues: p2 (copy), p4 (copy), p3 (copy) ]]
				if not (p2 and p2.Parent) then
					return
				end
				local Character = game.Players.LocalPlayer.Character
				if not Character then
					return
				end
				if not ((Character:GetPivot().Position - p2:GetPivot().Position).Magnitude < 20) then
					return
				end
				if p4 then
					p4:Disconnect()
					p3.Anchored = false
				end
				local v1 = (p2:GetPivot().Position - Character:GetPivot().Position).Unit * 100
				p3.Velocity = v1
				p3:ApplyImpulseAtPosition(v1, p3.Position)
			end)))
		end
	},
	Mystery = {
		Model = "MysteryEggModel"
	},
	Flying = {
		Model = "FlyingEgg",
		Setup = function(p1, p2, p3, p4) --[[ Setup | Line: 79 | Upvalues: RunService (copy) ]]
			p3.Anchored = false
			p3.CanCollide = true
			p3.CustomPhysicalProperties = PhysicalProperties.new(0.1, 0.1, 0.1, 1, 1)
			local BodyPosition = Instance.new("BodyPosition")
			BodyPosition.MaxForce = Vector3.new(10000, 10000, 10000)
			BodyPosition.P = 2000
			BodyPosition.D = 300
			BodyPosition.Position = p3.Position
			BodyPosition.Parent = p3
			local BodyGyro = Instance.new("BodyGyro")
			BodyGyro.MaxTorque = Vector3.new(10000, 10000, 10000)
			BodyGyro.P = 2000
			BodyGyro.D = 300
			BodyGyro.Parent = p3
			p1:GiveTask(BodyPosition)
			p1:GiveTask(BodyGyro)
			local v1 = 0
			p1:GiveTask((RunService.Heartbeat:Connect(function(p1) --[[ Line: 101 | Upvalues: p2 (copy), v1 (ref), p4 (copy), p3 (copy), BodyPosition (copy), BodyGyro (copy) ]]
				if not (p2 and p2.Parent) then
					return
				end
				local Character = game.Players.LocalPlayer.Character
				if not Character then
					return
				end
				v1 = v1 + p1
				local Position = p2:GetPivot().Position
				local Position_2 = Character:GetPivot().Position
				local Magnitude = (Position_2 - Position).Magnitude
				if not (Magnitude < 30) then
					BodyPosition.Position = p3.Position + Vector3.new(math.sin(v1 * 1.5) * 2, math.sin(v1 * 2) * 4 + 2, math.cos(v1 * 1.5) * 2)
					BodyGyro.CFrame = CFrame.new(Position) * CFrame.Angles(0, v1 * 0.5, 0)
					return
				end
				local v7, v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20
				if p4 then
					p4:Disconnect()
					p3.Anchored = false
				end
				v7 = (Position - Position_2).Unit
				v8 = v1 * 3
				v9 = math.sin(v8) * 3
				v10 = v1 * 4
				v11 = math.sin(v10) * 5 + 4
				v12 = v1 * 3
				v13 = math.cos(v12) * 3
				v14 = Vector3.new(v9, v11, v13)
				v15 = math.clamp(30 - Magnitude, 10, 25)
				v16 = Position + (v7 + Vector3.new(0, 3, 0)).Unit * v15 + v14
				BodyPosition.Position = v16
				v17 = (v16 - Position).Unit
				v18 = CFrame.lookAt
				v19 = v17.X
				v20 = v17.Z
				BodyGyro.CFrame = v18(Position, Position + Vector3.new(v19, 0, v20))
			end)))
		end
	},
	Goodie = {
		Model = "GoodieEgg"
	},
	Chamelion = {
		Model = "ChamelionEgg"
	}
}
local function PlayClaimAnimation(p1) --[[ PlayClaimAnimation | Line: 158 | Upvalues: RunService (copy), Particles (copy), v6 (copy), v5 (copy), v9 (copy), v7 (copy) ]]
	local Part = p1.Part
	Part.Anchored = true
	local v1 = Part.CFrame
	local v2 = tick()
	while tick() - v2 < 1 do
		local v3 = RunService.Heartbeat:Wait()
		local v4 = (tick() - v2) / 1
		local v52 = math.sin(v3 * 20) * 0.2 * (1 - v4)
		Part.CFrame = v1 * CFrame.new(0, 5 * v4, 0) * CFrame.Angles(0, math.rad(360 * v4), v52)
	end
	local Part_2 = Instance.new("Part")
	Part_2.Anchored = true
	Part_2.CanCollide = false
	Part_2.Transparency = 1
	Part_2.CFrame = Part.CFrame
	Part_2.Parent = workspace
	local v62 = Particles.CollectEgg:Clone()
	v62.Parent = Part_2
	for v72, v8 in v62:GetChildren() do
		v8:Emit(v8:GetAttribute("EmitCount"))
	end
	v6:Tween()
	v5.Notify({
		Message = "Egg Collected!",
		Preset = "Yellow"
	})
	v9:Shake(v7.Presets.SmallRotationBump)
	task.delay(5, function() --[[ Line: 198 | Upvalues: Part_2 (copy), v62 (copy) ]]
		Part_2:Destroy()
		v62:Destroy()
	end)
end
local t2 = {}
t2.__index = t2
function t2.new(p1) --[[ new | Line: 207 | Upvalues: t2 (copy), v2 (copy), t (copy), Royal2025 (copy), RunService (copy), v3 (copy), v8 (copy), PlayClaimAnimation (copy) ]]
	local v22 = setmetatable({}, t2)
	v22.SpawnPoint = p1
	v22.EggType = p1:GetAttribute("EggType")
	v22.Maid = v2.new()
	local v32 = t[v22.EggType]
	v22.EggModel = Royal2025.MinigameData[if v32 then v32.Model else "EggModel"]:Clone()
	v22.EggModel:PivotTo(v22.SpawnPoint:GetPivot())
	v22.EggModel.Name = v22.SpawnPoint.Name
	v22.EggModel:SetAttribute("BlipType", "Egg")
	v22.EggModel:AddTag("MinimapBlip")
	v22.EggModel.Parent = workspace
	v22.Maid:GiveTask(v22.EggModel)
	local Part = v22.EggModel.Part
	Part.Anchored = true
	local v5 = Part.CFrame
	local v6 = 0
	local v7 = RunService.Heartbeat:Connect(function() --[[ Line: 29 | Upvalues: v6 (ref), RunService (ref), Part (copy), v5 (copy) ]]
		v6 = v6 + RunService.Heartbeat:Wait()
		Part.CFrame = v5 * CFrame.Angles(0, 0, math.sin(v6 * 8) * 0.1)
	end)
	v22.Maid:GiveTask(v7)
	if v32 and v32.Setup then
		v32.Setup(v22.Maid, v22.EggModel, Part, v7)
	end
	v22.Maid:GiveTask(v3.new(v22.EggModel, {
		ShowHintLabel = true,
		Hint = function() --[[ Hint | Line: 234 ]]
			return "Claim Egg"
		end,
		CanFocus = function() --[[ CanFocus | Line: 240 ]]
			return true
		end,
		Run = function() --[[ Run | Line: 244 | Upvalues: v8 (ref), v22 (copy), PlayClaimAnimation (ref) ]]
			local v1, v2 = v8:InvokeServer(v22.EggModel.Name)
			warn(v1, v2)
			if v1 then
				PlayClaimAnimation(v22.EggModel)
			end
		end
	}))
	v22.Maid:GiveTask(function() --[[ Line: 253 | Upvalues: v22 (copy) ]]
		setmetatable(v22, nil)
	end)
	return v22
end
function t2.Destroy(p1) --[[ Destroy | Line: 260 ]]
	p1.Maid:DoCleaning()
end
function t2.Init() --[[ Init | Line: 264 | Upvalues: v1 (copy), t2 (copy), Sonar (copy) ]]
	v1.new("Egg", t2):Init()
	local v12 = tick()
	Sonar("NotificationsClient").AddNotificationCallback("EventEggSpawned", function(p1) --[[ Line: 269 | Upvalues: v12 (ref), Sonar (ref) ]]
		if not (tick() - v12 < 4) then
			v12 = tick()
			local v1 = string.gsub(p1 or "Unknown", "(%l)(%u)", "%1 %2")
			Sonar("MessagesClient"):AddNotification({
				Type = "EventEggSpawned",
				DoNotSkip = true,
				Duration = 2,
				Message = ("A %* Egg has spawned somewhere in the world!"):format(v1)
			})
		end
	end)
end
t2.Init()
return t2