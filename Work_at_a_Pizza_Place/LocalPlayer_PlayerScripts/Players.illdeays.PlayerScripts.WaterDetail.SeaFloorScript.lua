-- https://lua.expert/
local v1
if workspace:FindFirstChild("SeaFloor") then
	v1 = workspace.SeaFloor
else
	local v2 = game.ReplicatedStorage.SeaFloor:clone()
	v2.Parent = workspace
	v1 = v2
end
local LocalPlayer = game.Players.LocalPlayer
while LocalPlayer.Character == nil do
	wait()
end
local HumanoidRootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart")
while v1 and v1.Parent do
	wait(1.1)
	if not (HumanoidRootPart and HumanoidRootPart.Parent) then
		HumanoidRootPart = LocalPlayer.Character:WaitForChild("HumanoidRootPart", 5)
	end
	if HumanoidRootPart and (HumanoidRootPart.Position.Y < 2.337 or HumanoidRootPart.Velocity.Y < -60) then
		if LocalPlayer:DistanceFromCharacter(v1.Position) > 20 then
			v1.CFrame = CFrame.new((Vector3.new(HumanoidRootPart.Position.X, -27.63, HumanoidRootPart.Position.Z)))
		end
		wait(2)
	end
end
script:Destroy()