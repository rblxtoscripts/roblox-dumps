-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local v1 = require("@self/SpriteClip")
local v2 = require("@self/Maid")
local v3 = require("@self/Hints")
local v4 = require("@self/ScreenTransitionerPresets")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local TransitionScreen = script:FindFirstChild("TransitionScreen")
local t = {}
t.__index = t
local v5 = UDim2.fromScale(0.01, 0.01)
local v6 = UDim2.fromScale(0.5, 0.6)
local t2 = {
	frameRate = 10,
	xCount = 6,
	totalCount = 6,
	size = Vector2.new(170, 114)
}
local t3 = {
	"Connecting...",
	"Loading your data...",
	"Loading world systems...",
	"Finalizing...",
	"Ready"
}
local t4 = {
	{ Enum.CoreGuiType.Backpack, false },
	{ Enum.CoreGuiType.PlayerList, false },
	{ Enum.CoreGuiType.EmotesMenu, false },
	{ Enum.CoreGuiType.Health, false },
	{ Enum.CoreGuiType.Chat, true },
	{ "ResetButtonCallback", false }
}
local function setCoreGui(p1) --[[ setCoreGui | Line: 68 | Upvalues: t4 (copy), StarterGui (copy) ]]
	repeat
		local v1 = pcall(function() --[[ Line: 71 | Upvalues: p1 (copy), t4 (ref), StarterGui (ref) ]]
			for v3, v4 in pairs(p1 or t4) do
				if v4[1] == "ResetButtonCallback" then
					StarterGui:SetCore("ResetButtonCallback", v4[2])
					continue
				end
				StarterGui:SetCoreGuiEnabled(v4[1], v4[2])
			end
		end)
		if v1 then
			continue
		end
		task.wait()
	until v1
end
local t5 = {
	{
		prop = "ImageTransparency",
		test = function(p1) --[[ test | Line: 88 ]]
			return p1:IsA("ImageLabel") or p1:IsA("ImageButton")
		end
	},
	{
		prop = "TextTransparency",
		test = function(p1) --[[ test | Line: 89 ]]
			return p1:IsA("TextLabel") or (p1:IsA("TextButton") or p1:IsA("TextBox"))
		end
	},
	{
		prop = "TextStrokeTransparency",
		test = function(p1) --[[ test | Line: 90 ]]
			return p1:IsA("TextLabel") or (p1:IsA("TextButton") or p1:IsA("TextBox"))
		end
	},
	{
		prop = "BackgroundTransparency",
		test = function(p1) --[[ test | Line: 91 ]]
			return p1:IsA("GuiObject")
		end
	},
	{
		prop = "Transparency",
		test = function(p1) --[[ test | Line: 92 ]]
			return p1:IsA("UIStroke")
		end
	}
}
function t._applyFadeEntry(p1, p2) --[[ _applyFadeEntry | Line: 95 ]]
	local v1 = 1
	for i, v in ipairs(p2.groups) do
		v1 = v1 * (1 - p1._groupAlpha[v])
	end
	p2.inst[p2.prop] = 1 - (1 - p2.base) * v1
end
function t._applyFadeGroup(p1, p2) --[[ _applyFadeGroup | Line: 103 ]]
	local v1 = p1._entriesByGroup[p2]
	if not v1 then
		return
	end
	for i, v in ipairs(v1) do
		p1:_applyFadeEntry(v)
	end
end
function t._setGroupAlpha(p1, p2, p3) --[[ _setGroupAlpha | Line: 113 ]]
	p1._groupAlpha[p2] = p3
	local v1 = p1._alphaProxies[p2]
	if not v1 or v1.Value == p3 then
		p1:_applyFadeGroup(p2)
		return
	end
	v1.Value = p3
	p1:_applyFadeGroup(p2)
