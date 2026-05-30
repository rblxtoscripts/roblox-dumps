-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local UpdateLog = game.ReplicatedStorage.Remotes.Misc.UpdateLog
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local Misc = require(game.ReplicatedStorage.Configs.Misc)
local MainFrame = script.Parent.MainFrame
local UpdateButton = script.Parent.Parent:WaitForChild("SideDock"):WaitForChild("TokensContainer"):WaitForChild("UpdateButton")
repeat
	task.wait(0.5)
until LocalPlayer:FindFirstChild("ProfileLoaded")
Tween:AddButton(UpdateButton, MainFrame)
Tween:AddButton(MainFrame.Exit, MainFrame)
task.wait(0.1)
local v1 = ClientState.GetData()
if v1.Tutorial or v1.Playtime >= 100 then
	if v1.UpdateLog and v1.UpdateLog == Misc.OnUpdate then
		return
	end
elseif v1.UpdateLog == Misc.OnUpdate then
	return
end
Tween:AddButton("Open", MainFrame)
UpdateLog:FireServer()