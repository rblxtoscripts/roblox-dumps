-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("RacePowerupData")
local v4 = Sonar("NotificationsClient")
local v5 = Sonar("ParticleUtils")
local v6 = Sonar("CameraUtils")
local v7 = Sonar("ColorCorrectionUtils")
local v8 = Sonar("spr")
local v9 = v2.GetRemoteEvent("RacePowerupAction")
local Hotbar = Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("RacesGui").RaceFrame.Hotbar
local Template = Hotbar.Template
local v10 = 0
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local t8 = {}
local t9 = {}
local function TrackIsClosedLoop(p1) --[[ TrackIsClosedLoop | Line: 40 ]]
	local v1 = #p1
	if v1 < 3 then
		return false
	end
	local sum = 0
	for i = 1, v1 - 1 do
		sum = sum + (p1[i + 1] - p1[i]).Magnitude
	end
	return (p1[1] - p1[v1]).Magnitude < sum / (v1 - 1) * 3
end
local function FindTrackWaypoints() --[[ FindTrackWaypoints | Line: 54 | Upvalues: TrackIsClosedLoop (copy) ]]
	local Races = workspace.Terrain:FindFirstChild("Races")
	if not Races then
		return nil, nil
	end
	local Track = Races:FindFirstChild("Track")
	if not Track then
		return nil, nil
	end
	local t = {}
	for v1, v2 in Track:GetChildren() do
		local v4 = tonumber(v2.Name)
		local v5 = nil
		if v2:IsA("BasePart") then
			v5 = v2.Position
		elseif v2:IsA("Model") and v2.PrimaryPart then
			v5 = v2.PrimaryPart.Position
		end
		if v4 and v5 then
			table.insert(t, {
				Num = v4,
				Pos = v5
			})
		end
	end
	if #t == 0 then
		return nil, nil
	end
	table.sort(t, function(p1, p2) --[[ Line: 79 ]]
		return p1.Num < p2.Num
	end)
	local t2 = {}
	for v6, v7 in t do
		table.insert(t2, v7.Pos)
	end
	return t2, TrackIsClosedLoop(t2)
end
local function DistSqPointToSegmentXZ(p1, p2, p3, p4, p5, p6) --[[ DistSqPointToSegmentXZ | Line: 89 ]]
	local v1 = p5 - p3
	local v2 = p6 - p4
	local v3 = p1 - p3
	local v4 = p2 - p4
	local v5 = v1 * v1 + v2 * v2
	if v5 < 1e-8 then
		local v6 = p1 - p3
		local v7 = p2 - p4
		return v6 * v6 + v7 * v7
	else
		local v8 = math.clamp((v3 * v1 + v4 * v2) / v5, 0, 1)
		local v9 = p1 - (p3 + v1 * v8)
		local v10 = p2 - (p4 + v2 * v8)
		return v9 * v9 + v10 * v10
	end
end
local function FindNearestWaypointIndex(p1, p2) --[[ FindNearestWaypointIndex | Line: 103 ]]
	local X = p2.X
	local Z = p2.Z
	local v1 = (1 / 0)
	local v2 = 1
	for v3, v4 in p1 do
		local v5 = v4.X - X
		local v6 = v4.Z - Z
		local v7 = v5 * v5 + v6 * v6
		if v7 < v1 then
			v1 = v7
			v2 = v3
		end
	end
	return v2
end
local function PathLengthFromIndices(p1, p2) --[[ PathLengthFromIndices | Line: 119 ]]
	local sum = 0
	for i = 1, #p1 - 1 do
		sum = sum + (p2[p1[i + 1]] - p2[p1[i]]).Magnitude
	end
	return sum
end
local function BuildForwardPath(p1, p2, p3) --[[ BuildForwardPath | Line: 127 ]]
	local v1, v2 = p1, { p1 }
	while v1 ~= p2 do
		v1 = v1 % p3 + 1
		table.insert(v2, v1)
	end
	return v2
end
local function BuildBackwardPath(p1, p2, p3) --[[ BuildBackwardPath | Line: 137 ]]
	local v1, v2 = p1, { p1 }
	while v1 ~= p2 do
		local v3
		v3 = if v1 == 1 and p3 then p3 else v1 - 1
		table.insert(v2, v3)
		v1 = v3
	end
	return v2
end
local function ShortestPathIndices(p1, p2, p3, p4) --[[ ShortestPathIndices | Line: 147 | Upvalues: BuildBackwardPath (copy), PathLengthFromIndices (copy) ]]
	local v1 = #p3
	if p1 == p2 then
		return { p1 }
	end
	if p4 then
		v2 = p1
		v3 = { p1 }
		while v2 ~= p2 do
			v2 = v2 % v1 + 1
			table.insert(v3, v2)
		end
		local v4 = BuildBackwardPath(p1, p2, v1)
		if PathLengthFromIndices(v3, p3) <= PathLengthFromIndices(v4, p3) then
			return v3
		else
			return v4
		end
	else
		local t = {}
		if p1 < p2 then
			for i = p1, p2 do
				table.insert(t, i)
			end
		else
			for j = p1, p2, -1 do
				table.insert(t, j)
			end
		end
		return t
	end
end
local function GetForwardTrackTargetPosition(p1, p2, p3) --[[ GetForwardTrackTargetPosition | Line: 173 | Upvalues: DistSqPointToSegmentXZ (copy) ]]
	local v1 = #p1
	if v1 == 0 then
		return nil
	end
	if v1 == 1 then
		return p1[1]
	end
	local X = p3.X
	local Z = p3.Z
	local v2 = (1 / 0)
	local v3 = 1
	for i = 1, v1 - 1 do
		local v4 = p1[i]
		local v5 = p1[i + 1]
		local v6 = DistSqPointToSegmentXZ(X, Z, v4.X, v4.Z, v5.X, v5.Z)
		if v6 < v2 then
			v2 = v6
			v3 = i
		end
	end
	if p2 then
		local v7 = p1[v1]
		local v8 = p1[1]
		if DistSqPointToSegmentXZ(X, Z, v7.X, v7.Z, v8.X, v8.Z) < v2 then
			v3 = v1
		end
	end
	if p2 and v3 == v1 then
		return p1[1]
	end
	if v3 < v1 then
		return p1[v3 + 1]
	end
	if v1 >= 2 then
		return p1[v1] + (p1[v1] - p1[v1 - 1]).Unit * 80
	else
		return p1[v1]
	end
