-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("NotificationsClient")
local v3 = Sonar("IssueResponseClient")
local v4 = Sonar("RemoteUtils")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("CameraShaker")
local v7 = Sonar("Animal")
local v8 = Sonar("TimeUtils")
local v9 = Sonar("MobMeteor")
local v10 = Sonar("ColorCorrectionUtils")
local v11 = Sonar("GuiManager")
local SFX = ReplicatedStorage.Storage.SFX
local v12 = v5.GetClient()
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local v13 = false
local v14 = 0
local v15 = 120
local CurrentCamera = workspace.CurrentCamera
local CanyonChaosNode = ReplicatedStorage.Storage.Assets.Events.Valentines2025.CanyonChaosNode
local TNT = ReplicatedStorage.Storage.Assets.Events.Valentines2025.TNT
local v16 = Sonar("Constants")
local Valentines2025 = v16.Valentines2025
local v17 = v4.GetRemoteFunction("StartCanyonMinigame")
local t = {}
t.__index = t
local v18 = v6.new(Enum.RenderPriority.Camera.Value + 1, "PresentMinigameShaker", function(p1) --[[ Line: 42 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v18:Start()
function t.Start(p1) --[[ Start | Line: 48 | Upvalues: v13 (ref), v15 (ref), TNT (copy), CanyonChaosNode (copy), v1 (copy), v14 (ref), v2 (copy), v10 (copy), SFX (copy), v18 (copy), v6 (copy), v4 (copy), v11 (copy), PlayerGui (copy), v8 (copy), RunService (copy) ]]
	p1.Nodes = {}
	v13 = true
	v15 = 120
	p1.TNT = TNT:Clone()
	p1.Beam = Instance.new("Beam")
	p1.Rope = Instance.new("RopeConstraint")
	p1.Rope.Attachment0 = p1.TNT.Main.Attachment
	p1.Rope.Attachment1 = p1.Horse.Model:FindFirstChild("Hind", true)
	p1.Rope.Length = 50
	p1.Rope.Restitution = 1
	p1.Rope.Parent = p1.TNT
	p1.TNT:PivotTo(p1.Horse.Model:GetPivot() * CFrame.new(0, 5, 0))
	p1.TNT.Parent = workspace
	p1.Beam.Attachment0 = p1.TNT.Main.Attachment
	p1.Beam.Attachment1 = p1.Horse.Model:FindFirstChild("Hind", true)
	p1.Beam.Color = ColorSequence.new(Color3.fromRGB(255, 61, 61))
	p1.Beam.Texture = "rbxassetid://9076814128"
	p1.Beam.TextureMode = Enum.TextureMode.Static
	p1.Beam.FaceCamera = true
	p1.Beam.Parent = p1.TNT
	p1.Maid:GiveTask(p1.TNT)
	p1.Maid:GiveTask(p1.Rope)
	p1.Maid:GiveTask(p1.Beam)
	for v12, v22 in workspace.Events.Valentines.DeliveryNodes:GetChildren() do
		local t = {
			Node = v22,
			Model = CanyonChaosNode:Clone(),
			Maid = v1.new()
		}
		t.Model.Parent = workspace
		t.Model:PivotTo(v22.CFrame)
		t.Maid:GiveTask(t.Model)
		t.Maid:GiveTask(t.Model.Hitbox.Touched:Connect(function(p12) --[[ Line: 91 | Upvalues: p1 (copy), v14 (ref), v15 (ref), v2 (ref), v10 (ref), SFX (ref), v18 (ref), v6 (ref), t (copy), v4 (ref), v11 (ref), PlayerGui (ref), v13 (ref) ]]
			if p12.Parent ~= p1.TNT then
				return
			end
			v14 = v14 + 1
			v15 = math.min(120, v15 + 5)
			v2.Notify({
				Preset = "Green",
				Message = "Chocolate Destroyed! +" .. 5 .. " seconds! " .. #p1.Nodes .. " left!"
			})
			v10:Tween()
			SFX.MergeSuccess:Play()
			v18:Shake(v6.Presets.SmallRotationBump)
			table.remove(p1.Nodes, table.find(p1.Nodes, t))
			t.Maid:DoCleaning()
			if not (#p1.Nodes <= 0) then
				return
			end
			v4.GetRemoteFunction("EndCanyonMinigame"):InvokeServer(v14)
			v11.UpdateFrame(PlayerGui:WaitForChild("CanyonTimer").Container)
			v13 = false
			v2.Notify({
				Message = "You destroyed all the Chocolates!",
				Preset = "Green"
			})
			if not p1.Maid then
				return
			end
			p1.Maid:DoCleaning()
		end))
		p1.Maid:GiveTask(t.Maid)
		table.insert(p1.Nodes, t)
	end
	p1._lastMeteorSpawn = 0
	p1.MeteorSpawnRate = 2
	v11.UpdateFrame(PlayerGui:WaitForChild("CanyonTimer").Container)
	p1.Maid:GiveTask(task.spawn(function() --[[ Line: 141 | Upvalues: v13 (ref), p1 (copy), v15 (ref), PlayerGui (ref), v8 (ref), v11 (ref), v2 (ref), v4 (ref), v14 (ref) ]]
		while v13 and (p1 and v15 > 0) do
			if v13 and p1 then
				PlayerGui:WaitForChild("CanyonTimer").Container.Timer.Text = v8.FormatString(v15)
				v15 = v15 - 1
			else
				PlayerGui:WaitForChild("CanyonTimer").Container.Timer.Text = "TIMES UP"
			end
			task.wait(1)
		end
		if not v13 then
			return
		end
		v11.UpdateFrame(PlayerGui:WaitForChild("CanyonTimer").Container)
		v13 = false
		v2.Notify({
			Message = "Time\'s up!",
			Preset = "Red"
		})
		v4.GetRemoteFunction("EndCanyonMinigame"):InvokeServer(v14)
		if not p1.Maid then
			return
		end
		p1.Maid:DoCleaning()
	end))
	task.delay(3, function() --[[ Line: 172 | Upvalues: p1 (copy), RunService (ref), v13 (ref), v14 (ref) ]]
		p1.Maid:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 173 | Upvalues: v13 (ref), p1 (ref), v14 (ref) ]]
			if not v13 then
				return
			end
			local v1 = workspace:GetServerTimeNow()
			if not (v1 - p1._lastMeteorSpawn >= p1.MeteorSpawnRate) then
				return
			end
			p1._lastMeteorSpawn = v1
			local v3 = math.floor(v14 / 3)
			if v3 == 0 then
				v3 = 2
			end
			for i = 1, v3 do
				p1:SpawnMeteor()
			end
		end))
	end)
