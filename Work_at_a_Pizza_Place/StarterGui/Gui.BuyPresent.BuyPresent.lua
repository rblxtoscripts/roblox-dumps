-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Queue")
local v1 = Library:Load("Network")
game:GetService("AdService")
game:GetService("CollectionService")
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v2 = script.Parent
require(game.ReplicatedStorage:WaitForChild("Enums"))
require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Buttons = v2:WaitForChild("Body"):WaitForChild("Buttons")
local Ad = Buttons:WaitForChild("Ad")
local Buy = Buttons:WaitForChild("Buy")
Ad.Visible = false
local v3 = GuiManager:RegisterWindow(v2, "Left", "Right")
v3.FirstSelectedObject = Buy
v3.UseCursor = true
local v4 = nil
local v5 = require(game.ReplicatedStorage:WaitForChild("Enums"))
Buy.MouseButton1Click:Connect(function() --[[ Line: 96 | Upvalues: v3 (copy), v4 (ref) ]]
	v3:SetVisible(false)
	workspace.Main.BuyPresentCoins:InvokeServer(nil, v4)
end)
v1:BindEvents({
	PromptPresentPurchase = function(p1) --[[ PromptPresentPurchase | Line: 110 | Upvalues: Buy (copy), v5 (copy), v2 (copy), v4 (ref), Ad (copy), v3 (copy) ]]
		Buy.Foreground.TextLabel.Text = v5.FormatNumber("Number", tonumber(v5.PresentData[p1].Price), Buy.Foreground.TextLabel) or v5.PresentData[p1].Price
		v2.PresentImage.Image = v5.PresentData[p1].ToolIcon
		v2.PresentName.Text = v5.PresentData[p1].Name
		v4 = p1
		Ad.Visible = if p1 == "Normal" then workspace:GetAttribute("AdAvailable") else false
		v3:SetVisible(true)
	end
})