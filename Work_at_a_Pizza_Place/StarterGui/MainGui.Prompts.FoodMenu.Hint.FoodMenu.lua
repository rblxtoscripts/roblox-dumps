-- https://lua.expert/
local v1 = script.Parent.Parent
local Label = script.Parent:WaitForChild("Label")
require(game.ReplicatedStorage:WaitForChild("Enums"))
v1:WaitForChild("CheesePizza")
v1:WaitForChild("SausagePizza")
v1:WaitForChild("PepperoniPizza")
v1:WaitForChild("MountainDew")
function tween() --[[ tween | Line: 11 ]]
	script.Parent.Parent.Position = UDim2.new(0, -415, 1, -165)
	script.Parent.Parent:TweenPosition(UDim2.new(0.5, -200, 1, -165), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true)
end
function buttonPressed(p1) --[[ buttonPressed | Line: 16 | Upvalues: Label (copy) ]]
	workspace.GameService.OrderChosen:FireServer(p1.Name)
	SetButtonsVisible(false)
	Label.Text = "Tell The Cashier Your Order"
	tween()
end
function SetButtonsVisible(p1) --[[ SetButtonsVisible | Line: 23 | Upvalues: v1 (copy) ]]
	for i, v in ipairs(v1:GetChildren()) do
		if v:IsA("ImageButton") then
			v.Visible = p1
		end
	end
end
workspace.GameService.FoodMenuVisible.OnClientEvent:connect(function(p1, p2, p3) --[[ Line: 32 | Upvalues: v1 (copy), Label (copy) ]]
	if _G.GamepadEnabled then
		return
	end
	v1.Visible = p1
	if not p1 then
		return
	end
	if p2 and not p3 then
		SetButtonsVisible(true)
		Label.Text = "Choose your order. Each item cost 100 Coins."
		return
	end
	if p3 then
		SetButtonsVisible(false)
		Label.Text = "You are limited to 3 orders every 10 minutes."
		return
	end
	SetButtonsVisible(false)
	Label.Text = "You need 100 Coins to order food."
end)
workspace.GameService.NofityFoodOrderComplete.OnClientEvent:connect(function(p1, p2, p3) --[[ Line: 54 | Upvalues: Label (copy) ]]
	if p2 ~= nil then
		return
	end
	if p1 then
		Label.Text = "The cashier messed up your order. Try again."
		tween()
		wait(5)
	else
		Label.Text = "Order Complete!"
		tween()
		wait(6)
	end
	if p3 then
		SetButtonsVisible(false)
		Label.Text = "You are limited to 3 orders every 10 minutes."
	else
		SetButtonsVisible(true)
		Label.Text = "Choose your order. Each item cost 100 Coins."
	end
end)
for i, v in ipairs(v1:GetChildren()) do
	if v:IsA("ImageButton") then
		v.MouseButton1Click:connect(function() --[[ Line: 80 | Upvalues: v (copy) ]]
			buttonPressed(v)
		end)
	end
end