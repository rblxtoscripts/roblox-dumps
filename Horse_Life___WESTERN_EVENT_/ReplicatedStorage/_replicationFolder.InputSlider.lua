-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("spr")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("MathUtils")
local v6 = Sonar("EventUtils")
function t.new(p1) --[[ new | Line: 145 | Upvalues: t (copy), v2 (copy), v1 (copy), v6 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22:SetRange(p1.MinValue, p1.MaxValue)
	v22.DecimalPlaces = p1.DecimalPlaces or 0
	v22.LastValue = p1.DefaultValue or v22:_getMinValue()
	v22.DragSliderButton = v22.Config.DragInputSlider or v1.FindElement(v22.Instance, "Slider", {
		IgnoreParent = true
	}) or v22.Instance
	if not v22.DragSliderButton then
		warn("\226\154\160\239\184\143 InputSlider, DragInputSlider is required for InputSlider")
		return v22
	end
	v22.UIDragDetector = v22.DragSliderButton:FindFirstChildOfClass("UIDragDetector")
	if not v22.UIDragDetector then
		local UIDragDetector = Instance.new("UIDragDetector")
		UIDragDetector.ResponseStyle = Enum.UIDragDetectorResponseStyle.Scale
		UIDragDetector.DragRelativity = Enum.UIDragDetectorDragRelativity.Relative
		UIDragDetector.DragStyle = Enum.UIDragDetectorDragStyle.TranslateLine
		UIDragDetector.Parent = v22.DragSliderButton
		v22.UIDragDetector = UIDragDetector
		v22.Maid:GiveTask(UIDragDetector)
	end
	for v62, v7 in v22.Config.Properties or {} do
		v22.UIDragDetector[v62] = v7
	end
	v22.UIDragDetector.ReferenceUIInstance = v22.UIDragDetector.ReferenceUIInstance or v22.DragSliderButton.Parent
	v22.UIDragDetector.BoundingUI = v22.UIDragDetector.BoundingUI or v22.DragSliderButton.Parent
	if v22.DragSliderButton.Size.X.Scale >= 1 then
		local function updateScaleBounds() --[[ updateScaleBounds | Line: 184 | Upvalues: v22 (copy) ]]
			local v1 = v22.DragSliderButton.AbsoluteSize.X / v22.UIDragDetector.BoundingUI.AbsoluteSize.X
			v22.ButtonScale = v1
			v22.ScaleBounds = {
				Min = -0.5 + v1 / 2,
				Max = 0.5 - v1 / 2
			}
			v22:_setFillSize()
		end
		v22.Maid:GiveTask(v22.UIDragDetector.ReferenceUIInstance:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScaleBounds))
		v22.Maid:GiveTask(v22.DragSliderButton:GetPropertyChangedSignal("AbsoluteSize"):Connect(updateScaleBounds))
		task.defer(updateScaleBounds)
	else
		v22.ScaleBounds = {
			Min = -0.5 + v22.DragSliderButton.Size.X.Scale / 2,
			Max = 0.5 - v22.DragSliderButton.Size.X.Scale / 2
		}
	end
	v22.FillFrame = v22.Config.FillFrame or v1.FindElement(v22.Instance, "FillBar")
	v22.ClipFrame = v22.Config.ClipFrame or v1.FindElement(v22.Instance, "ClipBar")
	if v22.FillFrame or v22.ClipFrame then
		v22.Maid:GiveTask(v22.DragSliderButton:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 207 | Upvalues: v22 (copy) ]]
			v22:_setFillSize()
		end))
		v22:_setFillSize()
	end
	for v122, v13 in { "OnStarted", "OnChanged", "OnEnded", "OnInput" } do
		v22[v13] = {}
		for v14, v15 in p1 do
			if v22[v14] and type(v22[v14]) == "table" then
				if type(v15) == "table" then
					for v17, v18 in v15 do
						v22:AddCallback(v14, v18)
					end
					continue
				end
				v22:AddCallback(v14, v15)
			end
		end
	end
	if v22.Config.Changed then
		v22.Changed = v6.getConnectionEvents(v22.Config.Changed)
		for v19, v20 in v22.Changed do
			v22.Maid:GiveTask(v20:Connect(function() --[[ Line: 232 | Upvalues: v22 (copy) ]]
				v22:SetValue(v22.LastValue, {
					SetPosition = true
				})
			end))
		end
	end
	v22.Maid:GiveTask(v22.UIDragDetector.DragStart:Connect(function(p1) --[[ Line: 240 | Upvalues: v22 (copy) ]]
		v22:Started(p1)
	end))
	v22.Maid:GiveTask(v22.UIDragDetector.DragContinue:Connect(function(p1) --[[ Line: 244 | Upvalues: v22 (copy) ]]
		v22:Update(p1, {
			FromSlider = true
		})
	end))
	v22.Maid:GiveTask(v22.UIDragDetector.DragEnd:Connect(function(p1) --[[ Line: 250 | Upvalues: v22 (copy) ]]
		v22:Ended(p1)
	end))
	v22:SetEnabled(true)
	task.defer(function() --[[ Line: 256 | Upvalues: v22 (copy), p1 (copy) ]]
		v22:SetValue(p1.DefaultValue, {
			FromInit = true,
			SetPosition = true
		})
	end)
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 266 | Upvalues: v4 (copy) ]]
	v4(p1)
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 270 ]]
	if not p1[p2] then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t._setFillSize(p1) --[[ _setFillSize | Line: 282 ]]
	if not p1.ButtonScale then
		return
	end
	local v1 = p1.DragSliderButton.Position.X.Scale + p1.ButtonScale / 4
	if p1.ClipFrame then
		p1.ClipFrame.Position = UDim2.new(v1, 0, 0.5, 0)
		if p1.FillFrame then
			p1.FillFrame.Position = UDim2.new(1 - v1, 0, 0.5, 0)
		end
	else
		if not p1.FillFrame then
			return
		end
		p1.FillFrame.Size = UDim2.new(v1, p1.FillFrame.Size.X.Offset, p1.FillFrame.Size.Y.Scale, p1.FillFrame.Size.Y.Offset)
	end