end
function t._buildFadeGroups(p1) --[[ _buildFadeGroups | Line: 122 | Upvalues: t5 (copy) ]]
	local Assets = p1.Assets
	p1._fadeFrames = {
		Container = Assets.Container,
		Shadows = Assets.ShadowsCanvas,
		GameLogo = Assets.GameLogoCanvas,
		LoadInfo = Assets.LoadInfoCanvas,
		HorseSprite = Assets.HorseSpriteCanvas,
		Progress = Assets.ProgressCanvas
	}
	local t = {
		[Assets.BackgroundMainImage] = true,
		[Assets.BackgroundLayerImage] = true
	}
	p1._groupAlpha = {}
	p1._entriesByGroup = {}
	p1._fadeEntries = {}
	for k in pairs(p1._fadeFrames) do
		p1._groupAlpha[k] = 1
		p1._entriesByGroup[k] = {}
	end
	local function consider(p12) --[[ consider | Line: 147 | Upvalues: t (copy), p1 (copy), t5 (ref) ]]
		if t[p12] then
			return
		end
		local v1 = nil
		for k, v in pairs(p1._fadeFrames) do
			if v == p12 or v:IsAncestorOf(p12) then
				local v2 = if v1 then v1 else {}
				table.insert(v2, k)
				v1 = v2
			end
		end
		if not v1 then
			return
		end
		for i, v in ipairs(t5) do
			if v.test(p12) then
				local t2 = {
					inst = p12,
					prop = v.prop,
					base = p12[v.prop],
					groups = v1
				}
				table.insert(p1._fadeEntries, t2)
				for i2, v2 in ipairs(v1) do
					table.insert(p1._entriesByGroup[v2], t2)
				end
			end
		end
	end
	consider(Assets.Container)
	for i, v in ipairs(Assets.Container:GetDescendants()) do
		consider(v)
	end
	p1._alphaProxies = {}
	for k in pairs(p1._fadeFrames) do
		local v1 = Instance.new("NumberValue")
		v1.Name = "FadeAlpha_" .. k
		v1.Value = p1._groupAlpha[k]
		v1.Parent = Assets.Screen
		p1._alphaProxies[k] = v1
		p1._maid:GiveTask(v1)
		p1._maid:GiveTask(v1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 185 | Upvalues: p1 (copy), k (copy), v1 (copy) ]]
			p1._groupAlpha[k] = v1.Value
			p1:_applyFadeGroup(k)
		end))
	end