end
function t.SpawnMeteor(p1) --[[ SpawnMeteor | Line: 193 | Upvalues: v13 (ref), v12 (copy), v14 (ref), v2 (copy), Valentines2025 (copy), v15 (ref), PlayerGui (copy), v8 (copy), v4 (copy), v11 (copy), v9 (copy) ]]
	if not v13 then
		return
	end
	if not v12.Character then
		return
	end
	local v1 = v14 / 3
	local v22 = math.floor(v1)
	if v22 == 0 then
		v22 = 2
	end
	local v3 = v22 * 10
	local v42 = math.random(-v3, v3)
	local random = math.random
	local t = {
		Model = "Chocolate",
		HitSound = "rbxassetid://6333893194",
		StartPosition = v12.Character.PrimaryPart.Position + Vector3.new(v42, 0, random(-v3, v3)),
		FallTime = 8 / v22,
		OnHit = function() --[[ OnHit | Line: 219 | Upvalues: v13 (ref), v2 (ref), Valentines2025 (ref), v15 (ref), PlayerGui (ref), v8 (ref), v4 (ref), v14 (ref), v11 (ref), p1 (copy) ]]
			if not v13 then
				return
			end
			v2.Notify({
				Preset = "Red",
				Message = "You were hit by a meteor! -" .. Valentines2025.CanyonRemoveTimeBy .. " seconds"
			})
			v15 = math.max(0, v15 - Valentines2025.CanyonRemoveTimeBy)
			PlayerGui:WaitForChild("CanyonTimer").Container.Timer.Text = v8.FormatString(v15)
			if not (v15 <= 0) then
				return
			end
			v13 = false
			v2.Notify({
				Message = "Time\'s up!",
				Preset = "Red"
			})
			v4.GetRemoteFunction("EndCanyonMinigame"):InvokeServer(v14)
			v11.UpdateFrame(PlayerGui:WaitForChild("CanyonTimer").Container)
			if not p1.Maid then
				return
			end
			p1.Maid:DoCleaning()
		end
	}
	v9.new(t)
