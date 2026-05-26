-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("FormatNumber")
local v4 = Sonar("safeDestroy")
local v5 = Sonar("EventUtils")
local v6 = Sonar("ColorUtils")
local v7 = Sonar("spr")
local t2 = {
	LeftToRight = function(p1, p2) --[[ LeftToRight | Line: 169 ]]
		if p2 then
			return UDim2.new(-1 + p1, 0, 0.5, 0), UDim2.new(1 - p1, 0, 0.5, 0)
		else
			return UDim2.new(p1, 0, 1, 0)
		end
	end,
	RightToLeft = function(p1, p2) --[[ RightToLeft | Line: 178 ]]
		if p2 then
			return UDim2.new(1 - p1, 0, 0.5, 0), UDim2.new(-1 + p1, 0, 0.5, 0)
		else
			return UDim2.new(p1, 0, 1, 0)
		end
	end,
	Up = function(p1, p2) --[[ Up | Line: 188 ]]
		if p2 then
			return UDim2.new(0.5, 0, 1 + (1 - p1), 0), UDim2.new(0.5, 0, p1, 0)
		else
			return UDim2.new(1, 0, p1, 0)
		end
	end,
	Down = function(p1, p2) --[[ Down | Line: 197 ]]
		if p2 then
			return UDim2.new(0.5, 0, -1 + p1, 0), UDim2.new(0.5, 0, 1 - p1, 0)
		else
			return UDim2.new(1, 0, p1, 0)
		end
	end,
	OutToIn = function(p1, p2) --[[ OutToIn | Line: 206 ]]
		return UDim2.new(p1, 0, 1, 0)
	end
}
function t.new(p1) --[[ new | Line: 215 | Upvalues: t (copy), v1 (copy), v2 (copy), t2 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v1.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	if not v22.Instance then
		warn("\226\154\160\239\184\143 AnimatedBar, Instance is required for animated bar", p1)
		return v22
	end
	if not (v22.Config.Get or v22.Config.GetMax) then
		warn("\226\154\160\239\184\143 AnimatedBar, Get and GetMax functions are required for animated bar", v22.Instance, p1)
		return v22
	end
	v22.Instance = p1.Instance
	v22.FillFrame = v22.Config.FillFrame or v2.FindElement(v22.Instance, "FillBar") or v22.Instance
	v22.ClipFrame = v22.Config.ClipFrame or v2.FindElement(v22.Instance, "ClipBar")
	v22.AmountLabel = v22.Config.AmountLabel or v2.FindElement(v22.Instance, "AmountLabel")
	v22.EndLabel = v22.Config.EndLabel or v2.FindElement(v22.Instance, "EndProgressLabel")
	v22.StartFillFrame = v22.Config.StartFillFrame or v2.FindElement(v22.Instance, "StartFillBar")
	v22.StartClipFrame = v22.Config.StartClipFrame or v2.FindElement(v22.Instance, "StartClipBar")
	v22.Clipped = v22.ClipFrame ~= nil
	v22.Reverse = v22.Config.Reverse or false
	v22.Direction = v22.Config.Direction or "LeftToRight"
	if not t2[v22.Direction] then
		warn("\226\154\160\239\184\143 AnimatedBar, Invalid direction:", v22.Direction, "Defaulting to LeftToRight")
		v22.Direction = "LeftToRight"
	end
	v22:_setAnchorPoints()
	v22.TweenValue = Instance.new("NumberValue")
	v22.TweenValue.Value = if v22.Config.TweenToInitialValue then 0 else -1
	v22.Maid:GiveTask(v22.TweenValue)
	v22.ClampedTweenValue = Instance.new("NumberValue")
	v22.ClampedTweenValue.Value = if v22.Config.TweenToInitialValue then 0 else -1
	v22.Maid:GiveTask(v22.ClampedTweenValue)
	v22.Maid:GiveTask(v22.TweenValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 265 | Upvalues: v22 (copy) ]]
		v22:_updateText()
		v22:_runCallbacks("OnTween", {
			Value = v22.TweenValue.Value,
			ClampedValue = v22.ClampedTweenValue.Value
		})
	end))
	v22.Maid:GiveTask(v22.ClampedTweenValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 276 | Upvalues: v22 (copy) ]]
		v22:_updateBar()
	end))
	if v22.Config.Changed then
		v22.Changed = v5.getConnectionEvents(v22.Config.Changed)
		for v11, v122 in v22.Changed do
			v22.Maid:GiveTask(v122:Connect(function() --[[ Line: 284 | Upvalues: v22 (copy) ]]
				v22:_updateValue()
			end))
		end
	end
	v22.OnChanged = {}
	if v22.Config.OnChanged then
		v22.OnChanged = type(v22.Config.OnChanged) == "table" and v22.Config.OnChanged or { v22.Config.OnChanged }
	end
	v22.OnTween = {}
	if v22.Config.OnTween then
		v22.OnTween = type(v22.Config.OnTween) == "table" and v22.Config.OnTween or { v22.Config.OnTween }
	end
	v22:_updateValue(true)
	return v22
