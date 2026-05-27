-- https://lua.expert/
local OctreeRegionUtils = require(script.OctreeRegionUtils)
local OctreeNode = require(script.OctreeNode)
local t = {
	ClassName = "Octree"
}
t.__index = t
t.Node = script.OctreeNode
t.RegionUtils = script.OctreeRegionUtils
function t.new(p1, p2) --[[ new | Line: 52 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2._maxRegionSize = if p2 then { p2, p2, p2 } else { 512, 512, 512 }
	v2._maxDepth = p1 or 4
	v2._regionHashMap = {}
	return v2
end
function t.GetAllNodes(p1) --[[ GetAllNodes | Line: 76 ]]
	local t = {}
	for k, v in pairs(p1._regionHashMap) do
		for k2, v2 in pairs(v) do
			for k3, v3 in pairs(v2.nodes) do
				t[#t + 1] = k3
			end
		end
	end
	return t
end
function t.CreateNode(p1, p2, p3) --[[ CreateNode | Line: 105 | Upvalues: OctreeNode (copy) ]]
	assert(if typeof(p2) == "Vector3" then true else false, "Bad position value")
	assert(p3, "Bad object value")
	local v2 = OctreeNode.new(p1, p3)
	v2:SetPosition(p2)
	return v2
end
function t.RadiusSearch(p1, p2, p3) --[[ RadiusSearch | Line: 131 ]]
	assert(if typeof(p2) == "Vector3" then true else false, "Bad position")
	assert(if type(p3) == "number" then true else false, "Bad radius")
	return p1:_radiusSearch(p2.x, p2.y, p2.z, p3)
end
function t.KNearestNeighborsSearch(p1, p2, p3, p4) --[[ KNearestNeighborsSearch | Line: 149 ]]
	assert(if typeof(p2) == "Vector3" then true else false, "Bad position")
	assert(if type(p4) == "number" then true else false, "Bad radius")
	local v3, v4 = p1:_radiusSearch(p2.x, p2.y, p2.z, p4)
	local t = {}
	for k, v in pairs(v4) do
		table.insert(t, {
			dist2 = v,
			index = k
		})
	end
	table.sort(t, function(p1, p2) --[[ Line: 164 ]]
		return p1.dist2 < p2.dist2
	end)
	local t2 = {}
	local t3 = {}
	for i = 1, math.min(#t, p3) do
		local v5 = t[i]
		t2[#t2 + 1] = v5.dist2
		t3[#t3 + 1] = v3[v5.index]
	end
	return t3, t2
end
function t.GetOrCreateLowestSubRegion(p1, p2, p3, p4) --[[ GetOrCreateLowestSubRegion | Line: 187 | Upvalues: OctreeRegionUtils (copy) ]]
	return OctreeRegionUtils.getOrCreateSubRegionAtDepth(p1:_getOrCreateRegion(p2, p3, p4), p2, p3, p4, p1._maxDepth)
end
function t._radiusSearch(p1, p2, p3, p4, p5) --[[ _radiusSearch | Line: 192 | Upvalues: OctreeRegionUtils (copy) ]]
	local v2 = OctreeRegionUtils.getSearchRadiusSquared(p5, p1._maxRegionSize[1], 1e-9)
	local t = {}
	local t2 = {}
	for k, v in pairs(p1._regionHashMap) do
		for k2, v3 in pairs(v) do
			local position = v3.position
			local v4 = p2 - position[1]
			local v5 = p3 - position[2]
			local v6 = p4 - position[3]
			if v4 * v4 + v5 * v5 + v6 * v6 <= v2 then
				OctreeRegionUtils.getNeighborsWithinRadius(v3, p5, p2, p3, p4, t, t2, p1._maxDepth)
			end
		end
	end
	return t, t2
end
function t._getRegion(p1, p2, p3, p4) --[[ _getRegion | Line: 216 | Upvalues: OctreeRegionUtils (copy) ]]
	return OctreeRegionUtils.findRegion(p1._regionHashMap, p1._maxRegionSize, p2, p3, p4)
end
function t._getOrCreateRegion(p1, p2, p3, p4) --[[ _getOrCreateRegion | Line: 220 | Upvalues: OctreeRegionUtils (copy) ]]
	return OctreeRegionUtils.getOrCreateRegion(p1._regionHashMap, p1._maxRegionSize, p2, p3, p4)
end
return t