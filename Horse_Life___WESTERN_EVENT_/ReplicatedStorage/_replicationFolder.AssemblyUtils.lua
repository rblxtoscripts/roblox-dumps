-- https://lua.expert/
local t = {
	Weld = function(p1, p2, p3, p4) --[[ Weld | Line: 11 ]]
		local Weld = Instance.new("Weld")
		Weld.Parent = p4 or p2
		Weld.Part0 = p2
		Weld.Part1 = p3
		Weld.C0 = p2.CFrame:ToObjectSpace(p3.CFrame)
		return Weld
	end,
	Motor = function(p1, p2, p3, p4) --[[ Motor | Line: 28 ]]
		local Motor6D = Instance.new("Motor6D")
		Motor6D.Parent = p4 or p2
		Motor6D.Part0 = p2
		Motor6D.Part1 = p3
		Motor6D.C0 = p2.CFrame:ToObjectSpace(p3.CFrame)
		return Motor6D
	end
}
function t.weldModel(p1) --[[ weldModel | Line: 37 | Upvalues: t (copy) ]]
	local PrimaryPart = p1.PrimaryPart
	local PrimaryPart_2 = p1.PrimaryPart
	assert(PrimaryPart_2, "Model needs a PrimaryPart to weld!")
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("BasePart") and v ~= PrimaryPart then
			t:Weld(PrimaryPart_2, v)
		end
	end
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("BasePart") and v ~= PrimaryPart then
			v.Anchored = false
		end
	end
	PrimaryPart.Anchored = true
	PrimaryPart.CanCollide = false
end
function t.weldConstraintModel(p1) --[[ weldConstraintModel | Line: 57 ]]
	local PrimaryPart = p1.PrimaryPart
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("BasePart") and PrimaryPart ~= v then
			local WeldConstraint = Instance.new("WeldConstraint")
			WeldConstraint.Part0 = PrimaryPart
			WeldConstraint.Part1 = v
			WeldConstraint.Parent = WeldConstraint.Part0
		end
	end
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored = false
		end
	end
end
function t.weldConstraint(p1, p2) --[[ weldConstraint | Line: 74 ]]
	local WeldConstraint = Instance.new("WeldConstraint")
	WeldConstraint.Part0 = p1
	WeldConstraint.Part1 = p2
	WeldConstraint.Parent = WeldConstraint.Part0
end
function t.weldAttachments(p1, p2) --[[ weldAttachments | Line: 81 ]]
	local Weld = Instance.new("Weld")
	Weld.Part0 = if p1:IsA("BasePart") and p1 then p1 else p1.Parent
	Weld.Part1 = if p2:IsA("BasePart") and p2 then p2 else p2.Parent
	Weld.C0 = p1:IsA("BasePart") and p1.CFrame or p1.WorldCFrame
	Weld.C1 = p2:IsA("BasePart") and p2.CFrame or p2.WorldCFrame
	Weld.Parent = p1.Parent
	return Weld
end
function t.motorAttachments(p1, p2) --[[ motorAttachments | Line: 93 ]]
	local Motor6D = Instance.new("Motor6D")
	local v1 = p1:IsA("BasePart")
	local v2 = p2:IsA("BasePart")
	local v3 = if v1 and p1 then p1 else p1.Parent
	local v4 = if v2 and p2 then p2 else p2.Parent
	Motor6D.Part0 = v3
	Motor6D.Part1 = v4
	Motor6D.C0 = v3.CFrame:Inverse() * (v1 and p1.CFrame or p1.WorldCFrame)
	Motor6D.C1 = v4.CFrame:Inverse() * (v2 and p2.CFrame or p2.WorldCFrame)
	Motor6D.Parent = v3
	return Motor6D
end
function t.rigidConstraintAttachment(p1, p2) --[[ rigidConstraintAttachment | Line: 113 ]]
	local RigidConstraint = Instance.new("RigidConstraint")
	RigidConstraint.Enabled = true
	RigidConstraint.Attachment0 = p2
	RigidConstraint.Attachment1 = p1
	RigidConstraint.Parent = p1
	return RigidConstraint
end
function t.anchorModel(p1) --[[ anchorModel | Line: 126 ]]
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("BasePart") then
			v.Anchored = true
		end
	end
end
return t