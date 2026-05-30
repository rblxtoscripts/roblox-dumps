-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local BuyExclusive = script.Parent.BuyExclusive
local BuyExclusive2 = script.Parent.BuyExclusive2
local BuyEvent = script.Parent.BuyEvent
local BuyEvent2 = script.Parent.BuyEvent2
local BuyEvent3 = script.Parent.BuyEvent3
local ExclusivePresentFrame = script.Parent.ExclusivePresentFrame
local EventPresentFrame = script.Parent.EventPresentFrame
local Tween = require(ReplicatedStorage.Libs.Tween)
local Robux = require(ReplicatedStorage.Configs.Robux)
ExclusivePresentFrame.Buy1.Buy.MouseButton1Click:Connect(function() --[[ Line: 18 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ExclusivePresent1_1)
end)
pcall(function() --[[ Line: 21 | Upvalues: ExclusivePresentFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	ExclusivePresentFrame.Buy1.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ExclusivePresent1_1, Enum.InfoType.Product).PriceInRobux)
end)
ExclusivePresentFrame.Buy10.Buy.MouseButton1Click:Connect(function() --[[ Line: 26 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ExclusivePresent1_2)
end)
pcall(function() --[[ Line: 29 | Upvalues: ExclusivePresentFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	ExclusivePresentFrame.Buy10.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ExclusivePresent1_2, Enum.InfoType.Product).PriceInRobux)
end)
ExclusivePresentFrame.Buy50.Buy.MouseButton1Click:Connect(function() --[[ Line: 34 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ExclusivePresent1_3)
end)
pcall(function() --[[ Line: 37 | Upvalues: ExclusivePresentFrame (copy), MarketplaceService (copy), Robux (copy) ]]
	ExclusivePresentFrame.Buy50.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ExclusivePresent1_3, Enum.InfoType.Product).PriceInRobux)
end)
Tween:AddButton(BuyExclusive.Buy, ExclusivePresentFrame)
Tween:AddButton(BuyExclusive2.Buy, ExclusivePresentFrame)
Tween:AddButton(ExclusivePresentFrame.Buy1.Buy)
Tween:AddButton(ExclusivePresentFrame.Buy10.Buy)
Tween:AddButton(ExclusivePresentFrame.Buy50.Buy)
Tween:AddButton(ExclusivePresentFrame.Exit, ExclusivePresentFrame)
Tween:AddButton(BuyEvent.Buy, script.Parent.EventPresent)
Tween:AddButton(BuyEvent2.Buy, script.Parent.EventPresent)
Tween:AddButton(BuyEvent3.Buy, script.Parent.EventPresent)