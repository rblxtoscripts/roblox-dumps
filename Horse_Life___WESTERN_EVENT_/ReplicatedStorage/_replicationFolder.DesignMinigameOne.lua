-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("PlayerWrapper")
local v2 = Sonar("Binder")
local v3 = Sonar("Maid")
local v4 = Sonar("InteractMenu")
local v5 = Sonar("RemoteUtils")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("spr")
local v8 = Sonar("GuiManager")
local v9 = Sonar("PositionUtils")
local v10 = Sonar("CameraShaker")
local v11 = Sonar("FormatString")
local v12 = Sonar("TimeUtils")
local v13 = Sonar("InputTypeDetector")
local v14 = Sonar("ButtonTest")
local v15 = Sonar("CharacterControls")
local v16 = Sonar("UINavigator")
local v17 = Sonar("CharacterEffects")
local v18 = v1.GetClient()
local Player = v18.Player
local CurrentCamera = workspace.CurrentCamera
local v19 = Player:GetMouse()
local v20 = v5.GetRemoteEvent("CoffeeMinigame")
local v21 = Sonar("Constants")
local v22 = v21[v21.EventName]
local t = {}
t.__index = t
local Assets = ReplicatedStorage:WaitForChild("Storage"):WaitForChild("Assets")
local SFX = ReplicatedStorage.Storage.SFX
local PresentDesign = Assets:WaitForChild("PresentDesign")
local v23 = v3.new()
local v24 = v3.new()
local v25 = nil
local v26 = v10.new(Enum.RenderPriority.Camera.Value + 1, "CoffeeDesignShaker", function(p1) --[[ Line: 44 | Upvalues: CurrentCamera (copy) ]]
	CurrentCamera.CFrame = CurrentCamera.CFrame * p1
end)
v26:Start()
local t2 = { "Box", "Bow", "Tag", "Tie" }
local ContainerFrame = Player:WaitForChild("PlayerGui"):WaitForChild("AppleDesignMinigameGui"):WaitForChild("ContainerFrame")
local v27 = nil
function t._init(p1) --[[ _init | Line: 61 | Upvalues: v3 (copy), v4 (copy), v18 (copy) ]]
	p1.Maid = v3.new()
	p1.Maid:GiveTask(v4.new(p1.Object, {
		ShowHintLabel = true,
		Hint = "Design A Present!",
		Run = function() --[[ Run | Line: 66 | Upvalues: v18 (ref), p1 (copy) ]]
			v18._inCoffeeDesign = true
			p1:_startMinigame()
		end,
		Visibility = function() --[[ Visibility | Line: 71 | Upvalues: v18 (ref) ]]
			return not v18.Humanoid.SeatPart
		end
	}))
