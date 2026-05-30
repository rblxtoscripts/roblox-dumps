-- https://lua.expert/
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MarketplaceService = game:GetService("MarketplaceService")
local PolicyService = game:GetService("PolicyService")
require(ReplicatedStorage.Modules.PlayerData.ClientState)
local Tween = require(ReplicatedStorage.Libs.Tween)
local Robux = require(ReplicatedStorage.Configs.Robux)
local LocalPlayer = Players.LocalPlayer
local InventoryFrame = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("Inventory"):WaitForChild("InventoryFrame")
local HolderFrame = InventoryFrame:WaitForChild("HolderFrame")
local Shop = HolderFrame:WaitForChild("Shop")
local GiftingFrame = InventoryFrame:WaitForChild("GiftingFrame")
local TowerStats = InventoryFrame:WaitForChild("TowerStats")
local GiftToPlayer = ReplicatedStorage.Remotes.Misc.GiftToPlayer
local function promptPurchase(p1) --[[ promptPurchase | Line: 21 | Upvalues: GiftingFrame (copy), GiftToPlayer (copy), MarketplaceService (copy), LocalPlayer (copy) ]]
	if GiftingFrame.GiftingTo.Value ~= "" then
		GiftToPlayer:FireServer(GiftingFrame.GiftingTo.Value)
	end
	MarketplaceService:PromptProductPurchase(LocalPlayer, p1)
end
local function promptGamepassPurchase(p1) --[[ promptGamepassPurchase | Line: 28 | Upvalues: GiftingFrame (copy), GiftToPlayer (copy), Robux (copy), MarketplaceService (copy), LocalPlayer (copy) ]]
	if GiftingFrame.GiftingTo.Value == "" then
		MarketplaceService:PromptGamePassPurchase(LocalPlayer, p1)
		return
	end
	GiftToPlayer:FireServer(GiftingFrame.GiftingTo.Value)
	local v1 = nil
	for k, v in pairs(Robux.Gamepassses) do
		if v == p1 then
			v1 = k
		end
	end
	if not (v1 and Robux.Gifts[v1]) then
		return
	end
	MarketplaceService:PromptProductPurchase(LocalPlayer, Robux.Gifts[v1])
end
local t = {
	Shop.Tokens.ScrollingFrame["1kTokens"].TextLabel,
	Shop.Tokens.ScrollingFrame["200Tokens"].TextLabel,
	Shop.Tokens.ScrollingFrame["20kTokens"].TextLabel,
	Shop.Tokens.ScrollingFrame["5kTokens"].TextLabel,
	Shop.ExclusivePresent.Buy1.TextLabel,
	Shop.ExclusivePresent.Buy10.TextLabel,
	Shop.ExclusivePresent.Buy50.TextLabel
}
function giftingVisible(p1) --[[ giftingVisible | Line: 51 | Upvalues: InventoryFrame (copy), Players (copy), GiftingFrame (copy), Shop (copy), t (copy) ]]
	InventoryFrame.GiftingMessage.Visible = p1
	if Players:FindFirstChild(GiftingFrame.GiftingTo.Value) then
		InventoryFrame.GiftingMessage.Text = "You are currently gifting to: " .. GiftingFrame.GiftingTo.Value
	else
		InventoryFrame.GiftingMessage.Text = "You are currently gifting to: Nobody"
	end
	for k, v in pairs(Shop:GetDescendants()) do
		if v.Name == "Buy" and v:IsA("ImageButton") then
			local v3 = string.gsub(string.gsub(string.gsub(v.Info.Text, "GIFT!", ""), " %(", ""), "%)", "")
			v.Info.Text = if p1 then v3 .. " (GIFT!)" else v3
		end
	end
	for k, v in pairs(t) do
		local v7 = string.gsub(string.gsub(string.gsub(v.Text, "GIFT!", ""), " %(", ""), "%)", "")
		if p1 then
			v7 = v7 .. " (GIFT!)"
		end
		v.Text = v7
	end
