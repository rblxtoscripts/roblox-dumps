-- https://lua.expert/
local TweenService = game:GetService("TweenService")
local v1 = script:FindFirstAncestorOfClass("ScreenGui")
local v2 = nil
if script:GetAttribute("items") == "gears" then
	v2 = game.ReplicatedStorage.Assets.Gear
elseif script:GetAttribute("items") == "mutators" then
	v2 = game.ReplicatedStorage.Mutators
else
	error("No shop items category set")
end
local gridLayoutHelper = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function f3() --[[ Line: 13 | Upvalues: gridLayoutHelper (copy) ]]
	gridLayoutHelper(script.Parent)
end
function isOpen() --[[ isOpen | Line: 17 ]]
	local v1 = script
	while not v1:FindFirstChild("open") do
		v1 = v1.Parent
	end
	return v1.open.Value
end
local function createItem(p1, p2) --[[ createItem | Line: 27 | Upvalues: f3 (copy) ]]
	local v1 = script.template:Clone()
	v1.Name = p1.Name
	v1.method.Value = p2
	v1.item.Value = p1
	v1.Parent = script.Parent
	v1.Changed:Connect(f3)
	return v1
end
for k, v in pairs(v2:GetChildren()) do
	if not v.Configuration.hidden.Value then
		if v.Configuration:FindFirstChild("price") then
			local v4 = script.template:Clone()
			v4.Name = v.Name
			v4.method.Value = "regular"
			v4.item.Value = v
			v4.Parent = script.Parent
			v4.Changed:Connect(f3)
		end
		if v.Configuration:FindFirstChild("productId") then
			local v5 = script.template:Clone()
			v5.Name = v.Name
			v5.method.Value = "product"
			v5.item.Value = v
			v5.Parent = script.Parent
			v5.Changed:Connect(f3)
		end
		if v.Configuration:FindFirstChild("subscriptionPrice") then
			local v6 = script.template:Clone()
			v6.Name = v.Name
			v6.method.Value = "subscribed"
			v6.item.Value = v
			v6.Parent = script.Parent
			v6.Changed:Connect(f3)
		end
	end
end
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 52 ]]
	local selected = script.Parent.Parent.selected.Value
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.ButtonX or (not selected or (selected.Parent ~= script.Parent or not isOpen())) then
		return
	end
	selected.buy:Invoke()
end)
script.Parent.Parent.selected.Changed:Connect(function() --[[ Line: 62 | Upvalues: TweenService (copy), v1 (copy) ]]
	local selected = script.Parent.Parent.selected.Value
	for k, v in pairs(script.Parent:GetChildren()) do
		if v ~= selected and v:IsA("GuiBase") then
			TweenService:Create(v.info, TweenInfo.new(0.5), {
				Position = UDim2.new(0, 0, 0, 0)
			}):Play()
			v.info.xbox.Visible = false
		end
	end
	if not selected or selected.Parent ~= script.Parent then
		return
	end
	TweenService:Create(selected.info, TweenInfo.new(0.5), {
		Position = UDim2.new(0, 0, -0.55, 0)
	}):Play()
	selected.info.xbox.Visible = v1.controller.Value
end)
script.Parent.DescendantAdded:Connect(f3)
script.Parent.DescendantRemoving:Connect(f3)
gridLayoutHelper(script.Parent)