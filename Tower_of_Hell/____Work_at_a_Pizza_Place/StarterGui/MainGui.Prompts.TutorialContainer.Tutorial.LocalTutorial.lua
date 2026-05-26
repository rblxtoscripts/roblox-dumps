-- https://lua.expert/
local ContextActionService = game:GetService("ContextActionService")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local v1 = require(game.ReplicatedStorage:WaitForChild("Enums"))
if game:GetService("UserInputService").TouchEnabled and not game:GetService("UserInputService").MouseEnabled then
	local _ = not game:GetService("UserInputService").KeyboardEnabled
end
local Debug = require(game.ReplicatedStorage:WaitForChild("Debug"))
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v2 = Library:Load("Utility")
local v3 = Library:Load("Events")
local v4 = Library:Load("SoundFX")
local v5 = Library:Load("Queue")
local v6 = script.Parent
local v7 = _G.GamepadEnabled and v6:WaitForChild("ContinueGamepad") or v6:WaitForChild("Continue")
local v8 = _G.GamepadEnabled and v6:WaitForChild("OkGamepad") or v6:WaitForChild("Ok")
local v9 = _G.GamepadEnabled and v6:WaitForChild("DeleteGamepad") or v6:WaitForChild("Delete")
local v10 = _G.GamepadEnabled and v6:WaitForChild("StartGamepad") or v6:WaitForChild("Start")
local Message = v6:WaitForChild("Message")
local DisableInput = v6.Parent:WaitForChild("DisableInput")
local CancelButton = v6:WaitForChild("CancelButton")
local LocalPlayer = game.Players.LocalPlayer
local v11 = nil
if MainGui.AbsoluteSize.Y < 500 then
	Message.TextSize = 18
	v6:WaitForChild("UIAspectRatioConstraint"):Destroy()
	v6.Size = UDim2.new(0, 200, 0, 150)
elseif _G.GamepadEnabled then
	Message.TextSize = 28
end
local v12 = GuiManager:RegisterWindow(v6, "Right", "Right", 0.15)
v12:SetConsoleSize(UDim2.new(0, 450, 1, 0))
v12.CanBeFocused = false
v12.DefaultCancelButtonBehaviour = false
if v6:FindFirstChild("CancelGamepadHint") then
	v6.CancelGamepadHint:Destroy()
end
local v13 = nil
local v14 = nil
local v15 = v4:GetSoundObject("Swish")
if not _G.StartedPlaying then
	v3:Wait("StartedPlaying")
end
function SpawnButton(p1) --[[ SpawnButton | Line: 77 | Upvalues: LocalPlayer (copy), v13 (ref) ]]
	local v1 = p1:clone()
	v1.Parent = workspace
	local v2 = nil
	v2 = v1.Head.Touched:connect(function(p12) --[[ Line: 82 | Upvalues: LocalPlayer (ref), v2 (ref), v13 (ref), p1 (copy), v1 (copy) ]]
		if not (p12 and (p12.Parent and p12.Parent:FindFirstChild("Humanoid"))) then
			return
		end
		local v12 = game.Players:GetPlayerFromCharacter(p12.Parent)
		if not v12 or v12 ~= LocalPlayer then
			return
		end
		v2:disconnect()
		v13 = p1.Name
		workspace.Main.StartTutorial:FireServer(p1.Index.Value)
		v1:Destroy()
	end)
