-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local CollectionService = game:GetService("CollectionService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = Sonar("Maid")
local v4 = Sonar("Constants")
local v5 = Sonar("GuiUtils")
local v6 = Sonar("GuiManager")
local v7 = Sonar("TagMinigameGui")
local v8 = Sonar("InteractMenu")
local v9 = Sonar("ParticleUtils")
local v10 = Sonar("spr")
local v11 = Sonar("SoundUtils")
local v12 = Sonar("TeleportService")
local v13 = Sonar("CameraUtils")
local v14 = Sonar("TransitionClient")
local v15 = Sonar("MusicService")
local v16 = Sonar("InputTypeDetector")
local v17 = Sonar("InteractZone")
local LocalPlayer = Players.LocalPlayer
local v18 = v2.GetClient()
local v19 = v1.GetRemoteEvent("TagGameRemote")
local v20 = nil
local t2 = {
	Team1 = {},
	Team2 = {}
}
local v21 = nil
local t3 = {}
local t4 = {}
local v22 = false
local t5 = {}
local v23 = "Freeze"
local t6 = {
	Freeze = "Freeze",
	Build = "Build",
	Trap = "Trap"
}
local t7 = {
	[t6.Freeze] = Color3.fromRGB(170, 220, 255),
	[t6.Build] = Color3.fromRGB(139, 90, 43),
	[t6.Trap] = Color3.fromRGB(128, 0, 128)
}
local t8 = {}
local t9 = {}
local t10 = {}
local t11 = {}
local v24 = nil
local v25 = nil
local v26 = 0
local t12 = {
	Team1 = "rbxassetid://16830500650",
	Team2 = "rbxassetid://16830500422"
}
local v27 = Color3.fromRGB(255, 85, 85)
local TeamIcon = ReplicatedStorage.Storage.Assets:WaitForChild("TeamIcon")
function t.OnGameStart(p1) --[[ OnGameStart | Line: 79 | Upvalues: v15 (copy), v20 (ref), v7 (copy), v3 (copy), t2 (ref), t3 (ref), t4 (ref), v22 (ref), t5 (ref), v23 (ref), t6 (copy), t8 (ref), v5 (copy), t (copy), v26 (ref), v25 (ref), RunService (copy), LocalPlayer (copy), v21 (ref), v4 (copy), v12 (copy) ]]
	v15.setMusicTrack("TagMinigame", false)
	if v20 then
		v20:Destroy()
		v20 = nil
	end
	v7.CloseRewardFrame()
	v20 = v3.new()
	t2 = p1.Teams
	t3 = {}
	t4 = {}
	v22 = false
	t5 = p1.BrickInventory or {}
	v23 = p1.SelectedBrick or t6.Freeze
	t8 = {}
	_G.HideHUD = true
	_G.UnlimitedStamina = true
	_G.StopFlying = true
	_G.HotbarVisible = false
	v5.SetGameElements({
		ArrowButtons = true
	}, true)
	v7.Open()
	v7.SetOnBrickSelected(t.SelectBrick)
	v7.SetBrickInventory(t5, v23)
	v26 = tick() + (p1.GameDuration or 180)
	t.UpdateTimer()
	if v25 then
		v25:Disconnect()
	end
	v25 = RunService.Heartbeat:Connect(function() --[[ Line: 115 | Upvalues: t (ref) ]]
		t.UpdateTimer()
	end)
	for v32, v42 in t2.Team1 do
		if v42 == LocalPlayer then
			v21 = "Team1"
			break
		end
	end
	if not v21 then
		for v52, v6 in t2.Team2 do
			if v6 == LocalPlayer then
				v21 = "Team2"
				break
			end
		end
	end
	t.UpdateTeamVisuals()
	t.UpdateEnemyHighlights()
	t.SetupInteraction()
	t.SetupBrickInput()
	local t7 = {}
	for v72, v8 in t2.Team1 do
		table.insert(t7, v8)
	end
	for v9, v10 in t2.Team2 do
		table.insert(t7, v10)
	end
	v7.SetPlayers(t7)
	v7.UpdateScoreboard(t4)
	v15.setMusicTrack("TagMinigame", true)
	_G.DisableHotbar = true
	_G.HotbarVisible = false
	v4.GameStateChangedSignal:Fire()
	local HUDGui = LocalPlayer.PlayerGui:FindFirstChild("HUDGui")
	if HUDGui and HUDGui:FindFirstChild("BottomFrame") then
		for v11, v122 in HUDGui.BottomFrame:GetChildren() do
			local Bottom = v122:FindFirstChild("Bottom")
			if Bottom then
				Bottom.Visible = false
			end
			local Speeds = v122:FindFirstChild("Speeds")
			if Speeds then
				Speeds.Visible = false
			end
		end
	end
	v20:GiveTask(v4.ResetBindable.Event:Connect(function() --[[ Line: 170 | Upvalues: v21 (ref), t2 (ref), LocalPlayer (ref), v12 (ref) ]]
		if v21 then
			local v1 = workspace.Interactions.Tag[v21]
			v12.TeleportToPosition(v1.Position + Vector3.new(((table.find(t2[v21], LocalPlayer) or 1) - 1) * 8, 0, 0))
		end
	end))
end
function t.OnGameEnd(p1) --[[ OnGameEnd | Line: 184 | Upvalues: v21 (ref), v20 (ref), v24 (ref), v25 (ref), t8 (ref), t9 (ref), t10 (ref), t11 (ref), v18 (copy), v15 (copy), v7 (copy), v5 (copy), v6 (copy), t2 (ref), t3 (ref), t4 (ref), v22 (ref), t5 (ref), v23 (ref), t6 (copy) ]]
	local WinningTeam = p1.WinningTeam
	local v1 = WinningTeam == v21
	if if WinningTeam == nil then true else false then
		warn("Game ended in a tie! Team1:", p1.Team1Tags, "Team2:", p1.Team2Tags)
	else
		warn("Game ended! Winner:", WinningTeam, "Local win:", v1, "Team1:", p1.Team1Tags, "Team2:", p1.Team2Tags)
	end
	if v20 then
		v20:Destroy()
		v20 = nil
	end
	if v24 then
		v24:Disconnect()
		v24 = nil
	end
	if v25 then
		v25:Disconnect()
		v25 = nil
	end
	for v3, v4 in t8 do
		if v4 and v4.Parent then
			v4:Destroy()
		end
	end
	for v52, v62 in t9 do
		v62:Destroy()
	end
	t9 = {}
	for v72, v8 in t10 do
		v8:Destroy()
	end
	t10 = {}
	for v9, v10 in t11 do
		v10:Destroy()
	end
	t11 = {}
	v18:EnablePlayerControls()
	local v11 = v18:GetCurrentAnimal()
	if v11 then
		v11.ControlsUnlocked = 0
	end
	v15.setMusicTrack("TagMinigame", false)
	v7.ShowResults(p1)
	_G.HideHUD = false
	_G.HotbarVisible = true
	_G.DisableHotbar = false
	_G.StopFlying = false
	v5.SetGameElements({}, true)
	v6.OpenHUD()
	t2 = {
		Team1 = {},
		Team2 = {}
	}
	v21 = nil
	t3 = {}
	t4 = {}
	v22 = false
	t5 = {}
	v23 = t6.Freeze
	t8 = {}
end
function t.OnBrickInventoryUpdated(p1) --[[ OnBrickInventoryUpdated | Line: 258 | Upvalues: t5 (ref), v7 (copy), v23 (ref), v11 (copy), v13 (copy) ]]
	local sum = 0
	for v1, v2 in t5 do
		sum = sum + v2
	end
	t5 = p1.Inventory
	v7.SetBrickInventory(t5, v23)
	local sum_2 = 0
	for v3, v4 in t5 do
		sum_2 = sum_2 + v4
	end
	if not (sum < sum_2) then
		return
	end
	v11.PlaySound("LevelUp2")
	v13.Shake("SmallBump")
end
function t.OnBrickSelected(p1) --[[ OnBrickSelected | Line: 278 | Upvalues: v23 (ref), v7 (copy) ]]
	v23 = p1.SelectedBrick
	v7.SetSelectedBrick(v23)
end
function t.SelectBrick(p1) --[[ SelectBrick | Line: 283 | Upvalues: t5 (ref), v23 (ref), v7 (copy), v19 (copy) ]]
	if not ((t5[p1] or 0) <= 0) then
		v23 = p1
		v7.SetSelectedBrick(p1)
		v19:FireServer("SelectBrick", {
			BrickType = p1
		})
	end
end
function t.OnPlayerTagged(p1) --[[ OnPlayerTagged | Line: 296 | Upvalues: t4 (ref), t (copy), v7 (copy) ]]
	t4 = p1.TagCounts
	t.UpdateTagVisuals(p1.Tagger, p1.Tagged)
	v7.UpdateScoreboard(t4)
end
function t.OnPlayerFrozen(p1) --[[ OnPlayerFrozen | Line: 303 | Upvalues: t3 (ref), t (copy), LocalPlayer (copy), v22 (ref) ]]
	local Player = p1.Player
	t3[Player] = true
	t.CheckExistingIceEffects()
	if Player == LocalPlayer then
		v22 = true
		t.UpdateFrozenState()
	end
	t.UpdatePlayerFrozenVisual(Player, true)
end
function t.OnPlayerUnfrozen(p1) --[[ OnPlayerUnfrozen | Line: 317 | Upvalues: t3 (ref), LocalPlayer (copy), v22 (ref), t (copy) ]]
	local Player = p1.Player
	t3[Player] = false
	if Player == LocalPlayer then
		v22 = false
		t.UpdateFrozenState()
	end
	t.UpdatePlayerFrozenVisual(Player, false)
end
function t.OnPlayerRevived(p1) --[[ OnPlayerRevived | Line: 329 | Upvalues: t (copy) ]]
	t.UpdateReviveVisuals(p1.Reviver, p1.Revived)
end
function t.OnPlayerLeft(p1) --[[ OnPlayerLeft | Line: 333 | Upvalues: t (copy), t3 (ref), t2 (ref) ]]
	local Player = p1.Player
	t.RemoveTeamIcon(Player)
	t.RemoveRevivePrompt(Player)
	t.RemoveEnemyHighlight(Player)
	t3[Player] = nil
	for v1, v2 in t2 do
		for v3, v4 in v2 do
			if v4 == Player then
				table.remove(t2[v1], v3)
				break
			end
		end
	end
end
function t.OnBrickFired(p1) --[[ OnBrickFired | Line: 352 | Upvalues: t7 (copy), LocalPlayer (copy), v11 (copy), t8 (ref) ]]
	local BrickId = p1.BrickId
	local Brick = Instance.new("Part")
	Brick.Name = "Brick"
	Brick.Shape = Enum.PartType.Ball
	Brick.Size = Vector3.new(3, 3, 3)
	Brick.Color = t7[p1.BrickType] or Color3.new(255/255, 255/255, 255/255)
	Brick.Material = Enum.Material.SmoothPlastic
	Brick.Anchored = true
	Brick.CanCollide = false
	Brick.Position = p1.Origin
	Brick.Parent = workspace
	if p1.Thrower ~= LocalPlayer then
		t8[BrickId] = Brick
		return
	end
	v11.PlaySound("SnowballImpact")
	t8[BrickId] = Brick
end
function t.OnBrickUpdate(p1) --[[ OnBrickUpdate | Line: 376 | Upvalues: t8 (ref), v10 (copy) ]]
	local v1 = t8[p1.BrickId]
	if not v1 then
		return
	end
	v10.target(v1, 0.5, 3, {
		Position = p1.Position
	})
end
function t.OnBrickHit(p1) --[[ OnBrickHit | Line: 388 | Upvalues: t8 (ref), t (copy) ]]
	local BrickId = p1.BrickId
	local v1 = t8[BrickId]
	if v1 then
		v1:Destroy()
		t8[BrickId] = nil
	end
	t.PlayBrickHitEffect(p1.HitPosition)
end
function t.OnBrickDestroyed(p1) --[[ OnBrickDestroyed | Line: 401 | Upvalues: t8 (ref), t (copy) ]]
	local BrickId = p1.BrickId
	local HitPosition = p1.HitPosition
	local v1 = t8[BrickId]
	if v1 then
		v1:Destroy()
		t8[BrickId] = nil
	end
	if not HitPosition then
		return
	end
	t.PlayBrickHitEffect(HitPosition)
end
function t.PlayBrickHitEffect(p1) --[[ PlayBrickHitEffect | Line: 416 | Upvalues: v9 (copy) ]]
	v9.CreateParticleAtPosition({
		ParticleName = "SnowImpact",
		Duration = 5,
		Position = p1
	})
end
function t.UpdateTeamVisuals() --[[ UpdateTeamVisuals | Line: 424 | Upvalues: v20 (ref), t2 (ref), t (copy) ]]
	if not v20 then
		return
	end
	for v1, v2 in t2.Team1 do
		t.AddTeamIcon(v2, "Team1")
	end
	for v3, v4 in t2.Team2 do
		t.AddTeamIcon(v4, "Team2")
	end
end
function t.AddTeamIcon(p1, p2) --[[ AddTeamIcon | Line: 438 | Upvalues: t10 (ref), TeamIcon (copy), t12 (copy), v20 (ref) ]]
	if t10[p1] then
		return
	end
	local Character = p1.Character
	if not Character then
		return
	end
	local Head = Character:FindFirstChild("Head")
	if Head then
		local v1 = TeamIcon:Clone()
		v1.Name = "TeamIcon_" .. p1.Name
		v1.Adornee = Head
		v1.Frame.ImageLabel.Image = t12[p2]
		v1.Parent = Head
		t10[p1] = v1
		v20:GiveTask(v1)
	end
end
function t.RemoveTeamIcon(p1) --[[ RemoveTeamIcon | Line: 463 | Upvalues: t10 (ref) ]]
	if not t10[p1] then
		return
	end
	t10[p1]:Destroy()
	t10[p1] = nil
end
function t.UpdateEnemyHighlights() --[[ UpdateEnemyHighlights | Line: 470 | Upvalues: v20 (ref), v21 (ref), t2 (ref), t (copy) ]]
	if not v20 then
		return
	end
	for v3, v4 in t2[if v21 == "Team1" then "Team2" else "Team1"] or {} do
		t.AddEnemyHighlight(v4)
	end
end
function t.AddEnemyHighlight(p1) --[[ AddEnemyHighlight | Line: 483 | Upvalues: t11 (ref), v2 (copy), v27 (copy), v20 (ref) ]]
	if t11[p1] then
		return
	end
	local v1 = v2.getWrapperFromPlayer(p1)
	if not v1 then
		return
	end
	local v22 = v1:GetCurrentAnimal()
	if v22 and v22.Model then
		local EnemyHighlight = Instance.new("Highlight")
		EnemyHighlight.Name = "EnemyHighlight"
		EnemyHighlight.FillColor = v27
		EnemyHighlight.OutlineColor = v27
		EnemyHighlight.FillTransparency = 0.7
		EnemyHighlight.OutlineTransparency = 0
		EnemyHighlight.Adornee = v22.Model
		EnemyHighlight.Parent = v22.Model
		t11[p1] = EnemyHighlight
		v20:GiveTask(EnemyHighlight)
	end
end
function t.RemoveEnemyHighlight(p1) --[[ RemoveEnemyHighlight | Line: 511 | Upvalues: t11 (ref) ]]
	if not t11[p1] then
		return
	end
	t11[p1]:Destroy()
	t11[p1] = nil
end
function t.UpdateTagVisuals(p1, p2) --[[ UpdateTagVisuals | Line: 518 ]]
	warn("Player tagged:", p1.Name, "tagged", p2.Name)
end
function t.UpdateReviveVisuals(p1, p2) --[[ UpdateReviveVisuals | Line: 522 ]]
	warn("Player revived:", p1.Name, "revived", p2.Name)
end
function t.UpdatePlayerFrozenVisual(p1, p2) --[[ UpdatePlayerFrozenVisual | Line: 526 | Upvalues: LocalPlayer (copy), t (copy) ]]
	if p1 == LocalPlayer then
		return
	end
	if p2 then
		return
	end
	t.RemoveRevivePrompt(p1)
end
function t.OnIceEffectAdded(p1) --[[ OnIceEffectAdded | Line: 536 | Upvalues: v21 (ref), Players (copy), LocalPlayer (copy), t9 (ref), v8 (copy), t (copy), t3 (ref), v22 (ref) ]]
	local v1 = p1:GetAttribute("FrozenPlayer")
	local v2 = p1:GetAttribute("FrozenTeam")
	if not (v1 and v2) then
		return
	end
	if v2 ~= v21 then
		return
	end
	local v3 = Players:GetPlayerByUserId(v1)
	if not v3 or v3 == LocalPlayer then
		return
	end
	if not t9[v3] then
		t9[v3] = v8.new(p1, {
			ShowHintLabel = true,
			Range = 10,
			Hint = "Revive " .. v3.Name,
			Run = function() --[[ Run | Line: 562 | Upvalues: t (ref), v3 (copy) ]]
				t.TryRevivePlayer(v3)
			end,
			Visibility = function() --[[ Visibility | Line: 566 | Upvalues: t3 (ref), v3 (copy), v22 (ref) ]]
				return if t3[v3] == true then not v22 else false
			end
		})
	end
end
function t.SetupIceEffectListener() --[[ SetupIceEffectListener | Line: 572 | Upvalues: CollectionService (copy), v21 (ref), t (copy) ]]
	CollectionService:GetInstanceAddedSignal("TagGameIceEffect"):Connect(function(p1) --[[ Line: 573 | Upvalues: v21 (ref), t (ref) ]]
		if v21 then
			t.OnIceEffectAdded(p1)
		end
	end)
	for v1, v2 in CollectionService:GetTagged("TagGameIceEffect") do
		if v21 then
			t.OnIceEffectAdded(v2)
		end
	end
end
function t.CheckExistingIceEffects() --[[ CheckExistingIceEffects | Line: 587 | Upvalues: v21 (ref), CollectionService (copy), t (copy) ]]
	if not v21 then
		return
	end
	for v1, v2 in CollectionService:GetTagged("TagGameIceEffect") do
		t.OnIceEffectAdded(v2)
	end
end
function t.RemoveRevivePrompt(p1) --[[ RemoveRevivePrompt | Line: 597 | Upvalues: t9 (ref) ]]
	if not t9[p1] then
		return
	end
	t9[p1]:Destroy()
	t9[p1] = nil
end
function t.UpdateFrozenState() --[[ UpdateFrozenState | Line: 604 | Upvalues: v18 (copy), v7 (copy), v22 (ref), v10 (copy), v24 (ref), RunService (copy) ]]
	local v1 = v18:GetCurrentAnimal()
	v7.SetFrozen(v22)
	if v22 then
		v18:DisablePlayerControls()
		if v1 then
			v1:StopMovement(true)
			v1.ControlsUnlocked = (1 / 0)
			v10.stop(v1.BodyGyro)
			v10.stop(v1.BodyVelocity)
		end
		if not v24 then
			v24 = RunService.Heartbeat:Connect(function() --[[ Line: 623 | Upvalues: v18 (ref) ]]
				local v1 = v18:GetCurrentAnimal()
				if not (v1 and v1.Root) then
					return
				end
				v1.Root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
				if not v1.BodyVelocity then
					return
				end
				v1.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
			end)
			return
		end
		v24:Disconnect()
		v24 = RunService.Heartbeat:Connect(function() --[[ Line: 623 | Upvalues: v18 (ref) ]]
			local v1 = v18:GetCurrentAnimal()
			if not (v1 and v1.Root) then
				return
			end
			v1.Root.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			if not v1.BodyVelocity then
				return
			end
			v1.BodyVelocity.Velocity = Vector3.new(0, 0, 0)
		end)
	else
		if v24 then
			v24:Disconnect()
			v24 = nil
		end
		v18:EnablePlayerControls()
		if not v1 then
			return
		end
		v1.ControlsUnlocked = 0
	end
end
function t.UpdateTimer() --[[ UpdateTimer | Line: 647 | Upvalues: v26 (ref), v7 (copy) ]]
	v7.SetTimer((math.max(0, v26 - tick())))
end
function t.SetupInteraction() --[[ SetupInteraction | Line: 652 | Upvalues: v20 (ref), v21 (ref) ]]
	if v20 then
		warn("SetupInteraction - Team:", v21)
	end
end
function t.SetupBrickInput() --[[ SetupBrickInput | Line: 660 | Upvalues: v20 (ref), UserInputService (copy), v21 (ref), t (copy) ]]
	if v20 then
		v20:GiveTask(UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 665 | Upvalues: v21 (ref), t (ref) ]]
			if p2 then
				return
			end
			if not v21 then
				return
			end
			if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and (p1.UserInputType ~= Enum.UserInputType.Touch and p1.KeyCode ~= Enum.KeyCode.ButtonX) then
				return
			end
			t.TryFireBrick()
		end))
	end
