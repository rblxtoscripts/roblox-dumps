-- https://lua.expert/
local t = {}
function t.new(p1, p2, p3, p4) --[[ new | Line: 4 | Upvalues: t (copy) ]]
	local v1 = setmetatable({}, {
		__index = t
	})
	v1.initial = p1
	v1.Position = p1
	v1.velocity = p1 * 0
	v1.Target = p2
	v1.Max = p4
	v1.Min = p3
	v1.zeta = 3.5
	v1.acceleration = 60
	return v1
end
function t.Update(p1, p2) --[[ Update | Line: 20 ]]
	if math.abs(p1.Position - p1.Target) < 0.01 then
		p1.Position = p1.Target
		return
	end
	local v2 = math.min(p1.Target, p1.Min)
	local v3 = math.max(p1.Target, p1.Max)
	local v4 = if p1.Position > p1.Target then -1 else 1
	local v5, v6, v7
	if v4 == 1 then
		v5 = 1.5 - p1.Position / v3
		if v5 then
			v6 = v2
			v7 = v3
		else
			v6 = v2
			v7 = v3
			v5 = 1
		end
	else
		v6 = v2
		v7 = v3
		v5 = 1
	end
	p1.Position = math.clamp(p1.Position + p1.acceleration * p2 * v4 * v5, v6, v7)
end
return t