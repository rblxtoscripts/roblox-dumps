-- https://lua.expert/
task.wait(3)
for k, v in pairs((script.Parent.Units:GetChildren())) do
	local v2 = v.Humanoid:LoadAnimation(script[v.Name])
	if v2 then
		v2.Looped = true
		v2:Play()
	end
end