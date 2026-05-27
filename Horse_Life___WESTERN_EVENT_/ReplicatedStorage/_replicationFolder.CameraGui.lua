-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GamepadService = game:GetService("GamepadService")
local CaptureService = game:GetService("CaptureService")
local UserInputService = game:GetService("UserInputService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiManager")
local v2 = Sonar("InteractMenu")
local v3 = Sonar("UINavigator")
local v4 = Sonar("WorldspaceGuiUtils")
local v5 = Sonar("ButtonTest")
local v6 = Sonar("Signal")
local v7 = Sonar("InputTypeDetector")
local v8 = Sonar("LightingService")
local v9 = Sonar("CharacterControls")
local v10 = Sonar("FreeCamClient")
local v11 = Sonar("Maid")
local v12 = Sonar("AnimalEffects")
local v13 = Sonar("CharacterEffects")
local v14 = Sonar("AnimalDataService")
local v15 = Sonar("DisplayUtils")
local v16 = Sonar("StorageUtils")
local v17 = Sonar(v16.Get("Filters"))
local v18 = Sonar(v16.Get("Effects"))
local LocalPlayer = game:GetService("Players").LocalPlayer
local v19 = Sonar("PlayerWrapper").GetClient()
local CameraGui = LocalPlayer.PlayerGui:WaitForChild("CameraGui")
local t2 = {}
local t3 = {}
local v20 = v11.new()
local v21 = v11.new()
local v22 = tick()
local v23 = tick()
local t4 = {
	Bars = function() --[[ Bars | Line: 50 | Upvalues: t2 (copy), t (copy) ]]
		t2.Bars = not t2.Bars
		t:GetOptionSignal("Bars"):Fire()
	end,
	Filters = function() --[[ Filters | Line: 54 | Upvalues: t2 (copy), t (copy), v3 (copy), CameraGui (copy) ]]
		t2.Filters = not t2.Filters
		t:GetOptionSignal("Filters"):Fire()
		if not t2.Filters then
			return
		end
		v3.SetGamepadSelection(CameraGui.BottomBar.Content.Filters.None)
	end,
	Effects = function() --[[ Effects | Line: 62 | Upvalues: t2 (copy), t (copy), v3 (copy), CameraGui (copy) ]]
		t2.Effects = not t2.Effects
		t:GetOptionSignal("Effects"):Fire()
		if not t2.Effects then
			return
		end
		v3.SetGamepadSelection(CameraGui.BottomBar.Content.Effects.None)
	end,
	FreeCam = function() --[[ FreeCam | Line: 70 | Upvalues: t2 (copy), t (copy) ]]
		t2.FreeCam = not t2.FreeCam
		t:GetOptionSignal("FreeCam"):Fire()
	end,
	Capture = function() --[[ Capture | Line: 74 | Upvalues: v23 (ref), CameraGui (copy), UserInputService (copy), v3 (copy), ReplicatedStorage (copy), CaptureService (copy), v22 (ref) ]]
		if tick() - v23 < 1 then
			return
		end
		if CameraGui.BottomBar.Content.Visible then
			CameraGui.BottomBar.Content.Visible = false
			CameraGui.BottomBar.Watermark.Visible = true
			UserInputService.MouseIconEnabled = false
			v3.ResetGamepadSelection()
			game.TweenService:Create(CameraGui.SnapFrame, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), {
				BackgroundTransparency = 0
			}):Play()
			ReplicatedStorage.Storage.SFX.PictureTaken.TimePosition = 0.45
			ReplicatedStorage.Storage.SFX.PictureTaken:Play()
			CaptureService:CaptureScreenshot(function(p1) --[[ Line: 87 | Upvalues: v22 (ref), v23 (ref), CameraGui (ref), UserInputService (ref), CaptureService (ref) ]]
				v22 = tick()
				v23 = tick()
				CameraGui.BottomBar.Content.Visible = true
				CameraGui.BottomBar.Watermark.Visible = false
				UserInputService.MouseIconEnabled = true
				CaptureService:PromptSaveCapturesToGallery({ p1 }, function() --[[ Line: 120 ]] end)
			end)
			task.delay(2, function() --[[ Line: 125 | Upvalues: v23 (ref), CameraGui (ref) ]]
				v23 = tick()
				CameraGui.BottomBar.Content.Visible = true
				CameraGui.BottomBar.Watermark.Visible = false
			end)
		end
	end,
	HeadLock = function() --[[ HeadLock | Line: 131 | Upvalues: t2 (copy), t (copy) ]]
		t2.HeadLock = not t2.HeadLock
		t:GetOptionSignal("HeadLock"):Fire()
	end,
	SwapFilter = function(p1) --[[ SwapFilter | Line: 136 | Upvalues: v17 (copy), v8 (copy) ]]
		for k, v in pairs(v17) do
			v8.setLightingMode(k, false, false, true)
		end
		if not p1 then
			return
		end
		v8.setLightingMode(p1, true)
	end,
	SwapEffects = function(p1) --[[ SwapEffects | Line: 144 | Upvalues: v21 (copy), ReplicatedStorage (copy) ]]
		v21:DoCleaning()
		if not p1 then
			return
		end
		for k, v in pairs(ReplicatedStorage.Storage.CameraFilters.EffectsParticles[p1]:GetChildren()) do
			local v1 = v:Clone()
			v1.Parent = workspace.CurrentCamera.WeatherPart
			v21:GiveTask(v1)
		end
	end,
	PlayerVisible = function() --[[ PlayerVisible | Line: 155 | Upvalues: t2 (copy), t (copy) ]]
		t2.PlayerVisible = not t2.PlayerVisible
		t:GetOptionSignal("PlayerVisible"):Fire()
	end
}
function t.EnterMode(p1) --[[ EnterMode | Line: 161 | Upvalues: v19 (copy), v20 (copy), v2 (copy), v4 (copy), v3 (copy), GamepadService (copy), v1 (copy), CameraGui (copy), v7 (copy), v10 (copy), LocalPlayer (copy), t2 (copy), t (copy), UserInputService (copy), v22 (ref) ]]
	if v19:IsInAction("CameraMode") then
		return
	end
	v19:SetActionState("CameraMode", true)
	v20:DoCleaning()
	v2:Disable()
	v4.SetWorldspaceGuiVisibility(false)
	v3.OverwriteUISelect(function(p1, p2) --[[ Line: 170 | Upvalues: GamepadService (ref), v3 (ref), v1 (ref), CameraGui (ref) ]]
		if GamepadService.GamepadCursorEnabled then
			v3.ResetGamepadSelection()
			return
		end
		if p2.KeyCode ~= Enum.KeyCode.ButtonSelect then
			return
		end
		if not v1.IsFrameOpen(CameraGui.BottomBar) then
			return
		end
		if CameraGui.BottomBar.Content.Filters.Visible then
			v3.SetGamepadSelection(CameraGui.BottomBar.Content.Filters.ReturnButton.Button)
			return
		end
		if CameraGui.BottomBar.Content.Effects.Visible then
			v3.SetGamepadSelection(CameraGui.BottomBar.Content.Effects.ReturnButton.Button)
			return
		end
		CameraGui.BottomBar.Content.Main.Visible = true
		v3.SetGamepadSelection(CameraGui.BottomBar.Content.Main.Options.Bars)
	end)
	v3.ResetGamepadSelection()
	_G.StopMovement = true
	v19.Character.Humanoid.JumpPower = 0
	CameraGui.BottomBar.Content.Main.CaptureButton.Visible = v7.IsMobileInputType() or true
	workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
	v10.SetFreecam(true)
	_G.PreviousWildModeSetting = LocalPlayer.Character:GetAttribute("WildMode")
	t2.Bars = true
	t:GetOptionSignal("Bars"):Fire()
	t2.Filters = false
	t:GetOptionSignal("Filters"):Fire()
	t2.HeadLock = false
	t:GetOptionSignal("HeadLock"):Fire()
	t2.Effects = false
	t:GetOptionSignal("Effects"):Fire()
	t2.FreeCam = true
	t:GetOptionSignal("FreeCam"):Fire()
	local v12 = t2
	v12.PlayerVisible = if _G.PreviousWildModeSetting == nil then true else not _G.PreviousWildModeSetting
	t:GetOptionSignal("PlayerVisible"):Fire()
	UserInputService.MouseIconEnabled = true
	local function setInaction(p1) --[[ setInaction | Line: 214 | Upvalues: v22 (ref), UserInputService (ref), CameraGui (ref), t2 (ref), v19 (ref), v3 (ref) ]]
		if p1.UserInputType ~= Enum.UserInputType.MouseMovement and (p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.KeyCode ~= Enum.KeyCode.ButtonSelect) then
			return
		end
		local v1 = tick()
		v22 = v1
		UserInputService.MouseIconEnabled = CameraGui.BottomBar.Content.Visible
		if not (t2.Filters or t2.Effects) then
			CameraGui.BottomBar.Content.Main.Visible = true
		end
		local count = 1
		while v1 == v1 and count <= 120 do
			task.wait()
			count = count + 1
		end
		if not CameraGui.BottomBar.Content.Main.Visible or (not v19:IsInAction("CameraMode") or (v1 ~= v1 or v3.InGamepadSelection())) then
			return
		end
		CameraGui.BottomBar.Content.Main.Visible = false
		UserInputService.MouseIconEnabled = false
	end
	v20:GiveTask(UserInputService.InputBegan:Connect(setInaction))
	v20:GiveTask(UserInputService.InputChanged:Connect(setInaction))
	v1.OpenMainFrame(CameraGui.BottomBar, {
		Blur = false,
		DisableControls = false,
		CloseAll = true
	})
	v1.OpenFrame(CameraGui.TopBar)
