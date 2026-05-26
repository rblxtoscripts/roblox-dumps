-- https://lua.expert/
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Network")
local v1 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local v2 = GuiManager:RegisterWindow(v1, "Left", "Right")
local Buy = v1:WaitForChild("Buy")
local Wear = v1:WaitForChild("Wear")
local v3 = nil
local v4 = nil
local v5 = 0
local v6 = true
function workspace.Main.PromptAsset.OnClientInvoke(p1, p2) --[[ Line: 23 | Upvalues: v6 (ref), v5 (ref), v1 (copy), v2 (copy), v3 (ref), v4 (ref), Wear (copy), Buy (copy), LocalPlayer (copy) ]]
	if not p2 or _G.GamepadEnabled then
		return true
	end
	v6 = true
	v5 = v5 + 1
	v1.AssetName.Text = p2.Name
	v1.Thumbnail.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=110&Height=110&AssetID=" .. p1
	v1.Price.CurrencyAmount.Text = p2.PriceInRobux
	v2:SetVisible(true)
	if v3 then
		v3:Disconnect()
	end
	if v4 then
		v4:Disconnect()
	end
	v3 = Wear.MouseButton1Click:Connect(function() --[[ Line: 44 | Upvalues: v3 (ref), v2 (ref) ]]
		v3:Disconnect()
		v2:SetVisible(false)
	end)
	v4 = Buy.MouseButton1Click:Connect(function() --[[ Line: 50 | Upvalues: v4 (ref), v6 (ref), LocalPlayer (ref), p1 (copy) ]]
		v4:Disconnect()
		v6 = false
		game:GetService("MarketplaceService"):PromptPurchase(LocalPlayer, p1)
	end)
	while v1.Visible and v5 == v5 do
		wait()
	end
	return v6
end
v1:WaitForChild("Close").MouseButton1Click:Connect(function() --[[ Line: 69 | Upvalues: v6 (ref), v2 (copy) ]]
	v6 = false
	v2:SetVisible(false)
end)