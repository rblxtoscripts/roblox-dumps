-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local GameSpeed = game.ReplicatedStorage.Remotes.Misc.GameSpeed
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local t = {
	[1] = ">",
	[1.5] = ">>",
	[2] = ">>>"
}
function update(p1) --[[ update | Line: 8 | Upvalues: t (copy) ]]
	script.Parent.ImageButton.TextLabel.Text = if t[p1] then t[p1] else ">"
end
script.Parent.ImageButton.MouseButton1Click:Connect(function() --[[ Line: 12 | Upvalues: GameSpeed (copy) ]]
	GameSpeed:FireServer()
end)
if not game.ReplicatedStorage.Values.PVP.Value then
	game.ReplicatedStorage.Values.PVP.Changed:Connect(function() --[[ Line: 20 ]]
		if not game.ReplicatedStorage.Values.PVP.Value then
			return
		end
		script.Parent.Visible = false
		script.Parent.Parent.SpeedText.Visible = false
	end)
	update()
	Tween:AddButton(script.Parent.ImageButton)
	GameSpeed.OnClientEvent:Connect(update)
	return
end
script.Parent.Visible = false
script.Parent.Parent.SpeedText.Visible = false
game.ReplicatedStorage.Values.PVP.Changed:Connect(function() --[[ Line: 20 ]]
	if not game.ReplicatedStorage.Values.PVP.Value then
		return
	end
	script.Parent.Visible = false
	script.Parent.Parent.SpeedText.Visible = false
end)
update()
Tween:AddButton(script.Parent.ImageButton)
GameSpeed.OnClientEvent:Connect(update)