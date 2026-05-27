-- https://lua.expert/
local t = {
	Weld = function(p1, p2, p3, p4) --[[ Weld | Line: 3 ]]
		local Weld = Instance.new("Weld")
		Weld.Parent = p4 or p2
		Weld.Part0 = p2
		Weld.Part1 = p3
		Weld.C0 = p2.CFrame:ToObjectSpace(p3.CFrame)
		return Weld
	end
}
function t.WeldModel(p1, p2) --[[ WeldModel | Line: 11 | Upvalues: t (copy) ]]
	local PrimaryPart = p2.PrimaryPart
	local PrimaryPart_2 = p2.PrimaryPart
	assert(PrimaryPart_2, "Model needs a PrimaryPart to weld!")
	for k, v in pairs(p2:GetDescendants()) do
		if v:IsA("BasePart") and v ~= PrimaryPart then
			t:Weld(PrimaryPart_2, v)
		end
	end
	for k, v in pairs(p2:GetDescendants()) do
		if v:IsA("BasePart") and v ~= PrimaryPart then
			v.Anchored = false
		end
	end
	PrimaryPart.Anchored = true
	PrimaryPart.CanCollide = false
end
function t.WeldConstraintModel(p1, p2) --[[ WeldConstraintModel | Line: 31 ]]
	local PrimaryPart = p2.PrimaryPart
	for k, v in pairs(p2:GetChildren()) do
		if v:IsA("BasePart") and v ~= PrimaryPart then
			local WeldConstraint = Instance.new("WeldConstraint")
			WeldConstraint.Part0 = v
			WeldConstraint.Part1 = PrimaryPart
			WeldConstraint.Parent = WeldConstraint.Part0
		end
	end
	for k, v in pairs(p2:GetChildren()) do
		if v:IsA("BasePart") and v ~= PrimaryPart then
			v.Anchored = false
		end
	end
	PrimaryPart.Anchored = true
	PrimaryPart.CanCollide = false
end
function t.WeldAttachments(p1, p2, p3) --[[ WeldAttachments | Line: 52 ]]
	local Weld = Instance.new("Weld")
	Weld.Part0 = p2.Parent
	Weld.Part1 = p3.Parent
	Weld.C0 = p2.CFrame
	Weld.C1 = p3.CFrame
	Weld.Parent = p2.Parent
	return Weld
end
function t.AnchorModel(p1, p2) --[[ AnchorModel | Line: 64 ]]
	for k, v in pairs(p2:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored = true
		end
	end
end
return t