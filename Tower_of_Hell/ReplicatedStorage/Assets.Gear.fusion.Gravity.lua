-- https://lua.expert/
game:GetService("UserInputService")
local LocalPlayer = game.Players.LocalPlayer
local t = {}
local v1 = 0
local function updateGravity() --[[ updateGravity | Line: 8 | Upvalues: v1 (ref) ]]
	local Humanoid = script.Parent.Parent.Humanoid
	Humanoid.JumpPower = Humanoid.JumpPower - v1 + script.jumpPowerIncrease.Value
	v1 = script.jumpPowerIncrease.Value
	local Gravity = script.Parent.Handle.Gravity
	Gravity.Force = Vector3.new(0, script.Parent.mass.Value * workspace.Gravity * script.gravityDecrease.Value, 0)
end
script.Parent.Equipped:Connect(function() --[[ Line: 15 | Upvalues: updateGravity (copy), t (copy), LocalPlayer (copy) ]]
	updateGravity()
	local function f2(p1, p2) --[[ Line: 19 | Upvalues: updateGravity (ref) ]]
		if p2 ~= Enum.HumanoidStateType.Landed then
			return
		end
		updateGravity()
	end
	table.insert(t, script.Parent.Parent.Humanoid.StateChanged:connect(f2))
	local function changed() --[[ changed | Line: 24 | Upvalues: LocalPlayer (ref), updateGravity (ref) ]]
		if script.Parent.Parent ~= LocalPlayer.Character then
			return
		end
		local v1 = script.Parent.Parent.Humanoid:GetState()
		if v1 ~= Enum.HumanoidStateType.Running and (v1 ~= Enum.HumanoidStateType.RunningNoPhysics and (v1 ~= Enum.HumanoidStateType.Climbing and v1 ~= Enum.HumanoidStateType.Landed)) then
			return
		end
		updateGravity()
	end
	table.insert(t, script.gravityDecrease.Changed:Connect(changed))
	table.insert(t, script.jumpPowerIncrease.Changed:Connect(changed))
end)
function dequip() --[[ dequip | Line: 35 | Upvalues: t (copy), LocalPlayer (copy), v1 (ref) ]]
	while t[1] do
		t[1]:Disconnect()
		table.remove(t, 1)
	end
	local Humanoid = LocalPlayer.Character.Humanoid
	Humanoid.JumpPower = Humanoid.JumpPower - v1
	v1 = 0
	script.Parent.Handle.Gravity.Force = Vector3.new()
end
script.Parent.Unequipped:Connect(dequip)
script.Parent.AncestryChanged:Connect(function() --[[ Line: 46 | Upvalues: LocalPlayer (copy) ]]
	if script.Parent == LocalPlayer.Character then
		return
	end
	dequip()
end)