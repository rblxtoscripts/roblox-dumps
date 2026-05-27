-- https://lua.expert/
for k, v in pairs(script.Parent.Towers:GetChildren()) do
	local v1 = v:FindFirstChildWhichIsA("Model")
	if v1.Name ~= "Mr Can Do" then
		local v2 = v1.Humanoid.Animator:LoadAnimation(v1.Animations.Idle)
		v2.Looped = true
		v2:Play()
	end
end