-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 36 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Connected = p1 ~= nil
	v2._callback = p1
	return v2
end
function t.Disconnect(p1) --[[ Disconnect | Line: 47 ]]
	if p1.Connected then
		task.spawn(p1._callback)
	end
	p1.Connected = false
end
t.Destroy = t.Disconnect
return t