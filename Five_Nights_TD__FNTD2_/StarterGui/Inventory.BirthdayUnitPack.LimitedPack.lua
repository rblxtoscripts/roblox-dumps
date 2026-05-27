-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = game.Players.LocalPlayer
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Robux = require(game.ReplicatedStorage.Configs.Robux)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
require(game.ReplicatedStorage.Libs.Formatter)
local v1 = script.Parent
function update() --[[ update | Line: 12 | Upvalues: ClientState (copy), v1 (copy) ]]
	local v12 = ClientState.GetData()
	v1.BuyCoins.Info.Text = "$" .. (if v12.BoughtBDBashPresent then v12.BoughtBDBashPresent else 0) * 75000 + 130000
end
v1.Buy.MouseButton1Click:Connect(function() --[[ Line: 23 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.BirthdayBashBonnie)
end)
pcall(function() --[[ Line: 26 | Upvalues: v1 (copy), MarketplaceService (copy), Robux (copy) ]]
	v1.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.BirthdayBashBonnie, Enum.InfoType.Product).PriceInRobux)
end)
v1.BuyCoins.MouseButton1Click:Connect(function() --[[ Line: 31 ]]
	game.ReplicatedStorage.Remotes.Misc.LimitedExclusivePack:FireServer("BDBashPresent")
end)
game.ReplicatedStorage.Remotes.Misc.StardropRemote.OnClientEvent:Connect(function() --[[ Line: 35 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
update()
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.Buy)
Tween:AddButton(v1.BuyCoins)
game.ReplicatedStorage.Remotes.Misc.LimitedExclusivePack.OnClientEvent:Connect(update)