end
function t.ExitMode(p1) --[[ ExitMode | Line: 249 | Upvalues: v19 (copy), v20 (copy), v3 (copy), v4 (copy), t2 (copy), t (copy), LocalPlayer (copy), v10 (copy), UserInputService (copy), CameraGui (copy), t4 (copy), v1 (copy) ]]
	if not v19:IsInAction("CameraMode") then
		return
	end
	v19:SetActionState("CameraMode", false)
	v20:DoCleaning()
	v3.ResetSelectionToTargetFrame()
	v3.OverwriteUISelect()
	v4.SetWorldspaceGuiVisibility(true)
	t2.Filters = false
	t:GetOptionSignal("Filters"):Fire()
	t2.Effects = false
	t:GetOptionSignal("Effects"):Fire()
	t2.HeadLock = false
	t:GetOptionSignal("HeadLock"):Fire()
	_G.StopMovement = false
	v19.Character.Humanoid.JumpPower = if v19:GetCurrentAnimal() then 0 else game.StarterPlayer.CharacterJumpPower
	LocalPlayer.Character:SetAttribute("WildMode", _G.PreviousWildModeSetting or false)
	v10.SetFreecam()
	workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
	workspace.CurrentCamera.CameraSubject = v19:GetCurrentAnimal() and workspace.CurrentCamera:FindFirstChild("CameraPart") or LocalPlayer.Character.Humanoid
	UserInputService.MouseIconEnabled = true
	CameraGui.BottomBar.Content.Visible = true
	CameraGui.BottomBar.Watermark.Visible = false
	t4.SwapFilter()
	t4.SwapEffects()
	v1.OpenHUD()
