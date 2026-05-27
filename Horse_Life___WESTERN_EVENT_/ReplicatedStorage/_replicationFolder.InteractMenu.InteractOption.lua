-- https://lua.expert/
local t = {}
t.__index = t
local TweenService = game:GetService("TweenService")
local GuiService = game:GetService("GuiService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("InputTypeDetector")
local v2 = Sonar("Button")
local InteractFocusedOrder = Sonar("Constants").InteractFocusedOrder
local InteractUnfocusedOrder = Sonar("Constants").InteractUnfocusedOrder
local InteractOpenOrder = Sonar("Constants").InteractOpenOrder
local v3 = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out)
local v4 = TweenInfo.new(0.1)
local v5 = TweenInfo.new(0.1)
function t.new(p1, p2, p3) --[[ new | Line: 22 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Option = p2
	v22.InteractMenu = p1
	v22.Maid = p1.Maid
	if p3 then
		v22.OptionsFrame = p1.OptionsFrame
		v22.OptionButton = v22.OptionsFrame.Default:Clone()
		v22.ActionImageLabel = v22.OptionButton.ActionLabel
		v22.ActionImageLabel.Size = p2.ActionSize or v22.ActionImageLabel.Size
		v22.ActionTextLabel = v22.OptionButton.ActionTextLabel
		v22.InactiveLabel = v22.OptionButton:FindFirstChild("InactiveLabel")
		v22.InteractionHintLabel = v22.OptionButton.ActionHintLabel
		v22.InteractionHintLabel.Size = p2.HintSize or v22.InteractionHintLabel.Size
		v22.InteractionHintLabel.Visible = true
		v22:_hint()
		v22:_visibility()
		v22.OptionBranch = p3
		v22.OptionButton.Parent = v22.OptionsFrame
		v22.Button = v2.new(v22.OptionButton, {
			HoverUpLabel = v22.OptionButton.ActionLabel,
			ShadowLabelSize = UDim2.new(0.9, 0, 0.9, 0)
		})
		v22.Maid:GiveTask(v22.Button)
		v2:RegisterAction(v22.OptionButton, "OnDown", function() --[[ Line: 87 | Upvalues: v22 (copy) ]]
			if v22.Active then
				v22:_run()
				v22.DownPosition = v22.Button.DownPosition
				v22:_mouseLeave()
			end
		end)
		v2:RegisterHover(v22.OptionButton, function() --[[ Line: 94 | Upvalues: v22 (copy) ]]
			if v22.Active then
				v22:_mouseEnter()
			end
		end)
		v2:RegisterLeave(v22.OptionButton, function() --[[ Line: 98 | Upvalues: v22 (copy) ]]
			if v22.Active then
				v22:_mouseLeave()
			end
		end)
	else
		p1.MainOptionBranch = p2
		v22.InteractGui = p1.InteractGui
		v22.InteractionHintLabel = p1.InteractionHintLabel
		v22.InteractionHintLabel.Visible = false
		v22.InteractionHintLabel.Size = p2.HintSize or v22.InteractionHintLabel.Size
		v22:_hint()
		v22:_visibility()
		v22.Button = v2.new(p1.InteractButton, {
			Selectable = false,
			ShadowLabelSize = UDim2.new(1.2, 0, 1.2, 0)
		})
		v22.Maid:GiveTask(p1.InteractGui:GetPropertyChangedSignal("Enabled"):Connect(function() --[[ Line: 45 | Upvalues: v22 (copy) ]]
			v22.Button.ShadowLabel.Visible = false
		end))
		v22.Maid:GiveTask(p1.InteractButton:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 48 | Upvalues: v22 (copy) ]]
			v22.Button.ShadowLabel.Visible = false
		end))
		v22.Maid:GiveTask(v22.Button)
		v2:RegisterAction(p1.InteractButton, "OnDown", function() --[[ Line: 53 | Upvalues: v22 (copy) ]]
			v22:_run()
		end)
		v2:RegisterHover(p1.InteractButton, function() --[[ Line: 57 | Upvalues: v22 (copy) ]]
			v22:_mouseEnter()
		end)
		v2:RegisterLeave(p1.InteractButton, function() --[[ Line: 60 | Upvalues: v22 (copy) ]]
			v22:_mouseLeave()
		end)
	end
	v22:_hintChanged()
	v22:_visibilityChanged()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 110 ]]
	setmetatable(p1, nil)
end
function t._getPosition(p1, p2, p3, p4, p5) --[[ _getPosition | Line: 116 ]]
	local v1 = -1.5707963267948966 + (p3 - 1) * (6.283185307179586 / p5)
	local v2 = 0.5 + math.cos(v1) * p4
	return UDim2.new(v2, 0, 0.5 + math.sin(v1) * p4, 0)