end
function t.new(p1) --[[ new | Line: 193 | Upvalues: t (copy), TransitionScreen (copy), v2 (copy), v4 (copy), v1 (copy), t2 (copy), PlayerGui (copy) ]]
	local v22 = setmetatable({}, t)
	local v3 = TransitionScreen:Clone()
	v22._maid = v2.new()
	v22._stateMaid = v2.new()
	v22.IsActive = false
	v22.Assets = {
		Screen = v3,
		Container = v3:WaitForChild("Container"),
		ShadowsCanvas = v3:WaitForChild("Container"):WaitForChild("Shadows"),
		GameLogoCanvas = v3:WaitForChild("Container"):WaitForChild("GameLogo"),
		LoadInfoCanvas = v3:WaitForChild("Container"):WaitForChild("LoadInfo"),
		HorseSpriteCanvas = v3:WaitForChild("Container"):WaitForChild("BackgroundLayer"):WaitForChild("HorseSprite"),
		BackgroundMainImage = v3:WaitForChild("Container"):WaitForChild("BackgroundMain"),
		BackgroundLayerImage = v3:WaitForChild("Container"):WaitForChild("BackgroundLayer"),
		ProgressCanvas = v3:WaitForChild("Container"):WaitForChild("Progress")
	}
	local v42 = v4[p1]
	if not v42 then
		error(string.format("[Transitioner] no ScreenTransitionerPresets entry for transitionerType %q", (tostring(p1))), 2)
	end
	local function applyPresetOption(p1, p2) --[[ applyPresetOption | Line: 218 ]]
		if not p2 or #p2 == 0 then
			return
		end
		local v1 = p2[math.random(1, #p2)]
		if v1.Image then
			p1.Image = v1.Image
		end
		p1.ImageColor3 = v1.ImageColor3 or Color3.fromRGB(255, 255, 255)
	end
	applyPresetOption(v22.Assets.BackgroundLayerImage, v42.BackgroundLayer)
	applyPresetOption(v22.Assets.BackgroundMainImage, v42.BackgroundMain)
	if v42.Dropdown then
		local Container = v22.Assets.GameLogoCanvas.Dropdown.Container
		Container.TopTextDisplay.ShadowLabel.Text = v42.Dropdown.TopText
		Container.TopTextDisplay.DisplayLabel.Text = v42.Dropdown.TopText
		Container.BottomTextDisplay.DisplayLabel.Text = v42.Dropdown.BottomText
		Container.BottomTextDisplay.ShadowLabel.Text = v42.Dropdown.BottomText
	else
		v22.Assets.GameLogoCanvas.Dropdown.ImageTransparency = 1
		v22.Assets.GameLogoCanvas.Dropdown.Container.Visible = false
	end
	v22.Assets.ProgressBar = v22.Assets.ProgressCanvas:WaitForChild("Bar")
	local LoadInfoCanvas = v22.Assets.LoadInfoCanvas
	v22.Assets.TextProgressFrame = LoadInfoCanvas:WaitForChild("TextProgress")
	v22.Assets.TextProgressDisplayLabel = v22.Assets.TextProgressFrame:WaitForChild("DisplayLabel")
	v22.Assets.TipsFrame = LoadInfoCanvas:WaitForChild("Tips")
	v22.Assets.TipsContentLabel = v22.Assets.TipsFrame:WaitForChild("ContentLabel")
	local v5 = v1.new()
	v5.FrameRate = t2.frameRate
	v5.InheritSpriteSheet = true
	v5.Looped = true
	v5.SpriteSizePixel = t2.size
	v5.Adornee = v22.Assets.HorseSpriteCanvas.SpriteSheet
	v5.SpriteCountX = t2.xCount
	v5.SpriteCount = t2.totalCount
	v22.HorseSpriteClip = v5
	v22.Assets.Screen.Parent = PlayerGui
	v22.IsPreloaded = false
	v22._IsDestroyed = false
	v22._maid:GiveTask(v3)
	v22:_buildFadeGroups()
	v22:_resetAssets()
	return v22
end
function t.Preload(p1) --[[ Preload | Line: 275 ]]
	if p1.IsPreloaded then
		return
	end
	p1.IsPreloaded = true
	local t = {}
	for i, v in ipairs(p1.Assets.Screen:GetDescendants()) do
		if v:IsA("ImageLabel") or (v:IsA("ImageButton") or (v:IsA("Decal") or (v:IsA("Sound") or v:IsA("MeshPart")))) then
			table.insert(t, v)
		end
	end
	pcall(function() --[[ Line: 292 | Upvalues: t (copy) ]]
		game:GetService("ContentProvider"):PreloadAsync(t)
	end)
end
function t._postAnalytics(p1, p2) --[[ _postAnalytics | Line: 297 | Upvalues: ReplicatedStorage (copy) ]]
	if p2 ~= 1 then
		ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("PostLoadingStageRemote"):FireServer(p2)
	end
end
function t._advanceFromLoading(p1) --[[ _advanceFromLoading | Line: 306 | Upvalues: ReplicatedStorage (copy), UserInputService (copy), setCoreGui (copy), Players (copy) ]]
	local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
	Sonar("InteractMenu"):Disable()
	UserInputService.ModalEnabled = true
	UserInputService.ModalEnabled = false
	Sonar("InteractMenu"):Enable()
	setCoreGui({
		{ Enum.CoreGuiType.Chat, true },
		{ Enum.CoreGuiType.EmotesMenu, false },
		{ "ResetButtonCallback", Sonar("Constants").ResetBindable }
	})
	Sonar("RemoteUtils").GetRemoteEvent("ClientLoadedRemote"):FireServer()
	Sonar("Constants").ClientLoaded = true
	Sonar("Constants").HadIntro = true
	Sonar("Constants").IntroSignal:Fire()
	Sonar("Constants").IntroFrameFaded = true
	local v1, v2 = pcall(Sonar, "IntroClient")
	if v1 and v2 then
		local v3 = false
		local HandoffReady = v2.HandoffReady
		local v4 = if HandoffReady then HandoffReady:Connect(function() --[[ Line: 330 | Upvalues: v3 (ref) ]]
	v3 = true
end) else HandoffReady
		task.spawn(function() --[[ Line: 334 | Upvalues: v2 (copy) ]]
			v2:Init()
		end)
		if v4 then
			local v5 = os.clock()
			while p1.IsActive and (not v3 and os.clock() - v5 < 8) do
				task.wait()
			end
			v4:Disconnect()
		end
	else
		warn("[Transitioner] could not load IntroClient:", v2)
	end
	print(Players.LocalPlayer, "- Completed loading")
end
function t._setupBarLoop(p1) --[[ _setupBarLoop | Line: 352 | Upvalues: RunService (copy) ]]
	local ProgressBar = p1.Assets.ProgressBar
	p1._currentStageScale = 0
	p1._activeBarTween = nil
	ProgressBar.Size = UDim2.new(0, 0, 1, 0)
	p1._stateMaid:GiveTask(RunService.Heartbeat:Connect(function(p12) --[[ Line: 359 | Upvalues: p1 (copy), ProgressBar (copy) ]]
		if p1._activeBarTween and p1._activeBarTween.PlaybackState == Enum.PlaybackState.Playing then
			return
		end
		local _currentStageScale = p1._currentStageScale
		if _currentStageScale >= 1 then
			return
		end
		local v1 = math.min(_currentStageScale + 0.17, 1)
		local Scale = ProgressBar.Size.X.Scale
		if not (v1 <= Scale) then
			ProgressBar.Size = UDim2.new(Scale + (v1 - Scale) * math.clamp(p12 * 1.5, 0, 1), 0, 1, 0)
		end
	end))
end
function t._setStage(p1, p2) --[[ _setStage | Line: 379 | Upvalues: t3 (copy), TweenService (copy) ]]
	local v1 = math.clamp(p2, 0, 5)
	p1._currentStageScale = v1 / 5
	local v2 = t3[v1]
	if v2 then
		p1.Assets.TextProgressDisplayLabel.Text = v2
	end
	if p1._activeBarTween then
		p1._activeBarTween:Cancel()
	end
	local v3 = UDim2.new(p1._currentStageScale, 0, 1, 0)
	p1._activeBarTween = TweenService:Create(p1.Assets.ProgressBar, TweenInfo.new(0.4, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Size = v3
	})
	p1._activeBarTween:Play()
end
function t._setupTipsLoop(p1) --[[ _setupTipsLoop | Line: 400 | Upvalues: v3 (copy) ]]
	local TipsContentLabel = p1.Assets.TipsContentLabel
	local TipsFrame = p1.Assets.TipsFrame
	local v1 = #v3
	if v1 == 0 then
		TipsFrame.Visible = false
		return
	end
	TipsFrame.Visible = true
	if v1 == 1 then
		TipsContentLabel.Text = v3[1]
	else
		local v2 = math.random(1, v1)
		TipsContentLabel.Text = v3[v2]
		p1._stateMaid:GiveTask(task.spawn(function() --[[ Line: 420 | Upvalues: v1 (copy), v2 (ref), TipsContentLabel (copy), v3 (ref) ]]
			while true do
				task.wait(5)
				local v12 = math.random(1, v1)
				if v12 == v2 then
					v12 = v12 % v1 + 1
				end
				v2 = v12
				TipsContentLabel.Text = v3[v12]
			end
		end))
	end
end
function t._runRealLoadingPipeline(p1) --[[ _runRealLoadingPipeline | Line: 433 | Upvalues: Players (copy) ]]
	local LocalPlayer = Players.LocalPlayer
	local v1 = os.clock()
	p1:_setStage(1)
	if LocalPlayer:GetAttribute("LoadedWrapper") ~= true then
		LocalPlayer:GetAttributeChangedSignal("LoadedWrapper"):Wait()
	end
	if not p1.IsActive then
		return
	end
	p1:_setStage(2)
	p1:_postAnalytics(2)
	if LocalPlayer:GetAttribute("LoadedWrappers") ~= true then
		LocalPlayer:GetAttributeChangedSignal("LoadedWrappers"):Wait()
	end
	if not p1.IsActive then
		return
	end
	p1:_setStage(3)
	p1:_postAnalytics(3)
	if LocalPlayer:GetAttribute("ClientInitiated") ~= true then
		LocalPlayer:GetAttributeChangedSignal("ClientInitiated"):Wait()
	end
	if not p1.IsActive then
		return
	end
	p1:_setStage(4)
	p1:_postAnalytics(4)
	local v2 = os.clock() - v1
	if v2 < 1.5 then
		task.wait(1.5 - v2)
		if not p1.IsActive then
			return
		end
	end
	print(LocalPlayer, "- Client Loaded")
	p1:_setStage(5)
	p1:_postAnalytics(5)
	task.wait(0.8)
	if not p1.IsActive then
		return
	end
	p1:_advanceFromLoading()
	if not p1.IsActive then
		return
	end
	task.wait(0.5)
	if p1.IsActive then
		p1:Exit()
	end
end
function t._runFakeLoadingPipeline(p1) --[[ _runFakeLoadingPipeline | Line: 497 ]]
	for i = 1, 5 do
		if not p1.IsActive then
			return
		end
		p1:_setStage(i)
		if i < 5 then
			task.wait(2)
		end
	end
	task.wait(0.8)
	if p1.IsActive then
		p1:Exit()
	end
end
function t._show(p1) --[[ _show | Line: 514 | Upvalues: setCoreGui (copy), TweenService (copy), RunService (copy), UserInputService (copy), v6 (copy), v5 (copy) ]]
	p1:_setGroupAlpha("Container", 0)
	setCoreGui()
	p1:Preload()
	if p1._exitTweens then
		for i, v in ipairs(p1._exitTweens) do
			v:Cancel()
		end
		p1._exitTweens = nil
	end
	p1._exitFadeTween = nil
	p1.Assets.Screen.Enabled = true
	p1.Assets.ProgressCanvas.Visible = true
	local t = {}
	local v1 = 0
	local v2 = 0
	local v3 = os.clock()
	local v4 = UDim2.fromScale(0.5, 0.5)
	local _stateMaid = p1._stateMaid
	local BackgroundMainImage = p1.Assets.BackgroundMainImage
	local BackgroundLayerImage = p1.Assets.BackgroundLayerImage
	local v52 = TweenService:Create(BackgroundMainImage, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), {
		ImageTransparency = 0
	})
	local v62 = TweenService:Create(p1.Assets.BackgroundLayerImage, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		ImageTransparency = 0
	})
	local v7 = TweenService:Create(p1._alphaProxies.Shadows, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
		Value = 0.5
	})
	local v8 = TweenService:Create(p1.Assets.GameLogoCanvas.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Scale = 1
	})
	local v9 = TweenService:Create(p1.Assets.GameLogoCanvas, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
		Position = UDim2.fromScale(0.5, 0.306)
	})
	local v10 = TweenService:Create(p1.Assets.GameLogoCanvas.Background, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), {
		ImageColor3 = Color3.fromRGB(159, 159, 159)
	})
	local v11 = TweenService:Create(p1._alphaProxies.GameLogo, TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Value = 0
	})
	local v12 = TweenService:Create(p1.Assets.GameLogoCanvas.Dropdown, TweenInfo.new(0.25, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.fromScale(0.5, 0.75)
	})
	local v13 = TweenService:Create(p1._alphaProxies.Progress, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Value = 0
	})
	local v14 = TweenService:Create(p1._alphaProxies.HorseSprite, TweenInfo.new(1.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Value = 0
	})
	local v15 = TweenService:Create(p1.Assets.HorseSpriteCanvas, TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
		Position = UDim2.fromScale(0.94, 0.85)
	})
	local v16 = TweenService:Create(p1.Assets.LoadInfoCanvas, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Position = UDim2.new(0.5, 0, 0.96, -5)
	})
	local v17 = TweenService:Create(p1._alphaProxies.LoadInfo, TweenInfo.new(0.35, Enum.EasingStyle.Back, Enum.EasingDirection.Out), {
		Value = 0
	})
	table.insert(t, v11)
	table.insert(t, v13)
	table.insert(t, v10)
	table.insert(t, v14)
	table.insert(t, v9)
	table.insert(t, v12)
	table.insert(t, v8)
	table.insert(t, v7)
	table.insert(t, v15)
	table.insert(t, v16)
	table.insert(t, v17)
	table.insert(t, v62)
	table.insert(t, v52)
	p1.Assets.GameLogoCanvas.Background.ImageColor3 = Color3.fromRGB(255, 255, 255)
	p1:_setGroupAlpha("Shadows", 0.25)
	p1.Assets.GameLogoCanvas.UIScale.Scale = 1.5
	p1.HorseSpriteClip:Play()
	v52:Play()
	_stateMaid:GiveTask(RunService.RenderStepped:Connect(function(p1) --[[ Line: 601 | Upvalues: v3 (copy), BackgroundMainImage (copy), v4 (copy), UserInputService (ref), v1 (ref), v2 (ref), BackgroundLayerImage (copy), v6 (ref), v5 (ref) ]]
		local v12 = (os.clock() - v3) / 6 * math.pi * 2
		BackgroundMainImage.Position = v4 + UDim2.fromScale(math.cos(v12) * 0.015, math.sin(v12) * 0.015)
		local CurrentCamera = workspace.CurrentCamera
		if not CurrentCamera then
			return
		end
		local ViewportSize = CurrentCamera.ViewportSize
		if not (ViewportSize.X > 0 and ViewportSize.Y > 0) then
			return
		end
		local v22 = UserInputService:GetMouseLocation()
		local v42 = math.clamp(v22.X / ViewportSize.X * 2 - 1, -1, 1)
		local v62 = math.clamp(v22.Y / ViewportSize.Y * 2 - 1, -1, 1)
		local v7 = math.clamp(p1 * 4, 0, 1)
		v1 = v1 + (v42 - v1) * v7
		v2 = v2 + (v62 - v2) * v7
		BackgroundLayerImage.Position = v6 + UDim2.fromScale(v1 * v5.X.Scale, v2 * v5.Y.Scale)
	end))
	_stateMaid:GiveTask(function() --[[ Line: 625 | Upvalues: t (copy) ]]
		for v1, v2 in next, t do
			v2:Cancel()
		end
	end)
	_stateMaid:GiveTask(task.delay(v52.TweenInfo.Time / 2, function() --[[ Line: 630 | Upvalues: v62 (copy), v9 (copy), v10 (copy), v16 (copy), v17 (copy), v8 (copy), v7 (copy), v13 (copy), v11 (copy), _stateMaid (copy), p1 (copy), v14 (copy), v12 (copy), v15 (copy) ]]
		v62:Play()
		v9:Play()
		v10:Play()
		v16:Play()
		v17:Play()
		v8:Play()
		v7:Play()
		v13:Play()
		v11:Play()
		_stateMaid:GiveTask(task.delay(v9.TweenInfo.Time / 3, function() --[[ Line: 642 | Upvalues: p1 (ref), v14 (ref), v12 (ref), v15 (ref) ]]
			p1.Assets.GameLogoCanvas.Dropdown.Visible = true
			v14:Play()
			v12:Play()
			v15:Play()
		end))
	end))
	p1:_setupBarLoop()
	p1:_setupTipsLoop()