end
local function GetLocalAnimalRoot() --[[ GetLocalAnimalRoot | Line: 212 | Upvalues: v1 (copy) ]]
	local v12 = v1.GetClient()
	if v12 and v12.CurrentHorse then
		return v12.CurrentHorse.Model:FindFirstChild("HumanoidRootPart")
	else
		return nil
	end
end
local function PlaySoundOnPart(p1, p2) --[[ PlaySoundOnPart | Line: 220 | Upvalues: ReplicatedStorage (copy) ]]
	if not (p2 and p2:IsDescendantOf(workspace)) then
		return
	end
	local v1 = ReplicatedStorage.Storage.SFX:FindFirstChild(p1, true)
	if not v1 then
		return
	end
	local v2 = v1:Clone()
	v2.Parent = p2
	v2:Play()
	v2.Ended:Once(function() --[[ Line: 230 | Upvalues: v2 (copy) ]]
		v2:Destroy()
	end)
end
local t10 = {}
local v11 = nil
local function UpdateAllOrbits(p1) --[[ UpdateAllOrbits | Line: 240 | Upvalues: t10 (ref), v1 (copy) ]]
	for v2, v3 in t10 do
		local v12
		local v4, v5
		if v3.GetRoot then
			v12 = v3.GetRoot()
			if not v12 then
				v4 = v1.GetClient()
				if v4 and v4.CurrentHorse then
					v5 = v4.CurrentHorse.Model:FindFirstChild("HumanoidRootPart")
					v12 = v5
				else
					v12 = nil
				end
			end
		else
			v4 = v1.GetClient()
			if v4 and v4.CurrentHorse then
				v5 = v4.CurrentHorse.Model:FindFirstChild("HumanoidRootPart")
				v12 = v5
			else
				v12 = nil
			end
		end
		if v12 and v12.Parent then
			local sum = 0
			for v6, v7 in t10 do
				if v2 ~= v6 then
					local v8 = (v3.Angle - v7.Angle + math.pi) % 6.283185307179586 - math.pi
					sum = sum + (if v8 >= 0 then 1 else -1) / math.max(math.abs(v8), 0.1)
				end
			end
			v3.Angle = v3.Angle + (p1 * v3.OrbitSpeed + p1 * sum * 3)
			local Angle = v3.Angle
			local v13 = v3.YOffset + math.sin(Angle * v3.BobSpeed) * v3.BobHeight
			v3.SetPosition(v12.Position + Vector3.new(math.cos(Angle) * v3.OrbitRadius, v13, math.sin(Angle) * v3.OrbitRadius), v12)
		end
	end
end
local function StartOrbitLoop() --[[ StartOrbitLoop | Line: 273 | Upvalues: v11 (ref), RunService (copy), UpdateAllOrbits (copy) ]]
	if not v11 then
		v11 = RunService.Heartbeat:Connect(function(p1_2_2_2) --[[ Line: 277 | Upvalues: UpdateAllOrbits (ref) ]]
			UpdateAllOrbits(p1_2_2_2)
		end)
	end
end
local function StopOrbitLoopIfEmpty() --[[ StopOrbitLoopIfEmpty | Line: 282 | Upvalues: t10 (ref), v11 (ref) ]]
	if #t10 ~= 0 or not v11 then
		return
	end
	v11:Disconnect()
	v11 = nil
end
local function RegisterOrbitItem(p1) --[[ RegisterOrbitItem | Line: 289 | Upvalues: t10 (ref), v11 (ref), RunService (copy), UpdateAllOrbits (copy) ]]
	table.insert(t10, p1)
	if not v11 then
		v11 = RunService.Heartbeat:Connect(function(p1_2_2_2) --[[ Line: 277 | Upvalues: UpdateAllOrbits (ref) ]]
			UpdateAllOrbits(p1_2_2_2)
		end)
	end
	return p1
end
local function UnregisterOrbitItem(p1) --[[ UnregisterOrbitItem | Line: 295 | Upvalues: t10 (ref), v11 (ref) ]]
	local v1 = table.find(t10, p1)
	if v1 then
		table.remove(t10, v1)
	end
	if #t10 ~= 0 or not v11 then
		return
	end
	v11:Disconnect()
	v11 = nil
end
local function CleanupShield(p1) --[[ CleanupShield | Line: 303 | Upvalues: t10 (ref), v11 (ref) ]]
	if p1.OrbitItem then
		local v1 = table.find(t10, p1.OrbitItem)
		if v1 then
			table.remove(t10, v1)
		end
		if #t10 == 0 and v11 then
			v11:Disconnect()
			v11 = nil
		end
	end
	if p1.Model then
		p1.Model:Destroy()
	end
	if p1.HighlightConnection then
		p1.HighlightConnection:Disconnect()
		p1.HighlightConnection = nil
	end
	if p1.Highlight then
		p1.Highlight:Destroy()
		p1.Highlight = nil
	end
	if p1.ShieldParticle then
		p1.ShieldParticle.Maid:DoCleaning()
		p1.ShieldParticle = nil
	end
	if not (p1.Animal and (p1.Animal.Model and p1.Animal.Model.Parent)) then
		return
	end
	local v2 = p1.Animal.Model:GetAttribute("SwiftShieldCount") or 0
	if v2 <= 1 then
		p1.Animal.Model:SetAttribute("SwiftShieldCount", nil)
		p1.Animal.Model:SetAttribute("SwiftShield", nil)
		return
	end
	p1.Animal.Model:SetAttribute("SwiftShieldCount", v2 - 1)
