-- https://lua.expert/
repeat
	wait(0.2)
until script.Parent.Parent.Visible
while script.Parent.Parent.Visible do
	task.wait(0.3)
	script.Parent.Text = "Teleporting."
	task.wait(0.3)
	script.Parent.Text = "Teleporting.."
	task.wait(0.3)
	script.Parent.Text = "Teleporting..."
end