-- https://lua.expert/
task.wait(3)
for v1, v2 in script.Parent.Units:GetChildren() do
	if v2 then
		local v3 = v2:WaitForChild("Humanoid").Animator:LoadAnimation(script[v2.Name])
		v3.Looped = true
		v3:Play()
	end
end