end
local function RemoveOldestShield() --[[ RemoveOldestShield | Line: 333 | Upvalues: t3 (ref), CleanupShield (copy) ]]
	if #t3 ~= 0 then
		CleanupShield((table.remove(t3, 1)))
	end
end
local function AddShield(p1, p2) --[[ AddShield | Line: 341 | Upvalues: v1 (copy), ReplicatedStorage (copy), v10 (ref), v7 (copy), v4 (copy), t10 (ref), v11 (ref), RunService (copy), UpdateAllOrbits (copy), v5 (copy), t3 (ref), CleanupShield (copy) ]]
	local v12
	if p2 then
		v12 = p2
	else
		local v2 = v1.GetClient()
		v12 = if v2 then v2:GetCurrentAnimal() else v2
	end
	if not (v12 and v12.Model) then
		return
	end
	local HumanoidRootPart = v12.Model:FindFirstChild("HumanoidRootPart")
	if not HumanoidRootPart then
		return
	end
	local v42 = ReplicatedStorage
	for v52, v6 in p1.AssetPath do
		v42 = v42 and v42:FindFirstChild(v6)
	end
	if not v42 then
		return
	end
	if not p1.IsRemote then
		v10 = v10 + 1
		v7:Tween()
		v4.Notify({
			ChatMessage = false,
			Message = p1.NotifyMessage,
			Preset = p1.NotifyPreset
		})
	end
	local v8 = v42:Clone()
	v8.Parent = HumanoidRootPart
	local Orbit = p1.Orbit
	local t = {
		Angle = 0,
		OrbitRadius = Orbit.OrbitRadius,
		OrbitSpeed = Orbit.OrbitSpeed,
		BobSpeed = Orbit.BobSpeed,
		BobHeight = Orbit.BobHeight,
		YOffset = Orbit.YOffset,
		GetRoot = function() --[[ GetRoot | Line: 384 | Upvalues: HumanoidRootPart (copy) ]]
			return HumanoidRootPart
		end,
		SetPosition = function(p1, p2) --[[ SetPosition | Line: 385 | Upvalues: v8 (copy) ]]
			v8:PivotTo(CFrame.lookAt(p1, p2.Position))
		end
	}
	table.insert(t10, t)
	if not v11 then
		v11 = RunService.Heartbeat:Connect(function(p1_2_2_2) --[[ Line: 277 | Upvalues: UpdateAllOrbits (ref) ]]
			UpdateAllOrbits(p1_2_2_2)
		end)
	end
	local v102 = Color3.fromRGB(74, 74, 255)
	local v112 = Color3.fromRGB(69, 252, 255)
	local Highlight = Instance.new("Highlight")
	Highlight.DepthMode = Enum.HighlightDepthMode.Occluded
	Highlight.FillTransparency = 1
	Highlight.OutlineColor = v112
	Highlight.OutlineTransparency = 0.25
	Highlight.Adornee = v12.Model
	Highlight.Parent = v12.Model
	local v122 = tick()
	local t2 = {
		Model = v8,
		OrbitItem = t,
		Config = p1,
		Animal = v12,
		Highlight = Highlight,
		HighlightConnection = RunService.Heartbeat:Connect(function() --[[ Line: 402 | Upvalues: v122 (copy), Highlight (copy), v102 (copy), v112 (copy) ]]
			Highlight.OutlineColor = v102:Lerp(v112, (math.sin((tick() - v122) * 3) + 1) / 2)
		end),
		ShieldParticle = v5.CreateParticleAtPosition({
			ParticleName = "ShieldParticle",
			Parent = HumanoidRootPart,
			Duration = p1.Duration
		})
	}
	local v13 = t3
	table.insert(v13, t2)
	v12.Model:SetAttribute("SwiftShieldCount", (v12.Model:GetAttribute("SwiftShieldCount") or 0) + 1)
	v12.Model:SetAttribute("SwiftShield", math.floor((workspace:GetServerTimeNow())) + p1.Duration)
	task.delay(p1.Duration, function() --[[ Line: 428 | Upvalues: t3 (ref), t2 (copy), CleanupShield (ref), p1 (copy), v10 (ref), v4 (ref) ]]
		local v1 = table.find(t3, t2)
		if not v1 then
			return
		end
		table.remove(t3, v1)
		CleanupShield(t2)
		if p1.IsRemote then
			return
		end
		v10 = math.max(0, v10 - 1)
		v4.Notify({
			ChatMessage = false,
			Message = p1.ExpireMessage,
			Preset = p1.NotifyPreset
		})
	end)
end
local v12 = nil
local function GetNextClickId() --[[ GetNextClickId | Line: 460 | Upvalues: t4 (ref), t6 (ref) ]]
	for i = #t4, 1, -1 do
		local v1 = t4[i]
		if t6[v1] then
			return v1
		end
		table.remove(t4, i)
	end
	return nil
end
local function RefreshActiveClick() --[[ RefreshActiveClick | Line: 471 | Upvalues: v12 (ref), GetNextClickId (copy) ]]
	v12 = GetNextClickId()
end
local function RegisterClickPowerup(p1) --[[ RegisterClickPowerup | Line: 475 | Upvalues: t6 (ref), t4 (ref), v12 (ref) ]]
	t6[p1] = true
	table.insert(t4, p1)
	v12 = p1
end
local function UnregisterClickPowerup(p1) --[[ UnregisterClickPowerup | Line: 481 | Upvalues: t6 (ref), v12 (ref), GetNextClickId (copy) ]]
	t6[p1] = nil
	if v12 ~= p1 then
		return
	end
	v12 = GetNextClickId()
