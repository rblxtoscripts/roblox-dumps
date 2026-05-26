-- https://lua.expert/
local v1 = script.Parent.Parent.Parent.Parent.Parent
local Effects = game.ReplicatedStorage:WaitForChild("Configuration"):WaitForChild("Effects")
local selected = script.Parent.Parent.selected
if game:GetService("PolicyService"):GetPolicyInfoForPlayerAsync(game.Players.LocalPlayer).ArePaidRandomItemsRestricted then
	return
end
local function buyBox(p1) --[[ buyBox | Line: 10 ]]
	if p1:FindFirstChild("productId") then
		game:GetService("MarketplaceService"):PromptProductPurchase(game.Players.LocalPlayer, p1.productId.Value)
		_G.buyingBox = true
	else
		game.ReplicatedStorage.Remotes.Economy.openBox:InvokeServer(p1.Name)
	end
end
for k, v in pairs(Effects:WaitForChild("Boxes"):GetChildren()) do
	local v2 = script.template:Clone()
	v2.Name = v.Name
	if v:FindFirstChild("productId") then
		local v3 = v:WaitForChild("productId").Value
		spawn(function() --[[ Line: 25 | Upvalues: v3 (copy), v2 (copy) ]]
			v2.price.Text = game:GetService("MarketplaceService"):GetProductInfo(v3, Enum.InfoType.Product).PriceInRobux .. "R$"
			v2.price.yxle.ImageTransparency = 1
		end)
		Instance.new("StringValue", v2.price).Name = "COLORtext"
		v2.price.TextColor3 = Color3.new(0/255, 255/255, 0/255)
		v2.LayoutOrder = 1
	else
		v2.price.Text = v:WaitForChild("boxPrice").Value
	end
	v2.boxImage.Image = v.iconBox.Value
	v2.boxImage.lid.Image = v.iconLid.Value
	v2.buy.InputBegan:Connect(function(p1) --[[ Line: 39 | Upvalues: buyBox (copy), v (copy) ]]
		if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		buyBox(v)
	end)
	v2.buy.TouchTap:Connect(function() --[[ Line: 44 | Upvalues: buyBox (copy), v (copy) ]]
		buyBox(v)
	end)
	v1.controller.Changed:Connect(function() --[[ Line: 48 | Upvalues: selected (copy), v1 (copy), v2 (copy) ]]
		local isValue = selected.Value == v1
		v2.price.box.Visible = if isValue then v1.controller.Value else isValue
		v2.price.yxle.Visible = not isValue or not v1.controller.Value
	end)
	v2.Parent = script.Parent.boxFrame
end
script.Parent.boxFrame.Regular.NextSelectionDown = script.Parent.boxFrame.Premium
script.Parent.boxFrame.Premium.NextSelectionUp = script.Parent.boxFrame.Regular
script.Parent.Parent.effects.NextSelectionUp = script.Parent.boxFrame.Premium
game:GetService("MarketplaceService").PromptProductPurchaseFinished:Connect(function() --[[ Line: 62 ]]
	_G.buyingBox = false
end)
local v4 = nil
selected.Changed:Connect(function() --[[ Line: 67 | Upvalues: v4 (ref), v1 (copy), selected (copy) ]]
	if v4 and v4.Parent == script.Parent.boxFrame then
		v4.price.box.Visible = not v1.controller.Value
		v4.price.yxle.Visible = v1.controller.Value
	end
	if selected.Value.Parent == script.Parent.boxFrame then
		selected.Value.price.box.Visible = true
		selected.Value.price.yxle.Visible = false
	end
	v4 = selected.Value
end)
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 79 | Upvalues: v1 (copy), selected (copy), buyBox (copy), Effects (copy) ]]
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if not v1.open.Value or v1.tab.Value ~= script.Parent.Parent then
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.ButtonX or selected.Value.Parent ~= script.Parent.boxFrame then
		return
	end
	buyBox(Effects.Boxes:FindFirstChild(selected.Value.Name))
end)