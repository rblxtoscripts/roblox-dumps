-- https://lua.expert/
local v1 = false
function game.ReplicatedStorage.Remotes.Moderation.inputPopup.OnClientInvoke() --[[ Line: 3 | Upvalues: v1 (ref) ]]
	script.Parent.Enabled = true
	v1 = false
	while not v1 do
		wait()
	end
	script.Parent.Enabled = false
	v1 = false
	return script.Parent.TextBox.Text
end
script.Parent.confirm.InputBegan:Connect(function(p1) --[[ Line: 14 | Upvalues: v1 (ref) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 and p1.UserInputType ~= Enum.UserInputType.Touch then
		return
	end
	v1 = true
end)
script.Parent.confirm.TouchTap:Connect(function() --[[ Line: 19 | Upvalues: v1 (ref) ]]
	v1 = true
end)
script.Parent.TextBox.FocusLost:Connect(function(p1) --[[ Line: 22 | Upvalues: v1 (ref) ]]
	if not p1 then
		return
	end
	v1 = true
end)