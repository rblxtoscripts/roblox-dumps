-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = script.Parent.Parent.Parent.Parent.Parent
local uiStyle = v1.Parent:WaitForChild("uiStyle")
uiStyle:WaitForChild("AccentColor")
local v2 = game.ReplicatedStorage.data:WaitForChild(game.Players.LocalPlayer.UserId)
local function buyProduct(p1) --[[ buyProduct | Line: 14 | Upvalues: v2 (copy) ]]
	if not (v2.subscription.Value - os.time() > 5259600) then
		game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(p1.productId.Value)
	end
end
for k, v in pairs({
	[998414382] = {
		length = "One Week",
		backpic = "rbxassetid://5151622718",
		pic = "rbxassetid://5151623472"
	},
	[998861127] = {
		length = "One Month",
		backpic = "rbxassetid://5152710246",
		pic = "rbxassetid://5152710338"
	}
}) do
	local v3 = script.Template:Clone()
	v3.Name = k
	v3.productId.Value = k
	v3.length.Text = v.length
	v3.ImageLabel.Image = v.pic
	v3.ImageLabelBack.Image = v.backpic
	v3.ImageLabelBack.ImageColor3 = uiStyle.AccentColor.Value
	v3.Parent = script.Parent
	v3.InputBegan:Connect(function(p1) --[[ Line: 28 | Upvalues: v3 (copy), v2 (copy) ]]
		if p1.UserInputType == Enum.UserInputType.MouseMovement then
			script.Parent.Parent.selected.Value = v3
			return
		end
		if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		if v2.subscription.Value - os.time() > 5259600 then
			return
		end
		game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(v3.productId.Value)
	end)
	v3.InputEnded:Connect(function(p1) --[[ Line: 35 | Upvalues: v3 (copy) ]]
		if p1.UserInputType ~= Enum.UserInputType.MouseMovement or script.Parent.Parent.selected.Value ~= v3 then
			return
		end
		script.Parent.Parent.selected.Value = nil
	end)
	v3.TouchTap:Connect(function() --[[ Line: 40 | Upvalues: v3 (copy), v2 (copy) ]]
		if v3:FindFirstChild("info") and math.floor(v3.info.Position.Y.Scale * 100 + 0.5) ~= -55 then
			script.Parent.Parent.selected.Value = v3
			return
		end
		local v22 = v3
		if not (v2.subscription.Value - os.time() > 5259600) then
			game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(v22.productId.Value)
		end
	end)
	spawn(function() --[[ Line: 47 | Upvalues: v3 (copy) ]]
		local productId = v3:FindFirstChild("productId")
		local price = (v3:FindFirstChild("info") or v3).price
		if productId then
			price.Text = game:GetService("MarketplaceService"):GetProductInfo(v3.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
		else
			price.Text = game:GetService("MarketplaceService"):GetProductInfo(v3.gamepassId.Value, Enum.InfoType.GamePass).PriceInRobux .. " R$"
		end
	end)
end
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 59 | Upvalues: v1 (copy), v2 (copy) ]]
	local selected = script.Parent.Parent.selected.Value
	if p1.KeyCode ~= Enum.KeyCode.ButtonX or (not selected or (selected.Parent ~= script.Parent or (not v1.open.Value or v1.tab.Value ~= script.Parent.Parent))) then
		return
	end
	local selected_2 = script.Parent.Parent.selected.Value
	if v2.subscription.Value - os.time() > 5259600 then
		return
	end
	game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(selected_2.productId.Value)
end)
script.Parent.Parent.selected.Changed:Connect(function() --[[ Line: 66 | Upvalues: TweenService (copy), v1 (copy) ]]
	local selected = script.Parent.Parent.selected.Value
	for k, v in pairs(script.Parent:GetChildren()) do
		if v ~= selected and v:IsA("GuiBase") then
			if v:FindFirstChild("info") then
				TweenService:Create(v.info, TweenInfo.new(0.5), {
					Position = UDim2.new(0, 0, 0, 0)
				}):Play()
				v.info.xbox.Visible = false
				continue
			end
			v.length.box.Visible = false
		end
	end
	if not selected or selected.Parent ~= script.Parent then
		return
	end
	if selected:FindFirstChild("info") then
		TweenService:Create(selected.info, TweenInfo.new(0.5), {
			Position = UDim2.new(0, 0, -0.55, 0)
		}):Play()
		selected.info.xbox.Visible = v1.controller.Value
		return
	end
	selected.length.box.Visible = script.Parent.Parent.Parent.Parent.Parent.controller.Value
end)
local gridLayoutHelper = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function f4() --[[ Line: 93 | Upvalues: gridLayoutHelper (copy) ]]
	gridLayoutHelper(script.Parent)
end
script.Parent.DescendantAdded:Connect(f4)
script.Parent.DescendantRemoving:Connect(f4)
gridLayoutHelper(script.Parent)