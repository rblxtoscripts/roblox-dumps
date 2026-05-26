-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Ban = v1:WaitForChild("Ban")
local DontBan = v1:WaitForChild("DontBan")
local CancelButton = v1:WaitForChild("CancelButton")
local v2 = GuiManager:RegisterWindow(v1, "Top", "Top", nil, nil, true)
v2.FirstSelectedObject = DontBan
v2:SetConsoleSize(UDim2.new(1, 0, 0, 250))
Ban.MouseButton1Click:connect(function() --[[ Line: 24 | Upvalues: v2 (copy) ]]
	v2:SetVisible(false)
	game.Workspace.Main.VotePlayers:FireServer()
end)
DontBan.MouseButton1Click:connect(function() --[[ Line: 29 | Upvalues: v2 (copy) ]]
	v2:SetVisible(false)
end)
workspace.Main.VotePlayers.OnClientEvent:connect(function(p1) --[[ Line: 34 | Upvalues: v2 (copy) ]]
	if _G.PopupsEnded then
		v2:SetVisible(true)
		script.Parent.KickPlayer.Text = p1
	end
end)
CancelButton.MouseButton1Click:connect(function() --[[ Line: 44 | Upvalues: v2 (copy) ]]
	v2:SetVisible(false)
end)