-- https://lua.expert/
local MarketplaceService = game:GetService("MarketplaceService")
local LocalPlayer = game.Players.LocalPlayer
local Tween = require(game.ReplicatedStorage.Libs.Tween)
local Robux = require(game.ReplicatedStorage.Configs.Robux)
local ClientState = require(game.ReplicatedStorage.Modules.PlayerData.ClientState)
local StarterPack = script.Parent.Parent.Parent:WaitForChild("SideDock"):WaitForChild("Container"):WaitForChild("StarterPack")
local v1 = script.Parent
function Format(p1) --[[ Format | Line: 12 ]]
	return string.format("%02i", p1)
end
function convertToHMS(p1) --[[ convertToHMS | Line: 16 ]]
	local v1 = (p1 - p1 % 60) / 60
	local v2 = (v1 - v1 % 60) / 60
	return Format(v2) .. ":" .. Format(v1 - v2 * 60) .. ":" .. Format(p1 - v1 * 60)
end
function update() --[[ update | Line: 24 | Upvalues: ClientState (copy), StarterPack (copy) ]]
	local v1 = ClientState.GetData()
	StarterPack.TextLabel.Text = convertToHMS(if v1 and v1.StarterPack9 then v1.StarterPack9 + 129600 - tick() else 129600)
end
v1.Buy.MouseButton1Click:Connect(function() --[[ Line: 31 | Upvalues: ClientState (copy), MarketplaceService (copy), LocalPlayer (copy), Robux (copy) ]]
	local v1 = ClientState.GetData()
	if v1 then
		if v1.StarterPack9 and tick() - v1.StarterPack9 >= 129600 then
			return
		end
		if v1.BoughtStarterPack9 and v1.BoughtStarterPack9 >= 4 then
			return
		end
	end
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Products.StarterPack)
end)
pcall(function() --[[ Line: 38 | Upvalues: v1 (copy), MarketplaceService (copy), Robux (copy) ]]
	v1.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.StarterPack, Enum.InfoType.Product).PriceInRobux)
end)
StarterPack:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 44 | Upvalues: ClientState (copy), StarterPack (copy) ]]
	local v1 = ClientState.GetData()
	if not v1 then
		return
	end
	if not (v1.StarterPack9 and tick() - v1.StarterPack9 >= 129600 or v1.BoughtStarterPack9 and v1.BoughtStarterPack9 >= 4) then
		return
	end
	StarterPack.Visible = false
end)
StarterPack.MouseButton1Click:Connect(function() --[[ Line: 51 | Upvalues: ClientState (copy), Tween (copy), v1 (copy) ]]
	local v12 = ClientState.GetData()
	if not v12 then
		return
	end
	if not (v12.StarterPack9 and tick() - v12.StarterPack9 >= 129600 or v12.BoughtStarterPack9 and v12.BoughtStarterPack9 >= 4) then
		return
	end
	Tween:AddButton("Close", v1)
end)
coroutine.wrap(function() --[[ Line: 58 | Upvalues: ClientState (copy), StarterPack (copy), Tween (copy), v1 (copy) ]]
	repeat
		local v12 = ClientState.GetData()
		if v12 then
			if v12.StarterPack9 and tick() - v12.StarterPack9 >= 129600 then
				break
			end
			if v12.BoughtStarterPack9 and v12.BoughtStarterPack9 >= 4 then
				break
			end
		end
		update()
		task.wait(1)
	until not v12
	StarterPack.Visible = false
	Tween:AddButton("Close", v1)
end)()
Tween:AddButton(StarterPack, v1)
Tween:AddButton(v1.Exit, v1)
Tween:AddButton(v1.Buy)