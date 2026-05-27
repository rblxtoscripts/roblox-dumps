-- https://lua.expert/
local t = {}
t.__index = t
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Sonar = require(game:GetService("ReplicatedStorage"):WaitForChild("Sonar"))
local v1 = Sonar("InputTypeDetector")
local v2 = Sonar("Button")
local v3 = Sonar("InputImageLibrary")
local t2 = {}
local v4 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local function getKeyCodeImage(p1, p2) --[[ getKeyCodeImage | Line: 19 | Upvalues: t2 (copy), v3 (copy) ]]
	local v1 = t2[p2]
	if not v1 then
		local v2 = v3:GetScaledImageLabel(p2, "Dark", p1)
		t2[p2] = v2
		v1 = v2
	end
	return v1
end
function t.new(p1, p2, p3) --[[ new | Line: 28 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable(p2, t)
	v22.Action = p2
	v22.ShowHeldAction = v22.End and true
	v22.InteractMenu = p1
	v22.Maid = p1.Maid
	if p3 then
		v22.ValueChangedMaid = p1.ValueChangedMaid
		v22.HintLabel = p1.HintLabel
		v22.HintImageLabel = p1.HintImageLabel
		v22.ValueLabel = p1.ValueLabel
		v22.ContainerFrame = v22.InteractMenu.ContainerFrame
		v22.HintImageLabel.Image = v22.Image
		local v3 = v22.IconColor or v22.Color
		v22.HintImageLabel.UIGradient.Color = if typeof(v3) == "ColorSequence" and v3 then v3 else ColorSequence.new(v3)
		v22.HintImageLabel.ShadowLabel.Image = v22.Image
		v22.HintImageLabel.Size = v22.HintSize or v22.HintImageLabel.Size
		p1.DefaultHintSize = p1.ContainerFrame.Size
		p1.DefaultAbsoluteSize = p1.ContainerFrame.AbsoluteSize
		p1.DefaultHintTextSize = v22.HintLabel.TextBounds
		p1.DefaultValueTextSize = v22.ValueLabel.TextBounds
		p1.BackgroundFrame.BackgroundColor3 = typeof(v22.Color) == "ColorSequence" and v22.Color.Keypoints[1].Value or v22.Color
		p1.ContainerFrame.InnerFrame.BackgroundFrame.BackgroundColor3 = p1.BackgroundFrame.BackgroundColor3
		if v22.Value then
			v22:_value()
			v22:_valueChanged()
			v22.ValueLabel.Visible = true
		else
			v22.ValueLabel.Visible = false
		end
		v22:_addTweens(v22.ValueLabel, {
			TextTransparency = 1
		})
		v22:_addTweens(v22.ValueLabel.UIStroke, {
			Transparency = 1
		})
		v22:_addTweens(p1.BackgroundFrame, {
			BackgroundTransparency = 1
		})
		v22:_addTweens(p1.BackgroundFrame.UIScale, {
			Scale = 0
		})
		v22:_addTweens(p1.ContainerFrame.InnerFrame.BackingFrame, {
			ImageTransparency = 1
		})
		v22:_addTweens(p1.ContainerFrame.InnerFrame.BackingFrame.OutlineFrame, {
			ImageTransparency = 1
		})
		v22:_addTweens(p1.ContainerFrame.InnerFrame.BackingFrame.OutlineFrame.OutlineFrame, {
			ImageTransparency = 1
		})
		v22:_addTweens(p1.ContainerFrame.InnerFrame.ShadowFrame, {
			ImageTransparency = 1
		})
		v22:_addTweens(p1.ContainerFrame.InnerFrame.BackgroundFrame, {
			BackgroundTransparency = 1
		})
		v22:_addTweens(p1.ContainerFrame.InnerFrame.UIScale, {
			Scale = 0
		})
		v22:_addTweens(v22.HintImageLabel, {
			ImageTransparency = 1
		})
		v22:_addTweens(v22.HintImageLabel.ShadowLabel, {
			ImageTransparency = 1
		})
		v22:_addTweens(v22.HintLabel, {
			TextTransparency = 1
		})
		v22:_addTweens(v22.HintLabel.UIStroke, {
			Transparency = 1
		})
		v22:_hint()
	else
		p1.ActionsFrame.Default.Visible = false
		v22.ActionFrame = p1.ActionsFrame.Default:Clone()
		v22.HintLabel = v22.ActionFrame.InnerFrame.HintLabel
		v22.ControlFrame = v22.ActionFrame.InnerFrame.ControlFrame
		v22.ControlLabel = v22.ControlFrame.ControlLabel
		v22.MobileLabel = v22.ControlFrame.MobileLabel
		v22.HeldLabel = v22.ActionFrame.InnerFrame.HeldLabel
		v22:_hint()
		v22:_setKeybind()
		v22:_addTweens(v22.HintLabel, {
			TextTransparency = 1
		})
		v22:_addTweens(v22.HintLabel.UIStroke, {
			Transparency = 1
		})
		v22:_addTweens(v22.ControlLabel, {
			ImageTransparency = 1
		})
		v22.Maid:GiveTask(v2.new(v22.ActionFrame))
		v2:RegisterClick(v22.ActionFrame, function() --[[ Line: 116 | Upvalues: v22 (copy) ]]
			v22:_run()
		end)
		v22.ActionFrame.Parent = p1.ActionsFrame
		p1.Actions[#p1.Actions + 1] = v22
		v22:_visibilityChanged()
		v22:_stateChanged()
	end
	v22:_hintChanged()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 134 ]]
	setmetatable(p1, nil)
end
function t._addTweens(p1, p2, p3) --[[ _addTweens | Line: 138 | Upvalues: TweenService (copy), v4 (copy) ]]
	local t = {}
	for k, v in pairs(p3) do
		t[k] = p2[k]
	end
	table.insert(p1.InteractMenu.FadeOut, TweenService:Create(p2, v4, p3))
	table.insert(p1.InteractMenu.FadeIn, TweenService:Create(p2, v4, t))
	for k, v in pairs(p3) do
		p2[k] = v
	end
end
function t._run(p1, p2) --[[ _run | Line: 154 | Upvalues: TweenService (copy), v4 (copy) ]]
	if not p1.RepeatAction and p1.HeldAction then
		return
	end
	if not p1.Run then
		return
	end
	task.spawn(function() --[[ Line: 158 | Upvalues: p1 (copy), p2 (copy) ]]
		if not p1.Run() then
			return
		end
		p1.RanAction = true
		if p2 then
			return
		end
		p1:_repeatRun()
	end)
	local v1 = p1.ActionFrame.InnerFrame.Interacted:Clone()
	v1.BackgroundTransparency = 0.25
	v1.Visible = true
	v1.Parent = p1.ActionFrame
	local v2 = TweenService:Create(p1.ActionFrame.InnerFrame.UIScale, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
		Scale = 0.7
	})
	v2.Completed:Connect(function() --[[ Line: 175 | Upvalues: p1 (copy), TweenService (ref) ]]
		if p1.Destroy then
			TweenService:Create(p1.ActionFrame.InnerFrame.UIScale, TweenInfo.new(0.1, Enum.EasingStyle.Linear, Enum.EasingDirection.Out), {
				Scale = 1
			}):Play()
		end
	end)
	v2:Play()
	local v3 = TweenService:Create(v1, v4, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0.75, 0)
	})
	v3.Completed:Connect(function() --[[ Line: 184 | Upvalues: v1 (copy) ]]
		v1:Destroy()
	end)
	v3:Play()