end
function t.GetAutoAimDirection(p1, p2) --[[ GetAutoAimDirection | Line: 680 | Upvalues: v21 (ref), t2 (ref), t3 (ref) ]]
	local v3 = 0.5235987755982988
	local v4 = nil
	for v5, v6 in t2[if v21 == "Team1" then "Team2" else "Team1"] or {} do
		if v6 and (v6.Parent and not t3[v6]) then
			local Character = v6.Character
			if Character then
				local HumanoidRootPart = Character:FindFirstChild("HumanoidRootPart")
				if HumanoidRootPart then
					local v7 = HumanoidRootPart.Position - p1
					if not (v7.Magnitude > 250) then
						local v10 = math.acos((math.clamp(p2:Dot(v7.Unit), -1, 1)))
						if v10 < v3 then
							v3 = v10
							v4 = HumanoidRootPart
						end
					end
				end
			end
		end
	end
	if v4 then
		return p2:Lerp((v4.Position - p1).Unit, 0.9).Unit
	else
		return p2
	end
end
function t.TryFireBrick() --[[ TryFireBrick | Line: 730 | Upvalues: v22 (ref), v21 (ref), t5 (ref), v23 (ref), v18 (copy), v16 (copy), UserInputService (copy), t (copy), v19 (copy) ]]
	if v22 then
		return
	end
	if not v21 then
		return
	end
	if (t5[v23] or 0) <= 0 then
		return
	end
	local v1 = v18:GetCurrentAnimal()
	if not (v1 and v1.Root) then
		return
	end
	local CurrentCamera = workspace.CurrentCamera
	local v2
	if v16.IsGamepadInputType() then
		v2 = CurrentCamera.CFrame.LookVector
	else
		local v3 = UserInputService:GetMouseLocation()
		v2 = CurrentCamera:ViewportPointToRay(v3.X, v3.Y).Direction
	end
	local v4 = v1.Root.Position + Vector3.new(0, 3, 0) + v2 * 2
	v19:FireServer("FireBrick", {
		Origin = v4,
		Direction = t.GetAutoAimDirection(v4, v2),
		BrickType = v23
	})
