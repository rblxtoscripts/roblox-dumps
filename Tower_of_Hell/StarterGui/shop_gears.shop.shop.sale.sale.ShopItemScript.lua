-- https://lua.expert/
local uiStyle = script:FindFirstAncestorOfClass("ScreenGui").Parent:WaitForChild("uiStyle")
local v1 = script.Parent
local v2 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
v2:WaitForChild("subscription")
local coins = v2:WaitForChild("coins")
local v3 = script.Parent
while v3.Name ~= "selected" do
	v3 = if v3:FindFirstChild("selected") then v3.selected else v3.Parent
end
local function buy() --[[ buy | Line: 17 ]]
	local item = script.Parent.item.Value
	local method = script.Parent.method.Value
	local sale = script.Parent.sale.Value
	if sale then
		method = "sale"
	end
	local v1 = nil
	if item.Parent == game.ReplicatedStorage.Assets.Gear then
		v1 = "gear"
	elseif item.Parent == game.ReplicatedStorage.Mutators then
		v1 = "mutator"
	else
		error("Unknown item kind")
	end
	local buyShopItem = game.ReplicatedStorage.Remotes.Economy.buyShopItem
	local t = {
		source = "physical-shop",
		kind = v1,
		item = item.Name,
		method = method
	}
	t.sale = if sale then sale.Name else sale
	buyShopItem:InvokeServer(t)
end
script.Parent.buy.OnInvoke = buy
local function updatePrice() --[[ updatePrice | Line: 40 | Upvalues: v2 (copy), v1 (copy), uiStyle (copy), coins (copy) ]]
	if not script.Parent.item.Value then
		return
	end
	local item = script.Parent.item.Value
	local method = script.Parent.method.Value
	local sale = script.Parent.sale.Value
	local v12 = nil
	if item.Parent == game.ReplicatedStorage.Assets.Gear then
		v12 = "gear"
	elseif item.Parent == game.ReplicatedStorage.Mutators then
		v12 = "mutator"
	else
		error("Unknown item kind")
	end
	local v3 = math.min(workspace:WaitForChild("tower"):WaitForChild("sectionCount").Value - 2, game.ReplicatedStorage.Configuration.maxTowerLength.Value)
	local v4 = item:FindFirstChild("price") or v2.subscription.Value > os.time()
	if method == "product" then
		v1.Visible = not v4
	elseif method == "subscribed" then
		v1.info.yxles.Text = item.subscriptionPrice:IsA("ModuleScript") and require(item.subscriptionPrice)(v3) or item.subscriptionPrice.Value
		if v4 then
			v1.info.ImageLabel.ImageColor3 = uiStyle.AccentColor.Value
			v1.info.ImageLabel.COLORimage.Value = "AccentColor"
			v1.info.Frame.BackgroundColor3 = uiStyle.AccentColor.Value
			v1.info.Frame.COLORbackground.Value = "AccentColor"
			v1.info.nametext.TextColor3 = uiStyle.TextColor.Value
			v1.info.nametext.COLORtext.Value = "TextColor"
			v1.info.unsubscribedText.Visible = false
			v1.Visible = true
		else
			v1.info.ImageLabel.ImageColor3 = uiStyle.DisabledAccentColor.Value
			v1.info.ImageLabel.COLORimage.Value = "DisabledAccentColor"
			v1.info.Frame.BackgroundColor3 = uiStyle.DisabledAccentColor.Value
			v1.info.Frame.COLORbackground.Value = "DisabledAccentColor"
			v1.info.nametext.TextColor3 = uiStyle.DisabledTextColor.Value
			v1.info.nametext.COLORtext.Value = "DisabledTextColor"
			v1.info.unsubscribedText.Visible = true
			v1.Visible = false
		end
	else
		local v6 = v2:WaitForChild("prices"):WaitForChild(v12):WaitForChild(item.Name).Value
		local v7
		if sale then
			v6, v7 = math.round(sale.factor.Value * v6), v6
		else
			v7 = nil
		end
		v1.info.yxles.Text = v6
		if v7 then
			v1.info.regularyxles.Text = v7
		end
	end
	if not v1.info.yxles:FindFirstChild("yxle") then
		return
	end
	if v4 and (if tonumber(v1.info.yxles.Text) <= coins.Value then true else false) then
		v1.info.yxles.TextColor3 = uiStyle.TextColor.Value
		v1.info.yxles.COLORtext.Value = "TextColor"
		return
	end
	v1.info.yxles.TextColor3 = uiStyle.DisabledTextColor.Value
	v1.info.yxles.COLORtext.Value = "DisabledTextColor"
