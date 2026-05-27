-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
function t.new(p1) --[[ new | Line: 12 | Upvalues: t (copy), v2 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22:SetRange(p1.MinValue, p1.MaxValue)
	v22.DecimalPlaces = p1.DecimalPlaces or 0
	v22.LastValue = p1.DefaultValue or v22:_getMinValue()
	for v4, v5 in { "OnChanged" } do
		v22[v5] = {}
		for v7, v8 in p1 do
			local v6
			if v22[v7] and type(v22[v7]) == "table" then
				v6 = if type(v8) == "table" and v8 then v8 else { v8 }
				for v10, v11 in v6 do
					v22:AddCallback(v7, v11)
				end
			end
		end
	end
	v22.InputTextBox = v1.FindElement(v22.Instance, "InputTextBox")
	if v22.InputTextBox then
		v22.InputTextBox = v1.AddComponent("InputTextBox", {
			ClearTextOnFocus = false,
			Instance = v22.InputTextBox,
			PlaceholderText = p1.PlaceholderText or "Enter Value",
			OnTextChanged = function(p1, p2, p3) --[[ OnTextChanged | Line: 42 | Upvalues: v22 (copy) ]]
				if p3.FocusGained then
					v22:_textBoxFocusGained()
					return
				end
				if p3.FocusLost then
					v22:_textBoxFocusLost()
					return
				end
				if v22.InputTextBox:IsEmpty() then
					return
				end
				v22:SetValue(p2)
			end
		})
		v22.Maid:GiveTask(v22.InputTextBox)
	end
	v22.SliderFrame = v1.FindElement(v22.Instance, "InputSlider")
	if v22.SliderFrame then
		v22.Slider = v1.AddComponent("InputSlider", {
			Instance = v22.SliderFrame,
			MinValue = function() --[[ MinValue | Line: 61 | Upvalues: v22 (copy) ]]
				return v22:_getMinValue()
			end,
			MaxValue = function() --[[ MaxValue | Line: 64 | Upvalues: v22 (copy) ]]
				return v22:_getMaxValue()
			end,
			DefaultValue = v22.LastValue,
			DecimalPlaces = v22.DecimalPlaces,
			OnChanged = function(p1, p2) --[[ OnChanged | Line: 71 | Upvalues: v22 (copy) ]]
				v22:SetValue(p2.NewValue, {
					UpdateTextBox = true
				})
			end
		})
		v22.Maid:GiveTask(v22.Slider)
	end
	for v122, v13 in { "Add", "Subtract", "All" } do
		local v14 = v1.FindElement(v22.Instance, v13 .. "Button")
		if v14 then
			v22[v13 .. "Button"] = v1.AddComponent("Button", {
				Instance = v14,
				OnClick = function() --[[ OnClick | Line: 86 | Upvalues: v22 (copy), v13 (copy) ]]
					local v1 = v22.Config.StepValue or 1
					v22:SetValue(if v13 == "All" then v22:_getMaxValue() else v22:GetValue() + (if v13 == "Add" and v1 then v1 else -v1), {
						UpdateSlider = true,
						UpdateTextBox = true
					})
				end
			})
			v22.Maid:GiveTask(v22[v13 .. "Button"])
		end
	end
	v22.Maid:GiveTask(task.defer(function() --[[ Line: 113 | Upvalues: v22 (copy) ]]
		v22:SetValue(v22.LastValue, {
			FromInit = true
		})
	end))
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 122 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._getMinValue(p1) --[[ _getMinValue | Line: 128 ]]
	if type(p1.MinValue) == "function" then
		return p1.MinValue(p1)
	else
		return p1.MinValue
	end
end
function t._getMaxValue(p1) --[[ _getMaxValue | Line: 138 ]]
	if type(p1.MaxValue) == "function" then
		return p1.MaxValue(p1)
	else
		return p1.MaxValue
	end
end
function t._addCommas(p1, p2) --[[ _addCommas | Line: 146 ]]
	local v1 = p2:reverse():gsub("(%d%d%d)", "%1,"):reverse()
	if v1:sub(1, 1) == "," then
		v1 = v1:sub(2)
	end
	return v1
end
function t._formatText(p1, p2) --[[ _formatText | Line: 154 ]]
	local v1 = if p2 then p2 else p1.LastValue
	local v2 = tostring(v1)
	if p1.Config.Format then
		return p1.Config.Format(v1)
	end
	if p1.DecimalPlaces > 0 then
		local v3, v4 = v2:match("(%-?%d+)%.(%d+)")
		if v3 then
			return p1:_addCommas(v3) .. "." .. v4
		end
	else
		v2 = p1:_addCommas(v2)
	end
	return v2
end
function t._textBoxFocusGained(p1) --[[ _textBoxFocusGained | Line: 175 ]]
	p1.InputTextBox:SetText(p1:GetValue())
end
function t._textBoxFocusLost(p1) --[[ _textBoxFocusLost | Line: 180 ]]
	p1:SetValue(p1.InputTextBox:GetText(), {
		UpdateSlider = true,
		UpdateTextBox = true
	})
end
function t._roundValue(p1, p2) --[[ _roundValue | Line: 188 ]]
	if p1.DecimalPlaces > 0 then
		return math.floor(p2 * 10 ^ p1.DecimalPlaces + 0.5) / 10 ^ p1.DecimalPlaces
	else
		return math.floor(p2 + 0.5)
	end
end
function t.SetRange(p1, p2, p3) --[[ SetRange | Line: 196 ]]
	assert(if type(p2) == "number" then true elseif type(p2) == "function" then true else false, "\226\157\140 Slider, MinValue must be a number or a function")
	assert(if type(p3) == "number" then true elseif type(p3) == "function" then true else false, "\226\157\140 Slider, MaxValue must be a number or a function")
	p1.MinValue = p2
	p1.MaxValue = p3
	if not (p1:_getMinValue() >= p1:_getMaxValue()) then
		return
	end
	error("\226\157\140 NumberInput, MinValue must be less than MaxValue")
end
function t.AddCallback(p1, p2, p3) --[[ AddCallback | Line: 208 ]]
	if not p1[p2] then
		p1[p2] = {}
	end
	table.insert(p1[p2], p3)
end
function t._runCallbacks(p1, p2, p3) --[[ _runCallbacks | Line: 215 ]]
	if not p1[p2] then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1[p2] do
		v4(p1, v2)
	end
end
function t.GetValue(p1) --[[ GetValue | Line: 227 ]]
	return p1.LastValue
end
function t.SetValue(p1, p2, p3) --[[ SetValue | Line: 231 ]]
	local v1 = if p3 then p3 else {}
	local v2, v3 = p1:_getMinValue()
	local v4 = if v3 then v3 else p1:_getMaxValue()
	local v6 = math.clamp(p1:_roundValue(tonumber(p2) or v2), v2, v4)
	local LastValue = p1.LastValue
	local v7
	if v1.FromInit then
		if LastValue then
			v7, v6 = v6, LastValue
		else
			v7 = v6
		end
	else
		v7, v6 = v6, LastValue
	end
	local v8, v9
	if v7 == p1.LastValue then
		v8 = v1
		v9 = false
	else
		v8 = v1
		v9 = true
	end
	p1.LastValue = v7
	if v8.UpdateSlider or v8.FromInit then
		p1.Slider:SetValue(v7, {
			SetPosition = true,
			IgnoreCallbacks = true,
			FromInit = v8.FromInit
		})
	end
	if v8.UpdateTextBox or v8.FromInit then
		p1.InputTextBox:SetText(p1:_formatText(v7))
	else
		p1.InputTextBox:SetText(v7)
	end
	local t = {
		OldValue = v6,
		NewValue = v7
	}
	if v9 then
		p1:_runCallbacks("OnChanged", t)
	end
	return t
end
function t.ClearValue(p1) --[[ ClearValue | Line: 277 ]]
	if not p1.InputTextBox then
		return
	end
	p1.InputTextBox:SetText()
end
return t