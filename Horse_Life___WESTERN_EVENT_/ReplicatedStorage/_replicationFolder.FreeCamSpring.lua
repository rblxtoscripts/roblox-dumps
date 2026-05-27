-- https://lua.expert/
local t = {}
t.__index = t
function t.Update(p1, p2) --[[ Update | Line: 4 ]]
	local t = p1.t
	local k = p1.k
	local d = p1.d
	local x = p1.x
	local v = p1.v
	local v1 = k * (t - x) + v * d
	local v2 = v + v1 * (p2 / 2)
	local v3 = k * (t - (x + v * (p2 / 2))) + v2 * d
	local v4 = v + v3 * (p2 / 2)
	local v5 = k * (t - (x + v2 * (p2 / 2))) + v4 * d
	local v6 = v + v5 * p2
	local v7 = x + (v + 2 * (v2 + v4) + v6) * (p2 / 6)
	p1.x = v7
	p1.v = v + (v1 + 2 * (v3 + v5) + k * (t - (x + v4 * p2)) + v6 * d) * (p2 / 6)
	return v7
end
function t.new(p1, p2, p3, p4) --[[ new | Line: 17 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	local v3 = p3 or 1
	local v4 = p2 * p2 / (4 * p1 * v3 * v3)
	v2.k = p1 / v4
	v2.d = -p2 / v4
	v2.x = p4
	v2.t = p4
	v2.v = p4 * 0
	return v2
end
return t