-- https://lua.expert/
local Sonar = require(game.ReplicatedStorage.Sonar)
local v1 = Sonar("FishClient")
local v2 = Sonar("Binder")
local t = {}
t.__index = t
function t.Init() --[[ Init | Line: 8 | Upvalues: v2 (copy), t (copy) ]]
	v2.new("FishSpot", t):Init()
end
function t.new(p1) --[[ new | Line: 13 | Upvalues: t (copy), v1 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.SpawnPad = p1
	v2.ParentName = p1.Parent.Name
	v1.AddToPool(v2.ParentName, v2.SpawnPad)
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 24 | Upvalues: v1 (copy), t (copy) ]]
	v1.RemoveFromPool(p1.ParentName, p1.SpawnPad)
	setmetatable(p1, t)
end
t.Init()
return t