end
function t.new() --[[ new | Line: 252 | Upvalues: t (copy), v12 (copy), v2 (copy), LocalPlayer (copy), v7 (copy), v17 (copy), v3 (copy), v8 (copy), Valentines2025 (copy), v1 (copy), v13 (ref), v16 (copy), v4 (copy), v14 (ref), v11 (copy), PlayerGui (copy) ]]
	local v22 = setmetatable({}, t)
	if v12.CurrentHorse then
		if v12.CurrentHorse.Model.RiderSeat:FindFirstChild("SeatWeld") then
			v2.Notify({
				Message = "You can\'t enter the maze while co-riding!",
				Preset = "Red"
			})
			setmetatable(v22, nil)
			return
		end
	elseif LocalPlayer.Character.Humanoid.SeatPart then
		v2.Notify({
			Message = "You can\'t enter the maze while co-riding!",
			Preset = "Red"
		})
		setmetatable(v22, nil)
		return
	end
	if not v12.CurrentHorse then
		local v32 = nil
		for v42, v5 in v7.GetAllAnimals() do
			v32 = v5
			break
		end
		if not v32 then
			v2.Notify({
				Message = "You must be on a horse to start this minigame! ",
				Preset = "Red"
			})
			return
		end
		v32:_sit(LocalPlayer.Character.Humanoid)
	end
	local v6, v72 = v17:InvokeServer()
	if v6 then
		v22.Maid = v1.new()
		v22.Horse = v12.CurrentHorse
		v22.Horse:Fly(false)
		v22.Maid:GiveTask(v22.Horse.Model:GetPropertyChangedSignal("Parent"):Connect(function() --[[ Line: 321 | Upvalues: v13 (ref), v2 (ref), v22 (copy) ]]
			v13 = false
			v2.Notify({
				Message = "Minigame ended.",
				Preset = "Red"
			})
			v22.Maid:DoCleaning()
		end))
		v22.Maid:GiveTask(v16.ResetBindable.Event:Connect(function(p1) --[[ Line: 332 | Upvalues: v13 (ref), v2 (ref), v22 (copy), v4 (ref) ]]
			v13 = false
			v2.Notify({
				Message = "Minigame ended.",
				Preset = "Red"
			})
			v22.Maid:DoCleaning()
			v4.GetRemoteEvent("EndCanyonMinigameEarly"):FireServer()
		end))
		v12:SetActionState("DestructionMinigame", true)
		v2.Notify({
			Preset = "Green",
			Message = string.format("Blow up all the chocolates")
		})
		v22.Maid:GiveTask(function() --[[ Line: 352 | Upvalues: v14 (ref), v13 (ref), v11 (ref), PlayerGui (ref), v12 (ref) ]]
			v14 = 0
			v13 = false
			v11.UpdateFrame(PlayerGui:WaitForChild("CanyonTimer").Container)
			v12:SetActionState("DestructionMinigame", false)
		end)
		v22:Start()
		return
	end
	setmetatable(v22, nil)
	if v72 then
		local t2 = {
			Preset = "Red"
		}
		t2.Message = "Minigame on cooldown for " .. v8.FormatString((math.ceil(Valentines2025.CanyonCooldown * 60 - (workspace:GetServerTimeNow() - v72))))
		v2.Notify(t2)
	else
		v3.NotifyIssue("CantStartMinigame")
	end
end
function t.IsRunning() --[[ IsRunning | Line: 364 | Upvalues: v13 (ref) ]]
	return v13
end
function t.Init() --[[ Init | Line: 368 | Upvalues: v11 (copy), PlayerGui (copy), v13 (ref) ]]
	v11.AddFrame(PlayerGui:WaitForChild("CanyonTimer").Container, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = PlayerGui:WaitForChild("CanyonTimer").Container.Position,
		ClosePosition = PlayerGui:WaitForChild("CanyonTimer").Container.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.1, Enum.EasingStyle.Circular, Enum.EasingDirection.In),
		CheckVisibility = function() --[[ CheckVisibility | Line: 375 | Upvalues: v13 (ref) ]]
			return v13
		end
	})
end
t.Init()
return t