end
local function AddClickToUse(p1) --[[ AddClickToUse | Line: 488 | Upvalues: v1 (copy), v10 (ref), v4 (copy), ReplicatedStorage (copy), Template (copy), Hotbar (copy), t9 (ref), v8 (copy), t10 (ref), v11 (ref), RunService (copy), UpdateAllOrbits (copy), t6 (ref), v12 (ref), GetNextClickId (copy), t7 (ref), t4 (ref) ]]
	local v13 = v1.GetClient()
	local v2 = if v13 and v13.CurrentHorse then v13.CurrentHorse.Model:FindFirstChild("HumanoidRootPart") else nil
	if not v2 then
		return
	end
	v10 = v10 + 1
	v4.Notify({
		ChatMessage = false,
		Message = p1.NotifyMessage,
		Preset = p1.NotifyPreset
	})
	local Indicator = p1.Indicator
	local v3 = ReplicatedStorage
	for v42, v5 in Indicator.AssetPath do
		v3 = v3 and v3:FindFirstChild(v5)
	end
	if v3 then
		local v7 = v3:Clone()
		v7.Anchored = true
		v7.CanCollide = false
		v7.CanQuery = false
		v7.CanTouch = false
		v7.Parent = workspace.CurrentCamera
		local v82 = Template:Clone()
		v82.UIScale.Scale = 0
		v82.Menu.NameLabel.Lower.Title.Text = p1.DisplayName
		v82.Menu.NameLabel.Upper.Title.Text = p1.DisplayName
		v82.Menu.NameLabel.Upper.Title.UIGradient.Color = p1.GradientColor
		v82.Visible = true
		v82.Parent = Hotbar
		local v9 = t9
		table.insert(v9, v82)
		v8.target(v82.UIScale, 1, 1, {
			Scale = 1
		})
		local v102 = false
		local v112 = false
		local t = {}
		local t2 = {
			Angle = 0,
			OrbitRadius = Indicator.OrbitRadius,
			OrbitSpeed = Indicator.OrbitSpeed,
			BobSpeed = Indicator.BobSpeed,
			BobHeight = Indicator.BobHeight,
			YOffset = Indicator.YOffset,
			SetPosition = function(p1) --[[ SetPosition | Line: 543 | Upvalues: Indicator (copy), v7 (ref) ]]
				local v1 = CFrame.new(p1)
				if Indicator.RotationCFrame then
					v1 = v1 * Indicator.RotationCFrame
				end
				v7.CFrame = v1
			end
		}
		local v122 = t10
		table.insert(v122, t2)
		if not v11 then
			v11 = RunService.Heartbeat:Connect(function(p1_2_2_2) --[[ Line: 277 | Upvalues: UpdateAllOrbits (ref) ]]
				UpdateAllOrbits(p1_2_2_2)
			end)
		end
		local v132 = t2
		local function v14() --[[ Cleanup | Line: 552 | Upvalues: v112 (ref), v10 (ref), t (copy), t6 (ref), v12 (ref), GetNextClickId (ref), v132 (copy), t10 (ref), v11 (ref), v7 (ref), t7 (ref), v14 (copy), t9 (ref), v82 (copy), v8 (ref) ]]
			if v112 then
				return
			end
			v112 = true
			v10 = math.max(0, v10 - 1)
			local v2 = t
			t6[v2] = nil
			if v12 == v2 then
				v12 = GetNextClickId()
			end
			local v4 = table.find(t10, v132)
			if v4 then
				table.remove(t10, v4)
			end
			if #t10 == 0 and v11 then
				v11:Disconnect()
				v11 = nil
			end
			v7:Destroy()
			local v5 = table.find(t7, v14)
			if v5 then
				table.remove(t7, v5)
			end
			local v6 = table.find(t9, v82)
			if v6 then
				table.remove(t9, v6)
			end
			v8.target(v82.UIScale, 1, 1, {
				Scale = 0
			})
			task.delay(0.25, function() --[[ Line: 574 | Upvalues: v82 (ref) ]]
				v82:Destroy()
			end)
		end
		local v15 = t7
		table.insert(v15, v14)
		function t.OnClick() --[[ Line: 581 | Upvalues: v102 (ref), v2 (copy), v1 (ref), v14 (copy), p1 (copy) ]]
			if v102 then
				return false
			end
			if not (v2 and v2.Parent) then
				return false
			end
			v102 = true
			local v12 = v1.GetClient()
			local v22 = if v12 then v12.CurrentHorse else v12
			if not (v22 and v22.Root) then
				v14()
				return true
			end
			local LookVector = v22.Root.CFrame.LookVector
			if p1.BehindDistance then
				local v3 = v22.Root.Position - LookVector * p1.BehindDistance
				local v4 = RaycastParams.new()
				v4.ExcludeInstances = { v12.Character, v22.Model, workspace.CurrentCamera }
				local v5 = workspace:Raycast(v3 + Vector3.new(0, 20, 0), Vector3.new(0, -50, 0), v4)
				p1.OnUse(if v5 then v5.Position or v3 else v3, LookVector)
			else
				p1.OnUse(v22.Root.Position, LookVector)
			end
			v14()
			return true
		end
		t6[t] = true
		table.insert(t4, t)
		v12 = t
		task.delay(p1.ExpiryTime, function() --[[ Line: 620 | Upvalues: v102 (ref), v112 (ref), v4 (ref), p1 (copy), v14 (copy) ]]
			if v102 or v112 then
				return
			end
			v4.Notify({
				Preset = "Red",
				ChatMessage = false,
				Message = p1.ExpiryMessage
			})
			v14()
		end)
	end
