-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = game.Players.LocalPlayer
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Robux = require(game.ReplicatedStorage.Configs.Robux)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local v1 = script.Parent
function update() --[[ update | Line: 11 | Upvalues: ClientState (copy), v1 (copy) ]]
	local v12 = ClientState.GetData()
	v1.BuyCoins.Info.Text = "$" .. (if v12.BoughtStardrop then v12.BoughtStardrop else 0) * 100000 + 202500
end
v1.Buy.MouseButton1Click:Connect(function() --[[ Line: 22 | Upvalues: MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.Stardrop)
end)
v1.BuyCoins.MouseButton1Click:Connect(function() --[[ Line: 25 ]]
	game.ReplicatedStorage.Remotes.Misc.LimitedExclusivePack:FireServer("Stardrop")
end)
game.ReplicatedStorage.Remotes.Misc.StardropRemote.OnClientEvent:Connect(function() --[[ Line: 29 | Upvalues: v1 (copy), Tween (copy) ]]
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