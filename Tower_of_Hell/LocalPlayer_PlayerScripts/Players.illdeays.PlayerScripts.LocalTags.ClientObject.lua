-- https://lua.expert/
local t = {}
local LocalPlayer = game.Players.LocalPlayer
local t2 = {}
local v1 = "Default"
local function updateHeadCollisionGroupId(p1) --[[ updateHeadCollisionGroupId | Line: 24 | Upvalues: v1 (ref), t2 (copy) ]]
	v1 = p1.CollisionGroup
	for k, v in pairs(t2) do
		v.CollisionGroup = p1.CollisionGroup
	end
end
local function updateCharacter(p1) --[[ updateCharacter | Line: 31 | Upvalues: v1 (ref), t2 (copy) ]]
	local Head = p1:WaitForChild("Head", 5)
	if not Head then
		return
	end
	v1 = Head.CollisionGroup
	for k, v in pairs(t2) do
		v.CollisionGroup = Head.CollisionGroup
	end
	Head:GetPropertyChangedSignal("CollisionGroup"):Connect(function() --[[ Line: 36 | Upvalues: Head (copy), v1 (ref), t2 (ref) ]]
		local v12 = Head
		v1 = v12.CollisionGroup
		for k, v in pairs(t2) do
			v.CollisionGroup = v12.CollisionGroup
		end
	end)
end
LocalPlayer.CharacterAdded:Connect(function() --[[ Line: 41 | Upvalues: updateCharacter (copy), LocalPlayer (copy) ]]
	updateCharacter(LocalPlayer.Character)
end)
if not LocalPlayer.Character then
	function t.AddTagged(p1_2, p2_2) --[[ AddTagged | Line: 55 | Upvalues: t2 (copy), v1 (ref) ]]
		if not (p2_2:IsA("Model") or p2_2:IsA("BasePart")) then
			warn(p2_2:GetFullName() .. " has ClientObject tag, but is not of class \'Model\' or \'BasePart\'. (" .. p2_2.ClassName .. ")")
			return
		end
		if p2_2:GetAttribute("IsClonedClientObject") then
			return
		end
		local v12 = p2_2:Clone()
		v12:SetAttribute("IsClonedClientObject", true)
		v12.Parent = p2_2.Parent
		p2_2:SetAttribute("ServerStreamedObject", true)
		p2_2.Parent = nil
		for k2, v in pairs(v12:GetDescendants()) do
			if v:IsA("BasePart") then
				table.insert(t2, v)
				v.CollisionGroup = v1
			end
		end
		if not v12:IsA("PVInstance") or v12:GetAttribute("DisableServerSync") then
			return
		end
		local v3 = p2_2
		while v3:IsDescendantOf(workspace) and v3.Name ~= "center" do
			if v3:FindFirstChild("center") and v3.center == v3.PrimaryPart then
				v3 = v3.center
			else
				v3 = v3.Parent
			end
		end
		if v3.Name ~= "center" then
			return
		end
		local v4 = v3.CFrame
		v3:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 93 | Upvalues: v3 (ref), v4 (ref), v12 (copy) ]]
			local v1 = v3.CFrame * v4:Inverse()
			v4 = v3.CFrame
			v12:PivotTo(v1 * v12:GetPivot())
		end)
	end
	function t.RemoveTagged(p1_2, p2_2) --[[ RemoveTagged | Line: 102 | Upvalues: t2 (copy) ]]
		for k2, v in pairs(p2_2:GetDescendants()) do
			if v:IsA("BasePart") then
				local v1 = table.find(t2, v)
				if v1 then
					table.remove(t2, v1)
				end
			end
		end
		if not p2_2:GetAttribute("ServerStreamedObject") then
			p2_2:Destroy()
		end
	end
	return t
end
pcall(function() --[[ Line: 46 | Upvalues: updateCharacter (copy), LocalPlayer (copy) ]]
	updateCharacter(LocalPlayer.Character)
end)
function t.AddTagged(p1_2, p2_2) --[[ AddTagged | Line: 55 | Upvalues: t2 (copy), v1 (ref) ]]
	if not (p2_2:IsA("Model") or p2_2:IsA("BasePart")) then
		warn(p2_2:GetFullName() .. " has ClientObject tag, but is not of class \'Model\' or \'BasePart\'. (" .. p2_2.ClassName .. ")")
		return
	end
	if p2_2:GetAttribute("IsClonedClientObject") then
		return
	end
	local v12 = p2_2:Clone()
	v12:SetAttribute("IsClonedClientObject", true)
	v12.Parent = p2_2.Parent
	p2_2:SetAttribute("ServerStreamedObject", true)
	p2_2.Parent = nil
	for k2, v in pairs(v12:GetDescendants()) do
		if v:IsA("BasePart") then
			table.insert(t2, v)
			v.CollisionGroup = v1
		end
	end
	if not v12:IsA("PVInstance") or v12:GetAttribute("DisableServerSync") then
		return
	end
	local v3 = p2_2
	while v3:IsDescendantOf(workspace) and v3.Name ~= "center" do
		if v3:FindFirstChild("center") and v3.center == v3.PrimaryPart then
			v3 = v3.center
		else
			v3 = v3.Parent
		end
	end
	if v3.Name ~= "center" then
		return
	end
	local v4 = v3.CFrame
	v3:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 93 | Upvalues: v3 (ref), v4 (ref), v12 (copy) ]]
		local v1 = v3.CFrame * v4:Inverse()
		v4 = v3.CFrame
		v12:PivotTo(v1 * v12:GetPivot())
	end)
end
function t.RemoveTagged(p1_2, p2_2) --[[ RemoveTagged | Line: 102 | Upvalues: t2 (copy) ]]
	for k2, v in pairs(p2_2:GetDescendants()) do
		if v:IsA("BasePart") then
			local v1 = table.find(t2, v)
			if v1 then
				table.remove(t2, v1)
			end
		end
	end
	if not p2_2:GetAttribute("ServerStreamedObject") then
		p2_2:Destroy()
	end
end
return t