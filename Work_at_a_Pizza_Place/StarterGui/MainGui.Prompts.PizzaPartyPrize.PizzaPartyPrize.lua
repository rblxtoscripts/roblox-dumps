-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v1 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local v2 = GuiManager:RegisterWindow(v1, "Left", "Right")
workspace.Main.ShowPizzaPartyPopup.OnClientEvent:connect(function(p1, p2) --[[ Line: 15 | Upvalues: v1 (copy), v2 (copy) ]]
	v1.PrizeImage.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=" .. p1
	v1.PrizeName.Text = p2
	v2:SetVisible(true)
end)