end
function t.new(p1) --[[ new | Line: 77 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Object = p1
	v2:_init()
	return v2
end
function t._startMinigame(p1) --[[ _startMinigame | Line: 87 | Upvalues: v25 (ref), v27 (ref), v22 (copy), v18 (copy), v6 (copy), v12 (copy), v23 (copy), v24 (copy), v16 (copy), v8 (copy), ContainerFrame (copy), CurrentCamera (copy), v17 (copy), RunService (copy), v19 (copy), v7 (copy), v13 (copy), Player (copy), TweenService (copy) ]]
	if v25 then
		v25:Destroy()
	end
	v27 = p1
	local v1 = v22.CoolDown * 60
	local v2 = v18._lastCoffeeMinigame or 0
	if workspace:GetServerTimeNow() - v2 <= v22.CoolDown * 190 then
		local t = {
			Preset = "Red"
		}
		t.Message = "Rewards are on cooldown for " .. v12.FormatString((math.ceil(v1 - (workspace:GetServerTimeNow() - v2)))) .. "\nBut you can play for fun!"
		v6.Notify(t)
	else
		v6.Notify({
			Message = "Drag the different parts onto the Present to build it!",
			Preset = "Yellow"
		})
	end
	v23:DoCleaning()
	v24:DoCleaning()
	v16.SetHUDNavigationEnabled(false)
	v8.OpenMainFrame(ContainerFrame, {
		Blur = false,
		DisableControls = true,
		CloseAll = true
	})
	v18:SetActionState("AppleGame", true)
	v18.Humanoid:UnequipTools()
	local v4 = CurrentCamera.CFrame
	CurrentCamera.CameraType = Enum.CameraType.Scriptable
	CurrentCamera.CFrame = v4
	v17.UpdateVisibility(true)
	v23:GiveTask(RunService.Heartbeat:Connect(function() --[[ Line: 125 | Upvalues: p1 (copy), v19 (ref), CurrentCamera (ref), v7 (ref), v8 (ref), v13 (ref), Player (ref) ]]
		local WorldCFrame = p1.Object.PrimaryPart.CameraPoint.WorldCFrame
		local v1, v2, v3 = WorldCFrame:ToOrientation()
		v7.target(CurrentCamera, 0.9, 1, {
			CFrame = CFrame.new(WorldCFrame.p) * CFrame.fromEulerAnglesYXZ(v1, -(v19.X / (CurrentCamera.ViewportSize.X / 2) - 1) / 12 + v2, v3)
		})
		if game.ProximityPromptService.Enabled then
			v8.CloseHUD()
		end
		if v13.IsGamepadInputType() then
			game.GamepadService:EnableGamepadCursor(nil)
		end
		if not Player.Character or (Player.Character:GetPivot().p - p1.Object:GetPivot().p).Magnitude > 100 then
			p1:_endGame(false)
		end
	end))
	v23:GiveTask(function() --[[ Line: 153 | Upvalues: v7 (ref), CurrentCamera (ref), TweenService (ref), v4 (copy), v18 (ref) ]]
		v7.stop(CurrentCamera)
		local v1 = TweenService:Create(CurrentCamera, TweenInfo.new(0.5), {
			CFrame = v4
		})
		v1:Play()
		v1.Completed:Once(function() --[[ Line: 157 | Upvalues: CurrentCamera (ref) ]]
			CurrentCamera.CameraType = Enum.CameraType.Custom
		end)
		v18:EnablePlayerControls()
	end)
	p1:_updateStage(1)
	p1:_updateModel()
end
function t._updateModel(p1, p2) --[[ _updateModel | Line: 169 | Upvalues: PresentDesign (copy), v23 (copy) ]]
	if p2 then
		p1._model:FindFirstChild(p2, true).Transparency = 0
		return
	end
	p1._model = PresentDesign:Clone()
	v23:GiveTask(p1._model)
	for v1, v2 in p1._model:GetDescendants() do
		if v2:IsA("BasePart") then
			v2.Transparency = 1
		end
	end
	p1._model:PivotTo(p1.Object.PrimaryPart.Active.WorldCFrame)
	p1._model.Parent = p1.Object.PrimaryPart.Active
end
function t._updateStage(p1, p2) --[[ _updateStage | Line: 184 | Upvalues: t2 (copy), v24 (copy), SFX (copy), v7 (copy), Assets (copy), v11 (copy), TweenService (copy), v26 (copy), v10 (copy), v9 (copy), PresentDesign (copy) ]]
	local v1 = #t2
	p1._stage = math.clamp(p2, 1, v1)
	v24:DoCleaning()
	local Active = p1.Object.PrimaryPart.Active
	if p1._stage == 1 then
		SFX.TransitionSound:Play()
	else
		SFX.SuperCompleted:Play()
	end
	local function rigAsset(p12, p2) --[[ rigAsset | Line: 196 | Upvalues: p1 (copy), v7 (ref), SFX (ref), Assets (ref), v11 (ref), v24 (ref), t2 (ref), TweenService (ref), v26 (ref), v10 (ref), v9 (ref), Active (copy) ]]
		local v1 = p2:Clone()
		local v2 = p1.Object.PrimaryPart:FindFirstChild((tostring(p12)))
		if v2 then
			local Size = v1.Size
			local v3 = Size * 0.65
			local v4 = v2.WorldCFrame + v3 * Vector3.new(0, 0.5, 0)
			v1.CFrame = v4
			v1.Transparency = 1
			local v5 = task.delay
			local v6 = if p1._stage == 1 then 0.25 else 0.175
			v5(p12 * v6, function() --[[ Line: 205 | Upvalues: v1 (ref), v7 (ref), v3 (copy), SFX (ref) ]]
				local v12 = v1
				v12.Size = v12.Size * 0.01
				v1.Transparency = 0
				v7.target(v1, 0.5, 2, {
					Size = v3
				})
				SFX.Pop:Play()
			end)
			local v72 = Assets.AppleGui:Clone()
			v72.BG.Backing.Label.Text = v11.separateWordsInString(v1.Name)
			v72.Parent = v2
			v24:GiveTask(v72)
			local DragDetector = Instance.new("DragDetector", v1)
			DragDetector.RunLocally = true
			DragDetector.ResponseStyle = Enum.DragDetectorResponseStyle.Custom
			DragDetector.ReferenceInstance = v2
			local function showBillboard(p1) --[[ showBillboard | Line: 222 | Upvalues: v72 (copy), v7 (ref) ]]
				if not p1 then
					v7.stop(v72)
					v7.stop(v72.BG.UIScale)
					v72.Enabled = false
					return
				end
				if not v72.Enabled then
					v72.BG.UIScale.Scale = 0.01
					v72.StudsOffset = Vector3.new(0, 0, 0)
					v72.Enabled = true
					v7.target(v72, 1, 3, {
						StudsOffset = Vector3.new(0, 4, 0)
					})
					v7.target(v72.BG.UIScale, 0.9, 3, {
						Scale = 1
					})
				end
			end
			v24:GiveTask(DragDetector.MouseHoverEnter:Connect(function() --[[ Line: 239 | Upvalues: v7 (ref), v1 (ref), v3 (copy), showBillboard (copy), SFX (ref) ]]
				v7.target(v1, 0.8, 3, {
					Size = v3 * 1.2
				})
				showBillboard(true)
				SFX.HoverSound:Play()
			end))
			v24:GiveTask(DragDetector.MouseHoverLeave:Connect(function() --[[ Line: 245 | Upvalues: v7 (ref), v1 (ref), v3 (copy), v72 (copy) ]]
				v7.target(v1, 0.8, 3, {
					Size = v3
				})
				v7.stop(v72)
				v7.stop(v72.BG.UIScale)
				v72.Enabled = false
			end))
			local v8 = false
			v24:GiveTask(DragDetector.DragEnd:Connect(function() --[[ Line: 251 | Upvalues: v8 (ref), p1 (ref), v1 (ref), t2 (ref), TweenService (ref), v26 (ref), v10 (ref), v7 (ref), v3 (copy), v4 (copy) ]]
				if v8 then
					p1:_updateModel(v1.Name)
					if p1._stage == #t2 then
						TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.235, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
							Brightness = 0.355
						}):Play()
						p1:_endGame(true)
						return
					end
					p1:_updateStage(p1._stage + 1)
					TweenService:Create(game.Lighting.ColorCorrection, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
						Brightness = 0.2
					}):Play()
					v26:Shake(v10.Presets.SmallRotationBump)
				end
				v7.stop(v1)
				v1.Size = v3
				v7.target(v1, 1, 3, {
					CFrame = v4
				})
			end))
			v24:GiveTask(DragDetector.DragStart:Connect(function() --[[ Line: 282 | Upvalues: v26 (ref), v10 (ref), showBillboard (copy) ]]
				v26:Shake(v10.Presets.SmallBump)
				showBillboard(true)
			end))
			v24:GiveTask(DragDetector.DragContinue:Connect(function() --[[ Line: 287 | Upvalues: DragDetector (copy), v9 (ref), p1 (ref), Active (ref), v1 (ref), v8 (ref), SFX (ref), v72 (copy), v7 (ref), Size (copy) ]]
				local v12 = DragDetector.ReferenceInstance.WorldCFrame * DragDetector.DragFrame
				local v3 = CFrame.new((v9.clampPositionToPart(p1.Object.PrimaryPart, v12.p, Vector3.new(1, 9000000000, 1))))
				if (v12.p - Active.WorldPosition).Magnitude < v1.Size.Magnitude * 1.35 then
					v3 = p1._model:FindFirstChild(v1.Name, true).CFrame
					if not v8 then
						SFX.Pop:Play()
					end
					v8 = true
					v72.Enabled = false
				else
					v8 = false
				end
				v7.target(v1, if v8 then 1 else 0.7, if v8 then 5 else 2.25, {
					CFrame = v3,
					Size = Size
				})
			end))
			v1.Parent = v2
		end
		v24:GiveTask(v1)
	end
	for v2, v3 in PresentDesign:FindFirstChild(t2[p1._stage]):GetChildren() do
		rigAsset(v2, v3)
	end
