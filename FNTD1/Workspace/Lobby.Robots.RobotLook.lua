-- https://lua.expert/
local RunService = game:GetService("RunService")
local v1 = script.Parent
local LocalPlayer = game.Players.LocalPlayer
repeat
	task.wait(0.5)
until v1:FindFirstChild("Welded")
RunService.RenderStepped:Connect(function() --[[ Line: 8 | Upvalues: LocalPlayer (copy), v1 (copy) ]]
	if not (LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")) then
		return
	end
	for k, v in pairs(v1:GetChildren()) do
		if v:IsA("Model") and (v.PrimaryPart and not ((v.PrimaryPart.Position - LocalPlayer.Character.HumanoidRootPart.Position).Magnitude > 50)) then
			local lookAt = CFrame.lookAt
			v.PrimaryPart.CFrame = lookAt(v.PrimaryPart.Position, (Vector3.new(LocalPlayer.Character.HumanoidRootPart.Position.X, v.PrimaryPart.Position.Y, LocalPlayer.Character.HumanoidRootPart.Position.Z))) * CFrame.Angles(0, -1.5707963267948966, 0)
		end
	end
end)