end
workspace.TutorialService.ShowButton.OnClientEvent:connect(function(p1) --[[ Line: 96 ]]
	for i, v in ipairs(game.ReplicatedStorage.TutorialButtons:GetChildren()) do
		if v.Index.Value == p1 then
			break
		end
	end
end)
local IsNewPlayer = _G.IsNewPlayer
spawn(function() --[[ Line: 108 | Upvalues: v1 (copy), Debug (copy), IsNewPlayer (copy), v13 (ref) ]]
	local v12 = workspace.Main.GetCompletedTutorials:InvokeServer()
	if v1.IsOnline or Debug.Enabled and Debug.IntroEnabled or (v1.IsOnline and v1.IntroSequenceEnabled or v1.PlaceSettings.SkipIntro) then
		while _G.FirstJobName == nil do
			wait(0.5)
		end
	end
	if IsNewPlayer and _G.FirstJobName then
		v12[_G.FirstJobIndex] = true
		v13 = _G.FirstJobName .. " Tutorial"
	end
	if not v12 then
		return
	end
	for i, v in ipairs(game.ReplicatedStorage.TutorialButtons:GetChildren()) do
		local v2 = workspace:FindFirstChild(v.Name)
		if v2 then
			v2:Destroy()
		end
		local _ = v12[v.Index.Value] == true
	end
end)
workspace.TutorialService.ShowArrowKeys.OnClientEvent:connect(function() --[[ Line: 154 | Upvalues: IsNewPlayer (copy), v6 (copy) ]]
	if not (IsNewPlayer and v6.Parent:FindFirstChild("ArrowKeys")) then
		return
	end
	v6.Parent.ArrowKeys.Visible = true
end)
HighlightedCell = nil
workspace.TutorialService.HighlightOrder.OnClientEvent:connect(function() --[[ Line: 161 ]]
	for i, v in ipairs(workspace.Orders:GetChildren()) do
		if v.SG.ImageLabel.Image == "rbxassetid://3540529917" then
			HighlightedCell = v
			HighlightedCell.BrickColor = BrickColor.new("Really red")
			return
		end
	end
end)
workspace.TutorialService.ChangeHouseLabel.OnClientEvent:connect(function(p1) --[[ Line: 173 ]]
	workspace.Houses.House3.MailboxPointer.Value:FindFirstChild("LabelBack", true).TextLabel.Text = p1
	workspace.Houses.House3.MailboxPointer.Value:FindFirstChild("LabelFront", true).TextLabel.Text = p1
end)
function wiggleWiggleWiggle() --[[ wiggleWiggleWiggle | Line: 178 | Upvalues: v6 (copy) ]]
	math.randomseed(tick())
	math.random()
	for i = 1, 10 do
		wait()
		v6.Rotation = math.random(-10, 10)
	end
	v6.Rotation = 0
end
local CurrentCamera = workspace.CurrentCamera
function QuitTutorial() --[[ QuitTutorial | Line: 193 | Upvalues: v12 (copy), DisableInput (copy), CurrentCamera (copy), v11 (ref), ContextActionService (copy), LocalPlayer (copy), v14 (ref) ]]
	v12:SetVisible(false)
	DisableInput.Visible = false
	clearArrows()
	CurrentCamera.CameraType = "Custom"
	v11 = "Continue"
	if workspace.CurrentCamera:FindFirstChild("Barriers") then
		workspace.CurrentCamera.Barriers:Destroy()
	end
	ContextActionService:UnbindAction("Cancel")
	pcall(function() --[[ Line: 204 | Upvalues: LocalPlayer (ref) ]]
		LocalPlayer.Character.Humanoid.WalkSpeed = game.StarterPlayer.CharacterWalkSpeed
	end)
	DisableInput.BackgroundTransparency = 1
	if not v14 then
		return
	end
	v14:disconnect()
	v14 = nil
end
workspace.TutorialService.QuitTutorial.OnClientEvent:connect(function() --[[ Line: 210 ]]
	QuitTutorial()
end)
function PromptCancel() --[[ PromptCancel | Line: 216 | Upvalues: Dialog (copy), v13 (ref) ]]
	if not Dialog:GetChoice("Quit tutorial?", "Are you sure you want to quit the tutorial?", "Yes", "No") then
		return
	end
	if not _G.GamepadEnabled and (v13 and game.ReplicatedStorage.TutorialButtons:FindFirstChild(v13)) then
		delay(1, function() --[[ Line: 220 | Upvalues: v13 (ref) ]]
			SpawnButton(game.ReplicatedStorage.TutorialButtons:FindFirstChild(v13))
		end)
	end
	workspace.Main.QuitTutorial:FireServer()
end
CancelButton.MouseButton1Click:connect(function() --[[ Line: 229 ]]
	PromptCancel()
end)
local t = {}
workspace.TutorialService.ShowArrow.OnClientEvent:connect(function(p1, p2) --[[ Line: 240 | Upvalues: v6 (copy), PlayerGui (copy), t (ref) ]]
	if not (p1 and p1.Parent) then
		return
	end
	local v1 = v6.Parent.ArrowTemplate:clone()
	v1.Animation.Disabled = false
	v1.Parent = PlayerGui
	v1.Enabled = true
	v1.Adornee = p1
	v1.StudsOffset = Vector3.new(0, p2 or 0, 0)
	table.insert(t, v1)
	if p1.Name ~= "Head" then
		return
	end
	while v1 and v1.Parent do
		if not p1:FindFirstChild("Dialog") then
			v1.Adornee = nil
		end
		wait(0.5)
	end
end)
workspace.TutorialService.RemoveArrow.OnClientEvent:connect(function(p1) --[[ Line: 262 | Upvalues: t (ref) ]]
	if not (p1 and p1.Parent) then
		return
	end
	for i, v in ipairs(t) do
		if v.Adornee == p1 then
			table.remove(t, i)
			v:Destroy()
		end
	end
end)
local t2 = {}
local t3 = {}
function clearArrows() --[[ clearArrows | Line: 277 | Upvalues: t (ref), t2 (ref), t3 (ref) ]]
	if #t > 0 then
		for i, v in ipairs(t) do
			v:Destroy()
		end
	end
	if #t2 > 0 then
		for i, v in ipairs(t2) do
			v:Destroy()
		end
	end
	if #t3 > 0 then
		for i, v in ipairs(t3) do
			v.Visible = false
		end
	end
	t2 = {}
	t = {}
	t3 = {}