end
function t._endGame(p1, p2) --[[ _endGame | Line: 321 | Upvalues: v18 (copy), v27 (ref), SFX (copy), v25 (ref), CurrentCamera (copy), v6 (copy), v13 (copy), v16 (copy), v8 (copy), ContainerFrame (copy), v24 (copy), v23 (copy), v22 (copy), v20 (copy), v17 (copy) ]]
	if not v18:IsInAction("AppleGame") then
		return
	end
	v27 = nil
	v18:SetActionState("AppleGame", false)
	if p2 then
		SFX.FlashSound:Play()
		v25 = p1._model:Clone()
		v25.Parent = CurrentCamera
		v6.Notify({
			Message = "Don\'t forget to take a picture! It will be there until you restart.",
			Preset = "Yellow"
		})
	end
	if v13.IsGamepadInputType() then
		game.GamepadService:DisableGamepadCursor()
	end
	v16.SetHUDNavigationEnabled(true)
	if v8.MainFrameOpen == ContainerFrame or not v8.MainFrameOpen then
		v8.OpenHUD()
	end
	v24:DoCleaning()
	v23:DoCleaning()
	p1._stage = 1
	if not p2 then
		v17.UpdateVisibility(false)
		return
	end
	if not (workspace:GetServerTimeNow() - (v18._lastCoffeeMinigame or 0) >= v22.CoolDown * 60) then
		v17.UpdateVisibility(false)
		return
	end
	v20:FireServer()
	v18._lastCoffeeMinigame = workspace:GetServerTimeNow()
	v17.UpdateVisibility(false)
