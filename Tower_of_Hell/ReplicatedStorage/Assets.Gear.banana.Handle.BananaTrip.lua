-- https://lua.expert/
if script.Parent.Name == "Banana" then
	wait(0.5)
	script.Parent.Touched:Connect(function(p1) --[[ Line: 4 ]]
		local v1 = p1.Parent
		local Humanoid = v1:FindFirstChild("Humanoid")
		if not Humanoid then
			return
		end
		local v2 = Humanoid:GetState()
		if v2 ~= Enum.HumanoidStateType.Running and (v2 ~= Enum.HumanoidStateType.RunningNoPhysics and (v2 ~= Enum.HumanoidStateType.Climbing and (v2 ~= Enum.HumanoidStateType.Jumping and (v2 ~= Enum.HumanoidStateType.Freefall and (v2 ~= Enum.HumanoidStateType.Landed and (v2 ~= Enum.HumanoidStateType.Physics and v2 ~= Enum.HumanoidStateType.GettingUp)))))) then
			return
		end
		local v4 = math.pow(math.max(1, p1.AssemblyLinearVelocity.Magnitude), -0.5) * 3 + 1
		p1.AssemblyLinearVelocity = p1.AssemblyLinearVelocity * Vector3.new(v4, 1, v4)
		script.Parent.Sound.TimePosition = 0.4
		script.Parent.Sound:Resume()
		if v1 ~= game.Players.LocalPlayer.Character then
			return
		end
		Humanoid:ChangeState(Enum.HumanoidStateType.FallingDown)
	end)
end