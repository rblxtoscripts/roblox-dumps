-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TextService = game:GetService("TextService")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InputTypeService")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("SprUtils")
local v4 = Sonar("safeDestroy")
local function getTextWidth(p1) --[[ getTextWidth | Line: 116 | Upvalues: TextService (copy) ]]
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Text = p1.Text
	GetTextBoundsParams.Font = p1.FontFace
	GetTextBoundsParams.Size = p1.TextSize
	GetTextBoundsParams.Width = (1 / 0)
	local v1 = TextService:GetTextBoundsAsync(GetTextBoundsParams)
	GetTextBoundsParams:Destroy()
	return v1.X
end
function t.new(p1, p2, p3) --[[ new | Line: 128 | Upvalues: t (copy), v2 (copy) ]]
	local v22 = setmetatable(p2, t)
	v22.Action = p2
	v22.ShowHeldAction = v22.End and true
	v22.InteractMenu = p1
	v22.Maid = p1.Maid
	v22.IsMainAction = p3
	if p3 then
		v22.ValueChangedMaid = p1.ValueChangedMaid
		v22.HintLabel = p1.HintLabel
		v22.HintImageLabel = p1.HintImageLabel
		v22.ValueLabel = p1.ValueLabel
		v22.ContainerFrame = p1.ContainerFrame
		v22.HintImageLabel.Image = v22.Image or ""
		local v3 = v22.IconColor or v22.Color or Color3.fromRGB(255, 255, 255)
		local v4 = v2.FindElement(v22.HintImageLabel, "UIGradient")
		if v4 then
			v4.Color = if typeof(v3) == "ColorSequence" and v3 then v3 else ColorSequence.new(v3)
		end
		local v6 = v2.FindElement(v22.HintImageLabel, "ShadowLabel")
		if v6 then
			v6.Image = v22.Image or ""
		end
		v22.HintImageLabel.Size = v22.HintSize or v22.HintImageLabel.Size
		p1.DefaultHintSize = p1.ContainerFrame.Size
		local v8 = v22.Color or Color3.fromRGB(255, 255, 255)
		local v9 = typeof(v8) == "ColorSequence" and v8.Keypoints[1].Value or v8
		p1.BackgroundFrame.BackgroundColor3 = v9
		local v10 = v2.FindElement(p1.ContainerFrame, "BackgroundFrame")
		if v10 and v10 ~= p1.BackgroundFrame then
			v10.BackgroundColor3 = v9
		end
		if v22.Value then
			v22:_value()
			v22:_valueChanged()
			v22.ValueLabel.Visible = true
		else
			v22.ValueLabel.Visible = false
		end
		v22:_hint()
	else
		local v11 = v2.FindElement(p1.ActionsFrame, "Default")
		v11.Visible = false
		v22.ActionFrame = v11:Clone()
		v22.HintLabel = v2.FindElement(v22.ActionFrame, "HintLabel")
		v22.ControlFrame = v2.FindElement(v22.ActionFrame, "ControlFrame")
		v22.MobileLabel = v2.FindElement(v22.ControlFrame, "MobileLabel")
		v22.HeldLabel = v2.FindElement(v22.ActionFrame, "HeldLabel")
		v22:_hint()
		v22:_setKeybind()
		if v22.Controls then
			local t2 = {}
			for v12, v13 in v22.Controls do
				t2[v12] = v13.Name
			end
			v22.Maid:GiveTask(v2.AddComponent("KeyCodeLabel", {
				Instance = v22.ControlFrame,
				Inputs = t2
			}))
		end
		v22.Maid:GiveTask(v2.AddComponent("Button", {
			Instance = v22.ActionFrame,
			OnClick = function() --[[ OnClick | Line: 211 | Upvalues: v22 (copy) ]]
				v22:_run()
			end
		}))
		v22.ActionFrame.Parent = p1.ActionsFrame
		p1.Actions[#p1.Actions + 1] = v22
		v22:_visibilityChanged()
		v22:_stateChanged()
	end
	v22:_hintChanged()
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 229 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t._run(p1, p2) --[[ _run | Line: 233 | Upvalues: v2 (copy), v3 (copy) ]]
	if not p1.RepeatAction and p1.HeldAction then
		return
	end
	if not p1.Run then
		return
	end
	task.spawn(function() --[[ Line: 237 | Upvalues: p1 (copy), p2 (copy) ]]
		local v1 = if p1.DelayActivation then p1.DelayActivation() or 0 else 0
		if v1 > 0 then
			local v2 = tick() + v1
			p1:_showHeldAction()
			repeat
				task.wait()
				if not p1.HeldAction then
					return
				end
			until v2 <= tick()
			p1.Run()
			p1:_endRepeat()
		else
			if not p1.Run() then
				return
			end
			p1.RanAction = true
			if p2 then
				return
			end
			p1:_repeatRun()
		end
	end)
	local v1 = v2.FindElement(p1.ActionFrame, "InnerFrame")
	if not v1 then
		return
	end
	local v22 = v2.FindElement(v1, "Interacted")
	if v22 then
		local v32 = v22:Clone()
		v32.BackgroundTransparency = 0.25
		v32.Visible = true
		v32.Parent = p1.ActionFrame
		v3.spring(v32, 1, 4, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0.75, 0)
		})
		v3.onSpringsCompleted({ v32 }, function() --[[ Line: 271 | Upvalues: v32 (copy) ]]
			v32:Destroy()
		end)
	end
	local v4 = v2.FindElement(v1, "UIScale")
	if not v4 then
		return
	end
	v3.spring(v4, 0.5, 8, {
		Scale = 0.7
	})
	v3.onSpringsCompleted({ v4 }, function() --[[ Line: 279 | Upvalues: p1 (copy), v3 (ref), v4 (copy) ]]
		if not p1.Maid then
			return
		end
		v3.spring(v4, 0.5, 8, {
			Scale = 1
		})
	end)
