-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("Binder")
local t = {}
t.__index = t
local t2 = {}
function t.new(p1) --[[ new | Line: 9 | Upvalues: t (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	t2[p1] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 17 ]]
	table.clear(p1)
	setmetatable(p1, nil)
end
game:GetService("RunService").Heartbeat:Connect(function() --[[ Line: 22 | Upvalues: t2 (copy) ]]
	for v1, v2 in t2 do
		v1.Rotation = v1.Rotation + 0.25
	end
end)
local function init() --[[ init | Line: 28 | Upvalues: v1 (copy), t (copy) ]]
	v1.new("RotatingRay", t):Init()
end
v1.new("RotatingRay", t):Init()
return t