-- https://lua.expert/
local v1 = script.Parent.Parent
v1:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 2 | Upvalues: v1 (copy) ]]
	if not v1.Visible then
		return
	end
	while v1.Visible do
		task.wait(0.3)
		script.Parent.Text = "Teleporting."
		task.wait(0.3)
		script.Parent.Text = "Teleporting.."
		task.wait(0.3)
		script.Parent.Text = "Teleporting..."
	end
end)