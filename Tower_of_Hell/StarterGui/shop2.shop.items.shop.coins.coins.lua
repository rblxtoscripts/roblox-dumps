-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = script:FindFirstAncestorOfClass("ScreenGui")
local gridLayoutHelper = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
function isOpen() --[[ isOpen | Line: 9 ]]
	local v1 = script
	while not v1:FindFirstChild("open") do
		v1 = v1.Parent
	end
	return v1.open.Value
end
local function buyProduct(p1) --[[ buyProduct | Line: 19 ]]
	if p1:FindFirstChild("productId") then
		game.ReplicatedStorage.Remotes.Economy.buyDeveloperProduct:InvokeServer(p1.productId.Value)
	else
		game.ReplicatedStorage.Remotes.Economy.buyGamepass:InvokeServer(p1.gamepassId.Value)
	end
end
local function f2() --[[ Line: 5 | Upvalues: gridLayoutHelper (copy) ]]
	gridLayoutHelper(script.Parent)
end
for k, v in pairs(script.Parent:GetChildren()) do
	if v:IsA("GuiBase") then
		v.InputBegan:Connect(function(p1) --[[ Line: 29 | Upvalues: v (copy), buyProduct (copy) ]]
			if p1.UserInputType == Enum.UserInputType.MouseMovement then
				script.Parent.Parent.selected.Value = v
				return
			end
			if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
				return
			end
			buyProduct(v)
		end)
		v.InputEnded:Connect(function(p1) --[[ Line: 36 | Upvalues: v (copy) ]]
			if p1.UserInputType ~= Enum.UserInputType.MouseMovement or script.Parent.Parent.selected.Value ~= v then
				return
			end
			script.Parent.Parent.selected.Value = nil
		end)
		v.TouchTap:Connect(function() --[[ Line: 41 | Upvalues: v (copy), buyProduct (copy) ]]
			if not v:FindFirstChild("info") then
				buyProduct(v)
				return
			end
			if math.floor(v.info.Position.Y.Scale * 100 + 0.5) == -55 then
				buyProduct(v)
			else
				script.Parent.Parent.selected.Value = v
			end
		end)
		spawn(function() --[[ Line: 48 | Upvalues: v (copy) ]]
			local productId = v:FindFirstChild("productId")
			local price = (v:FindFirstChild("info") or v).price
			if productId then
				price.Text = game:GetService("MarketplaceService"):GetProductInfo(v.productId.Value, Enum.InfoType.Product).PriceInRobux .. " R$"
			else
				price.Text = game:GetService("MarketplaceService"):GetProductInfo(v.gamepassId.Value, Enum.InfoType.GamePass).PriceInRobux .. " R$"
			end
		end)
		v.Changed:Connect(f2)
	end
end
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 62 | Upvalues: buyProduct (copy) ]]
	local selected = script.Parent.Parent.selected.Value
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.ButtonX or (not selected or (selected.Parent ~= script.Parent or not isOpen())) then
		return
	end
	buyProduct(script.Parent.Parent.selected.Value)
end)
script.Parent.Parent.selected.Changed:Connect(function() --[[ Line: 72 | Upvalues: TweenService (copy), v1 (copy) ]]
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
			v.yxles.yxle.Visible = true
			v.yxles.box.Visible = false
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
	local controller = v1.controller.Value
	selected.yxles.yxle.Visible = not controller
	selected.yxles.box.Visible = controller
end)
script.Parent.DescendantAdded:Connect(f2)
script.Parent.DescendantRemoving:Connect(f2)
gridLayoutHelper(script.Parent)