end
function t.Enter(p1, p2) --[[ Enter | Line: 654 ]]
	if not (p1.IsActive or p1._IsDestroyed) then
		p1.IsActive = true
		p1:_show()
		p1._stateMaid:GiveTask(task.spawn(function() --[[ Line: 662 | Upvalues: p2 (copy), p1 (copy) ]]
			if p2 then
				p1:_runFakeLoadingPipeline()
			else
				p1:_runRealLoadingPipeline()
			end
		end))
	end
end
function t.EnterIndefinite(p1, p2) --[[ EnterIndefinite | Line: 671 ]]
	if not (p1.IsActive or p1._IsDestroyed) then
		p1.IsActive = true
		p1:_show()
		p1.Assets.ProgressCanvas.Visible = false
		p1.Assets.TextProgressDisplayLabel.Text = p2 or "Teleporting..."
	end
end
function t.Exit(p1) --[[ Exit | Line: 683 | Upvalues: TweenService (copy) ]]
	if not p1.IsActive then
		return
	end
	p1.IsActive = false
	if p1._exitTweens then
		for i, v in ipairs(p1._exitTweens) do
			v:Cancel()
		end
	end
	local v1 = TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
	local v2 = TweenService:Create(p1._alphaProxies.Container, v1, {
		Value = 1
	})
	local v3 = TweenService:Create(p1.Assets.BackgroundMainImage, v1, {
		ImageTransparency = 1
	})
	local v4 = TweenService:Create(p1.Assets.BackgroundLayerImage, v1, {
		ImageTransparency = 1
	})
	p1._exitFadeTween = v2
	p1._exitTweens = { v2, v3, v4 }
	v2:Play()
	v3:Play()
	v4:Play()
	task.delay(0.5, function() --[[ Line: 705 | Upvalues: p1 (copy), v2 (copy) ]]
		if p1._exitFadeTween ~= v2 then
			return
		end
		if not p1.IsActive then
			p1:_resetAssets()
			p1.Assets.Screen.Enabled = false
			p1._exitFadeTween = nil
			p1._exitTweens = nil
		end
	end)
