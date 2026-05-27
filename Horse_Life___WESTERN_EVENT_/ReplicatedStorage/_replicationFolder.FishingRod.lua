-- https://lua.expert/
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("NotificationsClient")
local v2 = Sonar("DisplayAnimalClient")
local v3 = Sonar("WorldspaceGuiUtils")
local v4 = Sonar("InputTypeDetector")
local v5 = Sonar("ItemDataService")
local v6 = Sonar("PlayerWrapper")
local v7 = Sonar("PromptClient")
local v8 = Sonar("RemoteUtils")
local v9 = Sonar("SoundPlayer")
local v10 = Sonar("FishClient")
local v11 = Sonar("GuiManager")
local v12 = Sonar("MathUtils")
local v13 = Sonar("Maid")
local v14 = Sonar("spr")
local v15 = Sonar("CameraShaker")
local _ = { workspace.Terrain }
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer.PlayerGui
local FishingGUI = PlayerGui.FishingGUI
local v16 = LocalPlayer:GetMouse()
local Particles = game.ReplicatedStorage.Storage.Assets.Particles
local SFX = game.ReplicatedStorage.Storage.SFX
local v17 = v6.GetClient()
local CurrentCamera = workspace.CurrentCamera
local FishingData = Sonar("Constants").FishingData
local v18 = Sonar("Constants")
local FishPointsNeeded = FishingData.FishPointsNeeded
local CurrentEvent = v18.CurrentEvent
local v19 = Sonar("AppleStart")
local t = {}
t.__index = t
local v20 = v15.new(Enum.RenderPriority.Camera.Value + 1, "PumpkinMinigameShaker", function(p1) --[[ Line: 47 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v20:Start()
function t.new(p1) --[[ new | Line: 52 | Upvalues: t (copy), v13 (copy), RunService (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Tool = p1
	v2.Object = p1.Object
	v2.Maid = v13.new()
	v2.Points = 0
	v2.Catching = false
	if RunService:IsServer() then
		v2:_initServer()
	else
		v2:_initClient()
	end
	return v2
end
function t._initClient(p1) --[[ _initClient | Line: 71 | Upvalues: v5 (copy), v3 (copy), Sonar (copy) ]]
	p1.NextUse = 0
	p1.Data = v5.GetByName(p1.Object.Name)
	p1.MaxDistance = p1.Data.Distance
	p1.MaxHitDistance = p1.Data.Hit
	local v1 = game.ReplicatedStorage.Storage.Assets.ToolBillboard:Clone()
	v3.AddWorldspaceGui(v1)
	v1.Parent = p1.Object:WaitForChild("Handle")
	p1.ToolUI = v1
	p1.Maid:GiveTask(v1)
	p1.DefaultColor = Color3.fromRGB(117, 225, 255)
	p1.AutoAimDivision = 3
	local v2 = Sonar("DebounceMeter").new(v1.DebounceMeter)
	p1.Maid:GiveTask(v2)
	p1.debounceMeter = v2
end
function t._initServer(p1) --[[ _initServer | Line: 95 ]] end
function t._setControls(p1) --[[ _setControls | Line: 99 | Upvalues: v17 (copy), v4 (copy) ]]
	p1.ToolUI.ControlsFrame.Visible = v17:GetCurrentAnimal()
	p1.ToolUI.ControlsFrame.Release.Visible = false
	p1.ToolUI.ControlsFrame.Position = v4.IsMobileInputType() and UDim2.new(0.05, 0, 0.8, 0) or UDim2.new(0.05, 0, 0.7, 0)
end
function t._checkTarget(p1, p2) --[[ _checkTarget | Line: 105 ]]
	local v1 = p1.MaxHitDistance / 2
	local v2 = nil
	local v3 = nil
	for v4, v5 in workspace.FishSpots:GetDescendants() do
		if v5:IsA("BasePart") then
			local v6 = v5.Position - p2
			local Magnitude = Vector2.new(v6.X, v6.Z).Magnitude
			local v7 = v5:HasTag("ActiveFish")
			if Magnitude <= v1 then
				if v7 then
					v1 = Magnitude
					v2 = v5
					continue
				end
				v2 = nil
				v3 = v5
			end
		end
	end
	return v2, v3
end
function t._startMinigame(p1) --[[ _startMinigame | Line: 132 | Upvalues: v13 (copy), v4 (copy), v16 (copy), RunService (copy), v14 (copy) ]]
	local v1 = v13.new()
	p1.Maid.MinigameMaid = v1
	local LassoDisplay = game.ReplicatedStorage.Storage.Assets.LassoDisplay
	p1.RodPart = LassoDisplay.LassoRangePart:Clone()
	p1.RodPart.Name = "FishingRange"
	p1.RodPartSize = Vector3.new(0.1, p1.MaxDistance, p1.MaxDistance)
	p1.RodPart.Size = p1.RodPartSize
	p1.RodPart.Transparency = 1
	p1.MousePart = LassoDisplay.LassoCursorPart:Clone()
	p1.MousePartSize = Vector3.new(0.9, p1.MaxHitDistance, p1.MaxHitDistance)
	p1.MousePart.Size = p1.MousePartSize
	p1.DefaultMouseColor = Color3.fromRGB(255, 255, 255)
	p1.HitColor = Color3.new(0/255, 255/255, 0/255)
	p1.MissColor = Color3.new(1, 0.478431, 0.384314)
	p1.LassoSurfaceGui = p1.RodPart.LassoSurfaceGui
	p1.MouseSurfaceGui = p1.MousePart.LassoSurfaceGui
	p1.MouseSurfaceGui.Enabled = not v4.IsMobileInputType()
	v1:GiveTask(p1.RodPart)
	v1:GiveTask(p1.MousePart)
	v1:GiveTask(v4.InputTypeChanged:Connect(function() --[[ Line: 159 | Upvalues: p1 (copy), v4 (ref) ]]
		p1.LassoHitRange = p1.Data.Hit * (if v4.IsGamepadInputType() or v4.IsMobileInputType() then 1.5 else 1)
		if v4.IsGamepadInputType() then
			p1.AutoAimDivision = 2
		else
			p1.AutoAimDivision = 4
		end
		p1:_setControls()
	end))
	p1:_setControls()
	local function updateCursorTransparency() --[[ updateCursorTransparency | Line: 173 | Upvalues: p1 (copy) ]]
		if tick() >= p1.NextUse then
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 0
			p1.MouseSurfaceGui.Frame.UIStroke.Color = Color3.fromRGB(255, 255, 255)
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		else
			p1.MouseSurfaceGui.Frame.UIStroke.Transparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundTransparency = 0.8
			p1.MouseSurfaceGui.Frame.UIStroke.Color = Color3.fromRGB(255, 242, 99)
			p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = Color3.fromRGB(255, 242, 99)
			p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = Color3.fromRGB(255, 242, 99)
			p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = Color3.fromRGB(255, 242, 99)
			p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = Color3.fromRGB(255, 242, 99)
		end
	end
	local v2 = Instance.new("NumberValue")
	v2.Value = v2.Value - 1
	v1:GiveTask(v2.Changed:Connect(function(p12) --[[ Line: 202 | Upvalues: p1 (copy) ]]
		local v1 = Color3.new(255/255, 255/255, 255/255):Lerp(Color3.new(0/255, 255/255, 0/255), p12)
		p1.MouseSurfaceGui.Frame.UIStroke.Color = v1
		p1.MouseSurfaceGui.Frame.Crosshair1.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair2.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair3.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Crosshair4.BackgroundColor3 = v1
		p1.MouseSurfaceGui.Frame.Rotation = p12 * 135
	end))
	v2.Value = 0
	v1:GiveTask(v2)
	local function updateCursorPosition() --[[ updateCursorPosition | Line: 216 | Upvalues: p1 (copy), v16 (ref), v4 (ref), v2 (copy) ]]
		local Character = game.Players.LocalPlayer.Character
		local LookVector = Character.PrimaryPart.CFrame.LookVector
		local v1 = Vector3.new(LookVector.X, 0, LookVector.Z)
		local v3 = Character.PrimaryPart.Position + v1 / v1.Magnitude * (p1.MaxDistance / 2)
		local v42 = p1.MaxDistance / 2 - p1.MaxHitDistance / 2
		local v5 = v16.Hit.p - v3
		local v6 = math.min(v5.magnitude, v42)
		local v7 = CFrame.new(v3 + v5.unit * v6) * CFrame.Angles(0, 0, 1.5707963267948966)
		if v4.IsMobileInputType() then
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = 0
		else
			p1.LassoSurfaceGui.Frame.UIStroke.Transparency = math.clamp((v42 - v6) / p1.MaxHitDistance, 0, 1)
		end
		p1.MousePart.Position = v7.Position:Lerp(p1.LastTargetPos or v7.Position, v2.Value)
		return v7
	end
	v1:GiveTask(RunService.RenderStepped:Connect(function() --[[ Line: 256 | Upvalues: p1 (copy), updateCursorPosition (copy), v14 (ref), v2 (copy), updateCursorTransparency (copy) ]]
		if not p1.Equipped then
			return
		end
		local Character = game.Players.LocalPlayer.Character
		local LookVector = Character.PrimaryPart.CFrame.LookVector
		local v1 = Vector3.new(LookVector.X, 0, LookVector.Z)
		local v3 = Character.PrimaryPart.Position + v1 / v1.Magnitude * (p1.MaxDistance / 2)
		p1.Origin = v3
		local v4 = RaycastParams.new()
		v4.FilterType = Enum.RaycastFilterType.Exclude
		v4.FilterDescendantsInstances = { p1.RodPart, p1.MousePart, Character }
		local v5 = workspace:Raycast(v3, Vector3.new(0, -200, 0), v4)
		p1.RodPart.CFrame = CFrame.new(v3.X, (v5 and v5.Position.Y or v3.Y - 3) - 3, v3.Z) * CFrame.Angles(0, 0, 1.5707963267948966)
		local v7 = updateCursorPosition()
		local MaxHitDistance = p1.MaxHitDistance
		p1.MousePartSize = Vector3.new(0.9, 1, 1)
		local v8, v9 = p1:_checkTarget(v7.Position)
		p1.MousePartSize = Vector3.new(0.9, MaxHitDistance, MaxHitDistance)
		if v8 then
			local v10
			if v8 then
				p1.LastTargetPos = v8.Position - Vector3.new(0, v8.Size.Y / 2, 0)
				v10 = Vector3.new(0.9, v8.Size.Z * 3, v8.Size.Z * 3)
			else
				v10 = nil
			end
			v14.target(v2, 1, 3, {
				Value = 1
			})
			v14.target(p1.MousePart, 1, 3, {
				Size = v10
			})
		else
			if v9 then
				local Position = p1.MousePart.Position
				p1.MousePart.Position = Vector3.new(Position.X, v9.Position.Y, Position.Z)
			end
			p1.LastTargetPos = p1.LastTargetPos or v7.Position
			v14.target(v2, 1, 3, {
				Value = 0
			})
			v14.target(p1.MousePart, 0.5, 3, {
				Size = p1.MousePartSize
			})
		end
		updateCursorTransparency()
	end))
	v1:GiveTask(game:GetService("UserInputService").TouchTapInWorld:Connect(function(p12, p2) --[[ Line: 310 | Upvalues: updateCursorPosition (copy), p1 (copy) ]]
		if p2 then
			return
		end
		updateCursorPosition()
		p1:OnInput()
	end))
	local Animation = Instance.new("Animation")
	Animation.AnimationId = "rbxassetid://16385033879"
	local v3 = p1.Object.Parent
	local v42 = v3.Humanoid.Animator:LoadAnimation(Animation)
	v42:Play()
	local Animation_2 = Instance.new("Animation")
	Animation_2.AnimationId = "rbxassetid://16385045159"
	p1.throwTrack = v3.Humanoid.Animator:LoadAnimation(Animation_2)
	p1.Maid.MinigameMaid:GiveTask(function() --[[ Line: 327 | Upvalues: v42 (copy), Animation (copy), p1 (copy), Animation_2 (copy) ]]
		v42:Stop()
		Animation:Destroy()
		p1.throwTrack:Stop()
		p1.throwTrack = nil
		Animation_2:Destroy()
	end)
	p1.RodPart.Parent = workspace.CurrentCamera
	p1.MousePart.Parent = workspace.CurrentCamera
	p1.RodPart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Size = Vector3.new(0, 0, 0)
	p1.MousePart.Position = v16.Hit.Position
	v14.target(p1.RodPart, 0.5, 3.5, {
		Size = p1.RodPartSize
	})
	v14.target(p1.MousePart, 0.5, 5, {
		Size = p1.MousePartSize
	})
end
function t._miss(p1) --[[ _miss | Line: 344 | Upvalues: v19 (copy), v9 (copy), SFX (copy), TweenService (copy) ]]
	local v1 = game.ReplicatedStorage.Storage.Assets.LassoDisplay.LassoMissPart:Clone()
	v1.Position = p1.MousePart.Position
	v1.Size = p1.MousePart.Size
	v1.Parent = workspace
	if v19 and v19.IsRunning() then
		v19.AddPoint(-1)
	else
		p1.Points = p1.Points - p1.Data.Points / 2
	end
	if p1.Points <= 0 then
		p1.Points = 0
	end
	p1:UpdateUI()
	p1:FlashUI(false)
	v9:PlayLocalSound(SFX.Error)
	local v3 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
	TweenService:Create(v1, v3, {
		Transparency = 1,
		Size = v1.Size / 2
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame.UIStroke, v3, {
		Transparency = 1,
		Color = Color3.new(0/255, 0/255, 0/255)
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame.StrikeThrough, v3, {
		BackgroundTransparency = 1,
		Rotation = -45,
		BackgroundColor3 = Color3.new(0/255, 0/255, 0/255)
	}):Play()
	game.Debris:AddItem(v1, 1)
end
function t._animateHit(p1, p2) --[[ _animateHit | Line: 384 | Upvalues: v4 (copy), TweenService (copy) ]]
	if not v4.IsMobileInputType() then
		return
	end
	local v1 = game.ReplicatedStorage.Storage.Assets.LassoDisplay.LassoTargetPart:Clone()
	v1.Position = p1.MousePart.Position
	v1.Size = p1.MousePart.Size
	v1.Parent = workspace
	local v5 = Color3.new(255/255, 255/255, 255/255):Lerp(Color3.new(0/255, 255/255, 0/255), if p2 then 1 else 0)
	v1.LassoSurfaceGui.Frame.UIStroke.Color = v5
	v1.LassoSurfaceGui.Frame.Crosshair1.BackgroundColor3 = v5
	v1.LassoSurfaceGui.Frame.Crosshair2.BackgroundColor3 = v5
	v1.LassoSurfaceGui.Frame.Crosshair3.BackgroundColor3 = v5
	v1.LassoSurfaceGui.Frame.Crosshair4.BackgroundColor3 = v5
	local v6 = TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.In)
	TweenService:Create(v1, v6, {
		Transparency = 1,
		Size = v1.Size / 2
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame.UIStroke, v6, {
		Transparency = 1,
		Color = Color3.new(0/255, 0/255, 0/255)
	}):Play()
	TweenService:Create(v1.LassoSurfaceGui.Frame, v6, {
		Rotation = -45
	}):Play()
	for i = 1, 4 do
		TweenService:Create(v1.LassoSurfaceGui.Frame:FindFirstChild("Crosshair" .. i), v6, {
			BackgroundTransparency = 1
		}):Play()
	end
	game.Debris:AddItem(v1, 1)
end
function t._hit(p1, p2) --[[ _hit | Line: 422 | Upvalues: v19 (copy), CurrentEvent (copy), SFX (copy), v12 (copy), FishPointsNeeded (copy), v9 (copy), v20 (copy), v15 (copy), Particles (copy), FishingGUI (copy), v8 (copy), v2 (copy), v17 (copy) ]]
	p2:AddTag("Claimed")
	if v19 and v19.IsRunning() then
		local NormalFish = CurrentEvent.NormalFish
		if p2:HasTag("IsGold") then
			NormalFish = CurrentEvent.GoldFish
		elseif p2:HasTag("IsPurple") then
			NormalFish = CurrentEvent.PurpleFish
		end
		v19.AddPoint(NormalFish)
	else
		local Points = p1.Data.Points
		if p2:HasTag("IsGold") then
			Points = Points * 2
		elseif p2:HasTag("IsPurple") then
			Points = Points * 3
		end
		p1.Points = p1.Points + Points
	end
	p2:RemoveTag("ActiveFish")
	SFX.QuestCompleteFishing.PlaybackSpeed = v12.map(p1.Points, 0, FishPointsNeeded, 0.85, 1.25)
	SFX.QuestCompleteFishing:Play()
	v9:PlayLocalSound(SFX.QuestCompleteFishing)
	v20:Shake(v15.Presets.SmallRotationBump)
	if p2 then
		local v1 = Particles.Confetti:Clone()
		v1.Parent = p2
		v1:Emit(10)
		game.Debris:AddItem(v1, 2)
	end
	if FishPointsNeeded <= p1.Points then
		if p1.Catching then
			return
		end
		p1.Catching = true
		FishingGUI.FishingProgress.ProgressBar.BarContainer.FillBar.Size = UDim2.new(0, 0, 1, 0)
		local v22, v3 = v8.GetRemoteFunction("ClientCaughtFish"):InvokeServer()
		p1.Catching = false
		if not v22 then
			p1:UpdateUI()
			p1:FlashUI(false)
			return
		end
		p1.Points = 0
		SFX.QuestComplete1:Play()
		SFX.QuestComplete2:Play()
		if v3 then
			v2:DisplaySlot({
				Type = "CaughtFishing",
				AllowNaming = true,
				ShowMaxWarning = true,
				MobileClickBackgroundToClose = false,
				ShowTameContestPoints = true,
				Slot = v17:GetItemFolder("Animals"):WaitForChild(v3)
			})
		end
	else
		p1:UpdateUI()
		p1:FlashUI(true)
	end
end
function initGui() --[[ initGui | Line: 500 | Upvalues: FishingGUI (copy) ]]
	FishingGUI.FishingProgress.ProgressBar.BarContainer.FillBar.Size = UDim2.new(0, 0, 1, 0)
end
function t.UpdateUI(p1) --[[ UpdateUI | Line: 504 | Upvalues: v19 (copy), FishingGUI (copy), FishPointsNeeded (copy), TweenService (copy), v14 (copy) ]]
	if not (v19 and v19.IsRunning()) then
		local FillBar = FishingGUI.FishingProgress.ProgressBar.BarContainer.FillBar
		local v3 = UDim2.new(math.clamp(p1.Points / FishPointsNeeded, 0, 1), 0, 1, 0)
		TweenService:Create(FillBar, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
			Size = v3
		}):Play()
		v14.target(FillBar.Bobber, 0.5, 0.5, {
			Rotation = math.random(-180, 180)
		})
		task.delay(1, function() --[[ Line: 516 | Upvalues: v14 (ref), FillBar (copy) ]]
			v14.target(FillBar.Bobber, 0.5, 1, {
				Rotation = 0
			})
		end)
	end
end
function t.FlashUI(p1, p2) --[[ FlashUI | Line: 521 | Upvalues: FishingGUI (copy), v14 (copy) ]]
	local FillBar = FishingGUI.FishingProgress.ProgressBar.BarContainer.FillBar
	if p2 then
		v14.target(FillBar, 0.5, 0.5, {
			BackgroundColor3 = Color3.fromRGB(188, 244, 255)
		})
		task.delay(0.5, function() --[[ Line: 525 | Upvalues: FillBar (copy), v14 (ref), p1 (copy) ]]
			if not FillBar.Visible then
				return
			end
			v14.target(FillBar, 0.5, 0.5, {
				BackgroundColor3 = p1.DefaultColor
			})
		end)
	else
		v14.target(FillBar, 0.5, 0.5, {
			BackgroundColor3 = Color3.fromRGB(255, 121, 121)
		})
		task.delay(0.5, function() --[[ Line: 532 | Upvalues: FillBar (copy), v14 (ref), p1 (copy) ]]
			if not FillBar.Visible then
				return
			end
			v14.target(FillBar, 0.5, 0.5, {
				BackgroundColor3 = p1.DefaultColor
			})
		end)
	end
end
function t.Equip(p1) --[[ Equip | Line: 540 | Upvalues: v17 (copy), v7 (copy), Sonar (copy), v19 (copy), v10 (copy), v11 (copy), PlayerGui (copy), v1 (copy) ]]
	if not (v17:HasUnlockedSpecies("Kelpie") or p1.Data.EventOnly) then
		v7.Prompt({
			Type = "LockedJournal",
			Setup = function(p1) --[[ Setup | Line: 544 ]]
				p1.Content.Description.Text = string.format("To tame this species you must complete the %s Quests!", "Kelpie")
			end,
			Run = function() --[[ Run | Line: 547 | Upvalues: Sonar (ref) ]]
				Sonar("JournalGui").Open("Horses")
				return true
			end,
			Cancel = function() --[[ Cancel | Line: 551 ]]
				return true
			end
		})
		return
	end
	if v17:CanGiveItem("Animals") or v19 and v19.IsRunning() then
		p1.Equipped = true
		initGui()
		p1:_startMinigame()
		if not p1.Data.EventOnly then
			v10.MinigameToggle(true)
		end
		if not (v19 and v19.IsRunning()) then
			v11.UpdateFrame(PlayerGui.FishingGUI.FishingProgress)
		end
	else
		v1.Notify({
			Message = "Max horses, cannot fish!",
			Type = "MaxHorses",
			Preset = "Red"
		})
	end
end
function t.Unequip(p1) --[[ Unequip | Line: 581 | Upvalues: FishingGUI (copy), v10 (copy), v11 (copy), PlayerGui (copy) ]]
	FishingGUI.FishingProgress.ProgressBar.BarContainer.FillBar.Size = UDim2.new(0, 0, 1, 0)
	p1.Points = 0
	p1.Catching = false
	if not p1.Equipped then
		return
	end
	p1.Equipped = false
	v10.MinigameToggle(false)
	v11.CloseFrame(PlayerGui.FishingGUI.FishingProgress)
	p1.Maid.MinigameMaid = nil
end
function t.OnInput(p1, p2) --[[ OnInput | Line: 597 | Upvalues: v1 (copy), v9 (copy), SFX (copy), v4 (copy) ]]
	if not p1.Equipped then
		return
	end
	if p2 and (p2.UserInputType ~= Enum.UserInputType.MouseButton1 and p2.KeyCode ~= Enum.KeyCode.ButtonX) then
		return
	end
	if tick() < p1.NextUse then
		p1.debounceMeter:earlyFlash()
		if p1.Prompted then
			return
		end
		p1.Prompted = true
		v1.Notify({
			Message = "Please wait to fish!",
			Type = "FishSpamClick"
		})
	else
		if p1.throwTrack then
			p1.throwTrack:Play()
		end
		p1.Prompted = nil
		local v12 = p1.Data.Cooldown or 2
		p1.NextUse = tick() + v12
		p1.debounceMeter:startTimer(v12)
		v9:PlayLocalSound(SFX.ClickSound)
		local v2 = nil
		for v3, v42 in workspace.FishSpots:GetDescendants() do
			if v42:IsA("BasePart") then
				local Position = v42.Position
				local v5 = p1.MaxHitDistance / 2
				if v42 and v42:HasTag("ActiveFish") then
					local v6 = v42.Position - p1.MousePart.Position
					if Vector2.new(v6.X, v6.Z).Magnitude <= v5 then
						if not v2 then
							task.spawn(function() --[[ Line: 644 | Upvalues: v4 (ref), p1 (copy), v42 (copy) ]]
								if v4.IsMobileInputType() then
									p1:_animateHit(v42)
								end
								p1:_hit(v42)
							end)
						end
						v2 = v42
						if v42 then
							break
						end
					end
				end
			end
		end
		if v2 then
			return
		end
		p1:_miss()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 670 | Upvalues: v11 (copy), PlayerGui (copy), v10 (copy) ]]
	v11.CloseFrame(PlayerGui.FishingGUI.FishingProgress)
	v10.MinigameToggle(false)
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
return t