end
workspace.TutorialService.RemoveArrows.OnClientEvent:connect(function() --[[ Line: 300 ]]
	clearArrows()
end)
workspace.TutorialService.ShowFloorWire.OnClientEvent:connect(function(p1, p2) --[[ Line: 306 | Upvalues: v6 (copy), t2 (ref) ]]
	local FloorWire = Instance.new("FloorWire")
	FloorWire.To = p1
	FloorWire.From = p2
	FloorWire.Transparency = 0.5
	FloorWire.WireRadius = 0
	FloorWire.TextureSize = Vector2.new(2, 2)
	FloorWire.Texture = "http://www.roblox.com/asset/?id=168194931"
	FloorWire.Parent = v6.Parent
	table.insert(t2, FloorWire)
end)
local ArrowAnimation = MainGui:WaitForChild("Menu"):WaitForChild("GamepadMainMenu"):WaitForChild("ArrowAnimation")
local ArrowAnimation_2 = MainGui:WaitForChild("Menu"):WaitForChild("Menu"):WaitForChild("Inventory"):WaitForChild("ArrowAnimation")
workspace.TutorialService.AnimatedArrowSprite.OnClientEvent:connect(function(p1) --[[ Line: 322 | Upvalues: ArrowAnimation (copy), ArrowAnimation_2 (copy), t3 (ref) ]]
	local v1, v2, v3
	if p1 == "RadialMenu" then
		v1 = ArrowAnimation
		v2 = -50
		v3 = -80
	else
		v1 = ArrowAnimation_2
		v2 = 90
		v3 = 100
	end
	local v4 = v1:clone()
	v4.Parent = v1.Parent
	v4.Visible = true
	table.insert(t3, v4)
	local Offset = v4.Position.X.Offset
	local Scale = v4.Position.X.Scale
	spawn(function() --[[ Line: 343 | Upvalues: v4 (copy), Scale (copy), Offset (copy), v2 (ref), v3 (ref) ]]
		while v4 and v4.Visible do
			v4:TweenPosition(UDim2.new(Scale, Offset, 0, v2), "Out", "Sine", 0.5, true)
			wait(0.5)
			v4:TweenPosition(UDim2.new(Scale, Offset, 0, v3), "Out", "Sine", 0.5, true)
			wait(0.5)
		end
		v4:Destroy()
	end)
end)
local MenuGamepadHelp = MainGui:WaitForChild("Notifications"):WaitForChild("MenuGamepadHelp")
local Position = MenuGamepadHelp.Position
workspace.TutorialService.ShowGamepadMenuHelp.OnClientEvent:connect(function(p1) --[[ Line: 362 | Upvalues: MenuGamepadHelp (copy), Position (copy) ]]
	if p1 then
		MenuGamepadHelp.Position = UDim2.new(0.5, 0, 0.5, 0)
	else
		MenuGamepadHelp.Position = Position
	end
end)
workspace.TutorialService.ShowRecipes.OnClientEvent:connect(function() --[[ Line: 374 ]]
	game.ReplicatedStorage.Recipes:clone().Parent = workspace.CurrentCamera
end)
local v16 = false
workspace.TutorialService.PanToCFrame.OnClientEvent:connect(function(p1) --[[ Line: 382 | Upvalues: v12 (copy), v16 (ref), CurrentCamera (copy) ]]
	v12:SetVisible(false)
	v16 = true
	CurrentCamera.CameraType = "Scriptable"
	CurrentCamera:Interpolate(p1, CFrame.new(p1.p + p1.lookVector * 2), 0.5)
	wait(1.5)
	v16 = false
end)
local Barriers = workspace.CurrentCamera:FindFirstChild("Barriers")
workspace.TutorialService.OpenBarrier.OnClientEvent:connect(function(p1, p2) --[[ Line: 395 | Upvalues: Barriers (ref), v2 (copy), LocalPlayer (copy) ]]
	if not workspace.CurrentCamera:FindFirstChild("Barriers") then
		Barriers = game.ReplicatedStorage.Barriers:clone()
		Barriers.Parent = workspace.CurrentCamera
		for i, v in ipairs(Barriers:GetChildren()) do
			for i2, v3 in ipairs(v:GetChildren()) do
				v3.Touched:connect(v2:Debounce(function(p1) --[[ Line: 401 | Upvalues: v3 (copy), LocalPlayer (ref) ]]
					if not v3.CanCollide or (not p1 or (not p1.Parent or p1.Parent ~= LocalPlayer.Character)) then
						return
					end
					PromptCancel()
					wait(5)
				end))
			end
		end
	end
	for i, v in ipairs(Barriers[p1]:GetChildren()) do
		if v.Name == "Barrier2" then
			v.CanCollide = p2
		end
	end
end)
local CameraLock = LocalPlayer:WaitForChild("PlayerGui", 10):WaitForChild("WorkTool", 10):WaitForChild("CameraLock", 10)
local function FormatMessage(p1) --[[ FormatMessage | Line: 422 | Upvalues: v1 (copy) ]]
	local v12 = v1.Translate(p1) or p1
	if v12 == p1 then
		local v2 = v1.Translate(p1 .. v1.Plateform) or error("NO TRANSLATION FOUND FOR KEY: " .. p1)
		if v2 then
			p1 = v2
		else
			error("No key for:", p1)
		end
	else
		p1 = v12
	end
	return "   " .. p1
