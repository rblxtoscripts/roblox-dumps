-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
local v1 = Library:Load("Utility")
Library:Load("Events")
local v2 = Library:Load("SoundFX")
local v3 = Library:Load("Tween")
local t = {}
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local v4 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local MainGui = PlayerGui:WaitForChild("MainGui")
local MainGui2 = PlayerGui:WaitForChild("MainGui2")
local UIEvents = PlayerGui:WaitForChild("UIEvents")
local Blur = game.Lighting.Blur
local Menu = MainGui:WaitForChild("Menu")
local Backpack = Menu:WaitForChild("Backpack")
local ChatWindow = Menu:WaitForChild("ChatWindow")
local PlayerList = Menu:WaitForChild("PlayerList")
local GamepadMoneyz = Menu:WaitForChild("GamepadMoneyz")
Menu:WaitForChild("Menu")
local ChristmasCountdown = MainGui2:WaitForChild("ChristmasCountdown")
local v5
if not game:GetService("UserInputService").TouchEnabled or game:GetService("UserInputService").MouseEnabled then
	t.__index = t
	v5 = Enum.EasingStyle.Sine
	function t.new(p1_2, p2_2, ...) --[[ new | Line: 44 | Upvalues: t (copy), v5 (copy), v4 (copy), UIEvents (copy), MainGui (copy) ]]
		local t2 = { ... }
		local v42 = t2[4]
		local t3 = {}
		setmetatable(t3, t)
		t3.Object = p2_2
		t3.Name = p2_2.Name
		t3.Type = "Window"
		t3.GuiManager = p1_2
		t3.OriginalPosition = p2_2.Position
		t3.TweenDuration = t2[3] or 0.3
		t3.TweenEasingStyle = if v42 then v42 else v5
		t3.BlurEffectEnabled = t2[5] or false
		t3.IgnoreBlurTween = false
		t3.EaseInDirection = t2[1]
		t3.EaseOutDirection = t2[2]
		t3.Disabled = false
		t3.WindowsOverriding = {}
		t3.IsCoreGuiWindow = false
		t3.IsTweeningOut = false
		t3.UseCursor = false
		t3.IsTweeningIn = false
		t3.TouchControls = {}
		t3.GamepadActions = {}
		t3.ButtonPopSoundConnections = {}
		t3.LastSelection = nil
		t3.FirstSelectedObject = nil
		t3.IsGamepadNavigateable = true
		t3.CanBeFocused = true
		t3:UpdateTweenEndPoints()
		t3.CanBeCanceled = true
		t3.CanBeOverriden = true
		t3.CancelButton = nil
		t3.DefaultCancelButtonBehaviour = true
		t3.RealVisibility = false
		p2_2.Visible = false
		local CancelButton = p2_2:FindFirstChild("CancelButton", true)
		if CancelButton and not v4.GamepadEnabled then
			t3.CancelButton = CancelButton
			t3.CancelButton.MouseButton1Click:connect(function() --[[ Line: 93 | Upvalues: t3 (copy), UIEvents (ref), p2_2 (copy) ]]
				if not t3.DefaultCancelButtonBehaviour then
					return
				end
				UIEvents.WindowManuallyClosed:Fire(p2_2)
				t3:SetVisible(false)
			end)
			return t3
		end
		if v4.GamepadEnabled and (CancelButton or (p2_2.Name == "Settings" or (p2_2.Name == "PetPanel" or p2_2.Name == "Emotions"))) then
			if CancelButton then
				CancelButton.Visible = false
			end
			t3:RegisterGamepadAction(Enum.KeyCode.ButtonB, function(p1_2, p22_2, p3_2) --[[ Line: 106 | Upvalues: t3 (copy), UIEvents (ref), p2_2 (copy) ]]
				if p22_2 ~= Enum.UserInputState.Begin or not t3.CanBeCanceled then
					return
				end
				UIEvents.WindowManuallyClosed:Fire(p2_2)
				t3:SetVisible(false)
			end)
			if p2_2.Name ~= "DialogBox" then
				local v8 = script.CancelGamepadHint:clone()
				v8.Parent = p2_2
				if v8.AbsolutePosition.Y + v8.AbsoluteSize.Y > MainGui.AbsoluteSize.Y then
					v8.AnchorPoint = Vector2.new(1, 1)
					v8.Position = UDim2.new(1, 0, 0, -5)
				end
			end
		end
		return t3
	end
	function t.CancelingEnabled(p1_2, p2_2) --[[ CancelingEnabled | Line: 132 | Upvalues: v4 (copy) ]]
		if v4.GamepadEnabled then
			p1_2.CanBeCanceled = p2_2
			p1_2.Object.CancelGamepadHint.Visible = p2_2
		else
			p1_2.CancelButton.Visible = p2_2
		end
	end
	function t.UpdateTweenEndPoints(p1_2) --[[ UpdateTweenEndPoints | Line: 145 | Upvalues: MainGui (copy) ]]
		p1_2.OriginalPosition = p1_2.Object.Position
		local EaseInDirection = p1_2.EaseInDirection
		local X = p1_2.Object.AnchorPoint.X
		local Y = p1_2.Object.AnchorPoint.Y
		if EaseInDirection then
			p1_2.EaseInStartPosition = UDim2.new(if EaseInDirection == "Left" then true elseif EaseInDirection == "Right" then 0 else p1_2.Object.Position.X.Scale, EaseInDirection == "Left" and -(1 - X) * p1_2.Object.AbsoluteSize.X or (EaseInDirection == "Right" and MainGui.AbsoluteSize.X + X * p1_2.Object.AbsoluteSize.X or p1_2.Object.Position.X.Offset), if EaseInDirection == "Top" then true elseif EaseInDirection == "Bottom" then 0 else p1_2.Object.Position.Y.Scale, EaseInDirection == "Top" and -(1 - X) * p1_2.Object.AbsoluteSize.Y or (EaseInDirection == "Bottom" and MainGui.AbsoluteSize.Y + X * p1_2.Object.AbsoluteSize.Y or p1_2.Object.Position.Y.Offset))
		end
		local EaseOutDirection = p1_2.EaseOutDirection
		if not EaseOutDirection then
			return
		end
		p1_2.EaseOutEndPosition = UDim2.new(if EaseOutDirection == "Left" then true elseif EaseOutDirection == "Right" then 0 else p1_2.Object.Position.X.Scale, EaseOutDirection == "Left" and -(1 - X) * p1_2.Object.AbsoluteSize.X or (EaseOutDirection == "Right" and MainGui.AbsoluteSize.X + X * p1_2.Object.AbsoluteSize.X or p1_2.Object.Position.X.Offset), if EaseOutDirection == "Top" then true elseif EaseOutDirection == "Bottom" then 0 else p1_2.Object.Position.Y.Scale, EaseOutDirection == "Top" and -(1 - X) * p1_2.Object.AbsoluteSize.Y or (EaseOutDirection == "Bottom" and MainGui.AbsoluteSize.Y + X * p1_2.Object.AbsoluteSize.Y or p1_2.Object.Position.Y.Offset))
	end
	function t.RegisterGamepadAction(p1_2, p2_2, p3_2) --[[ RegisterGamepadAction | Line: 182 ]]
		p1_2.GamepadActions[p2_2] = p3_2
	end
	function t.GamepadActionsEnabled(p1_2, p2_2) --[[ GamepadActionsEnabled | Line: 186 | Upvalues: ContextActionService (copy) ]]
		for k2, v in pairs(p1_2.GamepadActions) do
			local v1 = p1_2.Object.Name .. tostring(k2)
			if p2_2 then
				ContextActionService:BindAction(v1, v, false, k2)
				continue
			end
			ContextActionService:UnbindAction(v1)
		end
	end
	function t.SetConsoleSize(p1_2, p2_2) --[[ SetConsoleSize | Line: 197 ]]
		if not _G.GamepadEnabled then
			return
		end
		p1_2.Object.Size = p2_2
		p1_2:UpdateTweenEndPoints()
	end
	function t.SetSize(p1_2, p2_2) --[[ SetSize | Line: 204 | Upvalues: t (copy) ]]
		t.Size = p2_2
		p1_2:UpdateTweenEndPoints()
	end
	function HideOverlappingTouchControls(p1_2, p2_2) --[[ HideOverlappingTouchControls | Line: 212 | Upvalues: PlayerGui (copy), v1 (copy) ]]
		spawn(function() --[[ Line: 213 | Upvalues: PlayerGui (ref), v1 (ref), p2_2 (copy), p1_2 (copy) ]]
			wait()
			if not game:GetService("UserInputService").TouchEnabled then
				return
			end
			local TouchGui = PlayerGui:FindFirstChild("TouchGui")
			if not TouchGui then
				return
			end
			local TouchControlFrame = TouchGui:FindFirstChild("TouchControlFrame")
			if not TouchControlFrame then
				return
			end
			for i2, v in ipairs(TouchControlFrame:GetChildren()) do
				if v.Visible and v1:GuiIsOverlapping(p2_2, v) then
					v.Visible = false
					table.insert(p1_2.TouchControls, v)
				end
			end
		end)
	end
	function t.GamepadCaptureFocus(p1_2) --[[ GamepadCaptureFocus | Line: 234 | Upvalues: UserInputService (copy), GuiService (copy), ContextActionService (copy), GamepadService (copy) ]]
		local WindowFocusStack = p1_2.GuiManager.WindowFocusStack
		if #WindowFocusStack == 0 then
			UserInputService.MouseIconEnabled = false
			GuiService.GuiNavigationEnabled = true
			ContextActionService:BindAction("AButtonLock", function() --[[ Line: 244 ]] end, false, Enum.KeyCode.ButtonA)
			ContextActionService:BindAction("Thumbstick1Lock", function() --[[ Line: 245 ]] end, false, Enum.KeyCode.Thumbstick1)
			p1_2.GuiManager:CoreGuiGamepadActionsEnabed(false)
		else
			for i2, v in ipairs(WindowFocusStack) do
				if v == p1_2 then
					return
				end
			end
			WindowFocusStack[1].LastSelection = GuiService.SelectedObject
		end
		GuiService.SelectedObject = nil
		p1_2:GamepadActionsEnabled(true)
		table.insert(WindowFocusStack, 1, p1_2)
		if p1_2.UseCursor then
			delay(p1_2.TweenDuration, function() --[[ Line: 272 | Upvalues: WindowFocusStack (copy), p1_2 (copy), GamepadService (ref), GuiService (ref) ]]
				if WindowFocusStack[1] ~= p1_2 or (not p1_2.IsGamepadNavigateable or p1_2.IsCoreGuiWindow) then
					return
				end
				if p1_2.UseCursor then
					if p1_2.LastSelection and p1_2.LastSelection.Parent then
						GamepadService:EnableGamepadCursor(p1_2.LastSelection)
					else
						GamepadService:EnableGamepadCursor(p1_2.FirstSelectedObject)
					end
				else
					if p1_2.LastSelection and p1_2.LastSelection.Parent then
						GuiService.SelectedObject = p1_2.LastSelection
						return
					end
					if not p1_2.FirstSelectedObject then
						return
					end
					GuiService.SelectedObject = p1_2.FirstSelectedObject
				end
			end)
			return
		end
		GamepadService:DisableGamepadCursor()
		delay(p1_2.TweenDuration, function() --[[ Line: 272 | Upvalues: WindowFocusStack (copy), p1_2 (copy), GamepadService (ref), GuiService (ref) ]]
			if WindowFocusStack[1] ~= p1_2 or (not p1_2.IsGamepadNavigateable or p1_2.IsCoreGuiWindow) then
				return
			end
			if p1_2.UseCursor then
				if p1_2.LastSelection and p1_2.LastSelection.Parent then
					GamepadService:EnableGamepadCursor(p1_2.LastSelection)
				else
					GamepadService:EnableGamepadCursor(p1_2.FirstSelectedObject)
				end
			else
				if p1_2.LastSelection and p1_2.LastSelection.Parent then
					GuiService.SelectedObject = p1_2.LastSelection
					return
				end
				if not p1_2.FirstSelectedObject then
					return
				end
				GuiService.SelectedObject = p1_2.FirstSelectedObject
			end
		end)
	end
	function t.GamepadLoseFocus(p1_2) --[[ GamepadLoseFocus | Line: 294 | Upvalues: GuiService (copy), GamepadService (copy), UserInputService (copy), ContextActionService (copy) ]]
		local WindowFocusStack = p1_2.GuiManager.WindowFocusStack
		for i2, v in ipairs(WindowFocusStack) do
			if v == p1_2 then
				table.remove(WindowFocusStack, i2)
			end
		end
		if GuiService.SelectedObject == nil or GuiService.SelectedObject:IsDescendantOf(p1_2.Object) then
			p1_2.LastSelection = GuiService.SelectedObject
		end
		if p1_2.UseCursor then
			GamepadService:DisableGamepadCursor()
		end
		p1_2:GamepadActionsEnabled(false)
		local v1 = WindowFocusStack[1]
		if #WindowFocusStack == 0 then
			UserInputService.MouseIconEnabled = true
			GuiService.GuiNavigationEnabled = false
			ContextActionService:UnbindAction("AButtonLock")
			ContextActionService:UnbindAction("Thumbstick1Lock")
			ContextActionService:UnbindAction("Thumbstick2Lock")
			GuiService.SelectedObject = nil
			p1_2.GuiManager:CoreGuiGamepadActionsEnabed(true)
			return
		end
		if v1.UseCursor then
			GamepadService:EnableGamepadCursor(p1_2.LastSelection or p1_2.FirstSelectedObject)
		else
			if v1.LastSelection and v1.LastSelection.Parent then
				GuiService.SelectedObject = v1.LastSelection
				return
			end
			if v1.FirstSelectedObject and v1.FirstSelectedObject.Parent then
				GuiService.SelectedObject = v1.FirstSelectedObject
			else
				GuiService.SelectedObject = nil
			end
		end
	end
	function t.IsVisible(p1_2) --[[ IsVisible | Line: 344 ]]
		return p1_2.RealVisibility
	end
	function t.SetVisible(p1_2, p2_2) --[[ SetVisible | Line: 348 | Upvalues: UIEvents (copy), Backpack (copy), PlayerList (copy), ChatWindow (copy), GamepadMoneyz (copy), ChristmasCountdown (copy), v1 (copy), Blur (copy), v3 (copy), v2 (copy), v4 (copy) ]]
		local Object = p1_2.Object
		if p1_2.Disabled then
			return
		end
		if _G.GamepadEnabled and (not p1_2.IsCoreGuiWindow and p1_2.CanBeFocused) then
			if p2_2 then
				p1_2:GamepadCaptureFocus()
			else
				p1_2:GamepadLoseFocus()
			end
		end
		if p2_2 and p1_2.EaseInStartPosition then
			p1_2.RealVisibility = true
			Object.Position = p1_2.IsTweeningOut and Object.Position or p1_2.EaseInStartPosition
			Object.Visible = true
			UIEvents.WindowVisibilityChanged:Fire(p1_2.Object, true)
			if not p1_2.IsCoreGuiWindow then
				local Frame = Instance.new("Frame")
				Frame.Size = p1_2.Object.Size
				Frame.Position = p1_2.OriginalPosition
				Frame.BackgroundTransparency = 1
				Frame.Parent = p1_2.Object.Parent
				Frame.AnchorPoint = p1_2.Object.AnchorPoint
				HideOverlappingTouchControls(p1_2, Frame)
				for i2, v in ipairs({ Backpack, PlayerList, ChatWindow, GamepadMoneyz, ChristmasCountdown }) do
					local v22 = p1_2.GuiManager.Data[v]
					if v22 and (v22.Object.Visible and (v22.Disabled == false and v22.CanBeOverriden)) then
						local Frame_2 = Instance.new("Frame")
						Frame_2.Size = v22.Object.Size
						Frame_2.Position = v22.OriginalPosition
						Frame_2.BackgroundTransparency = 1
						Frame_2.Parent = v22.Object.Parent
						Frame_2.AnchorPoint = v22.Object.AnchorPoint
						if v1:GuiIsOverlapping(Frame, Frame_2) then
							v22:SetVisible(false)
							v22.Disabled = true
							table.insert(p1_2.WindowsOverriding, v)
						end
						Frame_2:Destroy()
					end
				end
				Frame:Destroy()
			end
			p1_2.IsTweeningIn = true
			Object:TweenPosition(p1_2.OriginalPosition, Enum.EasingDirection.Out, p1_2.TweenEasingStyle, p1_2.TweenDuration, p1_2.IsTweeningOut, function() --[[ Line: 418 | Upvalues: p1_2 (copy) ]]
				p1_2.IsTweeningIn = false
			end)
			p1_2.IsTweeningOut = false
			if p1_2.BlurEffectEnabled then
				Blur.Enabled = true
				v3(Blur, "Size", "Number", Blur.Size, 20, p1_2.TweenDuration, "Linear", "Out")
			end
		elseif p2_2 or (not p1_2.EaseInStartPosition or p1_2.IsTweeningOut) then
			Object.Visible = p2_2
			p1_2.RealVisibility = p2_2
			UIEvents.WindowVisibilityChanged:Fire(p1_2.Object, p2_2)
			if p1_2.BlurEffectEnabled then
				Blur.Size = 20
				Blur.Enabled = p2_2
			end
		else
			for i2, v in ipairs(p1_2.WindowsOverriding) do
				p1_2.GuiManager.Data[v].Disabled = false
				p1_2.GuiManager.Data[v]:SetVisible(true)
			end
			p1_2.WindowsOverriding = {}
			for i2, v in ipairs(p1_2.TouchControls) do
				v.Visible = true
			end
			p1_2.TouchControls = {}
			p1_2.RealVisibility = false
			p1_2.IsTweeningOut = true
			Object:TweenPosition(p1_2.EaseOutEndPosition, Enum.EasingDirection.In, p1_2.TweenEasingStyle, p1_2.TweenDuration, p1_2.IsTweeningIn, function() --[[ Line: 459 | Upvalues: p1_2 (copy), Object (copy), UIEvents (ref) ]]
				if not p1_2.IsTweeningOut then
					return
				end
				Object.Position = p1_2.OriginalPosition
				Object.Visible = false
				UIEvents.WindowVisibilityChanged:Fire(p1_2.Object, false)
				p1_2.IsTweeningOut = false
			end)
			p1_2.IsTweeningIn = false
			if p1_2.BlurEffectEnabled then
				Blur.Enabled = true
				v3(Blur, "Size")
				v3(Blur, "Size", "Number", Blur.Size, 0, p1_2.TweenDuration, "Linear", "Out"):connect(function() --[[ Line: 481 ]] end)
			end
		end
		local function ConnectButton(p12_2) --[[ ConnectButton | Line: 511 | Upvalues: p1_2 (copy), v2 (ref), v4 (ref) ]]
			if p12_2:FindFirstChild("Foreground") then
				local Position = p12_2.Foreground.Position
				p1_2.ButtonPopSoundConnections[p12_2] = p12_2.MouseButton1Click:connect(function() --[[ Line: 514 | Upvalues: v2 (ref) ]]
					v2:PlaySound("Pop3")
				end)
				if v4.Plateform == "Computer" then
					local BackgroundColor3 = p12_2.Foreground.BackgroundColor3
					p12_2.MouseEnter:Connect(function() --[[ Line: 522 | Upvalues: p12_2 (copy), BackgroundColor3 (copy) ]]
						p12_2.Foreground.BackgroundColor3 = Color3.new(BackgroundColor3.R + 0.06, BackgroundColor3.G + 0.06, BackgroundColor3.B + 0.06)
					end)
					p12_2.MouseLeave:Connect(function() --[[ Line: 525 | Upvalues: p12_2 (copy), BackgroundColor3 (copy) ]]
						p12_2.Foreground.BackgroundColor3 = BackgroundColor3
					end)
				end
			else
				p1_2.ButtonPopSoundConnections[p12_2] = p12_2.MouseButton1Click:connect(function() --[[ Line: 531 | Upvalues: v2 (ref) ]]
					v2:PlaySound("Pop3")
				end)
			end
		end
		if p2_2 then
			local function v32(p12_2) --[[ connecter | Line: 537 | Upvalues: p1_2 (copy), ConnectButton (copy), v32 (copy) ]]
				if p12_2:FindFirstChild("PopSoundDisabled") then
					return
				end
				for i2, v in ipairs(p12_2:GetChildren()) do
					if p1_2.ButtonPopSoundConnections[v] == nil then
						if v:IsA("TextButton") or v:IsA("ImageButton") then
							ConnectButton(v)
							continue
						end
						if v:IsA("Frame") or (v:IsA("ScrollingFrame") or v:IsA("Folder")) then
							v32(v)
						end
					end
				end
			end
			v32(p1_2.Object)
			local function decAdded(p12_2) --[[ decAdded | Line: 559 | Upvalues: p1_2 (copy), ConnectButton (copy) ]]
				wait()
				if not (p12_2 and (p12_2.Parent and (p12_2:IsA("TextButton") or p12_2:IsA("ImageButton")))) then
					return
				end
				if p12_2.Parent:FindFirstChild("PopSoundDisabled") or p1_2.ButtonPopSoundConnections[p12_2] ~= nil then
					return
				end
				ConnectButton(p12_2)
			end
			local function decRemoved(p12_2) --[[ decRemoved | Line: 566 | Upvalues: p1_2 (copy) ]]
				if not (p12_2 and p12_2:IsA("TextButton") or p12_2:IsA("ImageButton") and p1_2.ButtonPopSoundConnections[p12_2]) then
					return
				end
				pcall(function() --[[ Line: 568 | Upvalues: p1_2 (ref), p12_2 (copy) ]]
					p1_2.ButtonPopSoundConnections[p12_2]:disconnect()
				end)
				p1_2.ButtonPopSoundConnections[p12_2] = nil
			end
			p1_2.ButtonPopSoundConnections[p1_2.Object] = p1_2.Object.DescendantAdded:connect(decAdded)
			p1_2.ButtonPopSoundConnections[p1_2.Object] = p1_2.Object.DescendantRemoving:connect(decRemoved)
			return
		end
		for k2, v in pairs(p1_2.ButtonPopSoundConnections) do
			v:disconnect()
		end
		p1_2.ButtonPopSoundConnections = {}
	end
	function t.IsOverlapping(p1_2, p2_2) --[[ IsOverlapping | Line: 592 | Upvalues: v1 (copy) ]]
		return v1:GuiIsOverlapping(p1_2.Object, p2_2)
	end
	return t
