-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("Binder")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiManager")
local t = {}
t.__index = t
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local Assets = game.ReplicatedStorage.Storage.Assets
local FishingData = Sonar("Constants").FishingData
local CurrentEvent = Sonar("Constants").CurrentEvent
local MaxFishSpots = FishingData.MaxFishSpots
local MinTime = FishingData.MinTime
local MaxTime = FishingData.MaxTime
local t2 = {}
local v4 = nil
local v5 = nil
local v6 = nil
local t3 = {}
local Spot1 = workspace:WaitForChild("FishSpots").Spot1
function RandomFloat(p1, p2) --[[ RandomFloat | Line: 31 ]]
	return p1 + math.random() * (p1 - p2)
end
function t.Init() --[[ Init | Line: 35 | Upvalues: v3 (copy), PlayerGui (copy), t (copy), t2 (copy) ]]
	v3.AddFrame(PlayerGui.FishingGUI.FishingProgress, {
		HUD = true,
		TweenAnimation = true,
		OpenPosition = PlayerGui.FishingGUI.FishingProgress.Position,
		ClosePosition = PlayerGui.FishingGUI.FishingProgress.Position + UDim2.new(0, 0, 0.5, 0),
		TweenStyle = TweenInfo.new(0.1, Enum.EasingStyle.Circular, Enum.EasingDirection.In),
		CheckVisibility = function() --[[ CheckVisibility | Line: 42 | Upvalues: t (ref) ]]
			return t.IsMiniGameRunning()
		end
	})
	for v1, v2 in workspace:WaitForChild("FishSpots"):GetChildren() do
		t2[v2.Name] = {}
	end
	for v32, v4 in workspace:WaitForChild("FishSpots"):GetChildren() do
		for v5, v6 in v4:GetChildren() do
			v6.Transparency = 1
			table.insert(t2[v4.Name], v6)
		end
	end
end
function t.AddToPool(p1, p2) --[[ AddToPool | Line: 59 | Upvalues: t2 (copy) ]]
	p2.Transparency = 1
	if not t2[p1] then
		t2[p1] = {}
	end
	table.insert(t2[p1], p2)
