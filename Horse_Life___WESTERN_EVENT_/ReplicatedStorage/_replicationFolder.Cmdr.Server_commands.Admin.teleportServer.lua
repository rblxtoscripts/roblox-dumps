-- https://lua.expert/
return function(p1, p2, p3) --[[ Line: 1 ]]
	local v1 = nil
	if typeof(p3) == "Instance" then
		if not (p3.Character and p3.Character:FindFirstChild("HumanoidRootPart")) then
			return "Target player has no character."
		end
		v1 = p3.Character.HumanoidRootPart.CFrame
	elseif typeof(p3) == "Vector3" then
		v1 = CFrame.new(p3)
	elseif typeof(p3) == "string" then
		local v3 = workspace:FindFirstChild(p3, true)
		if v3:IsA("BasePart") then
			v1 = CFrame.new(v3.Position)
		elseif v3:IsA("Model") then
			v1 = CFrame.new(v3:GetPivot().p)
		end
	end
	for i, v in ipairs(p2) do
		if v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
			v.Character.HumanoidRootPart.CFrame = v1
		end
	end
	return ("Teleported %d players."):format(#p2)
end