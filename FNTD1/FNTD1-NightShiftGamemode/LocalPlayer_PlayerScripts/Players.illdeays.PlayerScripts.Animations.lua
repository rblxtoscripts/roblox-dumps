-- https://lua.expert/
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local ContentProvider = game:GetService("ContentProvider")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Towers = require(ReplicatedStorage.Configs.Towers)
local ClientState = require(ReplicatedStorage.PlayerData.ClientState)
local Sound = require(ReplicatedStorage.Libs.Sound)
local Animation = require(ReplicatedStorage.Libs.Animation)
local CurrentCamera = workspace.CurrentCamera
local v1 = RaycastParams.new()
v1.FilterType = Enum.RaycastFilterType.Exclude
local t = {}
local function isLoop(p1, p2) --[[ isLoop | Line: 20 | Upvalues: Animation (copy) ]]
	if not p1 then
		return false
	end
	if p2 then
		return true
	else
		return Animation == "Idle" or Animation == "Walk"
	end
end
local function setAnimation(p1, p2, p3, p4) --[[ setAnimation | Line: 31 ]]
	if not (p1 and p2) then
		return nil
	end
	local Humanoid = p1:WaitForChild("Humanoid")
	local Animations = p1:WaitForChild("Animations")
	if not (Humanoid and Animations) then
		return nil
	end
	local v1 = Animations:FindFirstChild(p2)
	if not v1 then
		return nil
	end
	local v2 = Humanoid:WaitForChild("Animator") or Instance.new("Animator")
	local v3 = nil
	local v4, v5 = xpcall(function() --[[ Line: 43 | Upvalues: v3 (ref), v2 (copy), v1 (copy) ]]
		v3 = v2:LoadAnimation(v1)
	end, function() --[[ Line: 45 | Upvalues: v3 (ref), v2 (copy), v1 (copy) ]]
		v3 = v2:LoadAnimation(v1)
	end)
	if v4 and v3 then
		if p3 then
			v3.Priority = Enum.AnimationPriority[p3]
		end
		if p2 == "Idle" or p2 == "Walk" then
			v3.Looped = true
		elseif p2 == "Attack" then
			v3.Looped = false
		end
	else
		if not v5 then
			return v3
		end
		warn(v5)
	end
	return v3
end
local function playAnimation(p1, p2, p3, p4, p5, p6, p7) --[[ playAnimation | Line: 68 | Upvalues: setAnimation (copy) ]]
	local v1 = setAnimation(p1, p2, p3, p6)
	if not v1 then
		return
	end
	if not p5 and p5 ~= nil then
		v1:Stop(p4)
		return
	end
	if p2 == "Idle" and (p1 and p1:FindFirstChild("Humanoid")) then
		for k, v in pairs(p1.Humanoid:GetPlayingAnimationTracks()) do
			if v.Name ~= "Idle" then
				v:Stop(p4)
			end
		end
	end
	v1:Play(p4)
	if p1:FindFirstChild("CDMulti") and not p7 then
		v1:AdjustSpeed(1 + (1 - p1.CDMulti.Value))
	end
	local isName = p1.Name == "Old Man Consequences"
	v1:AdjustSpeed(1.5)
	if typeof(p7) ~= "number" then
		return
	end
	if p1.Name == "Insane Music Man" then
		return
	end
	for k, v in pairs(p1.Humanoid:GetPlayingAnimationTracks()) do
		if v.Name ~= "Walk" then
			return
		end
		v:Stop(p4)
	end
	v1:AdjustSpeed(p7)
end
function spawnAnimation(p1) --[[ spawnAnimation | Line: 109 | Upvalues: Towers (copy), ReplicatedStorage (copy), v1 (copy), playAnimation (copy) ]]
	local v12 = if Towers[p1.Name] and Towers[p1.Name].SpecialSpawn then ReplicatedStorage.Objects.SpawnModels[Towers[p1.Name].SpecialSpawn] else ReplicatedStorage.Objects.SpawnModels["Spawn Tower Machine S"]
	v1.FilterDescendantsInstances = { workspace.Towers, workspace.Enemies }
	local v2 = workspace:Raycast(p1.HumanoidRootPart.Position, Vector3.new(0, -100, 0), v1)
	local v3 = if v2 and v2.Instance then v2.Position else p1.HumanoidRootPart.Position
	local v4 = v12:Clone()
	v4.Parent = ReplicatedStorage
	task.spawn(playAnimation, v4, "Spawn", "Action")
	v4.Parent = workspace.Visuals
	local _, _2 = v4:GetBoundingBox()
	v4.PrimaryPart.CFrame = CFrame.new(v3 + Vector3.new(0, 9, 0)) * CFrame.Angles(0, math.random(0, 6.283185307179586), 0)
	task.delay(1, function() --[[ Line: 128 | Upvalues: v4 (ref) ]]
		v4:Destroy()
	end)