end
local _ = not game:GetService("UserInputService").KeyboardEnabled
t.__index = t
v5 = Enum.EasingStyle.Sine
function t.new(p1_2, p2_2, ...) --[[ new | Line: 44 | Upvalues: t (copy), v5 (copy), v4 (copy), UIEvents (copy), MainGui (copy) ]]
	local t2 = { ... }
	local v42 = t2[4]
	local t3 = {}
	setmetatable(t3, t)
	t3.Object = p2_2
	t3.Name = p2_2.Name
	t3.Type = "Window"
	t3.GuiManager = p1_2
	t3.OriginalPosition = p2_2.Position
	t3.TweenDuration = t2[3] or 0.3
	t3.TweenEasingStyle = if v42 then v42 else v5
	t3.BlurEffectEnabled = t2[5] or false
	t3.IgnoreBlurTween = false
	t3.EaseInDirection = t2[1]
	t3.EaseOutDirection = t2[2]
	t3.Disabled = false
	t3.WindowsOverriding = {}
	t3.IsCoreGuiWindow = false
	t3.IsTweeningOut = false
	t3.UseCursor = false
	t3.IsTweeningIn = false
	t3.TouchControls = {}
	t3.GamepadActions = {}
	t3.ButtonPopSoundConnections = {}
	t3.LastSelection = nil
	t3.FirstSelectedObject = nil
	t3.IsGamepadNavigateable = true
	t3.CanBeFocused = true
	t3:UpdateTweenEndPoints()
	t3.CanBeCanceled = true
	t3.CanBeOverriden = true
	t3.CancelButton = nil
	t3.DefaultCancelButtonBehaviour = true
	t3.RealVisibility = false
	p2_2.Visible = false
	local CancelButton = p2_2:FindFirstChild("CancelButton", true)
	if CancelButton and not v4.GamepadEnabled then
		t3.CancelButton = CancelButton
		t3.CancelButton.MouseButton1Click:connect(function() --[[ Line: 93 | Upvalues: t3 (copy), UIEvents (ref), p2_2 (copy) ]]
			if not t3.DefaultCancelButtonBehaviour then
				return
			end
			UIEvents.WindowManuallyClosed:Fire(p2_2)
			t3:SetVisible(false)
		end)
		return t3
	end
	if v4.GamepadEnabled and (CancelButton or (p2_2.Name == "Settings" or (p2_2.Name == "PetPanel" or p2_2.Name == "Emotions"))) then
		if CancelButton then
			CancelButton.Visible = false
		end
		t3:RegisterGamepadAction(Enum.KeyCode.ButtonB, function(p1_2, p22_2, p3_2) --[[ Line: 106 | Upvalues: t3 (copy), UIEvents (ref), p2_2 (copy) ]]
			if p22_2 ~= Enum.UserInputState.Begin or not t3.CanBeCanceled then
				return
			end
			UIEvents.WindowManuallyClosed:Fire(p2_2)
			t3:SetVisible(false)
		end)
		if p2_2.Name ~= "DialogBox" then
			local v8 = script.CancelGamepadHint:clone()
			v8.Parent = p2_2
			if v8.AbsolutePosition.Y + v8.AbsoluteSize.Y > MainGui.AbsoluteSize.Y then
				v8.AnchorPoint = Vector2.new(1, 1)
				v8.Position = UDim2.new(1, 0, 0, -5)
			end
		end
	end
	return t3
