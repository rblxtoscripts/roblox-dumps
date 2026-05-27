-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ClientState = require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Formatter = require(ReplicatedStorage.Libs.Formatter)
local LocalPlayer = Players.LocalPlayer
local TokensContainer = script.Parent:WaitForChild("TokensContainer")
local CoinsFrame = TokensContainer:WaitForChild("CoinsFrame")
local EventCoinsFrame = TokensContainer:WaitForChild("EventCoinsFrame")
local DeathCoinsFrame = TokensContainer:WaitForChild("DeathCoinsFrame")
local function updateTokens(p1) --[[ updateTokens | Line: 14 | Upvalues: CoinsFrame (copy), Formatter (copy), EventCoinsFrame (copy), DeathCoinsFrame (copy), LocalPlayer (copy) ]]
	if p1.Tokens < 1000 then
		CoinsFrame.TextLabel.Text = math.floor(p1.Tokens)
	else
		CoinsFrame.TextLabel.Text = Formatter.FormatCompact((math.round(p1.Tokens)))
	end
	if p1["NewSummer Tokens"] < 1000 then
		EventCoinsFrame.TextLabel.Text = math.floor(p1["NewSummer Tokens"])
	else
		EventCoinsFrame.TextLabel.Text = Formatter.FormatCompact((math.round(p1["NewSummer Tokens"])))
	end
	if p1["Death Tokens"] < 1000 then
		DeathCoinsFrame.TextLabel.Text = math.floor(p1["Death Tokens"])
	else
		DeathCoinsFrame.TextLabel.Text = Formatter.FormatCompact((math.round(p1["Death Tokens"])))
	end
	if LocalPlayer:FindFirstChild("InEvent") then
		EventCoinsFrame.Visible = true
		DeathCoinsFrame.Visible = false
	else
		EventCoinsFrame.Visible = false
		DeathCoinsFrame.Visible = true
	end
end
ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(updateTokens)
LocalPlayer.ChildAdded:Connect(function() --[[ Line: 41 | Upvalues: updateTokens (copy), ClientState (copy) ]]
	updateTokens(ClientState.GetData())
end)
LocalPlayer.ChildRemoved:Connect(function() --[[ Line: 44 | Upvalues: updateTokens (copy), ClientState (copy) ]]
	updateTokens(ClientState.GetData())
end)
task.spawn(updateTokens, ClientState.GetData())