end
function t.OnOpen(p1) --[[ OnOpen | Line: 285 | Upvalues: v1 (copy), CameraGui (copy), t4 (copy), v5 (copy), v17 (copy), v18 (copy) ]]
	local v12 = v1.getFrameFromInstance(CameraGui.BottomBar)
	if v12.Opened then
		return
	end
	v12.Opened = true
	for k, v in pairs(CameraGui.BottomBar.Content.Main.Options:GetChildren()) do
		if t4[v.Name] then
			v5.new(v, {
				Click = t4[v.Name]
			})
		end
	end
	for k, v in pairs(CameraGui.BottomBar.Content.Main.SubOptions:GetChildren()) do
		if t4[v.Name] then
			v5.new(v, {
				Click = t4[v.Name]
			})
		end
	end
	v5.new(CameraGui.BottomBar.Content.Main.CaptureButton, {
		Click = t4.Capture
	})
	for k, v in pairs(v17) do
		local v2 = CameraGui.BottomBar.Content.Filters.Default:Clone()
		v2.Title.Text = v.DisplayName or k
		local UIGradient = v2.Button:FindFirstChild("Color").Filter.UIGradient
		UIGradient.Color = v.UIGradient and v.UIGradient.Color or v2.Button:FindFirstChild("Color").Filter.UIGradient.Color
		v5.new(v2, {
			Click = function() --[[ Click | Line: 317 | Upvalues: t4 (ref), k (copy) ]]
				t4.SwapFilter(k)
			end
		})
		v2.Name = k
		v2.Visible = true
		v2.Parent = CameraGui.BottomBar.Content.Filters
	end
	v5.new(CameraGui.BottomBar.Content.Filters.None, {
		Click = t4.SwapFilter
	})
	v5.new(CameraGui.BottomBar.Content.Filters.ReturnButton.Button, {
		Click = function() --[[ Click | Line: 330 | Upvalues: t4 (ref) ]]
			t4.Filters()
		end
	})
	for k, v in pairs(v18) do
		local v4 = CameraGui.BottomBar.Content.Effects.Default:Clone()
		v4.Title.Text = v.DisplayName or k
		v4.Button:FindFirstChild("Color").Filter.Icon.Image = v.Image or ""
		v5.new(v4, {
			Click = function() --[[ Click | Line: 344 | Upvalues: t4 (ref), k (copy) ]]
				t4.SwapEffects(k)
			end
		})
		v4.Name = k
		v4.Visible = true
		v4.Parent = CameraGui.BottomBar.Content.Effects
	end
	v5.new(CameraGui.BottomBar.Content.Effects.None, {
		Click = t4.SwapEffects
	})
	v5.new(CameraGui.BottomBar.Content.Effects.ReturnButton.Button, {
		Click = function() --[[ Click | Line: 357 | Upvalues: t4 (ref) ]]
			t4.Effects()
		end
	})