end
function t._resetAssets(p1) --[[ _resetAssets | Line: 719 | Upvalues: v6 (copy), t3 (copy) ]]
	p1._stateMaid:DoCleaning()
	p1.Assets.BackgroundMainImage.ImageTransparency = 1
	p1.Assets.BackgroundLayerImage.ImageTransparency = 1
	p1.Assets.GameLogoCanvas.Background.ImageColor3 = Color3.fromRGB(255, 255, 255)
	p1.Assets.BackgroundLayerImage.Position = v6
	p1.Assets.GameLogoCanvas.Dropdown.Position = UDim2.fromScale(0.5, 0.4)
	p1.Assets.BackgroundMainImage.Position = UDim2.fromScale(0.5, 0.5)
	p1.Assets.HorseSpriteCanvas.Position = UDim2.fromScale(1.2, 0.85)
	p1.Assets.LoadInfoCanvas.Position = UDim2.new(0.5, 0, 1.26, -5)
	p1.Assets.GameLogoCanvas.Position = UDim2.fromScale(0.5, 0.3)
	p1.HorseSpriteClip:Pause()
	if p1._fadeFrames then
		for k in pairs(p1._fadeFrames) do
			p1:_setGroupAlpha(k, 1)
		end
	end
	p1.Assets.GameLogoCanvas.Dropdown.Visible = false
	if p1._activeBarTween then
		p1._activeBarTween:Cancel()
		p1._activeBarTween = nil
	end
	if p1.Assets.ProgressBar then
		p1.Assets.ProgressBar.Size = UDim2.new(0, 0, 1, 0)
	end
	if p1.Assets.TextProgressDisplayLabel then
		p1.Assets.TextProgressDisplayLabel.Text = t3[1] or ""
	end
	p1._currentStageScale = 0
end
function t.Destroy(p1) --[[ Destroy | Line: 754 ]]
	p1._IsDestroyed = true
	p1._maid:DoCleaning()
	p1._stateMaid:DoCleaning()
end
return t