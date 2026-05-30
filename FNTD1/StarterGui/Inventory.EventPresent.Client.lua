-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = game.Players.LocalPlayer
local EventPresent = game.ReplicatedStorage.Remotes.Misc.EventPresent
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Robux = require(game.ReplicatedStorage.Configs.Robux)
require(game.ReplicatedStorage.Configs.Misc)
require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
require(game.ReplicatedStorage.Libs.Formatter)
local v1 = script.Parent
function init() --[[ init | Line: 14 | Upvalues: v1 (copy), Robux (copy), Tween (copy), MarketplaceService (copy), LocalPlayer (copy) ]]
	for k, v in pairs(v1.Main:GetChildren()) do
		if Robux.Products[v.Name] then
			Tween:AddButton(v)
			Tween:AddButton(v.Buy)
			local function buy() --[[ buy | Line: 19 | Upvalues: MarketplaceService (ref), LocalPlayer (ref), Robux (ref), v (copy) ]]
				MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v.Name])
			end
			v.MouseButton1Click:Connect(function() --[[ Line: 22 | Upvalues: MarketplaceService (ref), LocalPlayer (ref), Robux (ref), v (copy) ]]
				MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v.Name])
			end)
			v.Buy.MouseButton1Click:Connect(function() --[[ Line: 25 | Upvalues: MarketplaceService (ref), LocalPlayer (ref), Robux (ref), v (copy) ]]
				MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products[v.Name])
			end)
			pcall(function() --[[ Line: 28 | Upvalues: v (copy), MarketplaceService (ref), Robux (ref) ]]
				v.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products[v.Name], Enum.InfoType.Product).PriceInRobux)
			end)
		end
	end
end
EventPresent.OnClientEvent:Connect(function() --[[ Line: 36 | Upvalues: v1 (copy), Tween (copy) ]]
	if script.Parent.Parent.Parent:WaitForChild("Trade"):WaitForChild("TradeFrame").Visible then
		return
	end
	if not v1.Visible then
		Tween:AddButton("Open", v1)
	end
end)
init()
Tween:AddButton(v1.Exit, v1)