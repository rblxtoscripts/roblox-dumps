-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("FormatNumber")
local v5 = Sonar("StorageUtils")
local v6 = Sonar("AnimatedCircleBar")
local v7 = Sonar("spr")
local t2 = { "OnOpen", "OnChanged", "OnConfirm", "OnCancel", "OnClose" }
local function defaultFormat(p1) --[[ defaultFormat | Line: 26 | Upvalues: v4 (copy) ]]
	if type(p1) ~= "number" then
		return tostring(p1)
	end
	local v1 = math.floor(p1 + 0.5)
	if math.abs(v1) < 1000 then
		return tostring(v1)
	else
		return v4.condense(v1)
	end
end
local function resolveSnapValue(p1, p2) --[[ resolveSnapValue | Line: 37 ]]
	if type(p1) ~= "string" then
		return p1, nil
	end
	if p1 ~= "Max" and p1 ~= "All" then
		return tonumber(p1), p1
	end
	return p2, p1
end
local function autoSegmentCount(p1, p2, p3) --[[ autoSegmentCount | Line: 48 ]]
	return math.clamp(math.floor((p2 - p1) / math.max(p3, 1)) + 1, 8, 24)
end
local function normalizeCallbacks(p1) --[[ normalizeCallbacks | Line: 53 ]]
	if type(p1) == "function" then
		return { p1 }
	end
	if type(p1) == "table" then
		return p1
	else
		return {}
	end
