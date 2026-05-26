-- https://lua.expert/
local t = {}
t.__index = t
function t.new() --[[ new | Line: 4 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2.n = 0
	return v2
end
function t.Add(p1, p2) --[[ Add | Line: 12 ]]
	p1[p2] = true
	p1.n = p1.n + 1
end
function t.Remove(p1, p2) --[[ Remove | Line: 17 ]]
	if not p1[p2] then
		return
	end
	p1[p2] = nil
	p1.n = p1.n - 1
end
return t