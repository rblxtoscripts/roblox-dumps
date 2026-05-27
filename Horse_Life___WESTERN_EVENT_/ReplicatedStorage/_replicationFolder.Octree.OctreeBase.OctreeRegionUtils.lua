-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Draw")
local t = {
	{ 0.25, 0.25, -0.25 },
	{ -0.25, 0.25, -0.25 },
	{ 0.25, 0.25, 0.25 },
	{ -0.25, 0.25, 0.25 },
	{ 0.25, -0.25, -0.25 },
	{ -0.25, -0.25, -0.25 },
	{ 0.25, -0.25, 0.25 },
	{ -0.25, -0.25, 0.25 }
}
local t2 = {
	visualize = function(p1, p2, p3, p4) --[[ visualize | Line: 32 | Upvalues: v1 (copy) ]]
		local size = p1.size
		local position = p1.position
		local v7 = v1.box(Vector3.new(position[1], position[2], position[3]), Vector3.new(size[1], size[2], size[3]), p3)
		v7.Transparency = 0.9
		v7.BoxHandleAdornment.Transparency = p2 or 0.75
		v7.Name = "OctreeRegion_" .. tostring(p1.depth)
		return v7
	end,
	create = function(p1, p2, p3, p4, p5, p6, p7, p8) --[[ create | Line: 81 ]]
		local v1 = p4 / 2
		local v2 = p5 / 2
		local v3 = p6 / 2
		local t = {
			node_count = 0,
			subRegions = {},
			lowerBounds = { p1 - v1, p2 - v2, p3 - v3 },
			upperBounds = { p1 + v1, p2 + v2, p3 + v3 },
			position = { p1, p2, p3 },
			size = { p4, p5, p6 },
			parent = p7
		}
		t.depth = p7 and p7.depth + 1 or 1
		t.parentIndex = p8
		t.nodes = {}
		return t
	end,
	addNode = function(p1, p2) --[[ addNode | Line: 129 ]]
		assert(p2, "Bad node")
		local v1 = p1
		while v1 do
			if not v1.nodes[p2] then
				v1.nodes[p2] = p2
				v1.node_count = v1.node_count + 1
			end
			v1 = v1.parent
		end
	end,
	moveNode = function(p1, p2, p3) --[[ moveNode | Line: 148 ]]
		assert(if p1.depth == p2.depth then true else false, "fromLowest.depth ~= toLowest.depth")
		assert(if p1 == p2 then false else true, "fromLowest == toLowest")
		local v3, v4 = p1, p2
		while v3 ~= v4 do
			assert(v3.nodes[p3], "Not in currentFrom")
			assert(v3.node_count > 0, "No nodes in currentFrom")
			v3.nodes[p3] = nil
			v3.node_count = v3.node_count - 1
			if v3.node_count <= 0 and v3.parentIndex then
				assert(v3.parent, "Bad currentFrom.parent")
				assert(v3.parent.subRegions[v3.parentIndex] == v3, "Not in subregion")
				v3.parent.subRegions[v3.parentIndex] = nil
			end
			assert(not v4.nodes[p3], "Failed to add")
			v4.nodes[p3] = p3
			v4.node_count = v4.node_count + 1
			v3 = v3.parent
			v4 = v4.parent
		end
	end,
	removeNode = function(p1, p2) --[[ removeNode | Line: 188 ]]
		assert(p2, "Bad node")
		local v1 = p1
		while v1 do
			assert(v1.nodes[p2], "Not in current")
			assert(v1.node_count > 0, "Current has bad node count")
			v1.nodes[p2] = nil
			v1.node_count = v1.node_count - 1
			if v1.node_count <= 0 and v1.parentIndex then
				assert(v1.parent, "No parent")
				assert(v1.parent.subRegions[v1.parentIndex] == v1, "Not in subregion")
				v1.parent.subRegions[v1.parentIndex] = nil
			end
			v1 = v1.parent
		end
	end,
	getSearchRadiusSquared = function(p1, p2, p3) --[[ getSearchRadiusSquared | Line: 219 ]]
		local v1 = p1 + 0.8660254037844386 * p2
		return v1 * v1 + p3
	end
}
function t2.getNeighborsWithinRadius(p1, p2, p3, p4, p5, p6, p7, p8) --[[ getNeighborsWithinRadius | Line: 239 | Upvalues: t2 (copy) ]]
	assert(p8, "Bad maxDepth")
	local v2 = t2.getSearchRadiusSquared(p2, p1.size[1] / 2, 1e-6)
	local v3 = p2 * p2
	for k, v in pairs(p1.subRegions) do
		local position = v.position
		local v5 = p3 - position[1]
		local v6 = p4 - position[2]
		local v7 = p5 - position[3]
		if v5 * v5 + v6 * v6 + v7 * v7 <= v2 then
			if v.depth == p8 then
				for k2, v8 in pairs(v.nodes) do
					local v82, v9, v10 = k2:GetRawPosition()
					local v11 = p3 - v82
					local v12 = p4 - v9
					local v13 = p5 - v10
					local v14 = v11 * v11 + v12 * v12 + v13 * v13
					if v14 <= v3 then
						p6[#p6 + 1] = k2:GetObject()
						p7[#p7 + 1] = v14
					end
				end
				continue
			end
			t2.getNeighborsWithinRadius(v, p2, p3, p4, p5, p6, p7, p8)
		end
	end
end
function t2.getOrCreateSubRegionAtDepth(p1, p2, p3, p4, p5) --[[ getOrCreateSubRegionAtDepth | Line: 286 | Upvalues: t2 (copy) ]]
	local v1 = p1
	for i = p1.depth, p5 do
		local v2 = t2.getSubRegionIndex(v1, p2, p3, p4)
		local v3 = v1.subRegions[v2]
		if not v3 then
			local v4 = t2.createSubRegion(v1, v2)
			v1.subRegions[v2] = v4
			v3 = v4
		end
		v1 = v3
	end
	return v1
end
function t2.createSubRegion(p1, p2) --[[ createSubRegion | Line: 310 | Upvalues: t (copy), t2 (copy) ]]
	local size = p1.size
	local position = p1.position
	local v1 = t[p2]
	return t2.create(position[1] + v1[1] * size[1], position[2] + v1[2] * size[2], position[3] + v1[3] * size[3], size[1] / 2, size[2] / 2, size[3] / 2, p1, p2)
end
function t2.inRegionBounds(p1, p2, p3, p4) --[[ inRegionBounds | Line: 332 ]]
	local lowerBounds = p1.lowerBounds
	local upperBounds = p1.upperBounds
	return if lowerBounds[1] <= p2 and (p2 <= upperBounds[1] and (lowerBounds[2] <= p3 and (p3 <= upperBounds[2] and lowerBounds[3] <= p4))) then p4 <= upperBounds[3] else false
end
function t2.getSubRegionIndex(p1, p2, p3, p4) --[[ getSubRegionIndex | Line: 350 ]]
	local sum = if p1.position[1] < p2 then 1 else 2
	if p3 <= p1.position[2] then
		sum = sum + 4
	end
	if p1.position[3] <= p4 then
		sum = sum + 2
	end
	return sum
end
function t2.getTopLevelRegionHash(p1, p2, p3) --[[ getTopLevelRegionHash | Line: 370 ]]
	return p1 * 73856093 + p2 * 19351301 + p3 * 83492791
end
function t2.getTopLevelRegionCellIndex(p1, p2, p3, p4) --[[ getTopLevelRegionCellIndex | Line: 385 ]]
	return math.floor(p2 / p1[1] + 0.5), math.floor(p3 / p1[2] + 0.5), math.floor(p4 / p1[3] + 0.5)
end
function t2.getTopLevelRegionPosition(p1, p2, p3, p4) --[[ getTopLevelRegionPosition | Line: 402 ]]
	return p1[1] * p2, p1[2] * p3, p1[3] * p4
end
function t2.areEqualTopRegions(p1, p2, p3, p4) --[[ areEqualTopRegions | Line: 418 ]]
	local position = p1.position
	return if position[1] == p2 and position[2] == p3 then position[3] == p4 else false
end
function t2.findRegion(p1, p2, p3, p4, p5) --[[ findRegion | Line: 434 | Upvalues: t2 (copy) ]]
	local v1, v2, v3 = t2.getTopLevelRegionCellIndex(p2, p3, p4, p5)
	local v4 = p1[t2.getTopLevelRegionHash(v1, v2, v3)]
	if not v4 then
		return nil
	end
	local v5, v6, v7 = t2.getTopLevelRegionPosition(p2, v1, v2, v3)
	for k, v in pairs(v4) do
		if t2.areEqualTopRegions(v, v5, v6, v7) then
			return v
		end
	end
	return nil
end
function t2.getOrCreateRegion(p1, p2, p3, p4, p5) --[[ getOrCreateRegion | Line: 462 | Upvalues: t2 (copy) ]]
	local v1, v2, v3 = t2.getTopLevelRegionCellIndex(p2, p3, p4, p5)
	local v4 = t2.getTopLevelRegionHash(v1, v2, v3)
	local v5 = p1[v4]
	if not v5 then
		v5 = {}
		p1[v4] = v5
	end
	local v6, v7, v8 = t2.getTopLevelRegionPosition(p2, v1, v2, v3)
	for k, v in pairs(v5) do
		if t2.areEqualTopRegions(v, v6, v7, v8) then
			return v
		end
	end
	local v9 = t2.create(v6, v7, v8, p2[1], p2[2], p2[3])
	table.insert(v5, v9)
	return v9
end
return t2