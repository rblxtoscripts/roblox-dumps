-- https://lua.expert/
function kick() --[[ kick | Line: 1 ]]
	if game.Players.LocalPlayer.Character and (game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character.Humanoid.Health <= 0) then
		return
	end
	game.Players.LocalPlayer:Kick()
	wait(0.25)
	local function v1() --[[ Line: 6 | Upvalues: v1 (ref) ]]
		while true do
			spawn(v1)
		end
	end
	if not game:GetService("RunService"):IsStudio() then
		v1()
	end
end
function isAllowedToSit() --[[ isAllowedToSit | Line: 16 ]]
	return game.Players.LocalPlayer.Character.HumanoidRootPart.Position.Y < 87
end
game.Players.LocalPlayer.CharacterAdded:connect(function(p1) --[[ Line: 20 ]]
	p1.DescendantAdded:Connect(function(p12) --[[ Line: 21 | Upvalues: p1 (copy) ]]
		if p1:FindFirstChild("gravity") or (p1:FindFirstChild("fusion") or p1:FindFirstChild("hook")) then
			return
		end
		if not (p12:IsA("BodyPosition") or (p12:IsA("BodyVelocity") or (p12:IsA("BodyGyro") or (p12:IsA("AngularVelocity") or p12:IsA("BodyForce"))))) then
			return
		end
		local v1 = p12:FindFirstAncestorWhichIsA("Accessory")
		if v1 then
			v1:Destroy()
			return
		end
		print("desc kick")
		kick()
	end)
	p1:WaitForChild("Humanoid").StateChanged:Connect(function(p12, p2) --[[ Line: 33 | Upvalues: p1 (copy) ]]
		if p1:FindFirstChild("hook") then
			return
		end
		if p2 == Enum.HumanoidStateType.Jumping then
			if p12 == Enum.HumanoidStateType.Running or (p12 == Enum.HumanoidStateType.RunningNoPhysics or (p12 == Enum.HumanoidStateType.Climbing or p12 == Enum.HumanoidStateType.Seated and isAllowedToSit())) then
				return
			end
			if p12 == Enum.HumanoidStateType.GettingUp then
				return
			end
			if not (p1:FindFirstChild("gravity") or (p1:FindFirstChild("jump") or require(game.ReplicatedStorage.Mutators["double jump"]).isEnabled())) then
				print("state kick: ", p12, p2)
				kick()
			end
		else
			if p2 == Enum.HumanoidStateType.Running or (p2 == Enum.HumanoidStateType.RunningNoPhysics or (p2 == Enum.HumanoidStateType.Climbing or (p2 == Enum.HumanoidStateType.Jumping or (p2 == Enum.HumanoidStateType.FallingDown or (p2 == Enum.HumanoidStateType.Freefall or (p2 == Enum.HumanoidStateType.Dead or (p2 == Enum.HumanoidStateType.Landed or (p2 == Enum.HumanoidStateType.Physics or (p2 == Enum.HumanoidStateType.Ragdoll or p2 == Enum.HumanoidStateType.Seated and isAllowedToSit()))))))))) then
				return
			end
			if p2 == Enum.HumanoidStateType.GettingUp then
				return
			end
			if p1:FindFirstChild("hook") then
				return
			end
			print("state kick: ", p12, p2)
			kick()
		end
	end)
	p1:WaitForChild("Humanoid").Changed:Connect(function() --[[ Line: 63 | Upvalues: p1 (copy) ]]
		if p1.Humanoid.JumpPower > 101 then
			return
		end
		if p1.Humanoid.Sit then
			if not isAllowedToSit() then
				print("sit kick")
				kick()
			end
		else
			if p1.Humanoid.HipHeight == 0 or p1.Humanoid.RigType ~= Enum.HumanoidRigType.R6 then
				return
			end
			print("hip kick")
			kick()
		end
	end)
	spawn(function() --[[ Line: 75 ]]
		while true do
			wait()
			pcall(function() --[[ Line: 78 ]]
				if not (workspace.Gravity < 147) then
					return
				end
				print("grav kick")
				kick()
			end)
		end
	end)
end)
game.Players.LocalPlayer.ChildAdded:Connect(function(p1) --[[ Line: 100 ]]
	if p1.Name ~= "Backpack" then
		return
	end
	p1.ChildAdded:Connect(function(p1) --[[ Line: 102 ]]
		for k, v in pairs({
			"bomb",
			"fusion",
			"gravity",
			"hook",
			"hourglass",
			"jump",
			"killpart",
			"speed",
			"trowel",
			"yxterminator",
			"cola",
			"banana",
			"fishingrod"
		}) do
			if v == p1.Name then
				return
			end
		end
		print("gear kick: ", p1)
		kick()
	end)
end)
game.ReplicatedStorage.Remotes.Moderation.kickUser.OnClientEvent:Connect(kick)
local LocalScript2 = script.Parent:WaitForChild("LocalScript2")
LocalScript2.Changed:Connect(function() --[[ Line: 130 | Upvalues: LocalScript2 (copy) ]]
	if LocalScript2.Parent ~= game.Players.LocalPlayer.PlayerScripts or LocalScript2.Disabled == true then
		game.Players.LocalPlayer:Kick()
	end
	wait()
end)