-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 46 | Upvalues: t (copy) ]]
	assert(typeof(p1) == "table", "Config must be a table")
	assert(typeof(p1.Run) == "function", "config.Run must be a function")
	assert(if typeof(p1.Limit) == "number" then if p1.Limit >= 1 then true else false else false, "config.Limit must be a positive number")
	assert(if typeof(p1.Rate) == "number" then if p1.Rate > 0 then true else false else false, "config.Rate must be a positive number")
	assert(if p1.Key == nil then true elseif typeof(p1.Key) == "function" then true else false, "config.Key must be a function or nil")
	local v7 = setmetatable({}, t)
	v7.Run = p1.Run
	v7.Limit = p1.Limit
	v7.Rate = p1.Rate
	v7.Key = p1.Key
	v7.Buckets = {}
	return function(...) --[[ Line: 60 | Upvalues: v7 (copy) ]]
		local v1 = if v7.Key then v7.Key(...) or "__default" else "__default"
		local v2 = os.clock()
		local v3 = v7.Buckets[v1]
		if not v3 then
			local t = {
				Tokens = v7.Limit,
				LastRefill = v2
			}
			v7.Buckets[v1] = t
			v3 = t
		end
		local v4 = v2 - v3.LastRefill
		if v7.Rate <= v4 then
			local v6 = math.floor(v4 / v7.Rate)
			v3.Tokens = math.min(v7.Limit, v3.Tokens + v6)
			v3.LastRefill = v3.LastRefill + v6 * v7.Rate
		end
		if v3.Tokens > 0 then
			v3.Tokens = v3.Tokens - 1
			return v7.Run(...)
		else
			return nil
		end
	end
end
return t