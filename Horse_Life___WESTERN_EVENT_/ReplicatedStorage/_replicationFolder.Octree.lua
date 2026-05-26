-- https://lua.expert/
local OctreeBase = require(script.OctreeBase)
local v1 = Random.new(os.clock() * os.time())
local t = {}
local t2 = {
	Depth = 4,
	Size = 512
}
local t3 = {}
t3.__index = t3
function t3.GetAllNodes(p1) --[[ GetAllNodes | Line: 22 ]]
	return p1.Tree:GetAllNodes()
end
function t3.RadiusSearch(p1, p2, p3) --[[ RadiusSearch | Line: 26 ]]
	return p1.Tree:RadiusSearch(p2, p3)
end
function t3.GetNearestWithMax(p1, p2, p3, p4) --[[ GetNearestWithMax | Line: 31 ]]
	return p1.Tree:KNearestNeighborsSearch(p2, p3, p4)
end
function t3.AddStatic(p1, p2, p3) --[[ AddStatic | Line: 38 ]]
	table.insert(p1._trash, p1.Tree:CreateNode(p3 or Vector3.new(0, 0, 0), p2))
end
function t3.Add(p1, p2, p3) --[[ Add | Line: 42 ]]
	p1.Entries[p2] = p1.Tree:CreateNode(p3 or Vector3.new(0, 0, 0), p2)
end
function t3.Track(p1, p2, p3) --[[ Track | Line: 47 ]]
	assert(typeof(p2) == "Instance", "Object must be an instance")
end
function t3.Remove(p1, p2) --[[ Remove | Line: 51 ]]
	if p1.Entries[p2] then
		p1.Entries[p2]:Destroy()
	end
	p1.Entries[p2] = nil
end
function t3.UpdateFor(p1, p2, p3) --[[ UpdateFor | Line: 59 ]]
	p1:Remove(p2)
	p1:Add(p2, p3)
end
function t3.Destroy(p1) --[[ Destroy | Line: 65 ]]
	p1.Update = false
	for v1, v2 in p1._trash do
		v2:Destroy()
	end
	for v3, v4 in p1.Entries do
		v4:Destroy()
	end
	p1.Tree = nil
end
function t3._init(p1) --[[ _init | Line: 79 ]]
	p1.Update = true
end
function t.new(p1, p2, p3) --[[ new | Line: 86 | Upvalues: v1 (copy), OctreeBase (copy), t2 (copy), t3 (copy) ]]
	local t = {
		Update = false
	}
	t.Name = if p1 then p1 else "Unnamed DOS Grid ~~" .. v1:NextInteger(1000, 9999)
	local v3 = if p2 then p2 else t2.Depth
	t.Tree = OctreeBase.new(v3, if p3 then p3 else t2.Size)
	t.Entries = {}
	t.Tracked = {}
	t._trash = {}
	local v6 = setmetatable(t, t3)
	v6:_init()
	return v6
end
return t