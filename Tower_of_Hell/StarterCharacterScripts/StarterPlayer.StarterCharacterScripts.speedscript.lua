-- https://lua.expert/
local function update() --[[ update | Line: 1 ]]
	script.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value
end
script.Parent.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value
game.ReplicatedStorage.GameValues.globalSpeed.Changed:Connect(update)