end
Tween:AddButton(Shop.ExclusivePack.Buy)
Tween:AddButton(Shop.StarterPack.Buy)
Tween:AddButton(InventoryFrame.Shop)
function updateGiftingFrame() --[[ updateGiftingFrame | Line: 78 | Upvalues: GiftingFrame (copy), Players (copy), LocalPlayer (copy) ]]
	for k, v in pairs(GiftingFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("ImageLabel") and (not Players:FindFirstChild(v.Name) and v.Name ~= "Example") then
			v:Destroy()
		end
	end
	for i, v in ipairs(Players:GetPlayers()) do
		if not GiftingFrame.ScrollingFrame:FindFirstChild(v.Name) and v.Name ~= LocalPlayer.Name then
			local v1 = GiftingFrame.ScrollingFrame.Example:Clone()
			v1.Name = v.Name
			v1.PlayerName.Text = v.Name
			v1.Parent = GiftingFrame.ScrollingFrame
			v1.Visible = true
			v1.Click.MouseButton1Click:Connect(function() --[[ Line: 96 | Upvalues: GiftingFrame (ref), v (copy) ]]
				if GiftingFrame.GiftingTo.Value == v.Name then
					GiftingFrame.GiftingTo.Value = ""
					giftingVisible(false)
				else
					GiftingFrame.GiftingTo.Value = v.Name
					giftingVisible(true)
				end
			end)
		end
	end
end
GiftingFrame.GiftingTo.Changed:Connect(function() --[[ Line: 109 | Upvalues: GiftingFrame (copy) ]]
	for k, v in pairs(GiftingFrame.ScrollingFrame:GetChildren()) do
		if v:IsA("ImageLabel") and v.Name ~= "Example" then
			if v.Name == GiftingFrame.GiftingTo.Value then
				v.UIGradient.Color = GiftingFrame.ScrollingFrame.Example.UIGradient2.Color
				continue
			end
			v.UIGradient.Color = GiftingFrame.ScrollingFrame.Example.UIGradient.Color
		end
	end
end)
function initGifts() --[[ initGifts | Line: 121 | Upvalues: Shop (copy), Tween (copy), GiftingFrame (copy), ReplicatedStorage (copy), LocalPlayer (copy) ]]
	for k, v in pairs(Shop:GetDescendants()) do
		if v.Name == "Gift" and v:IsA("ImageButton") then
			Tween:AddButton(v)
			v.MouseButton1Click:Connect(function() --[[ Line: 126 | Upvalues: GiftingFrame (ref), ReplicatedStorage (ref), LocalPlayer (ref) ]]
				if GiftingFrame.Visible then
					GiftingFrame.Visible = false
					GiftingFrame.GiftingTo.Value = ""
					giftingVisible(false)
					ReplicatedStorage.Remotes.Misc.GiftToPlayer:FireServer(LocalPlayer, "None")
				else
					GiftingFrame.Visible = true
				end
			end)
		end
	end
end
Shop.ExclusivePack.Buy.MouseButton1Click:Connect(function() --[[ Line: 160 | Upvalues: promptPurchase (copy), Robux (copy) ]]
	task.spawn(promptPurchase, Robux.Products.ExclusivePack)
end)
pcall(function() --[[ Line: 163 | Upvalues: Shop (copy), MarketplaceService (copy), Robux (copy) ]]
	Shop.ExclusivePack.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ExclusivePack, Enum.InfoType.Product).PriceInRobux)
end)
Shop.ExclusivePresent.Buy1.MouseButton1Click:Connect(function() --[[ Line: 169 | Upvalues: promptPurchase (copy), Robux (copy) ]]
	task.spawn(promptPurchase, Robux.Products.ExclusivePresent1_1)
end)
pcall(function() --[[ Line: 172 | Upvalues: Shop (copy), MarketplaceService (copy), Robux (copy) ]]
	Shop.ExclusivePresent.Buy1.TextLabel.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ExclusivePresent1_1, Enum.InfoType.Product).PriceInRobux)
end)
Shop.ExclusivePresent.Buy10.MouseButton1Click:Connect(function() --[[ Line: 177 | Upvalues: promptPurchase (copy), Robux (copy) ]]
	task.spawn(promptPurchase, Robux.Products.ExclusivePresent1_2)
end)
pcall(function() --[[ Line: 180 | Upvalues: Shop (copy), MarketplaceService (copy), Robux (copy) ]]
	Shop.ExclusivePresent.Buy10.TextLabel.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ExclusivePresent1_2, Enum.InfoType.Product).PriceInRobux)
