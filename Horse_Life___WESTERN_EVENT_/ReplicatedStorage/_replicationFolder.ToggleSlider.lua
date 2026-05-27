-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("EventUtils")
local v5 = Sonar("spr")
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 153 | Upvalues: t (copy), v1 (copy), v3 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Config = p1
	v2.Instance = p1.Instance
	v2.ToggleButton = v3.FindElement(v2.Instance, "ToggleButton") or v2.Instance
	if not v2.ToggleButton then
		warn("\226\154\160\239\184\143 ToggleButton, Instance is required", v2.Instance)
		return v2
	end
	v2.DefaultValue = p1.DefaultValue or v2:_getValue()
	v2.ButtonScale = v2.ToggleButton.Size.X.Scale
	v2.ToggleTextLabel = v3.FindElement(v2.ToggleButton, "TextLabel")
	v2.ToggleLabel = v3.FindElement(v2.ToggleButton, "ToggleLabel") or v2.ToggleButton
	v2.Maid:GiveTask(v3.AddComponent("Button", {
		Instance = v2.ToggleButton,
		OnClick = function() --[[ OnClick | Line: 174 | Upvalues: v2 (copy) ]]
			if v2.Config.OnToggle then
				v2.Config.OnToggle(v2, not v2:_getValue())
			else
				v2:SetValue(not v2:_getValue())
			end
		end
	}))
	for v6, v7 in { "OnChanged" } do
		v2[v7] = {}
		for v8, v9 in p1 do
			if v2[v8] and type(v2[v8]) == "table" then
				v2:AddCallback(v8, v9)
			end
		end
	end
	if v2.Config.Changed then
		v2.Changed = v4.getConnectionEvents(v2.Config.Changed)
		for v11, v122 in v2.Changed do
			v2.Maid:GiveTask(v122:Connect(function() --[[ Line: 196 | Upvalues: v2 (copy) ]]
				v2:SetValue(v2:_getValue())
			end))
		end
	end
	v2:SetEnabled(true)
	if v2.DefaultValue ~= nil then
		v2:SetValue(v2.DefaultValue, true)
	end
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 211 | Upvalues: v2 (copy) ]]
	v2(p1)
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
function t._getValue(p1) --[[ _getValue | Line: 227 ]]
	if p1.Config.GetValue then
		return p1.Config.GetValue(p1)
	else
		return p1.Value
	end
end
function t._update(p1, p2) --[[ _update | Line: 234 | Upvalues: v5 (copy) ]]
	if p1:_getValue() then
		v5.target(p1.ToggleLabel, 0.8, if p2 then 9000000000 else 3, {
			Position = UDim2.fromScale(0 + p1.ButtonScale / 2, p1.ToggleLabel.Position.Y.Scale)
		})
		if p1.ToggleLabel:IsA("ImageLabel") then
			v5.target(p1.ToggleLabel, 0.8, if p2 then 9000000000 else 3, {
				ImageColor3 = Color3.fromRGB(159, 191, 94)
			})
		end
		if p1.ToggleTextLabel then
			p1.ToggleTextLabel.Text = p1.Config.EnabledText or "On"
		end
	else
		if p1.ToggleTextLabel then
			p1.ToggleTextLabel.Text = p1.Config.DisabledText or "Off"
		end
		v5.target(p1.ToggleLabel, 0.8, if p2 then 9000000000 else 3, {
			Position = UDim2.fromScale(1 - p1.ButtonScale / 2, p1.ToggleLabel.Position.Y.Scale)
		})
		if not p1.ToggleLabel:IsA("ImageLabel") then
			return
		end
		v5.target(p1.ToggleLabel, 0.8, if p2 then 9000000000 else 3, {
			ImageColor3 = Color3.fromRGB(222, 102, 102)
		})
	end
end
function t.SetValue(p1, p2, p3) --[[ SetValue | Line: 256 ]]
	local v1 = p1.Value
	p1.Value = p2
	if v1 ~= p2 then
		p1:_runCallbacks("OnChanged", p2)
	end
	p1:_update(p3)
	return p2
end
function t.GetValue(p1) --[[ GetValue | Line: 269 ]]
	return p1:_getValue()
end
function t.SetEnabled(p1, p2) --[[ SetEnabled | Line: 273 ]]
	p1.IsEnabled = p2
end
function t.IsEnabled(p1) --[[ IsEnabled | Line: 277 ]]
	return p1.IsEnabled
end
return t