end
local v17 = v5.new()
local function RefreshScale() --[[ RefreshScale | Line: 443 | Upvalues: Message (copy), v1 (copy) ]]
	Message.Font = v1.Localization:GetLanguageId() == "ru" and Enum.Font.Arial or Enum.Font.SourceSans
	if Message.TextFits then
		Message.TextScaled = false
	else
		Message.TextScaled = true
	end
end
workspace.TutorialService.ShowMessage.OnClientEvent:connect(function(p1) --[[ Line: 454 | Upvalues: FormatMessage (copy), v16 (ref), CurrentCamera (copy), CameraLock (copy), LocalPlayer (copy), v12 (copy), v17 (copy), v15 (copy), Message (copy), v7 (copy), v8 (copy), v9 (copy), v10 (copy), ContextActionService (copy), v1 (copy) ]]
	local v13 = FormatMessage(p1)
	if not v16 and (CurrentCamera.CameraType ~= Enum.CameraType.Custom and not CameraLock.Value) then
		CurrentCamera.CameraType = Enum.CameraType.Custom
		workspace.Main.RealignCamera.RealignCamera:Fire(25, 12)
	end
	pcall(function() --[[ Line: 467 | Upvalues: LocalPlayer (ref) ]]
		LocalPlayer.Character.Humanoid.WalkSpeed = game.StarterPlayer.CharacterWalkSpeed
	end)
	if v13 == "" then
		v12:SetVisible(false)
		v17:Next()
		return
	end
	clearArrows()
	v12:SetVisible(false)
	wait(0.22)
	v12:SetVisible(true)
	v15:Play()
	Message.Text = v13
	v7.Visible = false
	v8.Visible = false
	v9.Visible = false
	v10.Visible = false
	ContextActionService:BindAction("Cancel", function(p1, p2, p3) --[[ Line: 497 ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		PromptCancel()
	end, false, Enum.KeyCode.ButtonB)
	Message.Font = v1.Localization:GetLanguageId() == "ru" and Enum.Font.Arial or Enum.Font.SourceSans
	if Message.TextFits then
		Message.TextScaled = false
	else
		Message.TextScaled = true
	end
end)
local function OnClientInvoke(p1, p2) --[[ OnClientInvoke | Line: 518 | Upvalues: FormatMessage (copy), v12 (copy), v15 (copy), v14 (ref), LocalPlayer (copy), DisableInput (copy), v11 (ref), v7 (copy), v8 (copy), v9 (copy), v10 (copy), Message (copy), v16 (ref), CurrentCamera (copy), v1 (copy), ContextActionService (copy) ]]
	local v13 = FormatMessage(p1)
	clearArrows()
	v12:SetVisible(false)
	wait(0.22)
	v12:SetVisible(true)
	v15:Play()
	v14 = game:GetService("UserInputService").InputBegan:connect(function(p1, p2) --[[ Line: 533 | Upvalues: LocalPlayer (ref) ]]
		if p1.UserInputType ~= Enum.UserInputType.Keyboard or (not LocalPlayer.Character or (not LocalPlayer.Character:FindFirstChild("Humanoid") or LocalPlayer.Character.Humanoid.WalkSpeed ~= 0)) then
			return
		end
		wiggleWiggleWiggle()
	end)
	DisableInput.Visible = true
	v11 = nil
	v7.Visible = false
	v8.Visible = false
	v9.Visible = false
	v10.Visible = false
	Message.Text = v13
	if not v16 then
		CurrentCamera.CameraType = "Custom"
	end
	Message.Font = v1.Localization:GetLanguageId() == "ru" and Enum.Font.Arial or Enum.Font.SourceSans
	if Message.TextFits then
		Message.TextScaled = false
	else
		Message.TextScaled = true
	end
	local v4 = DisableInput.MouseButton1Down:connect(wiggleWiggleWiggle)
	local v5 = DisableInput.MouseButton2Down:connect(wiggleWiggleWiggle)
	ContextActionService:UnbindAction("Cancel")
	if p2 == 2 then
		v7.Visible = true
		pcall(function() --[[ Line: 560 | Upvalues: LocalPlayer (ref) ]]
			LocalPlayer.Character.Humanoid.WalkSpeed = 0
		end)
		ContextActionService:BindAction("Continue", function(p1, p2, p3) --[[ Line: 561 | Upvalues: v11 (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			v11 = "Continue"
		end, false, Enum.KeyCode.ButtonA)
	elseif p2 == 4 then
		v9.Visible = true
		v10.Visible = true
		DisableInput.BackgroundTransparency = 0.65
		pcall(function() --[[ Line: 568 | Upvalues: LocalPlayer (ref) ]]
			LocalPlayer.Character.Humanoid.WalkSpeed = 0
		end)
		ContextActionService:BindAction("Start", function(p1, p2, p3) --[[ Line: 569 | Upvalues: v11 (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			v11 = "Start"
		end, false, Enum.KeyCode.ButtonA)
	elseif p2 == 5 then
		v8.Visible = true
		pcall(function() --[[ Line: 574 | Upvalues: LocalPlayer (ref) ]]
			LocalPlayer.Character.Humanoid.WalkSpeed = 0
		end)
		ContextActionService:BindAction("Ok", function(p1, p2, p3) --[[ Line: 575 | Upvalues: v11 (ref) ]]
			if p2 ~= Enum.UserInputState.Begin then
				return
			end
			v11 = "Ok"
		end, false, Enum.KeyCode.ButtonA)
	end
	ContextActionService:BindAction("Cancel", function(p1, p2, p3) --[[ Line: 579 ]]
		if p2 ~= Enum.UserInputState.Begin then
			return
		end
		PromptCancel()
	end, false, Enum.KeyCode.ButtonB)
	while v11 == nil do
		wait(0.1)
	end
	ContextActionService:UnbindAction("Start")
	ContextActionService:UnbindAction("Delete")
	ContextActionService:UnbindAction("Ok")
	ContextActionService:UnbindAction("Cancel")
	ContextActionService:UnbindAction("Continue")
	if p2 == 2 then
		workspace.Main.RealignCamera.RealignCamera:Fire(25, 12)
	end
	if v5 then
		v5:disconnect()
	end
	if v4 then
		v4:disconnect()
	end
	if v14 then
		v14:disconnect()
	end
	v14 = nil
	if not HighlightedCell then
		DisableInput.Visible = false
		DisableInput.BackgroundTransparency = 1
		return v11
	end
	HighlightedCell.BrickColor = BrickColor.new("Medium stone grey")
	HighlightedCell = nil
	DisableInput.Visible = false
	DisableInput.BackgroundTransparency = 1
	return v11
end
workspace.TutorialService.PromptPlayer.OnClientInvoke = OnClientInvoke
for i, v in ipairs(v6:GetChildren()) do
	if v:IsA("TextButton") and v.Name ~= "CancelButton" then
		v.MouseButton1Click:connect(function() --[[ Line: 613 | Upvalues: v16 (ref), v11 (ref), v (copy) ]]
			if v16 then
				return
			end
			v11 = v.Name
		end)
	end
end