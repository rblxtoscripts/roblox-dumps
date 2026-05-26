-- https://lua.expert/
game:GetService("TweenService")
game:GetService("UserInputService")
function toggle(p1) --[[ toggle | Line: 4 ]]
	if p1 == nil then
		p1 = not script.Parent.open.Value
	end
	script.Parent.open.Value = p1
end
script.Parent.open.Changed:Connect(function() --[[ Line: 8 ]]
	script.Parent.Enabled = script.Parent.open.Value
end)
script.Parent.shop.close.MouseButton1Click:connect(function(p1) --[[ Line: 12 ]]
	toggle(false)
end)
script.Parent.shop.close.TouchTap:Connect(function() --[[ Line: 15 ]]
	toggle(false)
end)
game:GetService("ContextActionService"):BindActionAtPriority("open_" .. script.Parent.Name, function(p1, p2, p3) --[[ Line: 26 ]]
	if not script.Parent.open.Value then
		return Enum.ContextActionResult.Pass
	end
	if p2 ~= Enum.UserInputState.End then
		return Enum.ContextActionResult.Sink
	end
	toggle(false)
	return Enum.ContextActionResult.Sink
end, false, 35000, Enum.KeyCode.ButtonSelect)