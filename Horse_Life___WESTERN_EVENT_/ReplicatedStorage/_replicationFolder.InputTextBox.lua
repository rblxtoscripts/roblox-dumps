-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("Signal")
function t.new(p1) --[[ new | Line: 56 | Upvalues: t (copy), v1 (copy), v3 (copy), v4 (copy) ]]
	assert(p1.OnTextChanged, "\226\154\160\239\184\143 InputTextBox, OnTextChanged callback is required")
	assert(p1.Instance, "\226\154\160\239\184\143 InputTextBox, Instance is required")
	local v32 = setmetatable({}, t)
	v32.Maid = v1.new()
	v32.Config = p1
	v32.Instance = p1.Instance
	v32.TextBox = p1.Instance:IsA("TextBox") and p1.Instance or v3.FindElement(p1.Instance, "TextBox")
	v32.Active = true
	v32.OnTextChanged = p1.OnTextChanged
	if not v32.TextBox then
		warn("\226\154\160\239\184\143 InputTextBox, TextBox not found in instance:", p1.Instance)
		return v32
	end
	if p1.PlaceholderText then
		v32.TextBox.PlaceholderText = p1.PlaceholderText
	end
	if p1.ClearTextOnFocus ~= nil then
		v32.TextBox.ClearTextOnFocus = p1.ClearTextOnFocus
	end
	v32.FocusGained = v32.Maid:GiveTask(v4.new())
	v32.FocusLost = v32.Maid:GiveTask(v4.new())
	v32.Maid:GiveTask(v32.TextBox:GetPropertyChangedSignal("Text"):Connect(function() --[[ Line: 86 | Upvalues: v32 (copy) ]]
		if v32.TextBox:IsFocused() then
			v32:Update({})
		end
	end))
	v32.Maid:GiveTask(v32.TextBox.Focused:Connect(function() --[[ Line: 92 | Upvalues: p1 (copy), v32 (copy) ]]
		(p1.OnFocusGained or p1.OnTextChanged)(v32.TextBox, v32.TextBox.Text, {
			FocusGained = true
		})
	end))
	v32.Maid:GiveTask(v32.TextBox.FocusLost:Connect(function() --[[ Line: 98 | Upvalues: p1 (copy), v32 (copy) ]]
		(p1.OnFocusLost or p1.OnTextChanged)(v32.TextBox, v32.TextBox.Text, {
			FocusLost = true
		})
	end))
	if p1.UpdateTextOnInit then
		v32:Update({
			FromInit = true
		})
	end
	return v32
end
function t.Destroy(p1) --[[ Destroy | Line: 115 | Upvalues: v2 (copy) ]]
	v2(p1)
end
function t.Update(p1, p2) --[[ Update | Line: 122 ]]
	p1.OnTextChanged(p1.TextBox, p1.TextBox.Text, p2)
end
function t.IsEmpty(p1) --[[ IsEmpty | Line: 126 ]]
	return p1.TextBox.Text == ""
end
function t.SetText(p1, p2) --[[ SetText | Line: 130 ]]
	p1.TextBox.Text = p2 or ""
end
function t.GetText(p1) --[[ GetText | Line: 134 ]]
	return p1.TextBox.Text
end
return t