end
local function SpawnProjectileInternal(p1) --[[ SpawnProjectileInternal | Line: 632 | Upvalues: FindTrackWaypoints (copy), GetForwardTrackTargetPosition (copy), t8 (ref), RunService (copy), FindNearestWaypointIndex (copy), ShortestPathIndices (copy) ]]
	local StartPosition = p1.StartPosition
	local v1 = true
	local v2 = tick()
	local v3
	if p1.Model then
		v3 = p1.Model:Clone()
	else
		v3 = Instance.new("Part")
		v3.Size = p1.Size or Vector3.new(2, 2, 2)
		v3.Shape = p1.Shape or Enum.PartType.Ball
		v3.Material = p1.Material or Enum.Material.Neon
		v3.Color = p1.Color or Color3.fromRGB(255, 100, 0)
	end
	v3.Anchored = true
	v3.CanCollide = false
	v3.CanQuery = false
	v3.CanTouch = false
	v3.Parent = workspace.CurrentCamera
	local v7 = p1.Speed or 80
	local v8 = p1.Lifetime or 10
	local v9 = p1.HitRadius or 5
	local v10 = p1.VelocityPrediction or 0
	local v11 = 1
	local v12 = p1.TrackBlend or 0.15
	local v13, v14
	if p1.FollowTrack then
		local v15, v16 = FindTrackWaypoints()
		v13 = v16
		v14 = v15
	else
		v14 = nil
		v13 = nil
	end
	local v17 = p1.MaxBounces or 3
	local v18 = RaycastParams.new()
	v18.ExcludeInstances = { workspace.CurrentCamera }
	local v19 = nil
	if typeof(p1.Target) == "Vector3" then
		v19 = p1.Target
	elseif typeof(p1.Target) == "Instance" and p1.Target:IsA("BasePart") then
		v19 = p1.Target.Position
	end
	if typeof(p1.Target) == "Vector3" and (v14 and (#v14 > 0 and v13 ~= nil)) then
		local v20 = GetForwardTrackTargetPosition(v14, v13, StartPosition)
		if v20 then
			v19 = v20
		end
	end
	local v21 = v19 and (Vector3.new(v19.X, StartPosition.Y, v19.Z) - StartPosition).Unit or Vector3.new(0, 0, 1)
	local v22 = nil
	local function Cleanup() --[[ Cleanup | Line: 689 | Upvalues: v1 (ref), v22 (ref), v3 (ref), t8 (ref) ]]
		if not v1 then
			return
		end
		v1 = false
		if v22 and v22.Connection then
			v22.Connection:Disconnect()
		end
		v3:Destroy()
		local v12 = table.find(t8, v22)
		if not v12 then
			return
		end
		table.remove(t8, v12)
	end
	local v23 = RaycastParams.new()
	v23.ExcludeInstances = { workspace.CurrentCamera }
	local v24 = p1.HoverHeight or 4
	local v25 = 0
	v22 = {
		Connection = RunService.Heartbeat:Connect(function(p12) --[[ Line: 711 | Upvalues: v1 (ref), v25 (ref), p1 (copy), v14 (ref), v13 (ref), GetForwardTrackTargetPosition (ref), StartPosition (ref), v10 (copy), v7 (copy), Cleanup (copy), v21 (ref), FindNearestWaypointIndex (ref), ShortestPathIndices (ref), v11 (ref), v12 (copy), v17 (ref), v18 (copy), v23 (copy), v24 (copy), v3 (ref), v9 (copy), v2 (copy), v8 (copy) ]]
			if not v1 then
				return
			end
			v25 = v25 + p12
			local sum = nil
			if typeof(p1.Target) == "Vector3" and (v14 and (#v14 > 0 and v13 ~= nil)) then
				sum = GetForwardTrackTargetPosition(v14, v13, StartPosition) or p1.Target
			elseif typeof(p1.Target) == "Vector3" then
				sum = p1.Target
			elseif typeof(p1.Target) == "Instance" and p1.Target:IsA("BasePart") then
				sum = p1.Target.Position
				if v10 > 0 then
					local AssemblyLinearVelocity = p1.Target.AssemblyLinearVelocity
					if AssemblyLinearVelocity then
						sum = sum + AssemblyLinearVelocity * ((sum - StartPosition).Magnitude / v7) * v10
					end
				end
			end
			if not sum then
				Cleanup()
				return
			end
			local v22 = Vector3.new(sum.X, StartPosition.Y, sum.Z) - StartPosition
			local v32 = if v22.Magnitude < 0.01 then v21 else v22.Unit
			if v14 and (#v14 > 0 and v13 ~= nil) then
				local v4 = ShortestPathIndices(FindNearestWaypointIndex(v14, StartPosition), FindNearestWaypointIndex(v14, sum), v14, v13)
				v11 = math.min(v11, #v4)
				if v11 < 1 then
					v11 = 1
				end
				while v11 <= #v4 do
					local v6 = v14[v4[v11]]
					if Vector3.new(v6.X - StartPosition.X, 0, v6.Z - StartPosition.Z).Magnitude >= 15 then
						break
					end
					v11 = v11 + 1
				end
				local v92 = v4[v11]
				if v92 then
					local v102 = v14[v92]
					local v132 = Vector3.new(v102.X - StartPosition.X, 0, v102.Z - StartPosition.Z)
					if v132.Magnitude > 0.01 then
						v32 = (v132.Unit * v12 + v32 * (1 - v12)).Unit
					end
				end
			end
			v21 = (v21 + (v32 - v21) * math.min(p12 * 18, 1)).Unit
			if v17 > 0 then
				local v15 = workspace:Raycast(StartPosition, v21 * (v7 * p12 * 3), v18)
				if v15 and v15.Instance then
					local v16 = v15.Instance.Name:lower()
					local v172 = v15.Instance.Parent and v15.Instance.Parent.Name:lower() or ""
					if v16:find("wall") or v172:find("wall") then
						local Normal = v15.Normal
						v21 = (v21 - 2 * v21:Dot(Normal) * Normal).Unit
						v17 = v17 - 1
						StartPosition = v15.Position + Normal * 1.5
					end
				end
			end
			StartPosition = StartPosition + v21 * v7 * p12
			local v182 = workspace:Raycast(StartPosition + Vector3.new(0, 20, 0), Vector3.new(0, -60, 0), v23)
			if v182 then
				StartPosition = Vector3.new(StartPosition.X, StartPosition.Y + (v182.Position.Y + v24 - StartPosition.Y) * math.min(p12 * 10, 1), StartPosition.Z)
			end
			local v212 = v25 * 12
			local v222 = v21:Cross(Vector3.new(0, 1, 0))
			local v232 = if v222.Magnitude < 0.01 then Vector3.new(1, 0, 0) else v222.Unit
			local Unit = v232:Cross(v21).Unit
			local v242 = StartPosition + (v232 * math.cos(v212) * 1.5 + Unit * math.sin(v212) * 1.5)
			v3:PivotTo(CFrame.lookAt(v242, v242 + v21) * CFrame.Angles(0, 0, v25 * 8))
			if typeof(p1.Target) == "Instance" and p1.Target:IsA("BasePart") and Vector3.new(sum.X - StartPosition.X, 0, sum.Z - StartPosition.Z).Magnitude <= v9 then
				Cleanup()
				if not p1.OnHit then
					return
				end
				p1.OnHit(StartPosition)
				return
			end
			if not (v8 <= tick() - v2) then
				return
			end
			Cleanup()
			if not p1.OnExpire then
				return
			end
			p1.OnExpire()
		end),
		Model = v3,
		Cleanup = Cleanup
	}
	local v26 = t8
	local v27 = v22
	table.insert(v26, v27)
	return v22
end
local function SpawnShockwave(p1, p2) --[[ SpawnShockwave | Line: 858 | Upvalues: ReplicatedStorage (copy), TweenService (copy) ]]
	local Wave = ReplicatedStorage.Storage.Assets.VFX:FindFirstChild("Wave")
	if Wave then
		local v1 = Wave:Clone()
		v1.Anchored = true
		v1.CanCollide = false
		v1.CanQuery = false
		v1.CanTouch = false
		local v2 = p1 + p2 * 6
		v1.CFrame = CFrame.lookAt(v2, v2 + p2) * CFrame.Angles(1.5707963267948966, 0, 0)
		v1.Size = Vector3.new(1, 0.2, 1)
		v1.Transparency = 0.3
		v1.Parent = workspace.CurrentCamera
		local v3 = TweenService:Create(v1, TweenInfo.new(0.4, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			Size = Vector3.new(12, 6, 12),
			Transparency = 1
		})
		v3:Play()
		v3.Completed:Once(function() --[[ Line: 883 | Upvalues: v1 (copy) ]]
			v1:Destroy()
		end)
	end
end
local function SpawnProjectile(p1) --[[ SpawnProjectile | Line: 888 | Upvalues: v6 (copy), ReplicatedStorage (copy), SpawnShockwave (copy), SpawnProjectileInternal (copy) ]]
	v6.Shake("Bump")
	ReplicatedStorage.Storage.SFX.Shoot:Play()
	local StartPosition = p1.StartPosition
	local v1 = nil
	if typeof(p1.Target) == "Vector3" then
		v1 = p1.Target
	elseif typeof(p1.Target) == "Instance" and p1.Target:IsA("BasePart") then
		v1 = p1.Target.Position
	end
	if not v1 then
		return SpawnProjectileInternal(p1)
	end
	SpawnShockwave(StartPosition, (v1 - StartPosition).Unit)
	return SpawnProjectileInternal(p1)
end
local function v13() --[[ BuildContext | Line: 908 | Upvalues: v4 (copy), GetLocalAnimalRoot (copy), v1 (copy), v9 (copy), v6 (copy), v7 (copy), v10 (ref), t5 (ref), RegisterOrbitItem (copy), UnregisterOrbitItem (copy), AddShield (copy), AddClickToUse (copy), SpawnProjectile (copy), Sonar (copy), RunService (copy), Players (copy), PlaySoundOnPart (copy), v5 (copy), ReplicatedStorage (copy), v3 (copy), v13 (copy) ]]
	return {
		Notify = function(p1, p2) --[[ Notify | Line: 910 | Upvalues: v4 (ref) ]]
			v4.Notify({
				ChatMessage = false,
				Message = p1,
				Preset = p2
			})
		end,
		GetRoot = GetLocalAnimalRoot,
		GetHorse = function() --[[ GetHorse | Line: 918 | Upvalues: v1 (ref) ]]
			local v12 = v1.GetClient()
			return if v12 then v12.CurrentHorse else v12
		end,
		GetAnimal = function() --[[ GetAnimal | Line: 922 | Upvalues: v1 (ref) ]]
			local v12 = v1.GetClient()
			return if v12 then v12:GetCurrentAnimal() else v12
		end,
		FireServer = function(p1, ...) --[[ FireServer | Line: 926 | Upvalues: v9 (ref) ]]
			v9:FireServer(p1, ...)
		end,
		Shake = function(p1) --[[ Shake | Line: 929 | Upvalues: v6 (ref) ]]
			v6.Shake(p1)
		end,
		ColorCorrection = function() --[[ ColorCorrection | Line: 932 | Upvalues: v7 (ref) ]]
			v7:Tween()
		end,
		AddHeld = function() --[[ AddHeld | Line: 935 | Upvalues: v10 (ref) ]]
			v10 = v10 + 1
		end,
		RemoveHeld = function() --[[ RemoveHeld | Line: 938 | Upvalues: v10 (ref) ]]
			v10 = math.max(0, v10 - 1)
		end,
		CanHoldMore = function() --[[ CanHoldMore | Line: 941 | Upvalues: v10 (ref) ]]
			return v10 < 3
		end,
		RegisterCleanup = function(p1) --[[ RegisterCleanup | Line: 944 | Upvalues: t5 (ref) ]]
			table.insert(t5, p1)
		end,
		RegisterOrbitItem = RegisterOrbitItem,
		UnregisterOrbitItem = UnregisterOrbitItem,
		AddShield = AddShield,
		AddClickToUse = AddClickToUse,
		SpawnProjectile = SpawnProjectile,
		FindNearestTarget = function() --[[ FindNearestTarget | Line: 952 | Upvalues: v1 (ref), Sonar (ref), RunService (ref), Players (ref) ]]
			local v12 = v1.GetClient()
			local v2 = if v12 and v12.CurrentHorse then v12.CurrentHorse.Model:FindFirstChild("HumanoidRootPart") else nil
			if not v2 then
				return nil
			end
			local v3 = Sonar("RacesClient")
			if not v3:GetActiveRace() then
				return nil
			end
			if RunService:IsStudio() then
				local TargetHorse = workspace:FindFirstChild("TargetHorse")
				if TargetHorse then
					local HumanoidRootPart = TargetHorse:FindFirstChild("HumanoidRootPart")
					if HumanoidRootPart then
						return {
							Part = HumanoidRootPart,
							Player = {
								UserId = 0
							}
						}
					end
				end
			end
			local LocalPlayer = Players.LocalPlayer
			local v4 = (1 / 0)
			local v5 = nil
			for v6, v7 in Players:GetPlayers() do
				if v7 ~= LocalPlayer and v3.IsPlayerInRace(v7) then
					local Character = v7.Character
					local v8 = if Character then Character:FindFirstChildOfClass("Humanoid") else Character
					local v9 = if v8 then v8.SeatPart else v8
					local v10 = if v9 then v9:FindFirstAncestorOfClass("Model") else v9
					local v11 = if v10 then v10:FindFirstChild("HumanoidRootPart") else v10
					local v122 = if v11 then v11 elseif Character then Character:FindFirstChild("HumanoidRootPart") else Character
					if v122 then
						local Magnitude = (v122.Position - v2.Position).Magnitude
						if Magnitude < v4 then
							v4 = Magnitude
							v5 = {
								Part = v122,
								Player = v7
							}
						end
					end
				end
			end
			return v5
		end,
		PlaySoundOnPart = function(p1, p2) --[[ PlaySoundOnPart | Line: 1004 | Upvalues: PlaySoundOnPart (ref) ]]
			PlaySoundOnPart(p1, p2)
		end,
		SpawnParticleAbove = function(p1, p2, p3, p4) --[[ SpawnParticleAbove | Line: 1007 | Upvalues: v5 (ref), t5 (ref) ]]
			local v2 = v5.CreateParticleAtPosition({
				ParticleName = p1,
				Position = p2.Position + Vector3.new(0, p3, 0),
				Duration = p4
			})
			local v3 = false
			local function f5() --[[ Line: 1015 | Upvalues: v3 (ref), v2 (copy) ]]
				if not v3 then
					v3 = true
					v2.Maid:DoCleaning()
				end
			end
			table.insert(t5, f5)
		end,
		SpawnParticleAt = function(p1, p2, p3) --[[ SpawnParticleAt | Line: 1021 | Upvalues: v5 (ref), t5 (ref) ]]
			local v1 = v5.CreateParticleAtPosition({
				ParticleName = p1,
				Parent = p2,
				Duration = p3
			})
			local v2 = false
			local function f4() --[[ Line: 1028 | Upvalues: v2 (ref), v1 (copy) ]]
				if not v2 then
					v2 = true
					v1.Maid:DoCleaning()
				end
			end
			table.insert(t5, f4)
		end,
		AttachVFX = function(p1, p2, p3) --[[ AttachVFX | Line: 1034 | Upvalues: ReplicatedStorage (ref), t5 (ref) ]]
			local v1 = ReplicatedStorage.Storage.Assets.VFX:FindFirstChild(p1)
			if not v1 then
				return
			end
			local v2 = v1:Clone()
			v2.Parent = p2
			local v3 = false
			local function cleanup() --[[ cleanup | Line: 1041 | Upvalues: v3 (ref), v2 (copy) ]]
				if not v3 then
					v3 = true
					v2:Destroy()
				end
			end
			table.insert(t5, cleanup)
			task.delay(p3, cleanup)
		end,
		OnProjectileHit = function(p1, p2) --[[ OnProjectileHit | Line: 1050 | Upvalues: v3 (ref), v13 (ref) ]]
			local v1 = v3.GetSkill(p1)
			if not (v1 and v1.OnClientHit) then
				return
			end
			v1.OnClientHit(v13(), p2)
		end
	}
end
function t.CanHoldMore() --[[ CanHoldMore | Line: 1059 | Upvalues: v10 (ref) ]]
	return v10 < 3
end
function t.AddHeld() --[[ AddHeld | Line: 1063 | Upvalues: v10 (ref) ]]
	v10 = v10 + 1
end
function t.RemoveHeld() --[[ RemoveHeld | Line: 1067 | Upvalues: v10 (ref) ]]
	v10 = math.max(0, v10 - 1)
end
function t.GetHeldCount() --[[ GetHeldCount | Line: 1071 | Upvalues: v10 (ref) ]]
	return v10
end
function t.ResetHeld() --[[ ResetHeld | Line: 1075 | Upvalues: t3 (ref), CleanupShield (copy), t8 (ref), t7 (ref), t4 (ref), t6 (ref), v12 (ref), t10 (ref), v11 (ref), t9 (ref), t5 (ref), t2 (ref), v10 (ref) ]]
	for v1, v2 in t3 do
		CleanupShield(v2)
	end
	t3 = {}
	for v3, v4 in t8 do
		v4.Cleanup()
	end
	t8 = {}
	local v5 = table.clone(t7)
	t7 = {}
	for v6, v7 in v5 do
		v7()
	end
	t4 = {}
	t6 = {}
	v12 = nil
	t10 = {}
	if #t10 == 0 and v11 then
		v11:Disconnect()
		v11 = nil
	end
	for v8, v9 in t9 do
		v9:Destroy()
	end
	t9 = {}
	local v102 = table.clone(t5)
	t5 = {}
	for v112, v122 in v102 do
		pcall(v122)
	end
	t2 = {}
	v10 = 0
end
function t.OnPowerupUsed(p1) --[[ OnPowerupUsed | Line: 1107 | Upvalues: v3 (copy), ReplicatedStorage (copy), v13 (copy), t2 (ref) ]]
	local v1 = v3.GetSkill(p1)
	if not (v1 and v1.OnClient) then
		return
	end
	ReplicatedStorage.Storage.SFX.PulseEffectSound:Play()
	v1.OnClient((v13()))
	if v1.Type ~= "Passive" or not v1.Duration then
		return
	end
	t2[p1] = tick() + v1.Duration
	task.delay(v1.Duration, function() --[[ Line: 1118 | Upvalues: t2 (ref), p1 (copy) ]]
		if not (t2[p1] and t2[p1] <= tick() + 0.1) then
			return
		end
		t2[p1] = nil
	end)
end
function t.IsSkillActive(p1) --[[ IsSkillActive | Line: 1125 | Upvalues: t2 (ref) ]]
	local v1 = t2[p1]
	return if v1 == nil then false else tick() < v1
end
function t.SimulateShieldBreak() --[[ SimulateShieldBreak | Line: 1130 | Upvalues: t3 (ref), v4 (copy), v1 (copy), v5 (copy), v6 (copy), v7 (copy), PlaySoundOnPart (copy), v10 (ref), CleanupShield (copy) ]]
	if #t3 == 0 then
		return false
	end
	local v12 = t3[1]
	if v12 and v12.Config then
		v4.Notify({
			ChatMessage = false,
			Message = v12.Config.BlockMessage,
			Preset = v12.Config.NotifyPreset
		})
	end
	local v2 = v1.GetClient()
	local v3 = if v2 and v2.CurrentHorse then v2.CurrentHorse.Model:FindFirstChild("HumanoidRootPart") else nil
	if v3 then
		v5.CreateParticleAtPosition({
			ParticleName = "ShieldBreak",
			Duration = 2,
			Parent = v3
		})
	end
	v6.Shake("Bump")
	v7:Tween()
	PlaySoundOnPart("ShieldBreak", v3)
	v10 = math.max(0, v10 - 1)
	if #t3 == 0 then
		return true
	end
	CleanupShield((table.remove(t3, 1)))
	return true
end
v9.OnClientEvent:Connect(function(p1, ...) --[[ Line: 1175 | Upvalues: Players (copy), SpawnProjectileInternal (copy), v3 (copy), AddShield (copy), t3 (ref), v4 (copy), v1 (copy), v5 (copy), v6 (copy), v7 (copy), PlaySoundOnPart (copy), v10 (ref), CleanupShield (copy) ]]
	if p1 == "ReplicateProjectile" then
		local v12 = ...
		if typeof(v12) ~= "table" then
			return
		end
		local v2 = nil
		if v12.TargetUserId then
			local v32 = Players:GetPlayerByUserId(v12.TargetUserId)
			if v32 and v32.Character then
				v2 = v32.Character:FindFirstChild("HumanoidRootPart")
			end
		end
		local StartPosition = v12.StartPosition
		local t = {
			StartPosition = StartPosition
		}
		t.Target = if v2 then v2 else StartPosition + (v12.LookVector or Vector3.new(0, 0, 1)) * 200
		t.Speed = v12.Speed or 80
		t.Lifetime = v12.Lifetime or 10
		t.HitRadius = v12.HitRadius or 5
		t.VelocityPrediction = v12.VelocityPrediction or 0
		t.FollowTrack = v12.FollowTrack
		t.TrackBlend = v12.TrackBlend
		t.MaxBounces = v12.MaxBounces or 3
		t.HoverHeight = v12.HoverHeight
		t.Size = v12.Size
		t.Color = v12.Color
		t.Material = v12.Material
		SpawnProjectileInternal(t)
	elseif p1 == "ShieldActivated" then
		local v62, v72 = ...
		if typeof(v62) ~= "number" or not (v72 and v72:IsA("Model")) then
			return
		end
		local v8 = Players:GetPlayerByUserId(v62)
		if not v8 or v8 == Players.LocalPlayer then
			return
		end
		local v9 = v3.GetSkill("SwiftShield")
		local v102 = if v9 then v9.ClientConfig else v9
		if v102 then
			local v11 = table.clone(v102)
			v11.IsRemote = true
			AddShield(v11, {
				Model = v72
			})
		end
	else
		if p1 == "ShieldConsumed" then
			local v12 = t3[1]
			if v12 and v12.Config then
				v4.Notify({
					ChatMessage = false,
					Message = v12.Config.BlockMessage,
					Preset = v12.Config.NotifyPreset
				})
			end
			local v13 = v1.GetClient()
			local v14 = if v13 and v13.CurrentHorse then v13.CurrentHorse.Model:FindFirstChild("HumanoidRootPart") else nil
			if v14 then
				v5.CreateParticleAtPosition({
					ParticleName = "ShieldBreak",
					Duration = 2,
					Parent = v14
				})
			end
			v6.Shake("Bump")
			v7:Tween()
			PlaySoundOnPart("ShieldBreak", v14)
			v10 = math.max(0, v10 - 1)
			if #t3 ~= 0 then
				CleanupShield((table.remove(t3, 1)))
			end
		end
		if p1 ~= "ShieldConsumedRemote" then
			return
		end
		local v16, v17 = ...
		if typeof(v16) ~= "number" or not (v17 and v17:IsA("Model")) then
			return
		end
		local v18 = Players:GetPlayerByUserId(v16)
		if not v18 or v18 == Players.LocalPlayer then
			return
		end
		local HumanoidRootPart = v17:FindFirstChild("HumanoidRootPart")
		if HumanoidRootPart then
			v5.CreateParticleAtPosition({
				ParticleName = "ShieldBreak",
				Duration = 2,
				Parent = HumanoidRootPart
			})
		end
		PlaySoundOnPart("ShieldBreak", HumanoidRootPart)
		for i = #t3, 1, -1 do
			local v19 = t3[i]
			if v19.Animal and v19.Animal.Model == v17 then
				table.remove(t3, i)
				CleanupShield(v19)
				return
			end
		end
	end
end)
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 1299 | Upvalues: v12 (ref) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch then
		return
	end
	if v12 and v12.OnClick then
		v12.OnClick()
	end
end)
return t