end
function t.CancelingEnabled(p1_2, p2_2) --[[ CancelingEnabled | Line: 132 | Upvalues: v4 (copy) ]]
	if v4.GamepadEnabled then
		p1_2.CanBeCanceled = p2_2
		p1_2.Object.CancelGamepadHint.Visible = p2_2
	else
		p1_2.CancelButton.Visible = p2_2
	end
end
function t.UpdateTweenEndPoints(p1_2) --[[ UpdateTweenEndPoints | Line: 145 | Upvalues: MainGui (copy) ]]
	p1_2.OriginalPosition = p1_2.Object.Position
	local EaseInDirection = p1_2.EaseInDirection
	local X = p1_2.Object.AnchorPoint.X
	local Y = p1_2.Object.AnchorPoint.Y
	if EaseInDirection then
		p1_2.EaseInStartPosition = UDim2.new(if EaseInDirection == "Left" then true elseif EaseInDirection == "Right" then 0 else p1_2.Object.Position.X.Scale, EaseInDirection == "Left" and -(1 - X) * p1_2.Object.AbsoluteSize.X or (EaseInDirection == "Right" and MainGui.AbsoluteSize.X + X * p1_2.Object.AbsoluteSize.X or p1_2.Object.Position.X.Offset), if EaseInDirection == "Top" then true elseif EaseInDirection == "Bottom" then 0 else p1_2.Object.Position.Y.Scale, EaseInDirection == "Top" and -(1 - X) * p1_2.Object.AbsoluteSize.Y or (EaseInDirection == "Bottom" and MainGui.AbsoluteSize.Y + X * p1_2.Object.AbsoluteSize.Y or p1_2.Object.Position.Y.Offset))
	end
	local EaseOutDirection = p1_2.EaseOutDirection
	if not EaseOutDirection then
		return
	end
	p1_2.EaseOutEndPosition = UDim2.new(if EaseOutDirection == "Left" then true elseif EaseOutDirection == "Right" then 0 else p1_2.Object.Position.X.Scale, EaseOutDirection == "Left" and -(1 - X) * p1_2.Object.AbsoluteSize.X or (EaseOutDirection == "Right" and MainGui.AbsoluteSize.X + X * p1_2.Object.AbsoluteSize.X or p1_2.Object.Position.X.Offset), if EaseOutDirection == "Top" then true elseif EaseOutDirection == "Bottom" then 0 else p1_2.Object.Position.Y.Scale, EaseOutDirection == "Top" and -(1 - X) * p1_2.Object.AbsoluteSize.Y or (EaseOutDirection == "Bottom" and MainGui.AbsoluteSize.Y + X * p1_2.Object.AbsoluteSize.Y or p1_2.Object.Position.Y.Offset))