end
function t.Destroy(p1) --[[ Destroy | Line: 364 ]]
	if p1.Maid then
		p1.Maid:DoCleaning()
	end
	setmetatable(p1, nil)
	table.clear(p1)
end
function t.Init() --[[ Init | Line: 372 | Upvalues: v2 (copy), t (copy), v8 (copy), ContainerFrame (copy), v14 (copy), v27 (ref), v15 (copy) ]]
	v2.new("CoffeeMinigame", t):Init()
	v8.AddFrame(ContainerFrame, {
		TweenAnimation = "Open",
		CloseAll = "CloseOverlay",
		OpenPosition = ContainerFrame.Position,
		ClosePosition = ContainerFrame.Position + UDim2.new(0, 0, 0.2, 0)
	})
	v14.new(ContainerFrame:FindFirstChild("CloseButton", true), {
		Click = function() --[[ Click | Line: 386 | Upvalues: v27 (ref) ]]
			if v27 then
				v27:_endGame()
			end
		end
	})
	v8.AddStateCallback(ContainerFrame, "OnClose", function() --[[ Line: 392 | Upvalues: v27 (ref) ]]
		if v27 then
			v27:_endGame()
		end
	end)
	v15:AddControls("GamepadCloseCoffeeMinigame", { Enum.KeyCode.ButtonB }, {
		InputBegan = function() --[[ InputBegan | Line: 400 | Upvalues: v27 (ref) ]]
			if v27 then
				v27:_endGame()
			end
		end
	}, function() --[[ Line: 404 | Upvalues: v27 (ref) ]]
		return v27
	end, nil, true)
end
t.Init()
return t