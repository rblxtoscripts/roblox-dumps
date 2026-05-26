-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local v2 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
PlayerGui:WaitForChild("Gui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
local v3 = require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Message = v2:WaitForChild("DescriptionScrollingFrame"):WaitForChild("Description"):WaitForChild("Message")
if _G.GamepadEnabled then
	v2.UIScale.Scale = 1.3
end
local v4 = GuiManager:RegisterWindow(v2, "Left", "Right")
v4.UseCursor = true
local v5 = nil
local v6 = nil
local v7 = nil
local v8 = nil
function ShowGamePass(p1, p2) --[[ ShowGamePass | Line: 33 | Upvalues: v3 (copy), v4 (copy), v5 (ref), v6 (ref), v7 (ref), v8 (ref), v2 (copy), Message (copy) ]]
	if v3.Bundles[p1] then
		workspace.Main.ShowBundle:Fire(p1)
		return
	end
	local v1
	if not p2 then
		workspace.Main.OpenCatalogTab.OpenCatalogTab:Fire("GamePasses")
	end
	v4:SetVisible(true)
	v1 = v3.GamePasses[p1]
	v5 = v1.ProductId
	v6 = v1.Name
	v7 = v1.Owned
	v8 = v1.Description
	v2.Buy.Visible = not v7
	v2.GamepassImage.Image = "rbxassetid://" .. v1.ImageId
	v2.Price.Text = v3.FormatNumber("Number", game.ReplicatedStorage:GetAttribute(p1), v2.Price) or "???"
	v2.Title.Text = v6
	Message.Text = v3.GamepassDescriptions[p1]
	v2.DescriptionScrollingFrame.CanvasSize = UDim2.new(0, 0, 3, 0)
	wait()
	v2.DescriptionScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, game:GetService("TextService"):GetTextSize(Message.Text, Message.TextSize, Message.Font, Message.AbsoluteSize).Y)
end
workspace.Main.ShowGamePassPrompt.ShowGamePassPrompt.OnClientEvent:Connect(ShowGamePass)
workspace.Main.ShowGamePassPrompt.Event:Connect(ShowGamePass)
workspace.Main.ProductPurchaseComplete.OnClientEvent:Connect(function() --[[ Line: 85 | Upvalues: v4 (copy) ]]
	v4:SetVisible(false)
end)
v2.Buy.Text = "Buy"
v2.Buy.MouseButton1Click:Connect(function() --[[ Line: 92 | Upvalues: v7 (ref), Dialog (copy), v6 (ref), v1 (copy), v3 (copy), v5 (ref), LocalPlayer (copy) ]]
	if v7 then
		Dialog:ShowMessage("Already owned", "You already own this gamepass")
		return
	end
	if not _G.StartedPlaying then
		Dialog:ShowMessage("Error", "You cannot buy items right now. Try rejoining the game.")
		return
	end
	if v6 == "Pontoon Boat" and (not v1:SendData("GetSettings", "PlayerChannel", 10).WaterEnabled and Dialog:GetChoice("Swimmable water", "You must have swimmable water enabled to buy the boat. Would you like to enabled it now?", "Yes", "No")) then
		workspace.Main.ChangeSetting:Fire("WaterEnabled", true)
	end
	if v3.FreeMode then
		workspace.Main.FreeProducts:FireServer(v5)
	else
		game:GetService("MarketplaceService"):PromptGamePassPurchase(LocalPlayer, v5)
	end
end)