end
function t._end(p1) --[[ _end | Line: 288 ]]
	if not p1.End then
		return
	end
	task.spawn(p1.End)
end
function t._repeatRun(p1) --[[ _repeatRun | Line: 294 ]]
	local v1 = tick()
	p1.LastRun = v1
	p1.RepeatingAction = true
	if p1.ShowHeldAction then
		p1:_showHeldAction(v1)
	end
	task.delay(p1.RepeatDelay or 0.25, function() --[[ Line: 303 | Upvalues: p1 (copy), v1 (copy) ]]
		if p1.LastRun ~= v1 then
			return
		end
		while p1.LastRun == v1 do
			p1.RepeatingAction = true
			task.wait(p1.RepeatWait or 0.5)
			if p1.LastRun ~= v1 or not (p1._run and p1.RepeatAction) then
				continue
			end
			p1:_run(true)
		end
	end)
end
function t._showHeldAction(p1) --[[ _showHeldAction | Line: 319 | Upvalues: RunService (copy) ]]
	p1.HeldLabel.Visible = true
	p1.ControlFrame.Visible = false
	p1.HeldAction = true
	p1.HeldRotateConnection = RunService.Heartbeat:Connect(function() --[[ Line: 325 | Upvalues: p1 (copy) ]]
		if not p1.Maid then
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
function t._endRepeat(p1, p2) --[[ _endRepeat | Line: 338 ]]
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
function t._isRepeating(p1) --[[ _isRepeating | Line: 368 ]]
	if not p1.RepeatingAction then
		return
	end
	if p1.LastRun then
		return true
	end
end
function t._visibility(p1) --[[ _visibility | Line: 374 ]]
	if p1.Visibility == nil then
		return true
	end
	if type(p1.Visibility) == "boolean" then
		return p1.Visibility
	else
		return p1.Visibility()
	end
end
function t._setVisibility(p1, p2) --[[ _setVisibility | Line: 386 ]]
	p1.ActionFrame.Visible = p1:_visibility()
	if not p2 then
		return
	end
	p1.InteractMenu:_updateInteractFrame()
end
function t._hint(p1) --[[ _hint | Line: 393 ]]
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
function t._updateContainerSize(p1) --[[ _updateContainerSize | Line: 405 | Upvalues: TextService (copy) ]]
	local HintLabel = p1.HintLabel
	local GetTextBoundsParams = Instance.new("GetTextBoundsParams")
	GetTextBoundsParams.Text = HintLabel.Text
	GetTextBoundsParams.Font = HintLabel.FontFace
	GetTextBoundsParams.Size = HintLabel.TextSize
	GetTextBoundsParams.Width = (1 / 0)
	local v1 = TextService:GetTextBoundsAsync(GetTextBoundsParams)
	GetTextBoundsParams:Destroy()
	local v2
	if p1.ValueLabel.Visible then
		local ValueLabel = p1.ValueLabel
		local GetTextBoundsParams_2 = Instance.new("GetTextBoundsParams")
		GetTextBoundsParams_2.Text = ValueLabel.Text
		GetTextBoundsParams_2.Font = ValueLabel.FontFace
		GetTextBoundsParams_2.Size = ValueLabel.TextSize
		GetTextBoundsParams_2.Width = (1 / 0)
		local v3 = TextService:GetTextBoundsAsync(GetTextBoundsParams_2)
		GetTextBoundsParams_2:Destroy()
		v2 = v3.X or 0
	else
		v2 = 0
	end
	p1.ContainerFrame.Size = UDim2.new(0, 110 + v1.X + v2 + 10, 0, p1.ContainerFrame.Size.Y.Offset)
end
function t._hintChanged(p1) --[[ _hintChanged | Line: 415 ]]
	if not p1.HintChanged then
		return
	end
	if type(p1.HintChanged) == "table" and p1.HintChanged.ClassName ~= "Signal" then
		for v1, v2 in p1.HintChanged do
			p1.Maid:GiveTask(v2:Connect(function() --[[ Line: 420 | Upvalues: p1 (copy) ]]
				p1:_hint()
			end))
		end
	else
		p1.Maid:GiveTask(p1.HintChanged:Connect(function() --[[ Line: 425 | Upvalues: p1 (copy) ]]
			p1:_hint()
		end))
	end
end
function t._visibilityChanged(p1) --[[ _visibilityChanged | Line: 431 ]]
	if not p1.VisibilityChanged then
		return
	end
	if type(p1.VisibilityChanged) == "table" and p1.VisibilityChanged.ClassName ~= "Signal" then
		for v1, v2 in p1.VisibilityChanged do
			p1.Maid:GiveTask(v2:Connect(function() --[[ Line: 436 | Upvalues: p1 (copy) ]]
				p1:_setVisibility(true)
			end))
		end
	else
		p1.Maid:GiveTask(p1.VisibilityChanged:Connect(function() --[[ Line: 441 | Upvalues: p1 (copy) ]]
			p1:_setVisibility(true)
		end))
	end
end
function t._stateChanged(p1) --[[ _stateChanged | Line: 447 ]]
	if not p1.StateChanged then
		return
	end
	if type(p1.StateChanged) == "table" and p1.StateChanged.ClassName ~= "Signal" then
		for v1, v2 in p1.StateChanged do
			p1.Maid:GiveTask(v2:Connect(function() --[[ Line: 452 | Upvalues: p1 (copy) ]]
				if p1.RepeatingAction or p1.HeldAction then
					p1:_endRepeat(true)
				end
			end))
		end
	else
		p1.Maid:GiveTask(p1.StateChanged:Connect(function() --[[ Line: 458 | Upvalues: p1 (copy) ]]
			if p1.RepeatingAction or p1.HeldAction then
				p1:_endRepeat(true)
			end
		end))
	end
end
function t._setValue(p1, p2) --[[ _setValue | Line: 465 ]]
	local v1 = if p2 then p2 else {}
	p1.Value = v1.Value
	p1.ValueChanged = v1.ValueChanged
	p1:_valueChanged()
	p1.ValueLabel.Visible = next(v1) ~= nil
	if not p1.Value then
		return
	end
	p1:_value()
end
function t._value(p1) --[[ _value | Line: 479 ]]
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
function t._valueChanged(p1) --[[ _valueChanged | Line: 493 ]]
	if not p1.ValueChanged then
		return
	end
	if p1.ValueChangedMaid then
		p1.ValueChangedMaid:DoCleaning()
	end
	if type(p1.ValueChanged) == "table" and p1.ValueChanged.ClassName ~= "Signal" then
		for v1, v2 in p1.ValueChanged do
			p1.Maid:GiveTask(v2:Connect(function() --[[ Line: 502 | Upvalues: p1 (copy) ]]
				p1:_value()
			end))
		end
	else
		p1.Maid:GiveTask(p1.ValueChanged:Connect(function() --[[ Line: 507 | Upvalues: p1 (copy) ]]
			p1:_value()
		end))
	end
end
function t._setKeybind(p1) --[[ _setKeybind | Line: 513 | Upvalues: v1 (copy) ]]
	p1.KeyCode = p1.Controls and p1.Controls[v1.GetInputTypeName()]
	if not p1.MobileLabel then
		return
	end
	p1.MobileLabel.Visible = not p1.KeyCode
end
return t