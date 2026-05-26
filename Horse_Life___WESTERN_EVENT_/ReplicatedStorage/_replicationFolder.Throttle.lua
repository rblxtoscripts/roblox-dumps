-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 23 | Upvalues: t (copy) ]]
	assert(if typeof(p1) == "function" then true else false, "First argument must be a function")
	assert(if typeof(p2) == "number" then true else false, "Second argument must be a number")
	local v4 = setmetatable({}, t)
	v4.LastRun = 0
	v4.Fn = p1
	v4.Interval = p2
	return function(...) --[[ Line: 33 | Upvalues: v4 (copy) ]]
		local v1 = os.clock()
		if v1 - v4.LastRun >= v4.Interval then
			v4.LastRun = v1
			return v4.Fn(...)
		end
	end
end
return t