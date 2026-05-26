-- https://lua.expert/
local t = {}
local v1 = game:GetService("RunService"):IsServer()
local t2 = {
	CleanPart = {
		ClassName = "Part",
		Transparency = 1,
		Anchored = true,
		Massless = true,
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		CastShadow = false,
		EnableFluidForces = false,
		Size = Vector3.new(0, 0, 0)
	}
}
function t.Create(p1, p2, p3) --[[ Create | Line: 108 | Upvalues: v1 (copy), t2 (copy), t (copy) ]]
	local v12 = if p2 then p2 else {}
	if p3 and not v1 then
		assert(v12.Name, "Instance must have a Name property")
		assert(v12.Parent, "Instance must have a Parent property if clientYieldsForInstance is true")
		return v12.Parent:WaitForChild(v12.Name)
	end
	local v4, v5
	if p1 then
		v4 = p1
		v5 = v12
	else
		v4 = v12.ClassName
		v5 = v12
	end
	local v6
	if t2[v4] then
		for v8, v9 in t2[v4] do
			if not v5[v8] then
				v5[v8] = v9
			end
		end
		v6 = t2[v4].ClassName
	else
		v6 = v4
	end
	local v10 = Instance.new(v6)
	for v11, v122 in v5 do
		if v11 ~= "Parent" and (v11 ~= "Children" and (v11 ~= "ClassName" and v11 ~= "WorldCFrame")) then
			if v11 == "PivotTo" then
				v10:PivotTo(v122)
				continue
			end
			v10[v11] = v122
		end
	end
	if v5.Children then
		for v13, v14 in v5.Children do
			v14.Parent = v10
			t.Create(v14.ClassName, v14)
		end
	end
	if v5.Parent then
		v10.Parent = v5.Parent
	end
	if v5.WorldCFrame then
		v10.WorldCFrame = v5.WorldCFrame
	end
	return v10
end
function t.GetTagged(p1, p2) --[[ GetTagged | Line: 166 ]]
	for v1, v2 in p1:GetDescendants() do
		if v2:HasTag(p2) then
			return v2
		end
	end
	return p1:FindFirstChild(p2, true)
end
function t.GetTemplate(p1, p2) --[[ GetTemplate | Line: 177 ]]
	local v1 = nil
	for v2, v3 in p1:GetDescendants() do
		if v3:HasTag(p2) then
			v1 = v3
		end
	end
	if not v1 then
		v1 = p1:FindFirstChild(p2, true)
	end
	if v1:IsA("GuiObject") then
		v1.Visible = false
	end
	return v1
end
function t.GetAllTagged(p1, p2) --[[ GetAllTagged | Line: 198 ]]
	local t = {}
	for v1, v2 in p1:GetDescendants() do
		if v2:HasTag(p2) or v2.Name == p2 then
			table.insert(t, v2)
		end
	end
	return t
end
function t.FindFirstAncestorWithTag(p1, p2) --[[ FindFirstAncestorWithTag | Line: 211 ]]
	if p1:HasTag(p2) then
		return p1
	end
	local v1 = p1.Parent
	while v1 do
		if v1:HasTag(p2) then
			return v1
		end
		v1 = v1.Parent
	end
	return nil
end
function t.onChildAdded(p1, p2, p3) --[[ onChildAdded | Line: 227 ]]
	local v1 = p1.ChildAdded:Connect(function(p1) --[[ Line: 229 | Upvalues: p2 (copy), p3 (copy) ]]
		if p1.Name ~= p2 then
			return
		end
		p3(p1)
	end)
	local v2 = p1:FindFirstChild(p2, true)
	if not v2 then
		return v1
	end
	p3(v2)
	return v1
end
return t