end
function t._end(p1) --[[ _end | Line: 192 ]]
	if not p1.End then
		return
	end
	task.spawn(p1.End)
end
function t._repeatRun(p1) --[[ _repeatRun | Line: 218 ]]
	local v1 = tick()
	p1.LastRun = v1
	task.delay(p1.RepeatDelay or 0.25, function() --[[ Line: 222 | Upvalues: p1 (copy), v1 (copy) ]]
		if p1.LastRun ~= v1 then
			return
		end
		p1.RepeatingAction = true
		if p1.ShowHeldAction then
			p1:_showHeldAction(v1)
		end
		while p1.LastRun == v1 do
			p1.RepeatingAction = true
			wait(p1.RepeatWait or 0.5)
			if p1.LastRun ~= v1 or not (p1._run and p1.RepeatAction) then
				continue
			end
			p1:_run(true)
		end
	end)
end
function t._showHeldAction(p1, p2) --[[ _showHeldAction | Line: 244 | Upvalues: RunService (copy) ]]
	p1.HeldLabel.Visible = true
	p1.ControlFrame.Visible = false
	p1.HeldAction = true
	p1.HeldRotateConnection = RunService.Heartbeat:Connect(function() --[[ Line: 250 | Upvalues: p1 (copy) ]]
		if not p1.Destroy then
			p1.HeldRotateConnection:Disconnect()
			return
		end
		local HeldLabel = p1.HeldLabel
		HeldLabel.Rotation = HeldLabel.Rotation + 4
		if not (p1.HeldLabel.Rotation >= 360) then
			return
		end
		p1.HeldLabel.Rotation = 0
	end)