end
function t.GetOptionSignal(p1, p2) --[[ GetOptionSignal | Line: 364 | Upvalues: t3 (copy), v6 (copy) ]]
	if not t3[p2] then
		t3[p2] = v6.new()
	end
	return t3[p2]
end
function t.Init(p1) --[[ Init | Line: 373 | Upvalues: v1 (copy), CameraGui (copy), t (copy), v5 (copy), t2 (copy), v19 (copy), v14 (copy), v15 (copy), LocalPlayer (copy), CaptureService (copy), v10 (copy), v12 (copy), v13 (copy), v9 (copy), v3 (copy), t4 (copy) ]]
	v1.AddFrame(CameraGui.BottomBar, {
		TweenAnimation = true,
		ShortcutToClose = true,
		OpenPosition = CameraGui.BottomBar.Position,
		ClosePosition = CameraGui.BottomBar.Position + UDim2.new(0, 0, 0.3, 0),
		TweenStyle = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	})
	v1.AddFrame(CameraGui.TopBar, {
		TweenAnimation = true,
		OpenPosition = CameraGui.TopBar.Position,
		ClosePosition = CameraGui.TopBar.Position + UDim2.new(0, 0, -0.3, 0),
		TweenStyle = TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	})
	v1.AddStateCallback(CameraGui.BottomBar, "OnOpen", function() --[[ Line: 389 | Upvalues: t (ref) ]]
		t:OnOpen()
	end)
	v1.AddStateCallback(CameraGui.BottomBar, "OnClose", function() --[[ Line: 392 | Upvalues: t (ref) ]]
		t:ExitMode()
	end)
	v5.new(CameraGui.BottomBar.Content.Main.Options.CloseButton.Button, {
		Rotate = false,
		Click = function() --[[ Click | Line: 398 | Upvalues: t (ref) ]]
			t:ExitMode()
		end
	})
	t:GetOptionSignal("Bars"):Connect(function() --[[ Line: 403 | Upvalues: CameraGui (ref), t2 (ref) ]]
		local Bars = CameraGui.BottomBar.Content.Main.Options.Bars
		Bars.Title.Text = if t2.Bars then "Hide Bars" else "Show Bars"
		local Icon = Bars.Button:FindFirstChild("Color").Menu.Icon
		Icon.ImageColor3 = t2.Bars and Color3.fromRGB(210, 181, 255) or Color3.fromRGB(247, 131, 139)
		for k, v in pairs({ CameraGui.BottomBar.BlackBar, CameraGui.TopBar.BlackBar }) do
			local v3 = t2.Bars and UDim2.new(0.5, 0, 0, 0) or (v.Parent.Name:find("Top") and UDim2.new(0.5, 0, -1, 0) or UDim2.new(0.5, 0, 1, 0))
			game.TweenService:Create(v, TweenInfo.new(0.2, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
				Position = v3
			}):Play()
		end
	end)
	local function setNameLabel() --[[ setNameLabel | Line: 416 | Upvalues: v19 (ref), v14 (ref), v15 (ref), CameraGui (ref), LocalPlayer (ref) ]]
		local v1 = v19:GetCurrentAnimal()
		if v1 then
			local v2 = v14.GetByName(v1.SlotValue.Species.Value)
			CameraGui.BottomBar.Watermark.NameFrame.TextLabel.Text = "@" .. LocalPlayer.Name .. "\'s " .. v15.GetDisplayName(v2.Name, v2)
		else
			CameraGui.BottomBar.Watermark.NameFrame.TextLabel.Text = "@" .. LocalPlayer.Name
		end
	end
	v19.CurrentAnimalChangedSignal:Connect(setNameLabel)
	setNameLabel()
	CaptureService.CaptureEnded:Connect(function() --[[ Line: 429 | Upvalues: CameraGui (ref) ]]
		CameraGui.BottomBar.Content.Visible = true
		CameraGui.BottomBar.Watermark.Visible = false
	end)
	t:GetOptionSignal("Filters"):Connect(function() --[[ Line: 434 | Upvalues: CameraGui (ref), t2 (ref) ]]
		CameraGui.BottomBar.Content.Filters.Visible = t2.Filters
		CameraGui.BottomBar.Content.Main.Visible = not t2.Filters
	end)
	t:GetOptionSignal("Effects"):Connect(function() --[[ Line: 438 | Upvalues: CameraGui (ref), t2 (ref) ]]
		CameraGui.BottomBar.Content.Effects.Visible = t2.Effects
		CameraGui.BottomBar.Content.Main.Visible = not t2.Effects
	end)
	t:GetOptionSignal("FreeCam"):Connect(function() --[[ Line: 443 | Upvalues: CameraGui (ref), t2 (ref), v10 (ref) ]]
		local FreeCam = CameraGui.BottomBar.Content.Main.Options.FreeCam
		FreeCam.Title.Text = if t2.FreeCam then "Lock Cam" else "Free Cam"
		local Icon = FreeCam.Button:FindFirstChild("Color").Menu.Icon
		Icon.ImageColor3 = t2.FreeCam and Color3.fromRGB(247, 131, 139) or Color3.fromRGB(210, 181, 255)
		v10.SetCameraLock(not t2.FreeCam)
	end)
	t:GetOptionSignal("PlayerVisible"):Connect(function() --[[ Line: 452 | Upvalues: CameraGui (ref), t2 (ref), LocalPlayer (ref) ]]
		local PlayerVisible = CameraGui.BottomBar.Content.Main.Options.PlayerVisible
		PlayerVisible.Title.Text = if t2.PlayerVisible then "Hide Player" else "Show Player"
		local Icon = PlayerVisible.Button:FindFirstChild("Color").Menu.Icon
		Icon.ImageColor3 = t2.PlayerVisible and Color3.fromRGB(247, 131, 139) or Color3.fromRGB(210, 181, 255)
		LocalPlayer.Character:SetAttribute("WildMode", not t2.PlayerVisible)
	end)
	t:GetOptionSignal("HeadLock"):Connect(function() --[[ Line: 461 | Upvalues: CameraGui (ref), t2 (ref), LocalPlayer (ref), v12 (ref), v13 (ref) ]]
		local HeadLock = CameraGui.BottomBar.Content.Main.Options.HeadLock
		HeadLock.Title.Text = if t2.HeadLock then "Unlock Head" else "Lock Head"
		local Icon = HeadLock.Button:FindFirstChild("Color").Menu.Icon
		Icon.ImageColor3 = t2.HeadLock and Color3.fromRGB(247, 131, 139) or Color3.fromRGB(210, 181, 255)
		for k, v in pairs(LocalPlayer.Character.Animals:GetChildren()) do
			v:SetAttribute("HeadLock", t2.HeadLock and v12.GetAnimalFromModel(v)._lastMouseFollowPosition or nil)
		end
		LocalPlayer.Character:SetAttribute("HeadLock", if t2.HeadLock then v13.GetClassFromModel(LocalPlayer.Character)._lastMouseFollowPosition or nil else nil)
	end)
	v9:AddControls("CameraSelectBottom", { Enum.KeyCode.DPadDown }, function() --[[ Line: 474 | Upvalues: v1 (ref), CameraGui (ref), v3 (ref) ]]
		if not v1.IsFrameOpen(CameraGui.BottomBar) then
			return
		end
		if CameraGui.BottomBar.Content.Filters.Visible then
			v3.SetGamepadSelection(CameraGui.BottomBar.Content.Filters.ReturnButton.Button)
			return
		end
		if CameraGui.BottomBar.Content.Effects.Visible then
			v3.SetGamepadSelection(CameraGui.BottomBar.Content.Effects.ReturnButton.Button)
			return
		end
		CameraGui.BottomBar.Content.Main.Visible = true
		v3.SetGamepadSelection(CameraGui.BottomBar.Content.Main.Options.Bars)
	end, function() --[[ Line: 485 | Upvalues: v3 (ref) ]]
		return v3.CanNavigateHUD()
	end)
	v9:AddControls("CameraLockHead", { Enum.KeyCode.L, Enum.KeyCode.ButtonR1 }, function() --[[ Line: 492 | Upvalues: t4 (ref) ]]
		t4.HeadLock()
	end, function() --[[ Line: 494 | Upvalues: v3 (ref), v19 (ref) ]]
		return v3.CanNavigateHUD() and v19:IsInAction("CameraMode")
	end)
	game:GetService("GuiService"):WaitForChild("ScreenshotHud").HideCoreGuiForCaptures = true
end
t:Init()
return t