end
function t.RegisterGamepadAction(p1_2, p2_2, p3_2) --[[ RegisterGamepadAction | Line: 182 ]]
	p1_2.GamepadActions[p2_2] = p3_2
end
function t.GamepadActionsEnabled(p1_2, p2_2) --[[ GamepadActionsEnabled | Line: 186 | Upvalues: ContextActionService (copy) ]]
	for k2, v in pairs(p1_2.GamepadActions) do
		local v1 = p1_2.Object.Name .. tostring(k2)
		if p2_2 then
			ContextActionService:BindAction(v1, v, false, k2)
			continue
		end
		ContextActionService:UnbindAction(v1)
	end
end
function t.SetConsoleSize(p1_2, p2_2) --[[ SetConsoleSize | Line: 197 ]]
	if not _G.GamepadEnabled then
		return
	end
	p1_2.Object.Size = p2_2
	p1_2:UpdateTweenEndPoints()
end
function t.SetSize(p1_2, p2_2) --[[ SetSize | Line: 204 | Upvalues: t (copy) ]]
	t.Size = p2_2
	p1_2:UpdateTweenEndPoints()
end
function HideOverlappingTouchControls(p1_2, p2_2) --[[ HideOverlappingTouchControls | Line: 212 | Upvalues: PlayerGui (copy), v1 (copy) ]]
	spawn(function() --[[ Line: 213 | Upvalues: PlayerGui (ref), v1 (ref), p2_2 (copy), p1_2 (copy) ]]
		wait()
		if not game:GetService("UserInputService").TouchEnabled then
			return
		end
		local TouchGui = PlayerGui:FindFirstChild("TouchGui")
		if not TouchGui then
			return
		end
		local TouchControlFrame = TouchGui:FindFirstChild("TouchControlFrame")
		if not TouchControlFrame then
			return
		end
		for i2, v in ipairs(TouchControlFrame:GetChildren()) do
			if v.Visible and v1:GuiIsOverlapping(p2_2, v) then
				v.Visible = false
				table.insert(p1_2.TouchControls, v)
			end
		end
	end)
