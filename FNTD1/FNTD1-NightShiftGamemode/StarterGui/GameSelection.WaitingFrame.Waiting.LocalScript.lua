-- https://lua.expert/
script.Parent.Parent.Visible = true
repeat
	task.wait(0.2)
until script.Parent.Parent.Visible
while script.Parent.Parent.Visible do
	task.wait(0.3)
	script.Parent.Text = "Waiting For Everyone To Join."
	task.wait(0.3)
	script.Parent.Text = "Waiting For Everyone To Join.."
	task.wait(0.3)
	script.Parent.Text = "Waiting For Everyone To Join..."
end
if not game.ReplicatedStorage.Values.PVP.Value then
	game.ReplicatedStorage.Values.PVP.Changed:Connect(function() --[[ Line: 20 ]]
		if not game.ReplicatedStorage.Values.PVP.Value then
			return
		end
		local Custom = game.ReplicatedStorage.Values.PVP.Custom.Value
	end)
	return
end
local Custom = game.ReplicatedStorage.Values.PVP.Custom.Value
game.ReplicatedStorage.Values.PVP.Changed:Connect(function() --[[ Line: 20 ]]
	if not game.ReplicatedStorage.Values.PVP.Value then
		return
	end
	local Custom = game.ReplicatedStorage.Values.PVP.Custom.Value
end)