end
function t._setLastInputPosition(p1, p2) --[[ _setLastInputPosition | Line: 302 ]]
	if p2 then
		p1.LastInputPosition = p2
	end
end
function t._getAlphaFromSliderPosition(p1) --[[ _getAlphaFromSliderPosition | Line: 309 ]]
	if p1.UIDragDetector.DragStyle == Enum.UIDragDetectorDragStyle.TranslateLine then
		return (p1.UIDragDetector.DragUDim2.X.Scale - p1.ScaleBounds.Min) / (p1.ScaleBounds.Max - p1.ScaleBounds.Min)
	else
		return nil
	end
end
function t._getMinValue(p1) --[[ _getMinValue | Line: 318 ]]
	if type(p1.MinValue) == "function" then
		return p1.MinValue(p1)
	else
		return p1.MinValue
	end
end
function t._getMaxValue(p1) --[[ _getMaxValue | Line: 326 ]]
	if type(p1.MaxValue) == "function" then
		return p1.MaxValue(p1)
	else
		return p1.MaxValue
	end
end
function t._roundValue(p1, p2) --[[ _roundValue | Line: 334 ]]
	if p1.DecimalPlaces > 0 then
		return math.floor(p2 * 10 ^ p1.DecimalPlaces + 0.5) / 10 ^ p1.DecimalPlaces
	else
		return math.floor(p2 + 0.5)
	end
end
function t.GetValue(p1) --[[ GetValue | Line: 342 ]]
	return p1.LastValue
end
function t.SetValue(p1, p2, p3) --[[ SetValue | Line: 346 | Upvalues: v5 (copy), v3 (copy) ]]
	local v1 = if p3 then p3 else {}
	local v2, v32 = p1:_getMinValue()
	local v4 = if v32 then v32 else p1:_getMaxValue()
	local v52 = v1.SetPosition or not v1.FromSlider
	local v6 = v1
	local v7, v8
	if p2 and not v6.FromSlider then
		v7 = v4
		v8 = nil
		v52 = true
	else
		local v9 = p1:_getAlphaFromSliderPosition()
		p2 = v2 + (v4 - v2) * v9
		v7 = v4
		v8 = v9
	end
	local v11 = math.clamp(p1:_roundValue(p2), v2, v7)
	local v12, v13
	if v8 then
		v12 = v8
		v13 = v11
	else
		v12 = (v11 - v2) / (v7 - v2)
		v13 = v11
	end
	local LastValue = p1.LastValue
	if v6.FromInit and not LastValue then
		LastValue = v13
	end
	local v14, v15
	if v13 == p1.LastValue then
		v14 = false
		v15 = v12
	else
		v14 = true
		v15 = v12
	end
	p1.LastValue = v13
	local t = {
		OldValue = LastValue,
		NewValue = v13,
		InputPosition = p1.LastInputPosition
	}
	if v14 and v52 or v6.FromInit then
		local v16 = UDim2.new(v5.map(v15, 0, 1, p1.ScaleBounds.Min, p1.ScaleBounds.Max), 0, 0, 0)
		if v6.FromInit then
			p1.UIDragDetector.DragUDim2 = v16
		else
			v3.target(p1.UIDragDetector, 0.8, 3, {
				DragUDim2 = v16
			})
		end
	end
	if v14 and not v6.IgnoreCallbacks then
		if v6.FromSlider then
			p1:_runCallbacks("OnInput", t)
		end
		p1:_runCallbacks("OnChanged", t)
	end
	return t
end
function t.SetRange(p1, p2, p3) --[[ SetRange | Line: 397 ]]
	assert(if type(p2) == "number" then true elseif type(p2) == "function" then true else false, "\226\157\140 InputSlider, MinValue must be a number or a function")
	assert(if type(p3) == "number" then true elseif type(p3) == "function" then true else false, "\226\157\140 InputSlider, MaxValue must be a number or a function")
	p1.MinValue = p2
	p1.MaxValue = p3
	if not (p1:_getMinValue() >= p1:_getMaxValue()) then
		return
	end
	error("\226\157\140 InputSlider, MinValue must be less than MaxValue")
end
function t.Started(p1, p2) --[[ Started | Line: 409 ]]
	p1:_runCallbacks("OnStarted", (p1:Update(p2, false, true)))
end
function t.Update(p1, p2, p3, p4) --[[ Update | Line: 414 ]]
	p1:_setLastInputPosition(p2)
	return p1:SetValue(p4 and p1.LastValue or nil, {
		FromSlider = true,
		FromInit = p3
	})
end
function t.Ended(p1, p2) --[[ Ended | Line: 424 ]]
	p1:_runCallbacks("OnEnded", (p1:Update(p2)))
end
function t.SetEnabled(p1, p2) --[[ SetEnabled | Line: 429 ]]
	p1.Enabled = p2
	p1.UIDragDetector.Enabled = p2
end
function t.IsEnabled(p1) --[[ IsEnabled | Line: 434 ]]
	return p1.Enabled
end
function t.AddCallback(p1, p2, p3) --[[ AddCallback | Line: 438 ]]
	if not p1[p2] then
		p1[p2] = {}
	end
	table.insert(p1[p2], p3)
end
return t