end
function t.GamepadCaptureFocus(p1_2) --[[ GamepadCaptureFocus | Line: 234 | Upvalues: UserInputService (copy), GuiService (copy), ContextActionService (copy), GamepadService (copy) ]]
	local WindowFocusStack = p1_2.GuiManager.WindowFocusStack
	if #WindowFocusStack == 0 then
		UserInputService.MouseIconEnabled = false
		GuiService.GuiNavigationEnabled = true
		ContextActionService:BindAction("AButtonLock", function() --[[ Line: 244 ]] end, false, Enum.KeyCode.ButtonA)
		ContextActionService:BindAction("Thumbstick1Lock", function() --[[ Line: 245 ]] end, false, Enum.KeyCode.Thumbstick1)
		p1_2.GuiManager:CoreGuiGamepadActionsEnabed(false)
	else
		for i2, v in ipairs(WindowFocusStack) do
			if v == p1_2 then
				return
			end
		end
		WindowFocusStack[1].LastSelection = GuiService.SelectedObject
	end
	GuiService.SelectedObject = nil
	p1_2:GamepadActionsEnabled(true)
	table.insert(WindowFocusStack, 1, p1_2)
	if p1_2.UseCursor then
		delay(p1_2.TweenDuration, function() --[[ Line: 272 | Upvalues: WindowFocusStack (copy), p1_2 (copy), GamepadService (ref), GuiService (ref) ]]
			if WindowFocusStack[1] ~= p1_2 or (not p1_2.IsGamepadNavigateable or p1_2.IsCoreGuiWindow) then
				return
			end
			if p1_2.UseCursor then
				if p1_2.LastSelection and p1_2.LastSelection.Parent then
					GamepadService:EnableGamepadCursor(p1_2.LastSelection)
				else
					GamepadService:EnableGamepadCursor(p1_2.FirstSelectedObject)
				end
			else
				if p1_2.LastSelection and p1_2.LastSelection.Parent then
					GuiService.SelectedObject = p1_2.LastSelection
					return
				end
				if not p1_2.FirstSelectedObject then
					return
				end
				GuiService.SelectedObject = p1_2.FirstSelectedObject
			end
		end)
		return
	end
	GamepadService:DisableGamepadCursor()
	delay(p1_2.TweenDuration, function() --[[ Line: 272 | Upvalues: WindowFocusStack (copy), p1_2 (copy), GamepadService (ref), GuiService (ref) ]]
		if WindowFocusStack[1] ~= p1_2 or (not p1_2.IsGamepadNavigateable or p1_2.IsCoreGuiWindow) then
			return
		end
		if p1_2.UseCursor then
			if p1_2.LastSelection and p1_2.LastSelection.Parent then
				GamepadService:EnableGamepadCursor(p1_2.LastSelection)
			else
				GamepadService:EnableGamepadCursor(p1_2.FirstSelectedObject)
			end
		else
			if p1_2.LastSelection and p1_2.LastSelection.Parent then
				GuiService.SelectedObject = p1_2.LastSelection
				return
			end
			if not p1_2.FirstSelectedObject then
				return
			end
			GuiService.SelectedObject = p1_2.FirstSelectedObject
		end
	end)
