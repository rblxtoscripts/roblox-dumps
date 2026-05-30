-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = game.Players.LocalPlayer
local v1 = script.Parent
local Tween = require(game.ReplicatedStorage.Libs.Tween)
game.ReplicatedStorage.Remotes.Misc.UGCTouch.OnClientEvent:Connect(function() --[[ Line: 9 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
v1.CharactersFrame.Buy1.Buy.MouseButton1Click:Connect(function() --[[ Line: 15 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptBundlePurchase(LocalPlayer, 517597)
end)
v1.CharactersFrame.Buy2.Buy.MouseButton1Click:Connect(function() --[[ Line: 18 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptBundlePurchase(LocalPlayer, 524797)
end)
v1.CharactersFrame.Buy3.Buy.MouseButton1Click:Connect(function() --[[ Line: 21 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptBundlePurchase(LocalPlayer, 457402)
end)
v1.CharactersFrame.Buy4.Buy.MouseButton1Click:Connect(function() --[[ Line: 24 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptBundlePurchase(LocalPlayer, 497701)
end)
v1.CharactersFrame.Buy5.Buy.MouseButton1Click:Connect(function() --[[ Line: 27 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptBundlePurchase(LocalPlayer, 451102)
end)
v1.PlushiesFrame.Buy1.Buy.MouseButton1Click:Connect(function() --[[ Line: 31 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptPurchase(LocalPlayer, 18773521988)
end)
v1.PlushiesFrame.Buy2.Buy.MouseButton1Click:Connect(function() --[[ Line: 34 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptPurchase(LocalPlayer, 18773255385)
end)
v1.PlushiesFrame.Buy3.Buy.MouseButton1Click:Connect(function() --[[ Line: 37 | Upvalues: MarketplaceService (copy), LocalPlayer (copy) ]]
	MarketplaceService:PromptPurchase(LocalPlayer, 18802004612)
end)
v1.Characters.MouseButton1Click:Connect(function() --[[ Line: 41 | Upvalues: v1 (copy) ]]
	v1.CharactersFrame.Visible = true
	v1.PlushiesFrame.Visible = false
end)
v1.Plushies.MouseButton1Click:Connect(function() --[[ Line: 45 | Upvalues: v1 (copy) ]]
	v1.CharactersFrame.Visible = false
	v1.PlushiesFrame.Visible = true
end)
v1.CharactersFrame.Visible = true
v1.PlushiesFrame.Visible = false
Tween:AddButton(v1.Characters)
Tween:AddButton(v1.Plushies)
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.CharactersFrame.Buy1.Buy)
Tween:AddButton(v1.CharactersFrame.Buy2.Buy)
Tween:AddButton(v1.CharactersFrame.Buy3.Buy)
Tween:AddButton(v1.CharactersFrame.Buy4.Buy)
Tween:AddButton(v1.CharactersFrame.Buy5.Buy)
Tween:AddButton(v1.PlushiesFrame.Buy1.Buy)
Tween:AddButton(v1.PlushiesFrame.Buy2.Buy)
Tween:AddButton(v1.PlushiesFrame.Buy3.Buy)