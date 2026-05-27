-- https://lua.expert/
local UserInputService = game:GetService("UserInputService")
local t = {}
t.__index = t
function t.new(p1, p2, p3, p4, p5) --[[ new | Line: 18 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Value = 0
	v2.Connections = {}
	v2.DestroyTable = {}
	v2.Bar = p1
	v2.Slider = v2.Bar.Slider
	v2.Min = p3 or 0
	v2.Max = p4 or 1
	v2.Round = p5 and true or false
	v2.canMove = true
	v2.Label = v2.Bar:FindFirstChild("Label")
	v2.Changed = Instance.new("BindableEvent")
	table.insert(v2.DestroyTable, v2.Changed)
	table.insert(v2.DestroyTable, v2.Bar)
	if p2 then
		table.insert(v2.Connections, v2.Changed.Event:Connect(function(p1, p22) --[[ Line: 38 | Upvalues: p2 (copy) ]]
			p2(p1, p22)
		end))
	end
	v2:Reconnect()
	return v2, v2.Changed.Event
end
function t.SetFunction(p1, p2) --[[ SetFunction | Line: 47 ]]
	if not p2 then
		return
	end
	table.insert(p1.Connections, p1.Changed.Event:Connect(function(p1, p22) --[[ Line: 49 | Upvalues: p2 (copy) ]]
		p2(p1, p22)
	end))
end
function t.UpdateValue(p1, p2, p3) --[[ UpdateValue | Line: 55 ]]
	p1.Min = p2 or 0
	p1.Max = p3 or 1
end
function t.Set(p1, p2, p3) --[[ Set | Line: 60 ]]
	local v1 = math.clamp(p2, p1.Min, p1.Max)
	p1.Value = v1
	local v2 = (v1 - p1.Min) / (p1.Max - p1.Min)
	p1:Update(v2)
	if p3 then
		p1.Slider:TweenPosition(UDim2.new(v2, 0, 0.5, 0), "Out", "Linear", 0.5, true)
	else
		p1.Slider.Position = UDim2.new(v2, 0, 0.5, 0)
	end
end
function t.Update(p1, p2) --[[ Update | Line: 76 ]]
	local v1 = p1.Value
	local v2 = p1.Min + (p1.Max - p1.Min) * p2
	if p1.Round then
		v2 = if type(p1.Round) == "boolean" then math.floor(v2 + 0.5) else p1.Round(v2)
	end
	p1.Value = v2
	if p1.Label then
		p1.Label.Text = tostring(v2)
	end
	if p1.Value == v1 then
		return
	end
	p1.Changed:Fire(v2, v1)
end
function t.Reconnect(p1) --[[ Reconnect | Line: 95 | Upvalues: UserInputService (copy) ]]
	local Bar = p1.Bar
	local Slider = p1.Slider
	local AbsoluteSize = Bar.AbsoluteSize
	Bar:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 99 | Upvalues: AbsoluteSize (ref), Bar (copy) ]]
		AbsoluteSize = Bar.AbsoluteSize
	end)
	local v1 = Bar.InputBegan:Connect(function(p12) --[[ Line: 102 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		p1.Listening = true
	end)
	local v2 = Slider.InputBegan:Connect(function(p12) --[[ Line: 107 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		p1.Listening = true
	end)
	local v3 = UserInputService.InputEnded:Connect(function(p12) --[[ Line: 112 | Upvalues: p1 (copy) ]]
		if p12.UserInputType ~= Enum.UserInputType.MouseButton1 and p12.UserInputType ~= Enum.UserInputType.Touch then
			return
		end
		p1.Listening = nil
	end)
	local v4 = Slider.SelectionGained:Connect(function() --[[ Line: 117 | Upvalues: p1 (copy) ]]
		p1.Listening = true
	end)
	local v5 = Slider.SelectionLost:Connect(function() --[[ Line: 120 | Upvalues: p1 (copy) ]]
		p1.Listening = nil
	end)
	local v6 = UserInputService.InputChanged:Connect(function(p12) --[[ Line: 123 | Upvalues: p1 (copy), Slider (copy), Bar (copy), AbsoluteSize (ref) ]]
		if p1.Listening ~= true or not p1.canMove then
			return
		end
		local v1 = nil
		if p12.KeyCode == Enum.KeyCode.Thumbstick2 then
			local X = p12.Position.X
			if math.abs(X) > 0.15 then
				v1 = Slider.Position.X.Scale + (if X > 0 then 0.01 else -0.01)
			end
		elseif p12.UserInputType == Enum.UserInputType.MouseMovement or p12.UserInputType == Enum.UserInputType.Touch then
			v1 = (p12.Position.X - Bar.AbsolutePosition.X) / AbsoluteSize.X
		end
		if not v1 then
			return
		end
		local v3 = math.clamp(v1, 0, 1)
		p1:Update(v3)
		Slider.Position = UDim2.new(v3, 0, 0.5, 0)
	end)
	table.insert(p1.Connections, v2)
	table.insert(p1.Connections, v1)
	table.insert(p1.Connections, v4)
	table.insert(p1.Connections, v6)
	table.insert(p1.Connections, v3)
	table.insert(p1.Connections, v5)
end
function t.Disconnect(p1) --[[ Disconnect | Line: 158 ]]
	for i = 1, #p1.Connections do
		p1.Connections[i]:Disconnect()
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 165 ]]
	for i = 1, #p1.DestroyTable do
		p1.DestroyTable[i]:Destroy()
	end
	p1.DestroyTable = nil
	p1:Disconnect()
end
return t