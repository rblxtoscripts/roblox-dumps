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
function isOpen() --[[ isOpen | Line: 12 ]]
	local v1 = script
	while not v1:FindFirstChild("open") do
		v1 = v1.Parent
	end
	return v1.open.Value
end
local function createItem(p1, p2) --[[ createItem | Line: 22 ]]
	local v1 = script.template:Clone()
	v1.Name = p1.Name
	v1.method.Value = p2
	v1.item.Value = p1
	v1.Parent = script.Parent
	return v1
end
for k, v in pairs(v2:GetChildren()) do
	if not v.Configuration.hidden.Value then
		if v.Configuration:FindFirstChild("price") then
			local v3 = script.template:Clone()
			v3.Name = v.Name
			v3.method.Value = "regular"
			v3.item.Value = v
			v3.Parent = script.Parent
		end
		if v.Configuration:FindFirstChild("productId") then
			local v4 = script.template:Clone()
			v4.Name = v.Name
			v4.method.Value = "product"
			v4.item.Value = v
			v4.Parent = script.Parent
		end
		if v.Configuration:FindFirstChild("subscriptionPrice") then
			local v5 = script.template:Clone()
			v5.Name = v.Name
			v5.method.Value = "subscribed"
			v5.item.Value = v
			v5.Parent = script.Parent
		end
	end
end
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 47 ]]
	local selected = script.Parent.Parent.selected.Value
	if p1.KeyCode ~= Enum.KeyCode.ButtonX or (not selected or (selected.Parent ~= script.Parent or not isOpen())) then
		return
	end
	selected.buy:Invoke()
end)
script.Parent.Parent.selected.Changed:Connect(function() --[[ Line: 54 | Upvalues: TweenService (copy), v1 (copy) ]]
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
local gridLayoutHelper = require(game.ReplicatedStorage.Library.Utility.gridLayoutHelper)
local function f6() --[[ Line: 70 | Upvalues: gridLayoutHelper (copy) ]]
	gridLayoutHelper(script.Parent)
end
script.Parent.DescendantAdded:Connect(f6)
script.Parent.DescendantRemoving:Connect(f6)
gridLayoutHelper(script.Parent)