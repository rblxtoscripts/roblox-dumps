-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 24 | Upvalues: t (copy) ]]
	assert(if typeof(p1) == "function" then true else false, "First argument must be a function")
	assert(if typeof(p2) == "number" then true else false, "Second argument must be a number")
	local v4 = setmetatable({}, t)
	v4.Fn = p1
	v4.Wait = p2
	v4.Timer = nil
	return function(...) --[[ Line: 34 | Upvalues: v4 (copy) ]]
		local t = { ... }
		if v4.Timer then
			task.cancel(v4.Timer)
		end
		v4.Timer = task.delay(v4.Wait, function() --[[ Line: 40 | Upvalues: v4 (ref), t (copy) ]]
			v4.Timer = nil
			v4.Fn(unpack(t))
		end)
	end
end
return t