end
function t._animateOut(p1, p2, p3, p4, p5, p6) --[[ _animateOut | Line: 130 | Upvalues: TweenService (copy), v5 (copy), v3 (copy), GuiService (copy) ]]
	p1:_resetButton(p6)
	p1.OptionButton.Visible = true
	local v1 = TweenService:Create(p1.OptionButton, v5, {
		Position = p1:_getPosition(p2, p4, p3, p6)
	})
	TweenService:Create(p1.OptionButton.UIScale, v3, {
		Scale = 1
	}):Play()
	if p5 then
		v1.Completed:Connect(function(p12) --[[ Line: 138 | Upvalues: p4 (copy), GuiService (ref), p1 (copy) ]]
			if p12 ~= Enum.PlaybackState.Completed then
				return
			end
			if p4 ~= 1 then
				return
			end
			GuiService.SelectedObject = p1.OptionButton
		end)
	end
	v1:Play()
end
function t._animateIn(p1) --[[ _animateIn | Line: 150 | Upvalues: TweenService (copy), v5 (copy), v4 (copy) ]]
	local v1 = TweenService:Create(p1.OptionButton, v5, {
		Position = UDim2.fromScale(0.5, 0.5)
	})
	TweenService:Create(p1.OptionButton.UIScale, v4, {
		Scale = 0
	}):Play()
	v1.Completed:Connect(function(p12) --[[ Line: 154 | Upvalues: p1 (copy) ]]
		if p12 == Enum.PlaybackState.Completed then
			p1.OptionButton.Visible = false
		end
	end)
	v1:Play()
end
function t._resetButton(p1, p2) --[[ _resetButton | Line: 164 ]]
	if p2 then
		p1.ShowHintLabel = p2 <= 4
	end
	p1.InteractionHintLabel.Visible = p1:_canShowHintLabel()
	p1.OptionButton.UIScale.Scale = 0
	p1.OptionButton.Position = UDim2.fromScale(0.5, 0.5)
end
function t._run(p1, p2) --[[ _run | Line: 177 ]]
	local v1 = false
	if p1:_canOpenBranch() then
		if p1 == p1.InteractMenu.MainOption and not p2 then
			p1.InteractMenu:HandleMenuFromInput(p1.InteractMenu)
			return
		end
		if p1.Options and next(p1.Options) then
			p1.InteractMenu:_openBranch(p1)
			v1 = true
		end
	end
	if not p1.Option.Run or v1 then
		return
	end
	task.spawn(p1.Option.Run)
	if not p1.InteractMenu.PreviousBranch or p1.Option.KeepOpenOnClick then
		return
	end
	p1.InteractMenu:_closeMenu(nil, p1)
end
function t._canOpenBranch(p1) --[[ _canOpenBranch | Line: 206 ]]
	if p1.Option.OpenBranch then
		return p1.Option.OpenBranch()
	else
		return true
	end
end
function t._visibility(p1) --[[ _visibility | Line: 216 ]]
	p1:_active()
	if p1.Option.Visibility == nil then
		return true
	end
	if type(p1.Option.Visibility) == "boolean" then
		return p1.Option.Visibility
	else
		return p1.Option.Visibility()
	end
end
function t._canFocus(p1) --[[ _canFocus | Line: 231 ]]
	if p1.Option.CanFocus == nil then
		return true
	end
	if type(p1.Option.CanFocus) == "boolean" then
		return p1.Option.CanFocus
	else
		return p1.Option.CanFocus()
	end
end
function t._hint(p1) --[[ _hint | Line: 245 ]]
	if type(p1.Option.Hint) == "string" then
		p1.Option.VisualHint = p1.Option.Hint
	elseif typeof(p1.Option.Hint) == "function" then
		local v1, v2, v3 = p1.Option.Hint()
		p1.Option.VisualHint = v1
		p1.Option.Image = if v2 then v2 else p1.Option.Image or ""
		p1.Option.ImageColor3 = p1.Option.ImageColor3
		p1.Option.ImageText = v3
	end
	if p1.ActionImageLabel then
		if p1.Option.Image then
			p1.ActionImageLabel.Visible = true
			p1.ActionImageLabel.Image = p1.Option.Image
			p1.ActionImageLabel.ImageColor3 = p1.Option.ImageColor3 or p1.ActionImageLabel.ImageColor3
		else
			p1.ActionImageLabel.Visible = false
		end
	end
	if p1.ActionTextLabel then
		if p1.Option.ImageText then
			p1.ActionTextLabel.Visible = true
			p1.ActionTextLabel.Text = p1.Option.ImageText
		else
			p1.ActionTextLabel.Visible = false
		end
	end
	if p1.Option.VisualHint and p1.InteractionHintLabel then
		p1.InteractionHintLabel.Text = p1.Option.VisualHint
	end
	p1:_getTextSize()
