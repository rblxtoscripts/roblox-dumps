-- https://lua.expert/
local t = {}
t.__index = t
local function vec3Compare(p1, p2, p3) --[[ vec3Compare | Line: 4 ]]
	return Vector3.new(p3(p1.x, p2.x), p3(p1.y, p2.y), p3(p1.z, p2.z))
end
local function worldBoundingBox(p1, p2) --[[ worldBoundingBox | Line: 12 ]]
	local v1 = p2 / 2
	local v2 = p1:VectorToWorldSpace((Vector3.new(v1.x, v1.y, v1.z)))
	local v4 = p1:VectorToWorldSpace((Vector3.new(-v1.x, v1.y, v1.z)))
	local v7 = p1:VectorToWorldSpace((Vector3.new(-v1.x, -v1.y, v1.z)))
	local v11 = p1:VectorToWorldSpace((Vector3.new(-v1.x, -v1.y, -v1.z)))
	local v14 = p1:VectorToWorldSpace((Vector3.new(v1.x, -v1.y, -v1.z)))
	local v16 = p1:VectorToWorldSpace((Vector3.new(v1.x, v1.y, -v1.z)))
	local v18 = p1:VectorToWorldSpace((Vector3.new(v1.x, -v1.y, v1.z)))
	local v21 = p1:VectorToWorldSpace((Vector3.new(-v1.x, v1.y, -v1.z)))
	local v25 = Vector3.new(math.max(v2.x, v4.x, v7.x, v11.x, v14.x, v16.x, v18.x, v21.x), math.max(v2.y, v4.y, v7.y, v11.y, v14.y, v16.y, v18.y, v21.y), (math.max(v2.z, v4.z, v7.z, v11.z, v14.z, v16.z, v18.z, v21.z)))
	local v29 = Vector3.new(math.min(v2.x, v4.x, v7.x, v11.x, v14.x, v16.x, v18.x, v21.x), math.min(v2.y, v4.y, v7.y, v11.y, v14.y, v16.y, v18.y, v21.y), (math.min(v2.z, v4.z, v7.z, v11.z, v14.z, v16.z, v18.z, v21.z)))
	return v25 - v29, v29, v25
end
function t.new(p1, p2) --[[ new | Line: 41 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	local min = math.min
	local v3 = min(p1.x, p2.x)
	local v4 = min(p1.y, p2.y)
	v2.Min = Vector3.new(v3, v4, (min(p1.z, p2.z)))
	local max = math.max
	local v6 = max(p1.x, p2.x)
	local v7 = max(p1.y, p2.y)
	v2.Max = Vector3.new(v6, v7, (max(p1.z, p2.z)))
	return v2
end
function t.fromPositionSize(p1, p2) --[[ fromPositionSize | Line: 50 | Upvalues: t (copy) ]]
	return t.new(p1 + p2 / 2, p1 - p2 / 2)
end
t.worldBoundingBox = worldBoundingBox
function t.Intersects(p1, p2) --[[ Intersects | Line: 58 ]]
	local Max = p1.Max
	local Min = p1.Min
	local Max_2 = p2.Max
	local Min_2 = p2.Min
	if Min_2.x > Max.x then
		return false
	end
	if Min_2.y > Max.y then
		return false
	end
	if Min_2.z > Max.z then
		return false
	end
	if Max_2.x < Min.x then
		return false
	end
	if Max_2.y < Min.y then
		return false
	else
		return not (Max_2.z < Min.z)
	end
end
function t.Union(p1, p2) --[[ Union | Line: 72 | Upvalues: t (copy) ]]
	if p1:Intersects(p2) then
		local Min = p2.Min
		local Min_2 = p1.Min
		local max = math.max
		local v4 = Vector3.new(max(Min.x, Min_2.x), max(Min.y, Min_2.y), (max(Min.z, Min_2.z)))
		local Max = p2.Max
		local Max_2 = p1.Max
		local min = math.min
		return t.new(v4, (Vector3.new(min(Max.x, Max_2.x), min(Max.y, Max_2.y), (min(Max.z, Max_2.z)))))
	else
		return nil
	end
end
return t