end
function t._setAnchorPoints(p1) --[[ _setAnchorPoints | Line: 310 ]]
	local v1, v2
	if p1.Clipped then
		v1 = {
			LeftToRight = {
				Clip = {
					X = 0,
					Y = 0.5
				},
				Fill = {
					X = 0,
					Y = 0.5
				}
			},
			RightToLeft = {
				Clip = {
					X = 0,
					Y = 0.5
				},
				Fill = {
					X = 0,
					Y = 0.5
				}
			},
			Up = {
				Clip = {
					X = 0.5,
					Y = 1
				},
				Fill = {
					X = 0.5,
					Y = 1
				}
			},
			Down = {
				Clip = {
					X = 0.5,
					Y = 0
				},
				Fill = {
					X = 0.5,
					Y = 0
				}
			}
		}
		v2 = {}
	else
		v1, v2 = {
			LeftToRight = {
				Fill = {
					X = 0,
					Y = 0.5
				}
			},
			RightToLeft = {
				Fill = {
					X = 1,
					Y = 0.5
				}
			},
			Up = {
				Fill = {
					X = 0.5,
					Y = 1
				}
			},
			Down = {
				Fill = {
					X = 0.5,
					Y = 0
				}
			},
			OutToIn = {
				Fill = {
					X = 0.5,
					Y = 0.5
				}
			}
		}, {
			LeftToRight = UDim2.new(0, 0, 0.5, 0),
			RightToLeft = UDim2.new(1, 0, 0.5, 0),
			Up = UDim2.new(0.5, 0, 1, 0),
			Down = UDim2.new(0.5, 0, 0, 0),
			OutToIn = UDim2.new(0.5, 0, 0.5, 0)
		}
	end
	local v3 = v1[p1.Direction] or v1.LeftToRight
	local t = {
		p1.ClipFrame,
		p1.FillFrame,
		p1.StartClipFrame,
		p1.StartFillFrame
	}
	local v4 = p1.Clipped and {
		v3.Clip,
		v3.Fill,
		v3.Clip,
		v3.Fill
	} or {
		v3.Fill,
		nil,
		nil,
		v3.Fill
	}
	local v5 = if v2 then v2[p1.Direction] or v2.LeftToRight else v2
	if not p1.Clipped and v5 then
		for v6, v7 in t do
			if v7 then
				v7.Position = v5
			end
		end
	end
	for v8, v9 in t do
		if v9 and v4[v8] then
			v9.AnchorPoint = Vector2.new(v4[v8].X, v4[v8].Y)
		end
	end
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 366 ]]
	if not p1[p2] then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t._updateValue(p1, p2, p3) --[[ _updateValue | Line: 382 | Upvalues: TweenService (copy), v7 (copy) ]]
	local v2 = not (if p3 then p3 else {}).DoNotTween and (p2 and p1.Config.TweenToInitialValue or not p2)
	local v3, v4, v5 = p1.Config.Get()
	local v6 = if v4 then v4 else p1.Config.GetMax()
	local v72 = v5 or 0
	local LastValue = p1.LastValue
	if p2 and not LastValue then
		LastValue = v3
	end
	p1.LastValue = v3
	p1.LastMaxValue = v6
	local v8 = v6 - v72
	local v9 = math.min(v3 - v72, v8)
	p1.LastMappedMaxValue = v8
	local v10
	if v2 and p1.Config.TweenStyle ~= false then
		local TweenStyle = p1.Config.TweenStyle
		if TweenStyle then
			TweenStyle = type(p1.Config.TweenStyle) == "function" and p1.Config.TweenStyle() or p1.Config.TweenStyle
		end
		v10 = v6
		if TweenStyle then
			p1.TweenClampedTweenValue = TweenService:Create(p1.ClampedTweenValue, TweenStyle, {
				Value = v9
			})
			p1.TweenTweenValue = TweenService:Create(p1.TweenValue, TweenStyle, {
				Value = v3
			})
			p1.TweenClampedTweenValue:Play()
			p1.TweenTweenValue:Play()
		else
			v7.target(p1.ClampedTweenValue, 1, 3, {
				Value = v9
			})
			v7.target(p1.TweenValue, 1, 3, {
				Value = v3
			})
		end
	else
		v7.stop(p1.ClampedTweenValue)
		v7.stop(p1.TweenValue)
		if p1.TweenClampedTweenValue then
			p1.TweenClampedTweenValue:Cancel()
		end
		if p1.TweenTweenValue then
			p1.TweenTweenValue:Cancel()
		end
		p1.TweenValue.Value = v3
		p1.ClampedTweenValue.Value = v9
		v10 = v6
	end
	if p2 then
		p1:_updateStartBar()
	end
	p1:_updateBar()
	p1:_updateText()
	p1:_runCallbacks("OnChanged", {
		OldValue = LastValue,
		NewValue = v3,
		MaxValue = v10
	})
	p1:_runCallbacks("OnTween", {
		Value = p1.TweenValue.Value,
		ClampedValue = p1.ClampedTweenValue.Value
	})
