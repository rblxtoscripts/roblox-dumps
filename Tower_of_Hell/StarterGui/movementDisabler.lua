-- https://lua.expert/
local v1 = false
game:GetService("GuiService").AutoSelectGuiEnabled = false
game:GetService("ContextActionService"):BindActionAtPriority("StopMovement", function(p1, p2, p3) --[[ blockInput | Line: 8 | Upvalues: v1 (ref) ]]
	local v12 = v1
	if v12 then
		v12 = if p3.KeyCode == Enum.KeyCode.Thumbstick2 then false else not (if p3.KeyCode == Enum.KeyCode.Thumbstick1 then p3.Position.Magnitude < 0.05 else false)
	end
	return v12 and Enum.ContextActionResult.Sink or Enum.ContextActionResult.Pass
end, false, 30000, Enum.UserInputType.Gamepad1, Enum.UserInputType.Gamepad2, Enum.UserInputType.Gamepad3, Enum.UserInputType.Gamepad4)
local function disable() --[[ disable | Line: 34 | Upvalues: v1 (ref) ]]
	v1 = true
end
local function enable() --[[ enable | Line: 37 | Upvalues: v1 (ref) ]]
	v1 = false
end
local function f2() --[[ Line: 41 | Upvalues: v1 (ref) ]]
	if script.Parent.shop2.open.Value then
		if not v1 then
			v1 = true
		end
	else
		if not v1 then
			return
		end
		v1 = false
	end
end
script.Parent:WaitForChild("shop2"):WaitForChild("open").Changed:Connect(f2)
script.Parent:WaitForChild("shop_gears"):WaitForChild("open").Changed:Connect(f2)
script.Parent:WaitForChild("shop_mutators"):WaitForChild("open").Changed:Connect(f2)
script.Parent:WaitForChild("shop_coins"):WaitForChild("open").Changed:Connect(f2)