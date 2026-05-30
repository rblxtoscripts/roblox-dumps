-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local LocalPlayer = Players.LocalPlayer
local ExclusivePresentFrame = script.Parent.ExclusivePresentFrame
local Tween = require(ReplicatedStorage.Libs.Tween)
local Robux = require(ReplicatedStorage.Configs.Robux)
ExclusivePresentFrame.Buy1.Buy.MouseButton1Click:Connect(function() --[[ Line: 12 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ExclusivePresent1_1)
end)
ExclusivePresentFrame.Buy10.Buy.MouseButton1Click:Connect(function() --[[ Line: 15 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ExclusivePresent1_2)
end)
ExclusivePresentFrame.Buy50.Buy.MouseButton1Click:Connect(function() --[[ Line: 18 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.ExclusivePresent1_3)
end)
Tween:AddButton(ExclusivePresentFrame.Buy1.Buy, nil, "ButtonClick")
Tween:AddButton(ExclusivePresentFrame.Buy10.Buy, nil, "ButtonClick")
Tween:AddButton(ExclusivePresentFrame.Buy50.Buy, nil, "ButtonClick")
Tween:AddButton(ExclusivePresentFrame.Exit, ExclusivePresentFrame, "ButtonClick")