end
function t._updateBar(p1) --[[ _updateBar | Line: 455 | Upvalues: t2 (copy) ]]
	local count = math.clamp(p1.ClampedTweenValue.Value / p1.LastMappedMaxValue, 0, 1)
	if p1.Reverse then
		count = 1 - count
	end
	local v2, v3 = t2[p1.Direction](count, p1.Clipped)
	p1.Alpha = count
	if p1.Clipped then
		p1.ClipFrame.Position = v2
		if p1.FillFrame then
			p1.FillFrame.Position = v3
		end
	elseif p1.FillFrame then
		p1.FillFrame.Size = v2
	end
	local v4 = p1:_getColor(count)
	if v4 then
		p1.FillFrame.BackgroundColor3 = v4
	end
	p1:_updateEndLabel(count)
end
function t._updateEndLabel(p1, p2) --[[ _updateEndLabel | Line: 488 ]]
	if not p1.EndLabel then
		return
	end
	local Position = p1.EndLabel.Position
	local X = Position.X
	local Y = Position.Y
	if p1.Direction == "LeftToRight" then
		X = UDim.new(p2, X.Offset)
	elseif p1.Direction == "RightToLeft" then
		X = UDim.new(1 - p2, X.Offset)
	elseif p1.Direction == "Up" then
		Y = UDim.new(1 - p2, Y.Offset)
	else
		if p1.Direction ~= "Down" then
			return
		end
		Y = UDim.new(p2, Y.Offset)
	end
	p1.EndLabel.Position = UDim2.new(X, Y)
end
function t._updateStartBar(p1) --[[ _updateStartBar | Line: 509 | Upvalues: t2 (copy) ]]
	if not (p1.StartFillFrame or p1.StartClipFrame) then
		return
	end
	local count = math.clamp(p1.ClampedTweenValue.Value / p1.LastMappedMaxValue, 0, 1)
	if p1.Reverse then
		count = 1 - count
	end
	local v2, v3 = t2[p1.Direction](count, p1.Clipped)
	if p1.Clipped then
		if p1.StartClipFrame then
			p1.StartClipFrame.Position = v2
		end
		if p1.StartFillFrame then
			p1.StartFillFrame.Position = v3
		end
	elseif p1.StartFillFrame then
		p1.StartFillFrame.Size = v2
	end
	local v4 = p1:_getColor(count)
	if not (v4 and p1.StartFillFrame) then
		return
	end
	p1.StartFillFrame.BackgroundColor3 = v4
end
function t._updateText(p1) --[[ _updateText | Line: 539 | Upvalues: v3 (copy) ]]
	if p1.Config.DoNotSetText then
		return
	end
	if not p1.AmountLabel then
		return
	end
	local v1 = p1.Config.DoNotTweenText and p1.LastValue or p1.TweenValue.Value
	if not p1.DoNotRound then
		v1 = math.round(v1)
	end
	local Format = p1.Config.Format
	local v32 = if type(Format) == "function" then Format(v1, p1.LastMaxValue) elseif type(Format) == "string" then string.format(Format, v1, p1.LastMaxValue) else v3.suffix(v1) .. "/" .. v3.suffix(p1.LastMaxValue)
	if p1.Config.Prepend then
		v32 = p1.Config.Prepend .. v32
	end
	if p1.Config.Append then
		v32 = v32 .. p1.Config.Append
	end
	if type(p1.AmountLabel) ~= "table" then
		p1.AmountLabel.Text = v32
		return
	end
	for v6, v7 in p1.AmountLabel do
		v7.Text = v32
	end
end
function t._getColor(p1, p2) --[[ _getColor | Line: 575 | Upvalues: v6 (copy) ]]
	if typeof(p1.Config.Color) == "Color3" then
		return p1.Config.Color
	end
	if typeof(p1.Config.Color) == "function" then
		return p1.Config.Color(p2)
	end
	if typeof(p1.Config.Color) == "ColorSequence" then
		return v6.GetColorFromSequence(p1.Config.Color, p2)
	else
		return nil
	end
end
function t.Update(p1, p2) --[[ Update | Line: 587 ]]
	p1:_updateValue(false, p2)
end
function t.GetAlpha(p1, p2) --[[ GetAlpha | Line: 591 ]]
	if p2 then
		return math.clamp(p1.LastValue / p1.LastMaxValue, 0, 1)
	else
		return p1.Alpha
	end
end
function t.HideStartFrames(p1) --[[ HideStartFrames | Line: 598 ]]
	if p1.StartFillFrame then
		p1.StartFillFrame.Visible = false
	end
	if not p1.StartClipFrame then
		return
	end
	p1.StartClipFrame.Visible = false
end
function t.ShowStartFrames(p1) --[[ ShowStartFrames | Line: 607 ]]
	if p1.StartFillFrame then
		p1.StartFillFrame.Visible = true
	end
	if not p1.StartClipFrame then
		return
	end
	p1.StartClipFrame.Visible = true
end
function t.UpdateStartBar(p1) --[[ UpdateStartBar | Line: 616 ]]
	p1:_updateStartBar()
end
function t.AddOnChangedCallback(p1, p2) --[[ AddOnChangedCallback | Line: 622 ]]
	table.insert(p1.OnChanged, p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 628 | Upvalues: v4 (copy) ]]
	v4(p1)
end
return t