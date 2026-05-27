-- https://lua.expert/
local t = {}
local UserInputService = game:GetService("UserInputService")
local ProximityPromptService = game:GetService("ProximityPromptService")
local TweenService = game:GetService("TweenService")
local TextService = game:GetService("TextService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = require(ReplicatedStorage.Sonar)("StorageUtils")
local PlayerGui = Players.LocalPlayer:WaitForChild("PlayerGui")
local t2 = {
	[Enum.KeyCode.Backspace] = "rbxasset://textures/ui/Controls/backspace.png",
	[Enum.KeyCode.Return] = "rbxasset://textures/ui/Controls/return.png",
	[Enum.KeyCode.LeftShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.RightShift] = "rbxasset://textures/ui/Controls/shift.png",
	[Enum.KeyCode.Tab] = "rbxasset://textures/ui/Controls/tab.png"
}
local t3 = {
	["\'"] = "rbxasset://textures/ui/Controls/apostrophe.png",
	[","] = "rbxasset://textures/ui/Controls/comma.png",
	["`"] = "rbxasset://textures/ui/Controls/graveaccent.png",
	["."] = "rbxasset://textures/ui/Controls/period.png",
	[" "] = "rbxasset://textures/ui/Controls/spacebar.png"
}
local t4 = {
	[Enum.KeyCode.LeftControl] = "Ctrl",
	[Enum.KeyCode.RightControl] = "Ctrl",
	[Enum.KeyCode.LeftAlt] = "Alt",
	[Enum.KeyCode.RightAlt] = "Alt",
	[Enum.KeyCode.F1] = "F1",
	[Enum.KeyCode.F2] = "F2",
	[Enum.KeyCode.F3] = "F3",
	[Enum.KeyCode.F4] = "F4",
	[Enum.KeyCode.F5] = "F5",
	[Enum.KeyCode.F6] = "F6",
	[Enum.KeyCode.F7] = "F7",
	[Enum.KeyCode.F8] = "F8",
	[Enum.KeyCode.F9] = "F9",
	[Enum.KeyCode.F10] = "F10",
	[Enum.KeyCode.F11] = "F11",
	[Enum.KeyCode.F12] = "F12",
	[Enum.KeyCode.PageUp] = "PgUp",
	[Enum.KeyCode.PageDown] = "PgDn",
	[Enum.KeyCode.Home] = "Home",
	[Enum.KeyCode.End] = "End",
	[Enum.KeyCode.Insert] = "Ins",
	[Enum.KeyCode.Delete] = "Del"
}
local t5 = {
	[Enum.KeyCode.LeftControl] = 12,
	[Enum.KeyCode.RightControl] = 12,
	[Enum.KeyCode.LeftAlt] = 12,
	[Enum.KeyCode.RightAlt] = 12,
	[Enum.KeyCode.F10] = 12,
	[Enum.KeyCode.F11] = 12,
	[Enum.KeyCode.F12] = 12,
	[Enum.KeyCode.PageUp] = 8,
	[Enum.KeyCode.PageDown] = 8,
	[Enum.KeyCode.Home] = 8,
	[Enum.KeyCode.End] = 10,
	[Enum.KeyCode.Insert] = 10,
	[Enum.KeyCode.Delete] = 10
}
local v2 = TweenInfo.new(0.06, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
local v3 = v1.GetFromPath("ReplicatedStorage/Storage/Assets/ProximityPrompts")()
local function getScreenGui() --[[ getScreenGui | Line: 80 | Upvalues: PlayerGui (copy) ]]
	local GuiDump = PlayerGui:FindFirstChild("GuiDump")
	if GuiDump == nil then
		local GuiDump_2 = Instance.new("ScreenGui")
		GuiDump_2.Name = "GuiDump"
		GuiDump_2.ResetOnSpawn = false
		GuiDump_2.Parent = PlayerGui
		GuiDump = GuiDump_2
	end
	return GuiDump
end
local function setUpCircularProgressBar(p1) --[[ setUpCircularProgressBar | Line: 91 ]]
	local UIGradient = p1.LeftGradient.ProgressBarImage.UIGradient
	local UIGradient_2 = p1.RightGradient.ProgressBarImage.UIGradient
	p1.Progress.Changed:Connect(function(p1_2) --[[ Line: 96 | Upvalues: UIGradient (copy), UIGradient_2 (copy) ]]
		local v1 = math.clamp(p1_2 * 360, 0, 360)
		UIGradient.Rotation = math.clamp(v1, 180, 360)
		UIGradient_2.Rotation = math.clamp(v1, 0, 180)
	end)
end
local function createIndicator(p1, p2) --[[ createIndicator | Line: 103 | Upvalues: v3 (copy), TweenService (copy), v2 (copy) ]]
	local t = {}
	local t2 = {}
	local v1 = nil
	local v22 = p1:GetAttribute("Theme")
	if v22 then
		local v32 = v3:FindFirstChild(v22 .. "Indicator")
		if v32 then
			v1 = v32:Clone()
		end
	end
	if v1 == nil then
		v1 = v3.DefaultIndicator:Clone()
	end
	v1.Enabled = true
	local function v4(p1) --[[ setupChildTweens | Line: 122 | Upvalues: t (copy), TweenService (ref), v2 (ref), t2 (copy), v4 (copy) ]]
		if p1:IsA("UIStroke") then
			local Transparency = p1.Transparency
			p1.Transparency = 1
			table.insert(t, TweenService:Create(p1, v2, {
				Transparency = 1
			}))
			table.insert(t2, TweenService:Create(p1, v2, {
				Transparency = Transparency
			}))
		elseif p1:IsA("GuiObject") then
			local BackgroundTransparency = p1.BackgroundTransparency
			p1.BackgroundTransparency = 1
			table.insert(t, TweenService:Create(p1, v2, {
				BackgroundTransparency = 1
			}))
			table.insert(t2, TweenService:Create(p1, v2, {
				BackgroundTransparency = BackgroundTransparency
			}))
			if p1:IsA("TextLabel") then
				local TextTransparency = p1.TextTransparency
				local TextStrokeTransparency = p1.TextStrokeTransparency
				p1.TextTransparency = 1
				p1.TextStrokeTransparency = 1
				table.insert(t, TweenService:Create(p1, v2, {
					TextTransparency = 1,
					TextStrokeTransparency = 1
				}))
				table.insert(t2, TweenService:Create(p1, v2, {
					TextTransparency = TextTransparency,
					TextStrokeTransparency = TextStrokeTransparency
				}))
			elseif p1:IsA("ImageLabel") then
				local ImageTransparency = p1.ImageTransparency
				p1.ImageTransparency = 1
				table.insert(t, TweenService:Create(p1, v2, {
					ImageTransparency = 1
				}))
				table.insert(t2, TweenService:Create(p1, v2, {
					ImageTransparency = ImageTransparency
				}))
			end
		end
		for v25, v26 in p1:GetChildren() do
			v4(v26)
		end
	end
	for v5, v6 in v1:GetChildren() do
		v4(v6)
	end
	v1.Adornee = p1.Parent
	v1.Parent = p2
	local function updateUIAncestry() --[[ updateUIAncestry | Line: 161 | Upvalues: v1 (ref), p1 (copy) ]]
		v1.Adornee = p1.Parent
	end
	local v7 = p1.AncestryChanged:Connect(updateUIAncestry)
	for v8, v9 in t2 do
		v9:Play()
	end
	return function() --[[ cleanup | Line: 170 | Upvalues: v7 (copy), t (copy), v1 (ref) ]]
		v7:Disconnect()
		for v12, v2 in t do
			v2:Play()
		end
		task.wait(0.2)
		v1.Parent = nil
	end
end
local function createPrompt(p1, p2, p3) --[[ createPrompt | Line: 185 | Upvalues: v3 (copy), TweenService (copy), v2 (copy), UserInputService (copy), t2 (copy), t3 (copy), t4 (copy), t5 (copy), TextService (copy), ProximityPromptService (copy) ]]
	local t = {}
	local t6 = {}
	local t7 = {}
	local list = {}
	local t8 = {}
	local v1 = TweenInfo.new(p1.HoldDuration, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v22 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
	local v32 = TweenInfo.new(0, Enum.EasingStyle.Linear, Enum.EasingDirection.Out)
	local v4 = nil
	local v5 = p1:GetAttribute("Theme")
	if v5 then
		local v6 = v3:FindFirstChild(v5)
		if v6 then
			v4 = v6:Clone()
		end
	end
	if v4 == nil then
		v4 = v3.Default:Clone()
	end
	v4.Enabled = true
	local PromptFrame = v4:FindFirstChild("PromptFrame", true)
	local v7 = v4:FindFirstChild("Frame") or PromptFrame
	local InputFrame = PromptFrame.InputFrame
	local ActionText = PromptFrame:FindFirstChild("ActionText", true)
	local ObjectText = PromptFrame:FindFirstChild("ObjectText", true)
	local BackgroundTransparency = PromptFrame.BackgroundTransparency
	local ImageTransparency = PromptFrame.ImageTransparency
	PromptFrame.BackgroundTransparency = 1
	PromptFrame.ImageTransparency = 1
	t8[PromptFrame] = true
	local v8 = TweenService
	table.insert(t, v8:Create(PromptFrame, v22, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = UDim2.fromScale(0.5, 1)
	}))
	local v9 = TweenService
	table.insert(t6, v9:Create(PromptFrame, v22, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = BackgroundTransparency,
		ImageTransparency = ImageTransparency
	}))
	local v10 = TweenService
	table.insert(t7, v10:Create(PromptFrame, v22, {
		BackgroundTransparency = 1,
		ImageTransparency = 1,
		Size = UDim2.fromScale(0.5, 1)
	}))
	local v11 = TweenService
	table.insert(list, v11:Create(PromptFrame, v22, {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = BackgroundTransparency,
		ImageTransparency = ImageTransparency
	}))
	local function setupUIStrokeTweens(p1) --[[ setupUIStrokeTweens | Line: 230 | Upvalues: t (copy), TweenService (ref), v22 (copy), t6 (copy), t7 (copy), list (copy) ]]
		local Transparency = p1.Transparency
		p1.Transparency = 1
		table.insert(t, TweenService:Create(p1, v22, {
			Transparency = 1
		}))
		table.insert(t6, TweenService:Create(p1, v22, {
			Transparency = Transparency
		}))
		table.insert(t7, TweenService:Create(p1, v22, {
			Transparency = 1
		}))
		table.insert(list, TweenService:Create(p1, v22, {
			Transparency = Transparency
		}))
	end
	local function setupGUIObjectTweens(p1) --[[ setupGUIObjectTweens | Line: 239 | Upvalues: t (copy), TweenService (ref), v22 (copy), t6 (copy), t7 (copy), list (copy) ]]
		local BackgroundTransparency = p1.BackgroundTransparency
		p1.BackgroundTransparency = 1
		table.insert(t, TweenService:Create(p1, v22, {
			BackgroundTransparency = 1
		}))
		table.insert(t6, TweenService:Create(p1, v22, {
			BackgroundTransparency = BackgroundTransparency
		}))
		table.insert(t7, TweenService:Create(p1, v22, {
			BackgroundTransparency = 1
		}))
		table.insert(list, TweenService:Create(p1, v22, {
			BackgroundTransparency = BackgroundTransparency
		}))
	end
	local function setupTextLabelTweens(p1) --[[ setupTextLabelTweens | Line: 248 | Upvalues: t (copy), TweenService (ref), v22 (copy), t6 (copy), t7 (copy), list (copy) ]]
		local TextTransparency = p1.TextTransparency
		local TextStrokeTransparency = p1.TextStrokeTransparency
		p1.TextTransparency = 1
		p1.TextStrokeTransparency = 1
		table.insert(t, TweenService:Create(p1, v22, {
			TextTransparency = 1,
			TextStrokeTransparency = 1
		}))
		table.insert(t6, TweenService:Create(p1, v22, {
			TextTransparency = TextTransparency,
			TextStrokeTransparency = TextStrokeTransparency
		}))
		table.insert(t7, TweenService:Create(p1, v22, {
			TextTransparency = 1,
			TextStrokeTransparency = 1
		}))
		table.insert(list, TweenService:Create(p1, v22, {
			TextTransparency = TextTransparency,
			TextStrokeTransparency = TextStrokeTransparency
		}))
	end
	local function setupImageLabelTweens(p1) --[[ setupImageLabelTweens | Line: 259 | Upvalues: t (copy), TweenService (ref), v22 (copy), t6 (copy), t7 (copy), list (copy) ]]
		local ImageTransparency = p1.ImageTransparency
		p1.ImageTransparency = 1
		table.insert(t, TweenService:Create(p1, v22, {
			ImageTransparency = 1
		}))
		table.insert(t6, TweenService:Create(p1, v22, {
			ImageTransparency = ImageTransparency
		}))
		table.insert(t7, TweenService:Create(p1, v22, {
			ImageTransparency = 1
		}))
		table.insert(list, TweenService:Create(p1, v22, {
			ImageTransparency = ImageTransparency
		}))
	end
	local function v12(p1) --[[ setupUnexpectedChildTweens | Line: 269 | Upvalues: t8 (copy), setupUIStrokeTweens (copy), setupGUIObjectTweens (copy), setupTextLabelTweens (copy), setupImageLabelTweens (copy), v12 (copy) ]]
		if not t8[p1] then
			t8[p1] = true
			if p1:IsA("UIStroke") then
				setupUIStrokeTweens(p1)
			elseif not p1:IsA("UIGradient") and p1:IsA("GuiObject") then
				setupGUIObjectTweens(p1)
				if p1:IsA("TextLabel") then
					setupTextLabelTweens(p1)
				elseif p1:IsA("ImageLabel") then
					setupImageLabelTweens(p1)
				end
			end
		end
		for k, v in pairs(p1:GetChildren()) do
			v12(v)
		end
	end
	local t13 = {
		[InputFrame] = false
	}
	if ActionText then
		t13[ActionText] = true
	end
	if ObjectText then
		t13[ObjectText] = true
	end
	local Shadow = InputFrame:FindFirstChild("Shadow", true)
	if Shadow then
		v12(Shadow)
	end
	for k, v in pairs(PromptFrame:GetChildren()) do
		if t13[v] == nil then
			v12(v)
			continue
		end
		if t13[v] == true then
			for k2, v6 in pairs(v:GetChildren()) do
				v12(v6)
			end
		end
	end
	local Frame = InputFrame.Frame
	local UIScale = Frame.UIScale
	local v14 = TweenService
	table.insert(t, v14:Create(UIScale, v22, {
		Scale = if p2 == Enum.ProximityPromptInputType.Touch then 1.6 else 1.33
	}))
	local v15 = TweenService
	table.insert(t6, v15:Create(UIScale, v22, {
		Scale = 1
	}))
	if ActionText then
		t8[ActionText] = true
		setupTextLabelTweens(ActionText)
	end
	if ObjectText then
		t8[ObjectText] = true
		setupTextLabelTweens(ObjectText)
	end
	t8[InputFrame] = true
	t8[Frame] = true
	local ButtonFrame = Frame.ButtonFrame;
	(function() --[[ setupButtonFrameTweens | Line: 341 | Upvalues: t8 (copy), ButtonFrame (copy), t7 (copy), TweenService (ref), v2 (ref), list (copy) ]]
		t8[ButtonFrame] = true
		table.insert(t7, TweenService:Create(ButtonFrame, v2, {
			BackgroundTransparency = 1,
			ImageTransparency = 1
		}))
		table.insert(list, TweenService:Create(ButtonFrame, v2, {
			BackgroundTransparency = ButtonFrame.BackgroundTransparency,
			ImageTransparency = ButtonFrame.ImageTransparency
		}))
		for k, v in pairs(ButtonFrame:getChildren()) do
			if v:IsA("UIStroke") then
				t8[v] = true
				table.insert(t7, TweenService:Create(v, v2, {
					Transparency = 1
				}))
				table.insert(list, TweenService:Create(v, v2, {
					Transparency = v.Transparency
				}))
			end
		end
	end)()
	local ButtonImage = Frame.ButtonImage
	local ButtonText = Frame.ButtonText
	local ButtonTextImage = Frame.ButtonTextImage
	t8[ButtonImage] = true
	t8[ButtonText] = true
	t8[ButtonTextImage] = true
	local TouchFrame = PromptFrame:FindFirstChild("TouchFrame", true)
	local v16 = p1:GetAttribute("Direction")
	local Pointers = PromptFrame:FindFirstChild("Pointers", true)
	if Pointers then
		local Top = Pointers:FindFirstChild("Top")
		local Bottom = Pointers:FindFirstChild("Bottom")
		if v16 == "Top" then
			if Top then
				Top.Visible = true
			end
			if Bottom then
				Bottom.Visible = false
			end
		elseif v16 == "Bottom" then
			if Top then
				Top.Visible = false
			end
			if Bottom then
				Bottom.Visible = true
			end
		end
	end
	if v16 == "Top" then
		v7.Position = UDim2.new(0.5, 0, 0, 0)
	elseif v16 == "Bottom" then
		v7.Position = UDim2.new(0.5, 0, 1, 0)
	end
	local function setupButtonTextTweens() --[[ setupButtonTextTweens | Line: 389 | Upvalues: t8 (copy), ButtonText (copy), t7 (copy), TweenService (ref), v2 (ref), list (copy) ]]
		t8[ButtonText] = true
		local TextTransparency = ButtonText.TextTransparency
		local TextStrokeTransparency = ButtonText.TextStrokeTransparency
		local BackgroundTransparency = ButtonText.BackgroundTransparency
		ButtonText.BackgroundTransparency = 1
		ButtonText.TextStrokeTransparency = 1
		ButtonText.TextTransparency = 1
		table.insert(t7, TweenService:Create(ButtonText, v2, {
			TextTransparency = 1,
			TextStrokeTransparency = 1,
			BackgroundTransparency = 1
		}))
		table.insert(list, TweenService:Create(ButtonText, v2, {
			TextTransparency = TextTransparency,
			TextStrokeTransparency = TextStrokeTransparency,
			BackgroundTransparency = BackgroundTransparency
		}))
		for k, v in pairs(ButtonText:getChildren()) do
			if v:IsA("UIStroke") then
				t8[v] = true
				table.insert(t7, TweenService:Create(v, v2, {
					Transparency = 1
				}))
				table.insert(list, TweenService:Create(v, v2, {
					Transparency = v.Transparency
				}))
			end
		end
	end
	local function setupButtonImageTweens() --[[ setupButtonImageTweens | Line: 411 | Upvalues: t8 (copy), ButtonImage (copy), t7 (copy), TweenService (ref), v2 (ref), list (copy) ]]
		t8[ButtonImage] = true
		local ImageTransparency = ButtonImage.ImageTransparency
		local BackgroundTransparency = ButtonImage.BackgroundTransparency
		ButtonImage.BackgroundTransparency = 1
		ButtonImage.ImageTransparency = 1
		table.insert(t7, TweenService:Create(ButtonImage, v2, {
			ImageTransparency = 1,
			BackgroundTransparency = 1
		}))
		table.insert(list, TweenService:Create(ButtonImage, v2, {
			ImageTransparency = ImageTransparency,
			BackgroundTransparency = BackgroundTransparency
		}))
	end
	local function setupIconTweens() --[[ setupIconTweens | Line: 421 | Upvalues: t8 (copy), ButtonTextImage (copy), t7 (copy), TweenService (ref), v2 (ref), list (copy) ]]
		t8[ButtonTextImage] = true
		local BackgroundTransparency = ButtonTextImage.BackgroundTransparency
		local ImageTransparency = ButtonTextImage.ImageTransparency
		ButtonTextImage.BackgroundTransparency = 1
		ButtonTextImage.ImageTransparency = 1
		table.insert(t7, TweenService:Create(ButtonTextImage, v2, {
			ImageTransparency = 1,
			BackgroundTransparency = 1
		}))
		table.insert(list, TweenService:Create(ButtonTextImage, v2, {
			ImageTransparency = ImageTransparency,
			BackgroundTransparency = BackgroundTransparency
		}))
	end
	if p2 == Enum.ProximityPromptInputType.Gamepad then
		setupIconTweens()
		ButtonTextImage.Image = UserInputService:GetImageForKeyCode(p1.GamepadKeyCode)
		ButtonText.Visible = false
		ButtonImage.Visible = false
		ButtonTextImage.Visible = true
		if TouchFrame then
			TouchFrame.Visible = false
		end
	elseif p2 == Enum.ProximityPromptInputType.Touch then
		if TouchFrame then
			ButtonText.Visible = false
			ButtonTextImage.Visible = false
			ButtonImage.Visible = false
			TouchFrame.Visible = true
		else
			setupButtonImageTweens()
			ButtonImage.Image = "rbxasset://textures/ui/Controls/TouchTapIcon.png"
			ButtonText.Visible = false
			ButtonTextImage.Visible = false
			ButtonImage.Visible = true
		end
	else
		setupButtonImageTweens()
		ButtonImage.Visible = true
		if TouchFrame then
			TouchFrame.Visible = false
		end
		local v17 = UserInputService:GetStringForKeyCode(p1.KeyboardKeyCode)
		local v18 = t2[p1.KeyboardKeyCode]
		if v18 == nil then
			v18 = t3[v17]
		end
		if v18 == nil then
			local v19 = t4[p1.KeyboardKeyCode]
			if v19 then
				v17 = v19
			end
		end
		if v18 then
			setupIconTweens()
			ButtonTextImage.Image = v18
			ButtonText.Visible = false
			ButtonTextImage.Visible = true
		else
			if v17 == nil or v17 == "" then
				error("ProximityPrompt \'" .. p1.Name .. "\' has an unsupported keycode for rendering UI: " .. tostring(p1.KeyboardKeyCode))
			end
			local v222 = t5[p1.KeyboardKeyCode]
			if v222 then
				ButtonText.TextSize = v222
			end
			setupButtonTextTweens()
			ButtonText.Text = v17
			ButtonTextImage.Visible = false
			ButtonText.Visible = true
		end
	end
	if p2 == Enum.ProximityPromptInputType.Touch or p1.ClickablePrompt then
		local TextButton = v4:FindFirstChild("TextButton", true)
		local v23 = false
		TextButton.InputBegan:Connect(function(p12) --[[ Line: 504 | Upvalues: p1 (copy), v23 (ref) ]]
			if p12.UserInputType ~= Enum.UserInputType.Touch and p12.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end
			if p12.UserInputState == Enum.UserInputState.Change then
				return
			end
			p1:InputHoldBegin()
			v23 = true
		end)
		TextButton.InputEnded:Connect(function(p12) --[[ Line: 511 | Upvalues: v23 (ref), p1 (copy) ]]
			if p12.UserInputType ~= Enum.UserInputType.Touch and p12.UserInputType ~= Enum.UserInputType.MouseButton1 or not v23 then
				return
			end
			v23 = false
			p1:InputHoldEnd()
		end)
		v4.Active = true
	end
	if p1.HoldDuration > 0 then
		local ProgressBar = Frame.ProgressBar
		local UIGradient = ProgressBar.LeftGradient.ProgressBarImage.UIGradient
		local UIGradient_2 = ProgressBar.RightGradient.ProgressBarImage.UIGradient
		ProgressBar.Progress.Changed:Connect(function(p1_2) --[[ Line: 96 | Upvalues: UIGradient (copy), UIGradient_2 (copy) ]]
			local v1 = math.clamp(p1_2 * 360, 0, 360)
			UIGradient.Rotation = math.clamp(v1, 180, 360)
			UIGradient_2.Rotation = math.clamp(v1, 0, 180)
		end)
		table.insert(t, TweenService:Create(ProgressBar.Progress, v1, {
			Value = 1
		}))
		table.insert(t6, TweenService:Create(ProgressBar.Progress, v32, {
			Value = 0
		}))
		t8[ProgressBar] = true
		for k, v in pairs(ProgressBar:GetDescendants()) do
			t8[v] = true
		end
	end
	v12(v4)
	local v26, v27
	if p1.HoldDuration > 0 then
		v26 = p1.PromptButtonHoldBegan:Connect(function() --[[ Line: 543 | Upvalues: t (copy) ]]
			for i, v in ipairs(t) do
				v:Play()
			end
		end)
		v27 = p1.PromptButtonHoldEnded:Connect(function() --[[ Line: 549 | Upvalues: t6 (copy) ]]
			for i, v in ipairs(t6) do
				v:Play()
			end
		end)
	else
		v26 = nil
		v27 = nil
	end
	local v28 = p1.Triggered:Connect(function() --[[ Line: 556 | Upvalues: t7 (copy) ]]
		for i, v in ipairs(t7) do
			v:Play()
		end
	end)
	local v29 = p1.TriggerEnded:Connect(function() --[[ Line: 562 | Upvalues: p1 (copy), list (copy) ]]
		task.wait()
		if not p1.Enabled then
			return
		end
		for i, v in ipairs(list) do
			v:Play()
		end
	end)
	local function updateUIFromPrompt() --[[ updateUIFromPrompt | Line: 574 | Upvalues: ActionText (copy), p1 (copy), TextService (ref), ObjectText (copy), v4 (ref) ]]
		local v1 = 72
		local v2 = Vector2.new(0, 0)
		if ActionText then
			local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
			GetTextBoundsParams.Text = p1.ActionText
			GetTextBoundsParams.Font = ActionText.FontFace
			GetTextBoundsParams.Size = ActionText.TextSize
			GetTextBoundsParams.Width = 1000
			v2 = TextService:GetTextBoundsAsync(GetTextBoundsParams)
		end
		local v42 = Vector2.new(0, 0)
		if ObjectText then
			local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
			GetTextBoundsParams.Text = p1.ObjectText
			GetTextBoundsParams.Font = ObjectText.FontFace
			GetTextBoundsParams.Size = ObjectText.TextSize
			GetTextBoundsParams.Width = 1000
			v42 = TextService:GetTextBoundsAsync(GetTextBoundsParams)
		end
		local v6 = math.max(v2.X, v42.X)
		if p1.ActionText ~= nil and (p1.ActionText ~= "" and ActionText) or p1.ObjectText ~= nil and (p1.ObjectText ~= "" and ObjectText) then
			v1 = v6 + 72 + 24
		end
		local v7 = if p1.ObjectText == nil or (p1.ObjectText == "" or not ObjectText) then 0 else 9
		if ActionText then
			ActionText.Position = UDim2.new(0.5, 72 - v1 / 2, 0, v7)
			ActionText.Text = p1.ActionText
			ActionText.AutoLocalize = p1.AutoLocalize
			ActionText.RootLocalizationTable = p1.RootLocalizationTable
		end
		if ObjectText then
			ObjectText.Position = UDim2.new(0.5, 72 - v1 / 2, 0, -13)
			ObjectText.Text = p1.ObjectText
			ObjectText.AutoLocalize = p1.AutoLocalize
			ObjectText.RootLocalizationTable = p1.RootLocalizationTable
		end
		v4.Size = UDim2.fromOffset(v1, 142)
		v4.SizeOffset = Vector2.new(p1.UIOffset.X / v4.Size.Width.Offset, p1.UIOffset.Y / v4.Size.Height.Offset)
	end
	local v30 = p1.Changed:Connect(updateUIFromPrompt)
	updateUIFromPrompt()
	v4.Adornee = p1.Parent
	v4.Parent = p3
	local function updateUIAncestry() --[[ updateUIAncestry | Line: 635 | Upvalues: v4 (ref), p1 (copy) ]]
		v4.Adornee = p1.Parent
	end
	local v31 = p1.AncestryChanged:Connect(updateUIAncestry)
	local function updatePromptEnabled() --[[ updatePromptEnabled | Line: 640 | Upvalues: v4 (ref), ProximityPromptService (ref) ]]
		v4.Enabled = ProximityPromptService.Enabled
	end
	local v322 = ProximityPromptService:GetPropertyChangedSignal("Enabled"):Connect(updatePromptEnabled)
	v4.Enabled = ProximityPromptService.Enabled
	for i, v in ipairs(list) do
		v:Play()
	end
	return function() --[[ cleanup | Line: 650 | Upvalues: v26 (ref), v27 (ref), v322 (copy), v28 (ref), v29 (ref), v30 (copy), v31 (copy), t7 (copy), v4 (ref) ]]
		if v26 then
			v26:Disconnect()
		end
		if v27 then
			v27:Disconnect()
		end
		v322:Disconnect()
		v28:Disconnect()
		v29:Disconnect()
		v30:Disconnect()
		v31:Disconnect()
		for i, v in ipairs(t7) do
			v:Play()
		end
		task.wait(0.2)
		v4.Parent = nil
	end
end
function t.Init(p1) --[[ Init | Line: 677 | Upvalues: ProximityPromptService (copy), PlayerGui (copy), createPrompt (copy), createIndicator (copy) ]]
	ProximityPromptService.PromptShown:Connect(function(p1, p2) --[[ Line: 678 | Upvalues: PlayerGui (ref), createPrompt (ref) ]]
		if p1.Style == Enum.ProximityPromptStyle.Default then
			return
		end
		if p1:GetAttribute("Action") then
			return
		end
		local v1 = nil
		local v2 = false
		local function onHidden() --[[ onHidden | Line: 694 | Upvalues: v2 (ref), v1 (ref) ]]
			if v2 then
				return
			end
			v2 = true
			if not v1 then
				return
			end
			v1()
		end
		p1.PromptHidden:Once(onHidden)
		p1.Destroying:Once(onHidden)
		local GuiDump = PlayerGui:FindFirstChild("GuiDump")
		if GuiDump == nil then
			local GuiDump_2 = Instance.new("ScreenGui")
			GuiDump_2.Name = "GuiDump"
			GuiDump_2.ResetOnSpawn = false
			GuiDump_2.Parent = PlayerGui
			GuiDump = GuiDump_2
		end
		v1 = createPrompt(p1, p2, GuiDump)
		if v2 then
			v1()
		end
	end)
	ProximityPromptService.IndicatorShown:Connect(function(p1) --[[ Line: 714 | Upvalues: PlayerGui (ref), createIndicator (ref) ]]
		if p1.Style == Enum.ProximityPromptStyle.Default then
			return
		end
		if p1:GetAttribute("Action") then
			return
		end
		local v1 = nil
		local v2 = false
		local function onHidden() --[[ onHidden | Line: 725 | Upvalues: v2 (ref), v1 (ref) ]]
			if v2 then
				return
			end
			v2 = true
			if not v1 then
				return
			end
			v1()
		end
		p1.IndicatorHidden:Once(onHidden)
		p1.Destroying:Once(onHidden)
		local GuiDump = PlayerGui:FindFirstChild("GuiDump")
		if GuiDump == nil then
			local GuiDump_2 = Instance.new("ScreenGui")
			GuiDump_2.Name = "GuiDump"
			GuiDump_2.ResetOnSpawn = false
			GuiDump_2.Parent = PlayerGui
			GuiDump = GuiDump_2
		end
		v1 = createIndicator(p1, GuiDump)
		if not v2 then
			return
		end
		v1()
	end)
end
t:Init()
return t