end
function t.TryTagPlayer(p1) --[[ TryTagPlayer | Line: 769 | Upvalues: v19 (copy) ]]
	v19:FireServer("TryTag", {
		Target = p1
	})
end
function t.TryRevivePlayer(p1) --[[ TryRevivePlayer | Line: 775 | Upvalues: v19 (copy) ]]
	v19:FireServer("TryRevive", {
		Target = p1
	})
end
function t.GetPlayerTeam(p1) --[[ GetPlayerTeam | Line: 781 | Upvalues: t2 (ref) ]]
	for v1, v2 in t2.Team1 do
		if v2 == p1 then
			return "Team1"
		end
	end
	for v3, v4 in t2.Team2 do
		if v4 == p1 then
			return "Team2"
		end
	end
	return nil
end
function t.IsPlayerFrozen(p1) --[[ IsPlayerFrozen | Line: 795 | Upvalues: t3 (ref) ]]
	return t3[p1] == true
end
function t.IsFrozen() --[[ IsFrozen | Line: 799 | Upvalues: v22 (ref) ]]
	return v22
end
function t.GetLocalTeam() --[[ GetLocalTeam | Line: 803 | Upvalues: v21 (ref) ]]
	return v21
end
function t.GetTeams() --[[ GetTeams | Line: 807 | Upvalues: t2 (ref) ]]
	return t2
