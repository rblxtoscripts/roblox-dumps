-- https://lua.expert/
local OctreeRegionUtils = require(script.Parent.OctreeRegionUtils)
local t = {
	ClassName = "OctreeNode"
}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 31 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2._octree = if p1 then p1 else error("No octree")
	v2._object = if p2 then p2 else error("No object")
	v2._currentLowestRegion = nil
	v2._position = nil
	return v2
end
function t.KNearestNeighborsSearch(p1, p2, p3) --[[ KNearestNeighborsSearch | Line: 56 ]]
	return p1._octree:KNearestNeighborsSearch(p1._position, p2, p3)
end
function t.GetObject(p1) --[[ GetObject | Line: 69 ]]
	return p1._object
end
function t.RadiusSearch(p1, p2) --[[ RadiusSearch | Line: 79 ]]
	return p1._octree:RadiusSearch(p1._position, p2)
end
function t.GetPosition(p1) --[[ GetPosition | Line: 87 ]]
	return p1._position
end
function t.GetRawPosition(p1) --[[ GetRawPosition | Line: 97 ]]
	return p1._px, p1._py, p1._pz
end
function t.SetPosition(p1, p2) --[[ SetPosition | Line: 112 | Upvalues: OctreeRegionUtils (copy) ]]
	if p1._position == p2 then
		return
	end
	local x = p2.x
	local y = p2.y
	local z = p2.z
	p1._px = x
	p1._py = y
	p1._pz = z
	p1._position = p2
	if p1._currentLowestRegion and OctreeRegionUtils.inRegionBounds(p1._currentLowestRegion, x, y, z) then
		return
	end
	local v1 = p1._octree:GetOrCreateLowestSubRegion(x, y, z)
	if p1._currentLowestRegion then
		OctreeRegionUtils.moveNode(p1._currentLowestRegion, v1, p1)
	else
		OctreeRegionUtils.addNode(v1, p1)
	end
	p1._currentLowestRegion = v1
end
function t.Destroy(p1) --[[ Destroy | Line: 149 | Upvalues: OctreeRegionUtils (copy) ]]
	if not p1._currentLowestRegion then
		return
	end
	OctreeRegionUtils.removeNode(p1._currentLowestRegion, p1)
end
return t