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
	v1.BuyCoins.Info.Text = "$" .. (if v12.BoughtWarpseerPresent then v12.BoughtWarpseerPresent else 0) * 100000 + 210000
end
function updateTokens() --[[ updateTokens | Line: 23 ]] end
v1.Buy.MouseButton1Click:Connect(function() --[[ Line: 28 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.WarpseerPresentPack)
end)
pcall(function() --[[ Line: 31 | Upvalues: v1 (copy), MarketplaceService (copy), Robux (copy) ]]
	v1.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.WarpseerPresentPack, Enum.InfoType.Product).PriceInRobux)
end)
v1.BuyCoins.MouseButton1Click:Connect(function() --[[ Line: 37 ]]
	game.ReplicatedStorage.Remotes.Misc.LimitedExclusivePack:FireServer()
end)
game.ReplicatedStorage.Remotes.Misc.LimitedExclusivePackTouch.OnClientEvent:Connect(function() --[[ Line: 41 | Upvalues: v1 (copy), Tween (copy) ]]
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
game.ReplicatedStorage.Remotes.PlayerData.UpdateData.OnClientEvent:Connect(updateTokens)