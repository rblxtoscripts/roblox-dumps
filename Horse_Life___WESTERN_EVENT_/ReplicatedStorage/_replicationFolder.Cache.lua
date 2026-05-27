-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1, p2, p3) --[[ new | Line: 27 | Upvalues: t (copy) ]]
	assert(if typeof(p1) == "function" then true else false, "First argument must be a function")
	assert(if typeof(p2) == "number" then if p2 > 0 then true else false else false, "Second argument must be a positive number")
	local v4 = setmetatable({}, t)
	v4.Getter = p1
	v4.CacheTimer = p2
	v4.CachedValue = nil
	v4.CachedTime = nil
	if p3 then
		local v5, v6 = pcall(v4.Getter)
		if v5 then
			v4.CachedValue = v6
			v4.CachedTime = workspace:GetServerTimeNow()
		else
			warn("Cache getter function errored during init:", v6)
			v4.CachedValue = nil
			v4.CachedTime = nil
		end
	end
	return function(p1, ...) --[[ Line: 50 | Upvalues: v4 (copy) ]]
		local v1 = workspace:GetServerTimeNow()
		local v2 = false
		local v3 = if typeof(p1) == "boolean" and p1 then p1 else false
		local v42 = typeof(p1) == "boolean" and table.pack(...) or table.pack(p1, ...)
		if v3 or (v4.CachedValue == nil or v4.CachedTime == nil) then
			v2 = true
			local v6, v7 = pcall(v4.Getter, table.unpack(v42, 1, v42.n))
			if v6 then
				v4.CachedValue = v7
				v4.CachedTime = v1
			else
				warn("Cache getter function errored:", v7)
				if v4.CachedValue == nil then
					return nil, 0, false
				else
					return v4.CachedValue, v4.CachedTime, false
				end
			end
		elseif v1 - v4.CachedTime >= v4.CacheTimer then
			v2 = true
			local v9, v10 = pcall(v4.Getter, table.unpack(v42, 1, v42.n))
			if not v9 then
				warn("Cache getter function errored:", v10)
				return v4.CachedValue, v4.CachedTime, false
			end
			v4.CachedValue = v10
			v4.CachedTime = v1
		end
		return v4.CachedValue, v4.CachedTime, v2
	end
end
return t