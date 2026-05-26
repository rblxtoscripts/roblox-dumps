-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("GuiFrameworkService")
local v5 = Sonar("EventUtils")
local v6 = Sonar("spr")
local v7 = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
function t.new(p1) --[[ new | Line: 92 | Upvalues: t (copy), v1 (copy), v4 (copy), v5 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	if not v2.Instance then
		warn("\226\154\160\239\184\143 AnimatedValueDisplay, Instance is required", p1)
		return v2
	end
	v2.Value = v2.Config.Value
	if not (v2.Value or v2.Config.Get) then
		warn("\226\154\160\239\184\143 AnimatedValueDisplay, Value or Get is required", p1)
		return v2
	end
	v2.Instance = v4.FindElement(v2.Instance, "ValueLabel") or v2.Instance
	v2.TweenValue = Instance.new("NumberValue")
	v2.TweenValue.Value = -1
	v2.Maid:GiveTask(v2.TweenValue)
	if v2.Config.Effect == "Sliding" then
		v2:_setupSlidingEffect()
	else
		v2.Maid:GiveTask(v2.TweenValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 119 | Upvalues: v2 (copy) ]]
			v2:_updateText()
		end))
	end
	if v2.Value then
		v2.LastValue = v2.Value.Value
		v2.Maid:GiveTask(v2.Value:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 127 | Upvalues: v2 (copy) ]]
			v2:_updateValue()
		end))
	else
		v2.LastValue = v2.Config.Get()
	end
	if v2.Config.Changed then
		v2.Changed = v5.getConnectionEvents(v2.Config.Changed)
		for v42, v52 in v2.Changed do
			v2.Maid:GiveTask(v52:Connect(function() --[[ Line: 137 | Upvalues: v2 (copy) ]]
				v2:_updateValue()
			end))
		end
	end
	v2.OnChanged = {}
	if p1.OnChanged then
		if type(p1.OnChanged) == "function" then
			v2.OnChanged = { p1.OnChanged }
		else
			v2.OnChanged = p1.OnChanged
		end
	end
	v2:_updateValue(true)
	return v2
end
function t._formatText(p1, ...) --[[ _formatText | Line: 162 | Upvalues: v3 (copy) ]]
	local v1 = p1.Config.DoNotTweenText and p1.LastValue or p1.TweenValue.Value
	if not p1.DoNotRound then
		v1 = math.round(v1)
	end
	local Format = p1.Config.Format
	local v32 = if type(Format) == "function" then Format(v1, p1.LastMaxValue) elseif type(Format) == "string" then string.format(Format, v1, p1.LastMaxValue) else v3.splice(v1)
	if p1.Config.Prepend then
		v32 = p1.Config.Prepend .. v32
	end
	if p1.Config.Append then
		v32 = v32 .. p1.Config.Append
	end
	return v32
end
function t._setupSlidingEffect(p1) --[[ _setupSlidingEffect | Line: 190 | Upvalues: v4 (copy) ]]
	p1.Sliding = true
	p1.DampingRatio = p1.Config.DampingRatio or 0.8
	p1.Frequency = p1.Config.Frequency or 3
	p1.SlideDirection = p1.Config.SlideDirection or "Up"
	local v1 = v4.FindElement(p1.Config.Instance, "ValueFrame")
	if not v1 then
		warn("\226\154\160\239\184\143 AnimatedValueDisplay, ValueFrame is required for Sliding effect")
		p1.Sliding = false
		return
	end
	local v2 = v4.FindElement(v1, "DefaultTemplate")
	if v2 then
		v2.Visible = false
		local ActiveLabel = v4.CloneTemplate(v2)
		ActiveLabel.Name = "ActiveLabel"
		ActiveLabel.Visible = true
		ActiveLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		ActiveLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		ActiveLabel.Parent = v1
		p1.SlidingContainer = v1
		p1.SlidingActiveLabel = ActiveLabel
		p1.LastDisplayedText = nil
	else
		warn("\226\154\160\239\184\143 AnimatedValueDisplay, DefaultTemplate is required inside ValueFrame for Sliding effect")
		p1.Sliding = false
	end