end
workspace.Enemies.ChildAdded:Connect(function(p1) --[[ Line: 133 | Upvalues: playAnimation (copy) ]]
	if p1:FindFirstChild("NoAnimation") then
		return
	end
	if p1:FindFirstChild("IsABoss") and p1.Animations:FindFirstChild("Entry") then
		Instance.new("StringValue", p1).Name = "NoAnimation"
		task.spawn(playAnimation, p1, "Entry", "Action")
	end
	task.spawn(playAnimation, p1, "Walk", "Movement")
end)
ReplicatedStorage.Remotes.Main.Animation.OnClientEvent:Connect(function(p1, p2, p3, p4) --[[ Line: 145 | Upvalues: t (copy), playAnimation (copy) ]]
	if not p1 then
		return
	end
	if t[p1] then
		return
	end
	if p4 and typeof(p4) == "number" then
		if not p1:FindFirstChild("Humanoid") then
			return
		end
		for k, v in pairs(p1.Humanoid:GetPlayingAnimationTracks()) do
			if v.Name ~= "Walk" then
				break
			end
			v:AdjustSpeed(p4)
		end
	else
		if not p2 then
			task.spawn(playAnimation, p1, "Attack", "Action", p3 or 0)
			return
		end
		if typeof(p2) == "table" then
			task.spawn(playAnimation, p1, p2[1], p2[2], p3 or 0, nil, nil, p4)
		else
			task.spawn(playAnimation, p1, p2, "Action", p3 or 0, nil, nil, p4)
		end
	end
end)
ReplicatedStorage.Remotes.Misc.Animations.Event:Connect(function(p1, p2, p3, p4, p5) --[[ Line: 169 | Upvalues: playAnimation (copy) ]]
	if not p1 then
		return
	end
	if p2 then
		return
	end
	task.spawn(playAnimation, p1, "Attack", "Action", p5 or 0, p3, p4)
end)
ReplicatedStorage.Remotes.Misc.ClearAnimations.Event:Connect(function(p1, p2) --[[ Line: 176 ]]
	if not p1 then
		return
	end
	for k, v in pairs(p1.Humanoid:GetPlayingAnimationTracks()) do
		if v.Name ~= "Idle" then
			v:Stop(p2)
		end
	end
end)
ReplicatedStorage.Remotes.Misc.ExtraAnimations.OnClientEvent:Connect(function(p1, p2) --[[ Line: 186 | Upvalues: t (copy) ]]
	if not p1 then
		return
	end
	if p2 == "Clear" then
		t[p1] = nil
		for k, v in pairs(p1.Humanoid:GetPlayingAnimationTracks()) do
			if v.Name ~= "Idle" then
				v:Stop(1)
			end
		end
	else
		if p2 ~= "Loop" then
			return
		end
		if t[p1] then
			return
		end
		t[p1] = true
		local v1 = nil
		for k, v in pairs(p1.Humanoid:GetPlayingAnimationTracks()) do
			if v.Name == "Attack" then
				v1 = v
			end
		end
		local v2 = nil
		v2 = v1.KeyframeReached:Connect(function(p12) --[[ Line: 209 | Upvalues: t (ref), p1 (copy), v2 (ref), v1 (ref) ]]
			if p12 ~= "keyloopend" then
				return
			end
			if not t[p1] then
				v2:Disconnect()
				return
			end
			v1.TimePosition = 1.8458329439163208
		end)
	end
end)
for k, v in pairs(workspace.Towers:GetChildren()) do
	if v:FindFirstChild("Spawned") then
		return
	end
	if not ReplicatedStorage.Towers:FindFirstChild(v.Name) then
		return
	end
	task.spawn(playAnimation, v, "Idle", "Idle")
