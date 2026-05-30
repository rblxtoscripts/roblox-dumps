-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local RaidBoss = game.ReplicatedStorage.Values.RaidBoss
local RaidBossSave = game.ReplicatedStorage.Remotes.Main.RaidBossSave
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Save = script.Parent.Save
local Save_2 = script.Parent.Parent:WaitForChild("Placement"):WaitForChild("Save")
if RaidBoss.Value then
	Save_2.Visible = true
else
	Save_2.Visible = false
end
RaidBoss.Changed:Connect(function() --[[ Line: 16 | Upvalues: RaidBoss (copy), Save_2 (copy) ]]
	if RaidBoss.Value then
		Save_2.Visible = true
	else
		Save_2.Visible = false
	end
end)
Save.Give.MouseButton1Click:Connect(function() --[[ Line: 24 | Upvalues: RaidBossSave (copy) ]]
	RaidBossSave:FireServer()
end)
Tween:AddButton(Save_2, Save)
Tween:AddButton(Save.Exit, Save)
Tween:AddButton(Save.Give)