end
function t._slideToText(p1, p2) --[[ _slideToText | Line: 224 | Upvalues: v6 (copy) ]]
	if p2 == p1.LastDisplayedText then
		return
	end
	local SlidingActiveLabel = p1.SlidingActiveLabel
	if not SlidingActiveLabel then
		return
	end
	local isLastDisplayedText = p1.LastDisplayedText == nil
	p1.LastDisplayedText = p2
	if isLastDisplayedText then
		SlidingActiveLabel.Text = p2
		return
	end
	local OldLabel = SlidingActiveLabel:Clone()
	OldLabel.Name = "OldLabel"
	OldLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	OldLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	OldLabel.Parent = p1.SlidingContainer
	SlidingActiveLabel.Text = p2
	SlidingActiveLabel.TextTransparency = 0
	local UIStroke = SlidingActiveLabel:FindFirstChildOfClass("UIStroke")
	if UIStroke then
		UIStroke.Transparency = 0
	end
	local v1 = if p1.SlideDirection == "Down" then 0 else 1
	local v2 = if p1.SlideDirection == "Down" then 1 else 0
	SlidingActiveLabel.Position = UDim2.fromScale(0.5, v1)
	v6.target(SlidingActiveLabel, p1.DampingRatio, p1.Frequency, {
		Position = UDim2.fromScale(0.5, 0.5)
	})
	local UIStroke_2 = OldLabel:FindFirstChildOfClass("UIStroke")
	v6.target(OldLabel, p1.DampingRatio, p1.Frequency, {
		TextTransparency = 1,
		Position = UDim2.fromScale(0.5, v2)
	})
	if not UIStroke_2 then
		v6.completed(OldLabel, function() --[[ Line: 275 | Upvalues: OldLabel (copy) ]]
			OldLabel:Destroy()
		end)
		return
	end
	v6.target(UIStroke_2, 1, p1.Frequency, {
		Transparency = 1
	})
	v6.completed(OldLabel, function() --[[ Line: 275 | Upvalues: OldLabel (copy) ]]
		OldLabel:Destroy()
	end)
end
function t._updateText(p1) --[[ _updateText | Line: 280 ]]
	if p1.Sliding then
		p1:_slideToText(p1:_formatText())
	else
		p1.Instance.Text = p1:_formatText()
	end
end
function t._getValue(p1) --[[ _getValue | Line: 291 ]]
	if p1.Config.Get then
		return p1.Config.Get()
	else
		return p1.Value.Value
	end
end
function t._getMaxValue(p1) --[[ _getMaxValue | Line: 301 ]]
	if p1.Config.GetMax then
		return p1.Config.GetMax()
	else
		return nil
	end
end
function t._updateValue(p1, p2) --[[ _updateValue | Line: 311 | Upvalues: v7 (copy), TweenService (copy) ]]
	local v1 = p2 and p1.Config.TweenToInitialValue or not p2
	local v2, v3 = p1:_getValue()
	local v4 = if v3 then v3 else p1:_getMaxValue()
	local LastValue = p1.LastValue
	if p2 and not LastValue then
		LastValue = v2
	end
	local v5, v6
	if v4 then
		v5, v6 = v4, math.min(v2, v4)
	else
		v5 = v4
		v6 = v2
	end
	p1.LastValue = v2
	p1.LastMaxValue = v5
	local v8 = if LastValue == 0 then 0 else math.max(math.abs((math.ceil((v2 - LastValue) / LastValue * 100))), 1)
	if p1.Sliding then
		p1.TweenValue.Value = v6
	elseif v1 then
		TweenService:Create(p1.TweenValue, p1.Config.TweenStyle or v7, {
			Value = v6
		}):Play()
	else
		p1.TweenValue.Value = v6
		TweenService:Create(p1.TweenValue, TweenInfo.new(0), {
			Value = v6
		}):Play()
	end
	p1:_updateText()
	p1:_runCallbacks({
		OldValue = LastValue,
		NewValue = v2,
		PercentageChange = v8
	})
end
function t._runCallbacks(p1, p2) --[[ _runCallbacks | Line: 357 ]]
	local v2 = if p2 then p2 else {}
	for v3, v4 in p1.OnChanged do
		v4(p1, v2)
	end
end
function t.AddOnChangedCallback(p1, p2) --[[ AddOnChangedCallback | Line: 368 ]]
	table.insert(p1.OnChanged, p2)
end
function t.Update(p1) --[[ Update | Line: 372 ]]
	p1:_updateValue()
end
function t.Destroy(p1) --[[ Destroy | Line: 377 | Upvalues: v6 (copy), v2 (copy) ]]
	if p1.SlidingActiveLabel then
		v6.stop(p1.SlidingActiveLabel)
	end
	if p1.SlidingContainer then
		for v1, v22 in p1.SlidingContainer:GetChildren() do
			if v22.Name == "OldLabel" then
				v6.stop(v22)
				v22:Destroy()
			end
		end
	end
	v2(p1)
end
return t