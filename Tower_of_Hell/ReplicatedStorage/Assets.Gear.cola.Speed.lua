-- https://lua.expert/
local LocalPlayer = game.Players.LocalPlayer
local t = {}
local v1 = 1
local function updateSpeed() --[[ updateSpeed | Line: 6 | Upvalues: v1 (ref) ]]
	local Humanoid = script.Parent.Parent.Humanoid
	Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
	v1 = script.speedMult.Value
	print("update", Humanoid.WalkSpeed)
end
script.Parent.Activated:Connect(function() --[[ Line: 13 | Upvalues: v1 (ref), t (copy), LocalPlayer (copy) ]]
	local Humanoid = script.Parent.Parent.Humanoid
	Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
	v1 = script.speedMult.Value
	print("update", Humanoid.WalkSpeed)
	local function f2(p1, p2) --[[ Line: 17 | Upvalues: v1 (ref) ]]
		if p2 ~= Enum.HumanoidStateType.Landed then
			return
		end
		local Humanoid = script.Parent.Parent.Humanoid
		Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
		v1 = script.speedMult.Value
		print("update", Humanoid.WalkSpeed)
	end
	table.insert(t, script.Parent.Parent.Humanoid.StateChanged:connect(f2))
	local function f4(p1) --[[ Line: 22 | Upvalues: v1 (ref) ]]
		if p1 ~= "WalkSpeed" then
			return
		end
		local Humanoid = script.Parent.Parent.Humanoid
		Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
		v1 = script.speedMult.Value
		print("update", Humanoid.WalkSpeed)
	end
	table.insert(t, script.Parent.Parent.Humanoid.Changed:Connect(f4))
	local function f6() --[[ Line: 27 | Upvalues: LocalPlayer (ref), v1 (ref) ]]
		if script.Parent.Parent ~= LocalPlayer.Character then
			return
		end
		local v12 = script.Parent.Parent.Humanoid:GetState()
		if v12 ~= Enum.HumanoidStateType.Running and (v12 ~= Enum.HumanoidStateType.RunningNoPhysics and (v12 ~= Enum.HumanoidStateType.Climbing and v12 ~= Enum.HumanoidStateType.Landed)) then
			return
		end
		local Humanoid = script.Parent.Parent.Humanoid
		Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value * script.speedMult.Value
		v1 = script.speedMult.Value
		print("update", Humanoid.WalkSpeed)
	end
	table.insert(t, script.speedMult.Changed:Connect(f6))
end)
function dequip() --[[ dequip | Line: 36 | Upvalues: t (copy), LocalPlayer (copy), v1 (ref) ]]
	while t[1] do
		t[1]:Disconnect()
		table.remove(t, 1)
	end
	LocalPlayer.Character.Humanoid.WalkSpeed = game.ReplicatedStorage.GameValues.globalSpeed.Value
	v1 = 1
end
script.Parent.Unequipped:Connect(dequip)
script.Parent.AncestryChanged:Connect(function() --[[ Line: 46 | Upvalues: LocalPlayer (copy) ]]
	if script.Parent == LocalPlayer.Character then
		return
	end
	dequip()
end)