end
function t.GamepadLoseFocus(p1_2) --[[ GamepadLoseFocus | Line: 294 | Upvalues: GuiService (copy), GamepadService (copy), UserInputService (copy), ContextActionService (copy) ]]
	local WindowFocusStack = p1_2.GuiManager.WindowFocusStack
	for i2, v in ipairs(WindowFocusStack) do
		if v == p1_2 then
			table.remove(WindowFocusStack, i2)
		end
	end
	if GuiService.SelectedObject == nil or GuiService.SelectedObject:IsDescendantOf(p1_2.Object) then
		p1_2.LastSelection = GuiService.SelectedObject
	end
	if p1_2.UseCursor then
		GamepadService:DisableGamepadCursor()
	end
	p1_2:GamepadActionsEnabled(false)
	local v1 = WindowFocusStack[1]
	if #WindowFocusStack == 0 then
		UserInputService.MouseIconEnabled = true
		GuiService.GuiNavigationEnabled = false
		ContextActionService:UnbindAction("AButtonLock")
		ContextActionService:UnbindAction("Thumbstick1Lock")
		ContextActionService:UnbindAction("Thumbstick2Lock")
		GuiService.SelectedObject = nil
		p1_2.GuiManager:CoreGuiGamepadActionsEnabed(true)
		return
	end
	if v1.UseCursor then
		GamepadService:EnableGamepadCursor(p1_2.LastSelection or p1_2.FirstSelectedObject)
	else
		if v1.LastSelection and v1.LastSelection.Parent then
			GuiService.SelectedObject = v1.LastSelection
			return
		end
		if v1.FirstSelectedObject and v1.FirstSelectedObject.Parent then
			GuiService.SelectedObject = v1.FirstSelectedObject
		else
			GuiService.SelectedObject = nil
		end
	end
