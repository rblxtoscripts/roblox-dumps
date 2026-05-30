-- https://lua.expert/
script.Parent.Parent:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1 ]]
	if not script.Parent.Parent.Visible then
		return
	end
	while script.Parent.Parent.Visible do
		task.wait(0.3)
		script.Parent.Text = "Teleporting."
		task.wait(0.3)
		script.Parent.Text = "Teleporting.."
		task.wait(0.3)
		script.Parent.Text = "Teleporting..."
	end
end)