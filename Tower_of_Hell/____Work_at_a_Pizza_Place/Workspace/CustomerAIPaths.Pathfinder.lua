-- https://lua.expert/
local t = {}
local v1 = nil
function BuildNodes() --[[ BuildNodes | Line: 46 | Upvalues: v1 (ref) ]]
	local CustomerAIPaths = workspace.CustomerAIPaths
	local t = {}
	local t2 = {}
	for i, v in ipairs(CustomerAIPaths:GetChildren()) do
		if v:IsA("Vector3Value") then
			local t3 = {
				F = 0,
				G = 0,
				H = 0,
				Parent = nil,
				Position = v.Value,
				Neighbors = {}
			}
			table.insert(t, t3)
			t2[v] = t3
		end
	end
	for i, v in ipairs(CustomerAIPaths:GetChildren()) do
		if v:IsA("Vector3Value") then
			local v12 = t2[v]
			for i2, v2 in ipairs(v:GetChildren()) do
				if v2:IsA("ObjectValue") then
					local v22 = t2[v2.Value]
					table.insert(v12.Neighbors, v22)
					table.insert(v22.Neighbors, v12)
				end
			end
		end
	end
	CustomerAIPaths:Destroy()
	v1 = t
end
function FindNearestNode(p1) --[[ FindNearestNode | Line: 83 | Upvalues: v1 (ref) ]]
	local v12 = (1 / 0)
	local v2 = nil
	for i, v in ipairs(v1) do
		local Magnitude = (p1 - v.Position).Magnitude
		if Magnitude < v12 then
			v12 = Magnitude
			v2 = v
		end
	end
	return v2
end
function t.FindPath(p1, p2, p3) --[[ FindPath | Line: 95 | Upvalues: v1 (ref) ]]
	assert(v1, "Pathfinder not yet initialized")
	local v2 = FindNearestNode(p2)
	local v3 = FindNearestNode(p3)
	local tbl = {
		[v2] = true
	}
	local function FindLowestFNode() --[[ FindLowestFNode | Line: 109 | Upvalues: tbl (copy) ]]
		local v1 = (1 / 0)
		local v2 = nil
		for k in pairs(tbl) do
			if k.F < v1 then
				v1 = k.F
				v2 = k
			end
		end
		return v2
	end
	local tbl2 = {}
	local v4 = false
	local t = {}
	while next(tbl) do
		local v5 = (1 / 0)
		local v6 = nil
		for k in pairs(tbl) do
			if k.F < v5 then
				v5 = k.F
				v6 = k
			end
		end
		tbl[v6] = nil
		tbl2[v6] = true
		if v6 == v3 then
			v4 = true
			break
		end
		local v7 = v6
		for i, v in ipairs(v6.Neighbors) do
			if not tbl2[v] then
				if tbl[v] then
					if v.G < v7.G then
						v.Parent = v7
						v.G = v7.G + (v.Position - v7.Position).Magnitude
						v.F = v.G + v.H
					end
					continue
				end
				tbl[v] = true
				v.Parent = v7
				v.G = v7.G + (v.Position - v7.Position).Magnitude
				v.H = (v.Position - v3.Position).Magnitude
				v.F = v.G + v.H
			end
		end
	end
	if v4 then
		local v8 = v3
		while v8 do
			table.insert(t, 1, v8.Position)
			v8 = v8.Parent
		end
	end
	local function ResetNodeDictionary(p1) --[[ ResetNodeDictionary | Line: 168 ]]
		for k in pairs(p1) do
			k.F = 0
			k.G = 0
			k.H = 0
			k.Parent = nil
		end
	end
	for k in pairs(tbl) do
		k.F = 0
		k.G = 0
		k.H = 0
		k.Parent = nil
	end
	for k in pairs(tbl2) do
		k.F = 0
		k.G = 0
		k.H = 0
		k.Parent = nil
	end
	return if v4 and t then t else nil
end
function t.Init(p1) --[[ Init | Line: 184 ]]
	BuildNodes()
end
return t