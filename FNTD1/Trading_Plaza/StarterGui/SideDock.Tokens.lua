-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local LocalPlayer = Players.LocalPlayer
local CoinsFrame = script.Parent:WaitForChild("TokensContainer"):WaitForChild("CoinsFrame")
local function updateTokens(p1) --[[ updateTokens | Line: 12 | Upvalues: CoinsFrame (copy), Formatter (copy) ]]
	if p1.Tokens < 1000 then
		CoinsFrame.TextLabel.Text = math.floor(p1.Tokens)
	else
		CoinsFrame.TextLabel.Text = Formatter.FormatCompact((math.round(p1.Tokens)))
	end
end
ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(updateTokens)
task.spawn(updateTokens, ClientState.GetData())