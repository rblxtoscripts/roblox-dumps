-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = game.Players.LocalPlayer
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Robux = require(game.ReplicatedStorage.Configs.Robux)
local v1 = script.Parent
function init() --[[ init | Line: 10 | Upvalues: v1 (copy), Tween (copy), MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	for k, v in pairs(v1:GetChildren()) do
		if string.find(v.Name, "Buy") then
			Tween:AddButton(v.Buy)
			Tween:AddButton(v.BuyCoins)
			v.Buy.MouseButton1Click:Connect(function() --[[ Line: 15 | Upvalues: MarketplaceService (ref), LocalPlayer (ref), Robux (ref), v (copy) ]]
				MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products["Birthday" .. v.Name])
			end)
			v.BuyCoins.MouseButton1Click:Connect(function() --[[ Line: 18 | Upvalues: v (copy) ]]
				game.ReplicatedStorage.Remotes.Misc.BirthdayPresents:FireServer(v.Name)
			end)
			pcall(function() --[[ Line: 21 | Upvalues: v (copy), MarketplaceService (ref), Robux (ref) ]]
				v.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products["Birthday" .. v.Name], Enum.InfoType.Product).PriceInRobux)
			end)
		end
	end
end
game.ReplicatedStorage.Remotes.Misc.BirthdayPresents.OnClientEvent:Connect(function(p1) --[[ Line: 29 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
init()
Tween:AddButton(v1.Exit, v1)