end
function t.RemoveFromPool(p1, p2) --[[ RemoveFromPool | Line: 68 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1]
	if not v1 then
		return
	end
	local v2 = table.find(v1, p2)
	if not v2 then
		return
	end
	table.remove(v1, v2)
end
function t.MinigameToggle(p1, p2) --[[ MinigameToggle | Line: 78 | Upvalues: v6 (ref), v4 (ref), t2 (copy), t3 (copy), LocalPlayer (copy), Spot1 (ref), MaxFishSpots (copy), t (copy) ]]
	if v6 and p2 ~= false then
		return
	end
	v4 = p1
	v6 = p2
	if p1 then
		if p2 then
			for v1, v2 in t2 do
				for v3, v42 in v2 do
					v42:RemoveTag("ActiveFish")
				end
			end
			for v5, v62 in t3 do
				table.remove(t3, v5)
			end
		end
		local v7 = (1 / 0)
		for v8, v9 in workspace.FishSpots:GetChildren() do
			local v10 = v9:GetChildren()
			if #v10 > 0 then
				local Magnitude = (LocalPlayer.Character.HumanoidRootPart.Position - v10[1].Position).Magnitude
				if Magnitude < v7 then
					Spot1 = v9
					v7 = Magnitude
				end
			end
		end
		if #t3 ~= 0 then
			return
		end
		for i = 1, MaxFishSpots do
			t.Roll()
			task.wait(0.1)
		end
		return
	end
	for v12, v13 in t2 do
		for v14, v15 in v13 do
			v15:RemoveTag("ActiveFish")
		end
	end
	for v16, v17 in t3 do
		table.remove(t3, v16)
	end
end
function t.IsMiniGameRunning() --[[ IsMiniGameRunning | Line: 130 | Upvalues: v4 (ref) ]]
	return v4
end
function t.GetClosest() --[[ GetClosest | Line: 134 | Upvalues: Spot1 (ref) ]]
	return Spot1
end
function t.Roll() --[[ Roll | Line: 138 | Upvalues: v4 (ref), t3 (copy), MaxFishSpots (copy), t2 (copy), Spot1 (ref), v5 (ref) ]]
	if not (v4 and #t3 < MaxFishSpots) then
		return
	end
	if not t2[Spot1.Name] or #t2[Spot1.Name] == 0 then
		return
	end
	local count = 0
	local v1
	repeat
		v1 = t2[Spot1.Name][Random.new():NextInteger(1, #t2[Spot1.Name])]
		count = count + 1
	until v1 ~= v5 or count >= 10
	if not v1 then
		return
	end
	v5 = v1
	v1:AddTag("ActiveFish")
end
function t._animateFish(p1, p2) --[[ _animateFish | Line: 160 | Upvalues: TweenService (copy) ]]
	local v1
	if p2 then
		v1 = Vector3.new(15, 1.5, 15)
	else
		v1 = Vector3.new(0, 0, 0)
		if p1.ParticleEffect:IsA("Model") then
			p1.ParticleEffect.Particle.Attachment.Ground.Enabled = false
		else
			p1.ParticleEffect.Attachment.Ground.Enabled = false
		end
	end
	local v2 = TweenInfo.new(p1.LifeTime / 2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
	if p1.ParticleEffect:IsA("Model") then
		TweenService:Create(p1.ParticleEffect.Particle, v2, {
			Size = v1
		}):Play()
	else
		TweenService:Create(p1.ParticleEffect, v2, {
			Size = v1
		}):Play()
	end
end
function t.new(p1) --[[ new | Line: 184 | Upvalues: t (copy), v2 (copy), v6 (ref), CurrentEvent (copy), Assets (copy), MinTime (copy), MaxTime (copy), t3 (copy) ]]
	local v1 = t
	local v22 = setmetatable({}, v1)
	v22.SpawnPad = p1
	v22.Maid = v2.new()
	local v3 = math.random(1, 100)
	if v3 >= 1 and v3 <= 15 then
		if v6 then
			v22.ParticleEffect = CurrentEvent.MinigameData.PurpleFish:Clone()
		else
			v22.ParticleEffect = Assets:FindFirstChild("FishParticlesPurple"):Clone()
		end
		v22.SpawnPad:AddTag("IsPurple")
	elseif v3 >= 15 and v3 <= 40 then
		if v6 then
			v22.ParticleEffect = CurrentEvent.MinigameData.GoldFish:Clone()
		else
			v22.ParticleEffect = Assets:FindFirstChild("FishParticlesGold"):Clone()
		end
		v22.SpawnPad:AddTag("IsGold")
	elseif v6 then
		v22.ParticleEffect = CurrentEvent.MinigameData.Fish:Clone()
	else
		v22.ParticleEffect = Assets:FindFirstChild("FishParticles"):Clone()
	end
	if v22.ParticleEffect:IsA("Model") then
		v22.ParticleEffect:PivotTo(p1.CFrame * CFrame.Angles(0, math.rad((math.random(0, 360))), 0) + Vector3.new(0, 0, 0))
		v22.ParticleEffect.Particle.Size = Vector3.new(0, 0, 0)
	else
		v22.ParticleEffect.Position = p1.Position
		v22.ParticleEffect.Size = Vector3.new(0, 0, 0)
	end
	v22.ParticleEffect.Parent = workspace
	v22.Maid:GiveTask(v22.ParticleEffect)
	v22.Maid:GiveTask(function() --[[ Line: 227 | Upvalues: t (ref) ]]
		t.Roll()
	end)
	v22.LifeTime = RandomFloat(MinTime, MaxTime)
	v22.IsPulsating = false
	v22.StartTime = tick()
	if v22.ParticleEffect:IsA("Model") then
		v22.DefaultColor = v22.ParticleEffect.Particle.Color
	else
		v22.DefaultColor = v22.ParticleEffect.Color
	end
	v22.StartOffset = {
		X = math.random() * math.pi * 2,
		Y = math.random() * math.pi * 2,
		Z = math.random() * math.pi * 2,
		RotX = math.random() * math.pi * 2,
		RotY = math.random() * math.pi * 2,
		RotZ = math.random() * math.pi * 2
	}
	v22.BobAmplitude = {
		X = 0.3,
		Y = 0.5,
		Z = 0.2,
		RotX = 0.1,
		RotY = 0.15,
		RotZ = 0.08
	}
	v22.BobSpeed = {
		X = 1.2,
		Y = 1.5,
		Z = 0.8,
		RotX = 0.6,
		RotY = 0.9,
		RotZ = 0.7
	}
	v22.Maid:GiveTask(game:GetService("RunService").Heartbeat:Connect(function(p1) --[[ Line: 266 | Upvalues: v22 (copy) ]]
		if not (v22.ParticleEffect and (v22.ParticleEffect.Parent and v22.ParticleEffect:FindFirstChild("Fish"))) then
			return
		end
		local v1 = tick()
		local v8 = Vector3.new(math.sin(v1 * v22.BobSpeed.X + v22.StartOffset.X) * v22.BobAmplitude.X, math.sin(v1 * v22.BobSpeed.Y + v22.StartOffset.Y) * v22.BobAmplitude.Y, math.sin(v1 * v22.BobSpeed.Z + v22.StartOffset.Z) * v22.BobAmplitude.Z) * p1
		local v14 = CFrame.Angles(math.sin(v1 * v22.BobSpeed.RotX + v22.StartOffset.RotX) * v22.BobAmplitude.RotX * p1, math.sin(v1 * v22.BobSpeed.RotY + v22.StartOffset.RotY) * v22.BobAmplitude.RotY * p1, math.sin(v1 * v22.BobSpeed.RotZ + v22.StartOffset.RotZ) * v22.BobAmplitude.RotZ * p1)
		local Fish = v22.ParticleEffect.Fish
		Fish:PivotTo(Fish:GetPivot() * v14 + v8)
	end))
	v22.Maid:GiveTask(game["Run Service"].Heartbeat:Connect(function() --[[ Line: 286 | Upvalues: v22 (copy) ]]
		local v1 = tick() - v22.StartTime
		local v2 = v22.LifeTime - (tick() - v22.StartTime)
		if not v22.IsPulsating and v2 <= v22.LifeTime / 4 then
			v22.IsPulsating = true
		end
		if not v22.IsPulsating then
			return
		end
		if v2 <= 0 then
			if v22.ParticleEffect:IsA("Model") then
				v22.ParticleEffect.Particle.Color = Color3.fromRGB(255, 0, 0)
			else
				v22.ParticleEffect.Color = Color3.fromRGB(255, 0, 0)
			end
		else
			local v3 = math.floor(v1 / 0.2) % 2 == 0
			local v4 = v3 and Color3.fromRGB(255, 0, 0) or v22.DefaultColor
			if v22.ParticleEffect:IsA("Model") then
				v22.ParticleEffect.Particle.Color = v4
				return
			end
			v22.ParticleEffect.Color = v4
		end
	end))
	v22:_animateFish(true)
	table.insert(t3, v22)
	task.delay(v22.LifeTime, function() --[[ Line: 323 | Upvalues: v22 (copy) ]]
		if not (v22 and v22.SpawnPad:HasTag("ActiveFish")) then
			return
		end
		v22.SpawnPad:RemoveTag("ActiveFish")
	end)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 332 | Upvalues: v5 (ref), t3 (copy), MaxFishSpots (copy), t (copy) ]]
	if not p1.ParticleEffect then
		setmetatable(p1, nil)
		return
	end
	v5 = p1.SpawnPad
	p1:_animateFish(false)
	local v1
	if p1.SpawnPad:HasTag("Claimed") then
		local v2 = Color3.fromRGB(77, 255, 0)
		p1.SpawnPad:RemoveTag("Claimed")
		v1 = v2
	else
		v1 = Color3.fromRGB(255, 0, 0)
	end
	p1.SpawnPad:RemoveTag("IsGold")
	p1.SpawnPad:RemoveTag("IsPurple")
	local ParticleEffect = p1.ParticleEffect
	if p1.ParticleEffect:IsA("Model") then
		ParticleEffect = p1.ParticleEffect.Particle
	end
	ParticleEffect.Color = v1
	ParticleEffect.Flames.Color = ColorSequence.new(v1)
	ParticleEffect.Sparks.Color = ColorSequence.new(v1)
	ParticleEffect.Attachment.Ground.Color = ColorSequence.new(v1)
	table.remove(t3, table.find(t3, p1))
	task.delay(0.5, function() --[[ Line: 362 | Upvalues: p1 (copy), t3 (ref), MaxFishSpots (ref), t (ref) ]]
		p1.Maid:DoCleaning()
		setmetatable(p1, nil)
		if not (#t3 < MaxFishSpots) then
			return
		end
		t.Roll()
	end)
end
t.Init()
v1.new("ActiveFish", t):Init()
return t