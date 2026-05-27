-- https://lua.expert/
return function(p1, p2, p3) --[[ Line: 2 ]]
	debug.profilebegin("Model scaler")
	local v1 = p1:GetDescendants()
	if p1:IsA("BasePart") then
		table.insert(v1, p1)
	end
	for k, v in pairs(v1) do
		if not game.CollectionService:HasTag(v, "NoScale") then
			if v:IsA("BasePart") or v:IsA("SpecialMesh") then
				for k2, v2 in pairs(v:GetChildren()) do
					if v2:IsA("JointInstance") then
						v2.C0 = v2.C0 + v2.C0.Position * (p2 - 1)
						v2.C1 = v2.C1 + v2.C1.Position * (p2 - 1)
						continue
					end
					if v2:IsA("Attachment") then
						v2.CFrame = v2.CFrame + v2.Position * (p2 - 1)
					end
				end
				if v:IsA("BasePart") then
					v.Size = v.Size * p2
					if v.Anchored then
						v.Position = v.Position + v.Position * (p2 - 1)
					end
				end
				continue
			end
			if v:IsA("Beam") then
				v.Width0 = v.Width0 * p2
				v.Width1 = v.Width1 * p2
				continue
			end
			if v:IsA("Humanoid") then
				v.HipHeight = v.HipHeight * p2
			end
		end
	end
	debug.profileend()
end