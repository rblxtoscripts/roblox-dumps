-- https://lua.expert/
local v1, v2, v3
if game:IsLoaded() then
	v1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
	v2 = function(p1_2) --[[ reparentGui | Line: 8 | Upvalues: v1 (copy) ]]
		task.wait()
		p1_2.ResetOnSpawn = false
		p1_2.Parent = v1
	end
	v3 = function(p1_2) --[[ reparentGuiFolder | Line: 16 | Upvalues: v2 (copy) ]]
		if not p1_2 then
			return
		end
		p1_2.ChildAdded:Connect(v2)
		for k2, v in pairs(p1_2:GetChildren()) do
			task.spawn(v2, v)
		end
	end
	v3(game:GetService("ReplicatedStorage"):WaitForChild("StarterGui"))
	v3(game:GetService("ReplicatedStorage"):WaitForChild("WorldStarterGui"))
	return
end
game.Loaded:Wait()
v1 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
v2 = function(p1_2) --[[ reparentGui | Line: 8 | Upvalues: v1 (copy) ]]
	task.wait()
	p1_2.ResetOnSpawn = false
	p1_2.Parent = v1
end
v3 = function(p1_2) --[[ reparentGuiFolder | Line: 16 | Upvalues: v2 (copy) ]]
	if not p1_2 then
		return
	end
	p1_2.ChildAdded:Connect(v2)
	for k2, v in pairs(p1_2:GetChildren()) do
		task.spawn(v2, v)
	end
end
v3(game:GetService("ReplicatedStorage"):WaitForChild("StarterGui"))
v3(game:GetService("ReplicatedStorage"):WaitForChild("WorldStarterGui"))