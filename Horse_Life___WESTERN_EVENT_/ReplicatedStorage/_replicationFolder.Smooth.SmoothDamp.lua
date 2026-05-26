-- https://lua.expert/
local function DeltaAngle(p1, p2) --[[ DeltaAngle | Line: 27 ]]
	local v1 = (p2 - p1) % 6.2831853071796
	return v1 > 3.1415926535898 and v1 - 6.2831853071796 or v1
end
local function DeltaAngleV3(p1, p2) --[[ DeltaAngleV3 | Line: 32 ]]
	local v1 = (p2.X - p1.X) % 6.2831853071796
	local v3 = (p2.Y - p1.Y) % 6.2831853071796
	local v5 = (p2.Z - p1.Z) % 6.2831853071796
	return Vector3.new(v1 > 3.1415926535898 and v1 - 6.2831853071796 or v1, v3 > 3.1415926535898 and v3 - 6.2831853071796 or v3, v5 > 3.1415926535898 and v5 - 6.2831853071796 or v5)
end
local t = {}
t.__index = t
function t.new() --[[ new | Line: 41 | Upvalues: t (copy) ]]
	return setmetatable({
		MaxSpeed = (1 / 0),
		_update = os.clock(),
		_velocity = Vector3.new()
	}, t)
end
function t.Destroy(p1) --[[ Destroy | Line: 49 ]]
	setmetatable(p1, nil)
end
function t.Update(p1, p2, p3, p4) --[[ Update | Line: 53 ]]
	local _velocity = p1._velocity
	local v1 = time()
	local v2 = v1 - p1._update
	local v3 = math.max(0.0001, p4)
	local v4 = 2 / v3
	local v5 = v4 * v2
	local v6 = 1 / (1 + v5 + 0.48 * v5 * v5 + 0.235 * v5 * v5 * v5)
	local v7 = p2 - p3
	local v8 = p1.MaxSpeed * v3
	local v9, v10
	if v8 < v7.Magnitude then
		v9 = v7.Unit * v8
		if v9 then
			v10 = p3
		else
			v9 = v7
			v10 = p3
		end
	else
		v9 = v7
		v10 = p3
	end
	local v11 = (_velocity + v4 * v9) * v2
	local v12 = p2 - v9 + (v9 + v11) * v6
	local v13
	if (v10 - p2):Dot(v12 - v10) > 0 then
		v13 = (v10 - v10) / v2
		v12 = v10
	else
		v13 = (_velocity - v4 * v11) * v6
	end
	p1._velocity = v13
	p1._update = v1
	return v12
end
function t.UpdateAngle(p1, p2, p3, p4) --[[ UpdateAngle | Line: 84 ]]
	local v1 = (p3.X - p2.X) % 6.2831853071796
	local v2, v3
	if v1 > 3.1415926535898 then
		v2 = v1 - 6.2831853071796
		if v2 then
			v3 = p2
		else
			v2 = v1
			v3 = p2
		end
	else
		v2 = v1
		v3 = p2
	end
	local v4 = (p3.Y - p2.Y) % 6.2831853071796
	local v6 = (p3.Z - p2.Z) % 6.2831853071796
	return p1:Update(v3, p2 + Vector3.new(v2, v4 > 3.1415926535898 and v4 - 6.2831853071796 or v4, v6 > 3.1415926535898 and v6 - 6.2831853071796 or v6), p4)
end
return t