end
local function updateItem() --[[ updateItem | Line: 103 | Upvalues: v1 (copy), v2 (copy), updatePrice (copy) ]]
	if not script.Parent.item.Value then
		return
	end
	local item = script.Parent.item.Value
	local method = script.Parent.method.Value
	local v12 = nil
	if item.Parent == game.ReplicatedStorage.Assets.Gear then
		v12 = "gear"
	elseif item.Parent == game.ReplicatedStorage.Mutators then
		v12 = "mutator"
	else
		error("Unknown item kind")
	end
	v1.info.nametext.Text = item.Configuration.itemName.Value
	v1.info.ImageLabel.Image = item.Configuration.pic.Value
	v1.info.desc.Text = item.Configuration.desc.Value
	v1.LayoutOrder = item.Configuration.layoutOrder.Value
	if method == "subscribed" then
		v1.LayoutOrder = v1.LayoutOrder + 10000
	elseif method == "product" then
		v1.LayoutOrder = v1.LayoutOrder + 20000
		v1.info.unsubscribedText.Visible = false
		v1.info.yxles.yxle:Destroy()
		v1.info.yxles.Size = UDim2.new(UDim.new(1, 0), v1.info.yxles.Size.Y)
		v1.info.yxles.TextColor3 = Color3.new(0/255, 255/255, 0/255)
		spawn(function() --[[ Line: 129 | Upvalues: v1 (ref), item (copy) ]]
			v1.info.yxles.Text = game:GetService("MarketplaceService"):GetProductInfo(item.Configuration.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
		end)
	else
		v1.info.unsubscribedText.Visible = false
		v2:WaitForChild("prices"):WaitForChild(v12):WaitForChild(item.Name).Changed:Connect(updatePrice)
	end
	updatePrice()
end
v1.InputBegan:Connect(function(p1) --[[ Line: 140 | Upvalues: v3 (ref), v1 (copy), buy (copy) ]]
	if p1.UserInputType == Enum.UserInputType.MouseMovement then
		v3.Value = v1
		return
	end
	if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
		return
	end
	buy()
end)
v1.InputEnded:Connect(function(p1) --[[ Line: 147 | Upvalues: v3 (ref), v1 (copy) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseMovement or v3.Value ~= v1 then
		return
	end
	v3.Value = nil
end)
v1.TouchTap:Connect(function() --[[ Line: 152 | Upvalues: buy (copy) ]]
	buy()
end)
script.Parent.item.Changed:Connect(updateItem)
script.Parent.sale.Changed:Connect(updateItem)
coins.Changed:Connect(function() --[[ Line: 159 | Upvalues: updatePrice (copy) ]]
	updatePrice()
end)
workspace.ChildAdded:Connect(function(p1) --[[ Line: 160 | Upvalues: updatePrice (copy) ]]
	if p1.Name ~= "tower" then
		return
	end
	p1:WaitForChild("sectionCount")
	updatePrice()
end)
local v4 = v2.subscription.Value > os.time()
game:GetService("RunService").RenderStepped:Connect(function() --[[ Line: 167 | Upvalues: v4 (ref), v2 (copy), updatePrice (copy) ]]
	if v4 == (v2.subscription.Value > os.time()) then
		return
	end
	updatePrice()
	v4 = v2.subscription.Value > os.time()
end)
updateItem()