end
function t._active(p1) --[[ _active | Line: 283 ]]
	p1.Active = if p1.Option.Active == nil then true else type(p1.Option.Active == "function") and p1.Option.Active()
	if p1.Button then
		p1.Button.Active = if p1.Active == nil then true else p1.Active
	end
	if p1.InteractionHintLabel and p1.OptionBranch then
		p1.InteractionHintLabel.Visible = p1:_canShowHintLabel()
	end
	if p1.InactiveLabel then
		p1.InactiveLabel.Visible = not p1.Active
		return
	end
	if not p1.ActionImageLabel then
		return
	end
	p1.ActionImageLabel.ImageColor3 = p1.Active and Color3.fromRGB(255, 255, 255) or Color3.fromRGB(100, 100, 100)
	p1.OptionButton.ImageColor3 = p1.ActionImageLabel.ImageColor3
	if not p1.Button then
		return
	end
	p1.Button.OriginalColor = p1.ActionImageLabel.ImageColor3
end
function t._getTextSize(p1) --[[ _getTextSize | Line: 311 ]]
	if p1.OptionButton then
		p1.ButtonSize = UDim2.fromOffset(80, 80)
	end
end
function t._getAbsoluteSize(p1) --[[ _getAbsoluteSize | Line: 322 ]]
	return Vector2.new(p1.OptionsFrame.AbsoluteSize.X * p1.ButtonSize.X.Scale + p1.ButtonSize.X.Offset, p1.OptionsFrame.AbsoluteSize.Y * p1.ButtonSize.Y.Scale + p1.ButtonSize.Y.Offset)
end
function t._hintChanged(p1) --[[ _hintChanged | Line: 331 ]]
	if not p1.Option.HintChanged then
		return
	end
	if type(p1.Option.HintChanged) == "table" and p1.Option.HintChanged.ClassName ~= "Signal" then
		for k, v in pairs(p1.Option.HintChanged) do
			p1.Maid:GiveTask(v:Connect(function(p12) --[[ Line: 336 | Upvalues: p1 (copy) ]]
				p1:_hint()
			end))
		end
	else
		p1.Maid:GiveTask(p1.Option.HintChanged:Connect(function(p12) --[[ Line: 341 | Upvalues: p1 (copy) ]]
			p1:_hint()
		end))
	end
end
function t._visibilityChanged(p1) --[[ _visibilityChanged | Line: 349 ]]
	if not p1.Option.VisibilityChanged then
		return
	end
	if type(p1.Option.VisibilityChanged) == "table" and p1.Option.VisibilityChanged.ClassName ~= "Signal" then
		for k, v in pairs(p1.Option.VisibilityChanged) do
			p1.Maid:GiveTask(v:Connect(function(p12) --[[ Line: 354 | Upvalues: p1 (copy) ]]
				p1:_visibility()
			end))
		end
	else
		p1.Maid:GiveTask(p1.Option.VisibilityChanged:Connect(function(p12) --[[ Line: 359 | Upvalues: p1 (copy) ]]
			p1:_visibility()
		end))
	end
end
function t._mouseEnter(p1) --[[ _mouseEnter | Line: 367 | Upvalues: InteractFocusedOrder (copy) ]]
	if p1.InteractGui then
		p1.InteractGui.DisplayOrder = InteractFocusedOrder
	end
	p1.InteractionHintLabel.Visible = true
end
function t._canShowHintLabel(p1) --[[ _canShowHintLabel | Line: 374 ]]
	return p1.ShowHintLabel and p1.Active
end
function t._mouseLeave(p1) --[[ _mouseLeave | Line: 380 | Upvalues: InteractOpenOrder (copy), InteractUnfocusedOrder (copy), v1 (copy) ]]
	if p1.InteractGui then
		p1.InteractGui.DisplayOrder = p1.InteractMenu:_isFocused() and InteractOpenOrder or InteractUnfocusedOrder
	end
	if p1.OptionBranch then
		local _ = v1.IsMobileInputType()
	else
		v1.IsMobileInputType()
		local _ = p1.InteractMenu:_isFocused()
	end
	p1.InteractionHintLabel.Visible = p1:_canShowHintLabel()
end
return t