end
function t.new(p1) --[[ new | Line: 62 | Upvalues: t (copy), v1 (copy), defaultFormat (copy), t2 (copy), normalizeCallbacks (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = if p1 then p1 else {}
	v2.Instance = v2.Config.Instance
	v2.Adornee = v2.Config.Adornee
	if not v2.Adornee then
		warn("RadialAmountSelector, Adornee is required", p1)
		return v2
	end
	v2.Min = v2.Config.Min or (v2.Config.MinValue or 0)
	v2.Max = v2.Config.Max or v2.Config.MaxValue or 100
	if v2.Max < v2.Min then
		v2.Max = v2.Min
	end
	v2.Step = v2.Config.Step or (v2.Config.StepValue or 1)
	v2.Default = v2.Config.Default or v2.Config.DefaultValue or v2.Min
	v2.Format = v2.Config.Format or defaultFormat
	v2.DeadZoneFraction = v2.Config.DeadZoneFraction or 0.2
	v2.TopZeroZone = v2.Config.TopZeroZone == true
	v2.TopZeroZoneRadians = v2.Config.TopZeroZoneRadians or 0.2617993877991494
	v2.QuickClickToMax = v2.Config.QuickClickToMax ~= false
	v2.QuickClickDuration = v2.Config.QuickClickDuration or 0.1
	v2.Persistent = v2.Config.Persistent == true
	v2.CenterOnAdornee = v2.Config.CenterOnAdornee ~= false
	v2.Position = v2.Config.Position
	v2.CanOpen = v2.Config.CanOpen
	v2.SnapValues = v2:_resolveSnapValues(v2.Config.SnapValues)
	v2.IsDiscrete = v2.SnapValues ~= nil
	for v9, v10 in t2 do
		v2[v10] = {}
		for v11, v122 in normalizeCallbacks(v2.Config[v10]) do
			table.insert(v2[v10], v122)
		end
	end
	v2.Opened = false
	v2.CurrentValue = v2.Default
	v2.ConfirmedValue = nil
	v2.OutsideDeadZone = false
	v2.InZeroZone = false
	v2.PendingDrag = false
	v2.HasOpened = false
	v2:_buildFromAsset()
	if v2.Instance then
		v2:BindOpener(v2.Instance)
	end
	v2:SetValue(v2.Default, {
		IgnoreCallbacks = true,
		FromInit = true
	})
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 121 | Upvalues: v2 (copy) ]]
	if p1.Opened then
		p1:Close()
	end
	v2(p1)
end
function t._resolveSnapValues(p1, p2) --[[ _resolveSnapValues | Line: 128 ]]
	if not p2 or (type(p2) ~= "table" or #p2 == 0) then
		return nil
	end
	local t = {}
	for v3, v4 in p2 do
		local v1, v2
		local Max = p1.Max
		if type(v4) == "string" then
			if v4 == "Max" or v4 == "All" then
				v1 = Max
				v2 = v4
			else
				v1, v2 = tonumber(v4), v4
			end
		else
			v1 = v4
			v2 = nil
		end
		if v1 ~= nil then
			table.insert(t, {
				Value = v1,
				Label = v2
			})
		end
	end
	if #t == 0 then
		return nil
	else
		return t
	end
end
function t._buildFromAsset(p1) --[[ _buildFromAsset | Line: 147 | Upvalues: v5 (copy), v3 (copy), v6 (copy) ]]
	local v1 = v5.GetAsset("RadialAmountSelector")()
	if not v1 then
		warn("RadialAmountSelector, asset not found")
		return
	end
	p1.Wheel = v1:Clone()
	p1.Wheel.Name = "RadialAmountSelectorWheel"
	p1.Wheel.AnchorPoint = Vector2.new(0.5, 0.5)
	if typeof(p1.Position) == "UDim2" then
		p1.Wheel.Position = p1.Position
	elseif p1.CenterOnAdornee then
		p1.Wheel.Position = UDim2.fromScale(0.5, 0.5)
	end
	p1.Wheel.Visible = p1.Persistent
	p1.Wheel.Parent = p1.Adornee
	p1.Maid:GiveTask(p1.Wheel)
	p1.WheelScale = p1.Wheel:FindFirstChildOfClass("UIScale")
	if not p1.WheelScale then
		p1.WheelScale = Instance.new("UIScale")
		p1.WheelScale.Parent = p1.Wheel
	end
	p1.WheelScale.Scale = 0
	local v2 = v3.FindElement(p1.Wheel, "Frame") or p1.Wheel
	p1.RotateFrame = v3.FindElement(v2, "RotateFrame")
	p1.ValueLabel = v3.FindElement(v2, "ValueLabel") or v3.FindElement(v2, "TextLabel")
	p1.Backdrop = v3.FindElement(p1.Wheel, "Backdrop")
	p1.CancelLabel = v3.FindElement(v2, "CancelLabel")
	p1.InputLabel = v3.FindElement(v2, "InputLabel")
	if p1.InputLabel then
		p1.InputLabel.Visible = false
	end
	if not p1.RotateFrame then
		return
	end
	p1.CircleBar = v6.new({
		Reverse = true,
		TweenStyle = false,
		DoNotTweenText = true,
		Instance = p1.RotateFrame,
		LeftFrame = v3.FindElement(p1.RotateFrame, "Left"),
		RightFrame = v3.FindElement(p1.RotateFrame, "Right"),
		AmountLabel = p1.ValueLabel,
		Get = function() --[[ Get | Line: 191 | Upvalues: p1 (copy) ]]
			return p1.CurrentValue, p1.Max
		end,
		Format = p1.Format
	})
	if not p1.CircleBar then
		return
	end
	p1.Maid:GiveTask(p1.CircleBar)
end
function t._springScale(p1, p2) --[[ _springScale | Line: 204 | Upvalues: v7 (copy) ]]
	if p1.WheelScale then
		v7.stop(p1.WheelScale)
		v7.target(p1.WheelScale, 0.65, 4, {
			Scale = p2
		})
	end
end
function t._animateScaleOpen(p1) --[[ _animateScaleOpen | Line: 212 ]]
	if not p1.HasOpened then
		p1.WheelScale.Scale = 0
		p1.HasOpened = true
	end
	p1:_springScale(1)
end
function t._animateScaleCompact(p1) --[[ _animateScaleCompact | Line: 220 ]]
	p1:_springScale(0.65)
end
function t._animateScaleHidden(p1) --[[ _animateScaleHidden | Line: 224 ]]
	p1:_springScale(0)
end
function t._getSegmentCount(p1) --[[ _getSegmentCount | Line: 228 ]]
	if p1.IsDiscrete then
		return #p1.SnapValues
	else
		return math.clamp(math.floor((p1.Max - p1.Min) / math.max(p1.Step, 1)) + 1, 8, 24)
	end
end
function t.BindOpener(p1, p2) --[[ BindOpener | Line: 235 ]]
	p1.Instance = p2
	p1.Maid.OpenerInput = nil
	p1:_setupOpenerInteraction()
end
function t.BeginDrag(p1, p2) --[[ BeginDrag | Line: 241 ]]
	p1:_beginDrag(p2)
end
function t._setupOpenerInteraction(p1) --[[ _setupOpenerInteraction | Line: 245 ]]
	if p1.Instance then
		p1.Maid.OpenerInput = p1.Instance.InputBegan:Connect(function(p12) --[[ Line: 249 | Upvalues: p1 (copy) ]]
			if p1:_isPrimaryInput(p12) then
				p1:_beginDrag(p12)
			end
		end)
	end
end
function t._isPrimaryInput(p1, p2) --[[ _isPrimaryInput | Line: 257 ]]
	return if p2.UserInputType == Enum.UserInputType.MouseButton1 then true else p2.UserInputType == Enum.UserInputType.Touch
end
function t._beginDrag(p1, p2) --[[ _beginDrag | Line: 262 | Upvalues: UserInputService (copy) ]]
	if p1.CanOpen and not p1.CanOpen() then
		return
	end
	p1.PendingDrag = true
	p1._dragStartedAt = os.clock()
	p1._wasActiveBeforeDrag = if p1.ConfirmedValue == nil then false elseif p1.ConfirmedValue > 0 then true else false
	p1:Open(p2.Position)
	p1.Maid.DragInputChanged = UserInputService.InputChanged:Connect(function(p12) --[[ Line: 271 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseMovement and p12.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		p1:_updateFromScreenPosition(Vector2.new(p12.Position.X, p12.Position.Y))
	end)
	p1.Maid.DragInputEnded = UserInputService.InputEnded:Connect(function(p12) --[[ Line: 279 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		p1.Maid.DragInputChanged = nil
		p1.Maid.DragInputEnded = nil
		if not p1.PendingDrag then
			return
		end
		p1.PendingDrag = false
		if p1.QuickClickToMax and os.clock() - (p1._dragStartedAt or 0) < p1.QuickClickDuration then
			if not p1._wasActiveBeforeDrag then
				p1:SetValue(p1.Max, {
					IgnoreCallbacks = false
				})
				p1:Confirm()
				return
			end
			if p1.TopZeroZone or p1.Min <= 0 then
				p1.CurrentValue = 0
				p1:Confirm()
				return
			end
		end
		if p1.OutsideDeadZone then
			p1:Confirm()
		else
			p1:Cancel()
		end
	end)
	p1:_updateFromScreenPosition(Vector2.new(p2.Position.X, p2.Position.Y))
end
function t._updateFromScreenPosition(p1, p2) --[[ _updateFromScreenPosition | Line: 317 ]]
	if not (p1.Wheel and p1.Wheel.Parent) then
		return
	end
	local v1 = p2 - (p1.Wheel.AbsolutePosition + p1.Wheel.AbsoluteSize * 0.5)
	local AbsoluteSize = p1.Wheel.AbsoluteSize
	p1.OutsideDeadZone = v1.Magnitude > math.min(AbsoluteSize.X, AbsoluteSize.Y) * 0.5 * p1.DeadZoneFraction
	if p1.CancelLabel then
		p1.CancelLabel.Visible = not p1.OutsideDeadZone
	end
	if p1.ValueLabel then
		p1.ValueLabel.Visible = p1.OutsideDeadZone
	end
	if not p1.OutsideDeadZone then
		return
	end
	local sum = math.atan2(v1.X, -v1.Y)
	if sum < 0 then
		sum = sum + 6.283185307179586
	end
	p1:_updateFromAngle(sum)
end
function t._updateFromAngle(p1, p2) --[[ _updateFromAngle | Line: 350 ]]
	if p1.TopZeroZone then
		local TopZeroZoneRadians = p1.TopZeroZoneRadians
		if p2 <= TopZeroZoneRadians or 6.283185307179586 - TopZeroZoneRadians <= p2 then
			p1.InZeroZone = true
			p1:SetValue(0, {
				IgnoreCallbacks = false,
				AllowZero = true
			})
			return
		end
	end
	p1.InZeroZone = false
	local v1
	if p1.TopZeroZone then
		local TopZeroZoneRadians = p1.TopZeroZoneRadians
		v1 = math.clamp((p2 - TopZeroZoneRadians) / (6.283185307179586 - 2 * TopZeroZoneRadians), 0, 1)
	else
		v1 = p2 / 6.283185307179586
	end
	local v3
	if p1.IsDiscrete then
		local v4 = p1:_getSegmentCount()
		v3 = p1.SnapValues[if p1.TopZeroZone then math.clamp(math.floor(v1 * (v4 - 1) + 0.5) + 1, 1, v4) else math.floor(v1 * v4 + 0.5) % v4 + 1].Value
	else
		v3 = p1:_progressToValue(v1)
	end
	p1:SetValue(v3, {
		IgnoreCallbacks = false
	})
end
function t._progressToValue(p1, p2) --[[ _progressToValue | Line: 387 ]]
	return math.clamp(p1.Min + math.floor((p1.Min + p2 * (p1.Max - p1.Min) - p1.Min) / p1.Step + 0.5) * p1.Step, p1.Min, p1.Max)
end
function t._setValueInternal(p1, p2, p3) --[[ _setValueInternal | Line: 395 ]]
	local v1 = if p3 then p3 else {}
	local TopZeroZone = p1.TopZeroZone
	local v2
	if TopZeroZone then
		TopZeroZone = v1.AllowZero
		if TopZeroZone then
			if p2 == 0 then
				TopZeroZone = true
				v2 = v1
			else
				TopZeroZone = false
				v2 = v1
			end
		else
			v2 = v1
		end
	else
		v2 = v1
	end
	if not TopZeroZone then
		local v3 = math.clamp(p2, p1.Min, p1.Max)
		p2 = if p1.IsDiscrete then v3 else math.clamp(p1.Min + math.floor((v3 - p1.Min) / p1.Step + 0.5) * p1.Step, p1.Min, p1.Max)
	end
	local CurrentValue = p1.CurrentValue
	if p2 == CurrentValue and not v2.FromInit then
		return {
			OldValue = CurrentValue,
			NewValue = p2
		}
	end
	p1.CurrentValue = p2
	if p1.CircleBar then
		p1.CircleBar:Update()
	elseif p1.ValueLabel and p1.ValueLabel:IsA("TextLabel") then
		p1.ValueLabel.Text = p1.Format(p2)
	end
	local t = {
		OldValue = CurrentValue,
		NewValue = p2
	}
	if not v2.IgnoreCallbacks then
		p1:_runCallbacks("OnChanged", t)
	end
	return t
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 428 | Upvalues: RunService (copy) ]]
	local v2 = p1[p2]
	if not v2 then
		return
	end
	local v3 = if p3 then p3 else {}
	for v4, v5 in v2 do
		if RunService:IsStudio() then
			v5(p1, v3)
			continue
		end
		local v6, v7 = pcall(v5, p1, v3)
		if not v6 then
			warn("RadialAmountSelector, callback error:", p2, v7)
		end
	end
end
function t._positionWheel(p1, p2) --[[ _positionWheel | Line: 446 | Upvalues: UserInputService (copy) ]]
	if typeof(p1.Position) == "UDim2" then
		p1.Wheel.Position = p1.Position
		return
	end
	if p1.CenterOnAdornee then
		p1.Wheel.Position = UDim2.fromScale(0.5, 0.5)
		return
	end
	local v1 = if p2 then p2 else p1.Config.OpenAt
	local v2
	if typeof(v1) == "UDim2" then
		v2 = v1
	elseif type(v1) == "function" then
		v2 = v1(p1)
	elseif v1 == "Mouse" then
		local v4 = UserInputService:GetMouseLocation()
		v2 = UDim2.fromOffset(v4.X, v4.Y)
	else
		v2 = if typeof(v1) == "Vector2" or typeof(v1) == "Vector3" then UDim2.fromOffset(v1.X, v1.Y) else UDim2.fromScale(0.5, 0.5)
	end
	p1.Wheel.Position = v2
end
function t.Open(p1, p2) --[[ Open | Line: 475 ]]
	if p1.Opened then
		return
	end
	p1.Opened = true
	p1.Wheel.Parent = p1.Adornee
	p1.Wheel.Visible = true
	p1:_positionWheel(p2)
	p1:_animateScaleOpen()
	p1.OutsideDeadZone = false
	p1.InZeroZone = false
	if p1.CancelLabel then
		p1.CancelLabel.Visible = true
	end
	if p1.ValueLabel then
		p1.ValueLabel.Visible = false
	end
	if p1.InputLabel then
		p1.InputLabel.Visible = false
		p1.Maid.InputLabelShowThread = task.delay(p1.QuickClickDuration, function() --[[ Line: 497 | Upvalues: p1 (copy) ]]
			if not (p1.Opened and p1.InputLabel) then
				return
			end
			p1.InputLabel.Visible = true
		end)
	end
	if p1.CircleBar then
		p1.CircleBar:Update()
	end
	p1:_runCallbacks("OnOpen", {
		Value = p1.CurrentValue
	})
end
function t.Close(p1) --[[ Close | Line: 511 ]]
	if not p1.Opened then
		return
	end
	p1.Opened = false
	p1.Maid.DragInputChanged = nil
	p1.Maid.DragInputEnded = nil
	p1.Maid.InputLabelShowThread = nil
	if p1.CancelLabel then
		p1.CancelLabel.Visible = false
	end
	if p1.ValueLabel then
		p1.ValueLabel.Visible = true
	end
	if p1.InputLabel then
		p1.InputLabel.Visible = false
	end
	if p1.Persistent then
		if p1.ConfirmedValue and p1.ConfirmedValue > 0 then
			p1:_animateScaleCompact()
		else
			p1:_animateScaleHidden()
			p1.Wheel.Visible = false
		end
	else
		p1.Wheel.Visible = false
		p1:_animateScaleHidden()
	end
	p1:_runCallbacks("OnClose", {
		Value = p1.CurrentValue
	})
end
function t.Confirm(p1) --[[ Confirm | Line: 546 ]]
	if not p1.Opened then
		return
	end
	local t = {}
	t.OldValue = p1.ConfirmedValue or p1.Default
	t.NewValue = p1.CurrentValue
	p1.ConfirmedValue = p1.CurrentValue
	local _oneShotConfirm = p1._oneShotConfirm
	p1._oneShotConfirm = nil
	p1._oneShotCancel = nil
	p1:Close()
	if p1.Persistent and p1.ConfirmedValue > 0 then
		p1.Wheel.Visible = true
		p1:_animateScaleCompact()
	end
	p1:_runCallbacks("OnConfirm", t)
	p1:_runOneShot(_oneShotConfirm, "OnConfirm", t)
end
function t.Cancel(p1) --[[ Cancel | Line: 568 ]]
	if p1.Opened then
		local t = {
			OldValue = p1.CurrentValue,
			NewValue = p1.CurrentValue
		}
		local _oneShotCancel = p1._oneShotCancel
		p1._oneShotConfirm = nil
		p1._oneShotCancel = nil
		p1:Close()
		p1:_runCallbacks("OnCancel", t)
		p1:_runOneShot(_oneShotCancel, "OnCancel", t)
	end
end
function t.Reset(p1) --[[ Reset | Line: 584 ]]
	p1.Opened = false
	p1.PendingDrag = false
	p1.OutsideDeadZone = false
	p1.InZeroZone = false
	p1._oneShotConfirm = nil
	p1._oneShotCancel = nil
	p1.Maid.DragInputChanged = nil
	p1.Maid.DragInputEnded = nil
	p1.Maid.InputLabelShowThread = nil
	p1.ConfirmedValue = nil
	p1:SetValue(p1.Default, {
		IgnoreCallbacks = true
	})
	if p1.CancelLabel then
		p1.CancelLabel.Visible = false
	end
	if p1.ValueLabel then
		p1.ValueLabel.Visible = true
	end
	if p1.InputLabel then
		p1.InputLabel.Visible = false
	end
	if p1.Wheel then
		p1.Wheel.Visible = false
	end
	p1:_animateScaleHidden()
end
function t._runOneShot(p1, p2, p3, p4) --[[ _runOneShot | Line: 613 | Upvalues: RunService (copy) ]]
	if not p2 then
		return
	end
	if RunService:IsStudio() then
		p2(p1, p4)
		return
	end
	local v1, v2 = pcall(p2, p1, p4)
	if v1 then
		return
	end
	warn("RadialAmountSelector, one-shot callback error:", p3, v2)
end
function t.OpenFor(p1, p2, p3) --[[ OpenFor | Line: 627 ]]
	local v1 = if p2 then p2 else {}
	local v2
	if v1.Max == nil and v1.MaxValue == nil then
		v2 = v1
	else
		v2 = v1
		p1:SetRange(v1.Min or (v1.MinValue or p1.Min), v1.Max or v1.MaxValue)
	end
	if v2.Default ~= nil or v2.DefaultValue ~= nil then
		p1.Default = v2.Default or v2.DefaultValue
	end
	p1._oneShotConfirm = v2.OnConfirm
	p1._oneShotCancel = v2.OnCancel
	if p3 then
		p1:_beginDrag(p3)
	else
		p1:Open()
	end
end
function t.SetRange(p1, p2, p3) --[[ SetRange | Line: 651 ]]
	p1.Min = p2
	p1.Max = p3
	if p1.Max < p1.Min then
		p1.Max = p1.Min
	end
	p1:_refreshDynamicSnapValues()
	local v1 = p1.TopZeroZone and (if p1.CurrentValue == 0 then true else false)
	if p1.CurrentValue > p1.Max then
		p1:SetValue(p1.Max)
		return
	end
	if p1.CurrentValue < p1.Min and not v1 then
		p1:SetValue(p1.Min)
		return
	end
	if not p1.CircleBar then
		return
	end
	p1.CircleBar:Update()
end
function t._refreshDynamicSnapValues(p1) --[[ _refreshDynamicSnapValues | Line: 668 ]]
	if not (p1.IsDiscrete and p1.SnapValues) then
		return
	end
	for v1, v2 in p1.SnapValues do
		if v2.Label == "Max" or v2.Label == "All" then
			v2.Value = p1.Max
		end
	end
end
function t.SetValue(p1, p2, p3) --[[ SetValue | Line: 680 ]]
	return p1:_setValueInternal(p2, p3)
end
function t.GetValue(p1) --[[ GetValue | Line: 684 ]]
	return p1.CurrentValue
end
function t.GetConfirmedValue(p1) --[[ GetConfirmedValue | Line: 688 ]]
	return p1.ConfirmedValue
end
function t.IsOpen(p1) --[[ IsOpen | Line: 692 ]]
	return p1.Opened
end
function t.SetVisible(p1, p2) --[[ SetVisible | Line: 696 ]]
	if not p1.Wheel then
		return
	end
	p1.Wheel.Visible = p2
	if not p2 then
		p1:_animateScaleHidden()
		return
	end
	if p1.ConfirmedValue and p1.ConfirmedValue > 0 then
		p1:_animateScaleCompact()
		return
	end
	if p1.CurrentValue > p1.Min then
		p1:_animateScaleCompact()
	else
		p1.WheelScale.Scale = 0
	end
end
function t.AddCallback(p1, p2, p3) --[[ AddCallback | Line: 714 ]]
	if p1[p2] then
		table.insert(p1[p2], p3)
	end
end
return t