end)
Shop.ExclusivePresent.Buy50.MouseButton1Click:Connect(function() --[[ Line: 185 | Upvalues: promptPurchase (copy), Robux (copy) ]]
	task.spawn(promptPurchase, Robux.Products.ExclusivePresent1_3)
end)
pcall(function() --[[ Line: 188 | Upvalues: Shop (copy), MarketplaceService (copy), Robux (copy) ]]
	Shop.ExclusivePresent.Buy50.TextLabel.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.ExclusivePresent1_3, Enum.InfoType.Product).PriceInRobux)
end)
Shop.StarterPack.Buy.MouseButton1Click:Connect(function() --[[ Line: 194 | Upvalues: promptPurchase (copy), Robux (copy) ]]
	task.spawn(promptPurchase, Robux.Products.StarterPack)
end)
pcall(function() --[[ Line: 197 | Upvalues: Shop (copy), MarketplaceService (copy), Robux (copy) ]]
	Shop.StarterPack.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products.StarterPack, Enum.InfoType.Product).PriceInRobux)
end)
InventoryFrame.Shop.MouseButton1Click:Connect(function() --[[ Line: 203 | Upvalues: HolderFrame (copy), Shop (copy), TowerStats (copy), InventoryFrame (copy) ]]
	HolderFrame.Units.Visible = false
	HolderFrame.Items.Visible = false
	HolderFrame.Teams.Visible = false
	Shop.Visible = true
	TowerStats.Visible = false
	InventoryFrame.OpenPresent.Visible = false
	InventoryFrame.UnequipAll.Visible = false
	InventoryFrame.Teams.Visible = false
	InventoryFrame.Search.Visible = false
end)
for v1, v2 in Shop.Tokens.ScrollingFrame:GetChildren() do
	if v2:IsA("ImageButton") then
		Tween:AddButton(v2, nil, nil, nil, true)
		v2.MouseButton1Click:Connect(function() --[[ Line: 220 | Upvalues: PolicyService (copy), LocalPlayer (copy), promptPurchase (copy), Robux (copy), v2 (copy) ]]
			local v1, v22 = pcall(function() --[[ Line: 222 | Upvalues: PolicyService (ref), LocalPlayer (ref) ]]
				return PolicyService:GetPolicyInfoForPlayerAsync(LocalPlayer)
			end)
			if not v1 then
				warn("PolicyService error: " .. v22)
				return
			end
			if v22.ArePaidRandomItemsRestricted then
				game.ReplicatedStorage.Remotes.Misc.Alert.Bindable:Fire("Your region doesn\'t allow you to buy this!")
			else
				task.spawn(promptPurchase, Robux.Products[v2.Name])
			end
		end)
		pcall(function() --[[ Line: 235 | Upvalues: v2 (copy), MarketplaceService (copy), Robux (copy) ]]
			v2.Robux.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products[v2.Name], Enum.InfoType.Product).PriceInRobux)
		end)
	end
end
for k, v in pairs(Shop.Tickets:GetChildren()) do
	Tween:AddButton(v.Buy)
	v.Buy.MouseButton1Click:Connect(function() --[[ Line: 245 | Upvalues: promptPurchase (copy), Robux (copy), v (copy) ]]
		task.spawn(promptPurchase, Robux.Products[v.Name])
	end)
	pcall(function() --[[ Line: 248 | Upvalues: v (copy), MarketplaceService (copy), Robux (copy) ]]
		v.Buy.Info.Text = ("R$ %*"):format(MarketplaceService:GetProductInfo(Robux.Products[v.Name], Enum.InfoType.Product).PriceInRobux)
	end)
end
Tween:AddButton(Shop.ExclusivePresent.Buy1)
Tween:AddButton(Shop.ExclusivePresent.Buy10)
Tween:AddButton(Shop.ExclusivePresent.Buy50)
updateGiftingFrame()
initGifts()
Players.PlayerAdded:Connect(updateGiftingFrame)
Players.PlayerRemoving:Connect(updateGiftingFrame)