end
function t._endRepeat(p1, p2) --[[ _endRepeat | Line: 264 ]]
	local RanAction = p1.RanAction
	local v1 = tick()
	p1.LastRun = v1
	p1.RanAction = false
	if p1.HeldRotateConnection then
		p1.HeldRotateConnection:Disconnect()
	end
	local RepeatingAction = p1.RepeatingAction
	local HeldAction = p1.HeldAction
	p1.RepeatingAction = false
	p1.HeldAction = false
	if RepeatingAction or (HeldAction or p2) then
		p1.HeldLabel.Visible = false
		p1.ControlFrame.Visible = true
		p1:_end()
		return
	end
	if not (RanAction and p1.ShowHeldAction) then
		return
	end
	p1:_showHeldAction(v1)
end
function t._isRepeating(p1) --[[ _isRepeating | Line: 297 ]]
	if not p1.RepeatingAction then
		return
	end
	if p1.LastRun then
		return true
	end
end
function t._visibility(p1) --[[ _visibility | Line: 305 ]]
	if p1.Visibility == nil then
		return true
	end
	if type(p1.Visibility) == "boolean" then
		return p1.Visibility
	else
		return p1.Visibility()
	end
end
function t._setVisibility(p1, p2) --[[ _setVisibility | Line: 318 ]]
	p1.ActionFrame.Visible = p1:_visibility()
	if not p2 then
		return
	end
	p1.InteractMenu:_updateInteractFrame()
end
function t._hint(p1) --[[ _hint | Line: 327 ]]
	local v1, v2
	if type(p1.Hint) == "string" then
		v1 = p1.Hint
		if not v1 then
			v2 = p1.Hint
			v1 = if type(v2) == "function" then p1.Hint() else false
		end
	else
		v2 = p1.Hint
		v1 = if type(v2) == "function" then p1.Hint() else false
	end
	if v1 then
		p1.HintLabel.Text = v1
	end
	if p1 ~= p1.InteractMenu.PrimaryAction then
		return
	end
	p1:_updateContainerSize()
end
function t._updateContainerSize(p1) --[[ _updateContainerSize | Line: 340 ]]
	p1.ContainerFrame.UIScale.Scale = 1
	p1.ContainerFrame.Size = UDim2.new(0, 110 + p1.HintLabel.TextBounds.X + p1.ValueLabel.TextBounds.X + 10, 0, p1.ContainerFrame.Size.Y.Offset)
	p1.ContainerFrame.UIScale.Scale = 0.65
end
function t._hintChanged(p1) --[[ _hintChanged | Line: 349 ]]
	if not p1.HintChanged then
		return
	end
	if type(p1.HintChanged) == "table" and p1.HintChanged.ClassName ~= "Signal" then
		for k, v in pairs(p1.HintChanged) do
			p1.Maid:GiveTask(v:Connect(function(p12) --[[ Line: 354 | Upvalues: p1 (copy) ]]
				p1:_hint()
			end))
		end
	else
		p1.Maid:GiveTask(p1.HintChanged:Connect(function(p12) --[[ Line: 359 | Upvalues: p1 (copy) ]]
			p1:_hint()
		end))
	end
