-- https://lua.expert/
local function OnClientInvoke() --[[ OnClientInvoke | Line: 2 ]]
	return os.time()
end
workspace.Main.GetLocalTime.OnClientInvoke = OnClientInvoke
local Library = require(game.ReplicatedStorage:WaitForChild("Library"))
Library:Load("Utility")
Library:Load("Events")
local v1 = Library:Load("SoundFX")
Library:Load("Date")
Library:Load("Queue")
local v2 = Library:Load("Network")
local v3 = script.Parent
local PlayerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
PlayerGui:WaitForChild("MainGui")
PlayerGui:WaitForChild("GuiTop")
local GuiManager = require(PlayerGui:WaitForChild("GuiManager"))
local UIEvents = PlayerGui:WaitForChild("UIEvents")
require(game.ReplicatedStorage:WaitForChild("Enums"))
local Dialog = require(game.ReplicatedStorage:WaitForChild("Dialog"))
local Title = v3:WaitForChild("Title")
local List = v3:WaitForChild("List")
local BuyCoins = List:WaitForChild("Coins"):WaitForChild("BuyCoins")
local BuyRobux = List:WaitForChild("Robux"):WaitForChild("BuyRobux")
local Price = List.Coins:WaitForChild("Price")
local Price_2 = List.Robux:WaitForChild("Price")
local AssetImage = List:WaitForChild("AssetImage")
local VideoFrame = List:WaitForChild("VideoFrame")
VideoFrame.Playing = false
local v4 = GuiManager:RegisterWindow(v3, "Left", "Right", 0.3)
v4.FirstSelectedObject = BuyRobux
local v5 = nil
local v6 = nil
function Show(p1) --[[ Show | Line: 44 | Upvalues: v5 (ref), v6 (ref), v4 (copy), VideoFrame (copy), AssetImage (copy), Price (copy), Price_2 (copy), Title (copy), BuyRobux (copy), BuyCoins (copy), Dialog (copy), v2 (copy), v1 (copy), GuiManager (copy) ]]
	if v5 then
		v5:Disconnect()
	end
	if v6 then
		v6:Disconnect()
	end
	v4:SetVisible(true)
	VideoFrame.Playing = true
	VideoFrame.Video = "rbxassetid://" .. p1.VideoId
	AssetImage.Image = "http://www.roblox.com/Thumbs/Asset.ashx?Width=75&Height=75&AssetID=" .. p1.ModelId or p1.AssetId
	Price.Text = p1.Price
	Price_2.Text = game.ReplicatedStorage:GetAttribute(p1.AssetId) or "???"
	Title.Text = p1.Name
	v6 = BuyRobux.MouseButton1Click:Connect(function() --[[ Line: 61 | Upvalues: p1 (copy) ]]
		game:GetService("MarketplaceService"):PromptProductPurchase(game.Players.LocalPlayer, p1.ProductId)
	end)
	v5 = BuyCoins.MouseButton1Click:Connect(function() --[[ Line: 65 | Upvalues: Dialog (ref), p1 (copy), v2 (ref), v1 (ref), GuiManager (ref) ]]
		if not Dialog:GetChoice(p1.Name, tostring(p1.Price), "Buy", "Cancel") then
			return
		end
		if not v2:InvokeServer("BuyCatalogItem", tonumber(p1.AssetId), 1) then
			return
		end
		v1:PlaySound("CashRegister")
		GuiManager:GetWindowDataByName("ItemAdvertisement"):SetVisible(false)
		GuiManager:GetWindowDataByName("Catalog"):SetVisible(false)
	end)
end
workspace.Main.ShowItemAdvertisement.ShowItemAdvertisement.Event:Connect(Show)
workspace.Main.ShowItemAdvertisement.OnClientEvent:Connect(Show)
UIEvents.WindowVisibilityChanged.Event:connect(function(p1, p2) --[[ Line: 82 | Upvalues: v3 (copy), VideoFrame (copy) ]]
	if p1 ~= v3 or p2 then
		return
	end
	VideoFrame.Playing = false
end)
v2:BindEvents({
	PreloadVideo = function(p1) --[[ PreloadVideo | Line: 90 | Upvalues: VideoFrame (copy) ]]
		VideoFrame.Video = "rbxassetid://" .. p1
		VideoFrame.Playing = false
		game:GetService("ContentProvider"):PreloadAsync({ VideoFrame })
	end
})