end
workspace.Towers.ChildAdded:Connect(function(p1) --[[ Line: 231 | Upvalues: ReplicatedStorage (copy), playAnimation (copy) ]]
	if p1:FindFirstChild("Spawned") then
		return
	end
	if ReplicatedStorage.Towers:FindFirstChild(p1.Name) then
		task.spawn(playAnimation, p1, "Idle", "Idle")
	end
end)
workspace.Summoner.ChildAdded:Connect(function(p1) --[[ Line: 256 | Upvalues: ReplicatedStorage (copy), playAnimation (copy) ]]
	if p1:FindFirstChild("Spawned") then
		return
	end
	if ReplicatedStorage.Towers:FindFirstChild(p1.Name) then
		task.spawn(playAnimation, p1, "Idle", "Idle")
	end
end)
ReplicatedStorage.Remotes.Misc.Jumpscare.OnClientEvent:Connect(function(p1) --[[ Line: 281 | Upvalues: ClientState (copy), CurrentCamera (copy), ReplicatedStorage (copy), Sound (copy) ]]
	local JumpscareModel = workspace:FindFirstChild("JumpscareModel")
	if not JumpscareModel then
		return
	end
	if ClientState.GetData().Settings.Jumpscares then
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		local Animator = JumpscareModel:WaitForChild("Humanoid"):WaitForChild("Animator")
		local v1 = nil
		pcall(function() --[[ Line: 292 | Upvalues: v1 (ref), Animator (copy), ReplicatedStorage (ref), p1 (copy), CurrentCamera (ref) ]]
			v1 = Animator:LoadAnimation(ReplicatedStorage.Objects.Jumpscares[p1].Animation)
			if not v1 then
				CurrentCamera.CFrame = workspace.Jumpscare:WaitForChild("Cam").CFrame + Vector3.new(0, 0, 0)
				return
			end
			v1:Play()
			CurrentCamera.CFrame = workspace.Jumpscare:WaitForChild("Cam").CFrame + Vector3.new(0, 0, 0)
		end)
		Sound.PlaySound(ReplicatedStorage.Objects.Jumpscares[p1].Sound)
		task.wait(2)
		CurrentCamera.CameraType = Enum.CameraType.Custom
	end
end)
ReplicatedStorage.Remotes.Misc.RaidBossCamera.OnClientEvent:Connect(function(p1, p2, p3) --[[ Line: 306 | Upvalues: ReplicatedStorage (copy), ClientState (copy), CurrentCamera (copy), TweenService (copy), RunService (copy) ]]
	if p2 then
		if p3 then
			p2.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Objects.Animations.GateClose):Play()
		else
			p2.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Objects.Animations.GateOpen):Play()
			task.wait(4)
			local v1 = p2.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Objects.Animations.GateOpened)
			v1.Looped = true
			v1:Play()
		end
	else
		if ClientState.GetData().Settings.RaidBossCamera then
			return
		end
		local v2 = workspace.Map:FindFirstChild("Blender Camera" .. p1)
		if v2 and workspace.Map:FindFirstChild("RaidbossGate" .. p1) then
			local Camera = v2.Camera
			CurrentCamera.CameraType = Enum.CameraType.Scriptable
			Camera.Parent.Humanoid.Animator:LoadAnimation(ReplicatedStorage.Objects.Animations.GateCamera):Play()
			local v3 = TweenService:Create(CurrentCamera, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
				CFrame = Camera.CFrame
			})
			v3:Play()
			v3.Completed:Wait()
			local v4 = nil
			v4 = RunService.RenderStepped:Connect(function() --[[ Line: 349 | Upvalues: v4 (ref), CurrentCamera (ref), Camera (ref) ]]
				if not v4 then
					return
				end
				CurrentCamera.CFrame = Camera.CFrame
			end)
			task.wait(4)
			v4:Disconnect()
			CurrentCamera.CameraType = Enum.CameraType.Custom
		end
	end
end)
ReplicatedStorage.Remotes.Misc.Preload.OnClientEvent:Connect(function(p1) --[[ Line: 361 | Upvalues: ContentProvider (copy) ]]
	ContentProvider:PreloadAsync(p1)
end)
local function getMapModel(p1) --[[ getMapModel | Line: 365 | Upvalues: ReplicatedStorage (copy) ]]
	if not ReplicatedStorage.Values.PVP.Value then
		return workspace.Map
	end
	repeat
		task.wait()
	until p1:GetAttribute("PVPNumber")
	return workspace.Map[p1:GetAttribute("PVPNumber")]