end
function t.GetTagCounts() --[[ GetTagCounts | Line: 811 | Upvalues: t4 (ref) ]]
	return t4
end
function t.GetBrickInventory() --[[ GetBrickInventory | Line: 815 | Upvalues: t5 (ref) ]]
	return t5
end
function t.GetSelectedBrick() --[[ GetSelectedBrick | Line: 819 | Upvalues: v23 (ref) ]]
	return v23
end
function t.GetBrickTypes() --[[ GetBrickTypes | Line: 823 | Upvalues: t6 (copy) ]]
	return t6
end
function t.IsInGame() --[[ IsInGame | Line: 827 | Upvalues: v21 (ref) ]]
	return v21 ~= nil
end
function t.Init() --[[ Init | Line: 831 | Upvalues: v19 (copy), t (copy), v14 (copy), v12 (copy), v17 (copy) ]]
	v19.OnClientEvent:Connect(function(p1, p2) --[[ Line: 832 | Upvalues: t (ref), v14 (ref), v12 (ref) ]]
		if p1 == "GameStart" then
			t.OnGameStart(p2)
			return
		end
		if p1 == "GameEnd" then
			t.OnGameEnd(p2)
			return
		end
		if p1 == "PlayerTagged" then
			t.OnPlayerTagged(p2)
			return
		end
		if p1 == "PlayerFrozen" then
			t.OnPlayerFrozen(p2)
			return
		end
		if p1 == "PlayerUnfrozen" then
			t.OnPlayerUnfrozen(p2)
			return
		end
		if p1 == "PlayerRevived" then
			t.OnPlayerRevived(p2)
			return
		end
		if p1 == "PlayerLeft" then
			t.OnPlayerLeft(p2)
			return
		end
		if p1 == "BrickFired" then
			t.OnBrickFired(p2)
			return
		end
		if p1 == "BrickUpdate" then
			t.OnBrickUpdate(p2)
			return
		end
		if p1 == "BrickHit" then
			t.OnBrickHit(p2)
			return
		end
		if p1 == "BrickDestroyed" then
			t.OnBrickDestroyed(p2)
			return
		end
		if p1 == "BrickInventoryUpdated" then
			t.OnBrickInventoryUpdated(p2)
			return
		end
		if p1 == "BrickSelected" then
			t.OnBrickSelected(p2)
			return
		end
		if p1 ~= "Teleport" or not (p2 and p2.Position) then
			return
		end
		task.spawn(function() --[[ Line: 861 | Upvalues: v14 (ref), v12 (ref), p2 (copy) ]]
			v14:Start()
			v12.TeleportToPosition(p2.Position)
			v14:End()
		end)
	end)
	v17.GetOrCreateZone({
		Type = "Tag",
		OnEntered = function() --[[ OnEntered | Line: 872 ]]
			warn("TagZoneEntered")
		end,
		OnLeave = function() --[[ OnLeave | Line: 875 ]]
			warn("TagZoneLeft")
		end
	})
	t.SetupIceEffectListener()
end
t.Init()
return t