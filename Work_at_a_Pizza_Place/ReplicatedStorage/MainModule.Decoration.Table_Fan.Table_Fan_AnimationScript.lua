-- https://lua.expert/
local v1 = script:WaitForChild("ObjectPointer").Value
while v1 and v1:FindFirstChild("Blades") do
	v1.Blades.CFrame = v1.Blades.CFrame * CFrame.Angles(0.6108652381980153, 0, 0)
	task.wait(0.07)
end