end
ReplicatedStorage.Remotes.Main.ArrowAnimation.OnClientEvent:Connect(function() --[[ Line: 374 | Upvalues: getMapModel (copy), ReplicatedStorage (copy), TweenService (copy) ]]
	local t = {}
	local tbl = {}
	local t2 = { "Green" }
	for k, v in pairs(game.Players:GetPlayers()) do
		local v1 = getMapModel(v)
		if not table.find(t, v1) then
			table.insert(t, v1)
			for k2, v2 in pairs(v1.Paths:GetChildren()) do
				if not v2:GetAttribute("NoAnimation") then
					table.insert(tbl, v2)
				end
			end
		end
	end
	local function arrow(p1) --[[ arrow | Line: 393 | Upvalues: t2 (copy), ReplicatedStorage (ref), TweenService (ref) ]]
		local Start = p1:WaitForChild("Start")
		local sum = 0
		for i = 1, #p1:GetChildren() - 1 do
			local v1 = p1:WaitForChild((tostring(i)))
			sum = sum + (Start.Position - v1.Position).Magnitude
			Start = v1
		end
		local v2 = CFrame.Angles(0, 1.5707963267948966, 0)
		for k, v in pairs(t2) do
			task.spawn(function() --[[ Line: 405 | Upvalues: ReplicatedStorage (ref), v (copy), p1 (copy), TweenService (ref), sum (ref), v2 (copy) ]]
				local v1 = ReplicatedStorage.Objects.Chevrons[v]:Clone()
				v1.Parent = workspace
				local v22 = if v1:IsA("BasePart") then v1 else v1.PrimaryPart
				v22.Color = Color3.fromRGB(0, 165, 0)
				v22.CFrame = CFrame.lookAt(p1.Start.Position, p1["1"].Position)
				local v3 = RaycastParams.new()
				v3.FilterDescendantsInstances = { workspace.Map.Pathways }
				v3.FilterType = Enum.RaycastFilterType.Include
				local v4 = workspace:Raycast(v22.Position, Vector3.new(0, -100, 0), v3)
				local v5 = if v4 and v4.Position then Vector3.new(0, v4.Position.Y - v22.Position.Y + 0.25, 0) else Vector3.new(0, -5, 0)
				task.spawn(function() --[[ Line: 428 | Upvalues: v1 (copy), v22 (copy), TweenService (ref), sum (ref) ]]
					for v4, v5 in pairs(if v1 == v22 then v22 else v1:GetDescendants()) do
						if v5:IsA("BasePart") then
							TweenService:Create(v5, TweenInfo.new(sum / 20 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
								Color = Color3.fromRGB(165, 110, 0)
							}):Play()
							delay(sum / 20 / 2, function() --[[ Line: 433 | Upvalues: TweenService (ref), v5 (copy), sum (ref) ]]
								TweenService:Create(v5, TweenInfo.new(sum / 20 / 2, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
									Color = Color3.fromRGB(163, 75, 75)
								}):Play()
							end)
						end
					end
				end)
				local Start = p1.Start
				for i = 1, #p1:GetChildren() - 1 do
					local v8 = p1[tostring(i)]
					local v9 = TweenService:Create(v22, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						CFrame = CFrame.lookAt(Start.Position, v8.Position) * v2 + v5
					})
					v9:Play()
					v9.Completed:Wait()
					local v10 = TweenService:Create(v22, TweenInfo.new((v8.Position - Start.Position).Magnitude / 20, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
						CFrame = v22.CFrame - v22.Position + v8.Position + v5
					})
					v10:Play()
					v10.Completed:Wait()
					Start = v8
				end
				local v11 = TweenService:Create(v22, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					CFrame = v22.CFrame + (v22.CFrame * v2).LookVector * -20
				})
				v11:Play()
				v11.Completed:Wait()
				v1:Destroy()
			end)
			task.wait(0.1)
		end
	end
	for k, v in pairs(tbl) do
		for i = 1, 3 do
			task.spawn(arrow, v)
			task.wait(0.6)
		end
	end
end)