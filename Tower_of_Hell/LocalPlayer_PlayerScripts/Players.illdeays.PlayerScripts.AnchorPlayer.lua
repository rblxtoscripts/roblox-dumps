-- https://lua.expert/
local count = 0
local LocalPlayer = game.Players.LocalPlayer
local function f1(p1) --[[ Line: 4 | Upvalues: count (ref), LocalPlayer (copy) ]]
	if not p1:IsA("SpawnLocation") then
		return
	end
	if count == 0 and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		LocalPlayer.Character.HumanoidRootPart.Anchored = false
	end
	count = count + 1
end
workspace.DescendantRemoving:Connect(function(p1) --[[ Line: 14 | Upvalues: count (ref), LocalPlayer (copy) ]]
	if not p1:IsA("SpawnLocation") then
		return
	end
	count = count - 1
	if count ~= 0 or not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		return
	end
	LocalPlayer.Character.HumanoidRootPart.Anchored = true
end)
workspace.DescendantAdded:Connect(f1)
for k, v in pairs(workspace:GetDescendants()) do
	if v:IsA("SpawnLocation") then
		if count == 0 and (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
			LocalPlayer.Character.HumanoidRootPart.Anchored = false
		end
		count = count + 1
	end
end
LocalPlayer.CharacterAdded:Connect(function(p1) --[[ Line: 29 | Upvalues: count (ref) ]]
	local HumanoidRootPart = p1:WaitForChild("HumanoidRootPart")
	HumanoidRootPart.Anchored = count == 0
end)