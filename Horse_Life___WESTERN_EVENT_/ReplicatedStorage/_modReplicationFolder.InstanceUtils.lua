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
	if p3 and not v1 then
		assert(p2.Name, "Instance must have a Name property")
		assert(p2.Parent, "Instance must have a Parent property if clientYieldsForInstance is true")
		return p2.Parent:WaitForChild(p2.Name)
	end
	local v3 = if p1 then p1 else p2.ClassName
	local v4
	if t2[v3] then
		for v6, v7 in t2[v3] do
			if not p2[v6] then
				p2[v6] = v7
			end
		end
		v4 = t2[v3].ClassName
	else
		v4 = v3
	end
	local v8 = Instance.new(v4)
	for v9, v10 in p2 do
		if v9 ~= "Parent" and (v9 ~= "Children" and (v9 ~= "ClassName" and v9 ~= "WorldCFrame")) then
			if v9 == "PivotTo" then
				v8:PivotTo(v10)
				continue
			end
			v8[v9] = v10
		end
	end
	if p2.Children then
		for v11, v12 in p2.Children do
			v12.Parent = v8
			t.Create(v12.ClassName, v12)
		end
	end
	if p2.Parent then
		v8.Parent = p2.Parent
	end
	if p2.WorldCFrame then
		v8.WorldCFrame = p2.WorldCFrame
	end
	return v8
end
function t.GetTagged(p1, p2) --[[ GetTagged | Line: 164 ]]
	for v1, v2 in p1:GetDescendants() do
		if v2:HasTag(p2) then
			return v2
		end
	end
	return p1:FindFirstChild(p2, true)
end
function t.GetAllTagged(p1, p2) --[[ GetAllTagged | Line: 175 ]]
	local t = {}
	for v1, v2 in p1:GetDescendants() do
		if v2:HasTag(p2) or v2.Name == p2 then
			table.insert(t, v2)
		end
	end
	return t
end
function t.FindFirstAncestorWithTag(p1, p2) --[[ FindFirstAncestorWithTag | Line: 188 ]]
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
function t.onChildAdded(p1, p2, p3) --[[ onChildAdded | Line: 204 ]]
	local v1 = p1.ChildAdded:Connect(function(p1) --[[ Line: 206 | Upvalues: p2 (copy), p3 (copy) ]]
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