end
function t.IsVisible(p1_2) --[[ IsVisible | Line: 344 ]]
	return p1_2.RealVisibility
end
function t.SetVisible(p1_2, p2_2) --[[ SetVisible | Line: 348 | Upvalues: UIEvents (copy), Backpack (copy), PlayerList (copy), ChatWindow (copy), GamepadMoneyz (copy), ChristmasCountdown (copy), v1 (copy), Blur (copy), v3 (copy), v2 (copy), v4 (copy) ]]
	local Object = p1_2.Object
	if p1_2.Disabled then
		return
	end
	if _G.GamepadEnabled and (not p1_2.IsCoreGuiWindow and p1_2.CanBeFocused) then
		if p2_2 then
			p1_2:GamepadCaptureFocus()
		else
			p1_2:GamepadLoseFocus()
		end
	end
	if p2_2 and p1_2.EaseInStartPosition then
		p1_2.RealVisibility = true
		Object.Position = p1_2.IsTweeningOut and Object.Position or p1_2.EaseInStartPosition
		Object.Visible = true
		UIEvents.WindowVisibilityChanged:Fire(p1_2.Object, true)
		if not p1_2.IsCoreGuiWindow then
			local Frame = Instance.new("Frame")
			Frame.Size = p1_2.Object.Size
			Frame.Position = p1_2.OriginalPosition
			Frame.BackgroundTransparency = 1
			Frame.Parent = p1_2.Object.Parent
			Frame.AnchorPoint = p1_2.Object.AnchorPoint
			HideOverlappingTouchControls(p1_2, Frame)
			for i2, v in ipairs({ Backpack, PlayerList, ChatWindow, GamepadMoneyz, ChristmasCountdown }) do
				local v22 = p1_2.GuiManager.Data[v]
				if v22 and (v22.Object.Visible and (v22.Disabled == false and v22.CanBeOverriden)) then
					local Frame_2 = Instance.new("Frame")
					Frame_2.Size = v22.Object.Size
					Frame_2.Position = v22.OriginalPosition
					Frame_2.BackgroundTransparency = 1
					Frame_2.Parent = v22.Object.Parent
					Frame_2.AnchorPoint = v22.Object.AnchorPoint
					if v1:GuiIsOverlapping(Frame, Frame_2) then
						v22:SetVisible(false)
						v22.Disabled = true
						table.insert(p1_2.WindowsOverriding, v)
					end
					Frame_2:Destroy()
				end
			end
			Frame:Destroy()
		end
		p1_2.IsTweeningIn = true
		Object:TweenPosition(p1_2.OriginalPosition, Enum.EasingDirection.Out, p1_2.TweenEasingStyle, p1_2.TweenDuration, p1_2.IsTweeningOut, function() --[[ Line: 418 | Upvalues: p1_2 (copy) ]]
			p1_2.IsTweeningIn = false
		end)
		p1_2.IsTweeningOut = false
		if p1_2.BlurEffectEnabled then
			Blur.Enabled = true
			v3(Blur, "Size", "Number", Blur.Size, 20, p1_2.TweenDuration, "Linear", "Out")
		end
	elseif p2_2 or (not p1_2.EaseInStartPosition or p1_2.IsTweeningOut) then
		Object.Visible = p2_2
		p1_2.RealVisibility = p2_2
		UIEvents.WindowVisibilityChanged:Fire(p1_2.Object, p2_2)
		if p1_2.BlurEffectEnabled then
			Blur.Size = 20
			Blur.Enabled = p2_2
		end
	else
		for i2, v in ipairs(p1_2.WindowsOverriding) do
			p1_2.GuiManager.Data[v].Disabled = false
			p1_2.GuiManager.Data[v]:SetVisible(true)
		end
		p1_2.WindowsOverriding = {}
		for i2, v in ipairs(p1_2.TouchControls) do
			v.Visible = true
		end
		p1_2.TouchControls = {}
		p1_2.RealVisibility = false
		p1_2.IsTweeningOut = true
		Object:TweenPosition(p1_2.EaseOutEndPosition, Enum.EasingDirection.In, p1_2.TweenEasingStyle, p1_2.TweenDuration, p1_2.IsTweeningIn, function() --[[ Line: 459 | Upvalues: p1_2 (copy), Object (copy), UIEvents (ref) ]]
			if not p1_2.IsTweeningOut then
				return
			end
			Object.Position = p1_2.OriginalPosition
			Object.Visible = false
			UIEvents.WindowVisibilityChanged:Fire(p1_2.Object, false)
			p1_2.IsTweeningOut = false
		end)
		p1_2.IsTweeningIn = false
		if p1_2.BlurEffectEnabled then
			Blur.Enabled = true
			v3(Blur, "Size")
			v3(Blur, "Size", "Number", Blur.Size, 0, p1_2.TweenDuration, "Linear", "Out"):connect(function() --[[ Line: 481 ]] end)
		end
	end
	local function ConnectButton(p12_2) --[[ ConnectButton | Line: 511 | Upvalues: p1_2 (copy), v2 (ref), v4 (ref) ]]
		if p12_2:FindFirstChild("Foreground") then
			local Position = p12_2.Foreground.Position
			p1_2.ButtonPopSoundConnections[p12_2] = p12_2.MouseButton1Click:connect(function() --[[ Line: 514 | Upvalues: v2 (ref) ]]
				v2:PlaySound("Pop3")
			end)
			if v4.Plateform == "Computer" then
				local BackgroundColor3 = p12_2.Foreground.BackgroundColor3
				p12_2.MouseEnter:Connect(function() --[[ Line: 522 | Upvalues: p12_2 (copy), BackgroundColor3 (copy) ]]
					p12_2.Foreground.BackgroundColor3 = Color3.new(BackgroundColor3.R + 0.06, BackgroundColor3.G + 0.06, BackgroundColor3.B + 0.06)
				end)
				p12_2.MouseLeave:Connect(function() --[[ Line: 525 | Upvalues: p12_2 (copy), BackgroundColor3 (copy) ]]
					p12_2.Foreground.BackgroundColor3 = BackgroundColor3
				end)
			end
		else
			p1_2.ButtonPopSoundConnections[p12_2] = p12_2.MouseButton1Click:connect(function() --[[ Line: 531 | Upvalues: v2 (ref) ]]
				v2:PlaySound("Pop3")
			end)
		end
	end
	if p2_2 then
		local function v32(p12_2) --[[ connecter | Line: 537 | Upvalues: p1_2 (copy), ConnectButton (copy), v32 (copy) ]]
			if p12_2:FindFirstChild("PopSoundDisabled") then
				return
			end
			for i2, v in ipairs(p12_2:GetChildren()) do
				if p1_2.ButtonPopSoundConnections[v] == nil then
					if v:IsA("TextButton") or v:IsA("ImageButton") then
						ConnectButton(v)
						continue
					end
					if v:IsA("Frame") or (v:IsA("ScrollingFrame") or v:IsA("Folder")) then
						v32(v)
					end
				end
			end
		end
		v32(p1_2.Object)
		local function decAdded(p12_2) --[[ decAdded | Line: 559 | Upvalues: p1_2 (copy), ConnectButton (copy) ]]
			wait()
			if not (p12_2 and (p12_2.Parent and (p12_2:IsA("TextButton") or p12_2:IsA("ImageButton")))) then
				return
			end
			if p12_2.Parent:FindFirstChild("PopSoundDisabled") or p1_2.ButtonPopSoundConnections[p12_2] ~= nil then
				return
			end
			ConnectButton(p12_2)
		end
		local function decRemoved(p12_2) --[[ decRemoved | Line: 566 | Upvalues: p1_2 (copy) ]]
			if not (p12_2 and p12_2:IsA("TextButton") or p12_2:IsA("ImageButton") and p1_2.ButtonPopSoundConnections[p12_2]) then
				return
			end
			pcall(function() --[[ Line: 568 | Upvalues: p1_2 (ref), p12_2 (copy) ]]
				p1_2.ButtonPopSoundConnections[p12_2]:disconnect()
			end)
			p1_2.ButtonPopSoundConnections[p12_2] = nil
		end
		p1_2.ButtonPopSoundConnections[p1_2.Object] = p1_2.Object.DescendantAdded:connect(decAdded)
		p1_2.ButtonPopSoundConnections[p1_2.Object] = p1_2.Object.DescendantRemoving:connect(decRemoved)
		return
	end
	for k2, v in pairs(p1_2.ButtonPopSoundConnections) do
		v:disconnect()
	end
	p1_2.ButtonPopSoundConnections = {}
end
function t.IsOverlapping(p1_2, p2_2) --[[ IsOverlapping | Line: 592 | Upvalues: v1 (copy) ]]
	return v1:GuiIsOverlapping(p1_2.Object, p2_2)
end
return t