end
function t._visibilityChanged(p1) --[[ _visibilityChanged | Line: 366 ]]
	if not p1.VisibilityChanged then
		return
	end
	if type(p1.VisibilityChanged) == "table" and p1.VisibilityChanged.ClassName ~= "Signal" then
		for k, v in pairs(p1.VisibilityChanged) do
			p1.Maid:GiveTask(v:Connect(function(p12) --[[ Line: 371 | Upvalues: p1 (copy) ]]
				p1:_setVisibility(true)
			end))
		end
	else
		p1.Maid:GiveTask(p1.VisibilityChanged:Connect(function(p12) --[[ Line: 376 | Upvalues: p1 (copy) ]]
			p1:_setVisibility(true)
		end))
	end
end
function t._stateChanged(p1) --[[ _stateChanged | Line: 383 ]]
	if not p1.StateChanged then
		return
	end
	if type(p1.StateChanged) == "table" and p1.StateChanged.ClassName ~= "Signal" then
		for k, v in pairs(p1.StateChanged) do
			p1.Maid:GiveTask(v:Connect(function(p12) --[[ Line: 388 | Upvalues: p1 (copy) ]]
				if p1.RepeatingAction or p1.HeldAction then
					p1:_endRepeat(true)
				end
			end))
		end
	else
		p1.Maid:GiveTask(p1.StateChanged:Connect(function(p12) --[[ Line: 394 | Upvalues: p1 (copy) ]]
			if p1.RepeatingAction or p1.HeldAction then
				p1:_endRepeat(true)
			end
		end))
	end
end
function t._setValue(p1, p2) --[[ _setValue | Line: 402 ]]
	local v1 = if p2 then p2 else {}
	p1.Value = v1.Value
	p1.ValueChanged = v1.ValueChanged
	p1:_valueChanged()
	p1.ValueLabel.Visible = next(v1)
	if not p1.Value then
		return
	end
	p1:_value()
end
function t._value(p1) --[[ _value | Line: 417 ]]
	if type(p1.Value) == "string" then
		p1.ValueLabel.Text = p1.Value
		return
	end
	if type(p1.Value) ~= "function" then
		return
	end
	local v3, v4 = pcall(p1.Value)
	if not v3 then
		warn(v4)
	end
	p1.ValueLabel.Text = if v3 then v4 else "!ERR"
	p1:_updateContainerSize()
end
function t._valueChanged(p1) --[[ _valueChanged | Line: 432 ]]
	if not p1.ValueChanged then
		return
	end
	if p1.ValueChangedMaid then
		p1.ValueChangedMaid:DoCleaning()
	end
	if type(p1.ValueChanged) == "table" and p1.ValueChanged.ClassName ~= "Signal" then
		for k, v in pairs(p1.ValueChanged) do
			p1.Maid:GiveTask(v:Connect(function(p12) --[[ Line: 441 | Upvalues: p1 (copy) ]]
				p1:_value()
			end))
		end
	else
		p1.Maid:GiveTask(p1.ValueChanged:Connect(function(p12) --[[ Line: 446 | Upvalues: p1 (copy) ]]
			p1:_value()
		end))
	end
end
function t._setKeybind(p1) --[[ _setKeybind | Line: 453 | Upvalues: v1 (copy), t2 (copy), v3 (copy) ]]
	local v12 = v1.GetInputTypeName()
	p1.KeyCode = p1.Controls[v12]
	if not p1.KeyCode then
		p1.ControlLabel.Visible = false
		p1.MobileLabel.Visible = true
		return
	end
	local KeyCode = p1.KeyCode
	local v2 = t2[KeyCode]
	if not v2 then
		local v32 = v3:GetScaledImageLabel(KeyCode, "Dark", v12)
		t2[KeyCode] = v32
		v2 = v32
	end
	p1.ControlLabel.Image = v2.Image
	p1.ControlLabel.ImageRectOffset = v2.ImageRectOffset
	p1.ControlLabel.ImageRectSize = v2.ImageRectSize
	p1.ControlLabel.Visible = true
	p1.MobileLabel.Visible = false
end
return t