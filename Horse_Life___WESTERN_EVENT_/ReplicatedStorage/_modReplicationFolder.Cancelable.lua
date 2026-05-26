-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1) --[[ new | Line: 24 | Upvalues: t (copy) ]]
	assert(typeof(p1) == "function", "First argument must be a function")
	local v3 = setmetatable({}, t)
	v3.Fn = p1
	v3.CurrentThread = nil
	return function(...) --[[ Line: 31 | Upvalues: v3 (copy) ]]
		local v1
		if not v3.CurrentThread then
			v1 = table.pack(...)
			v3.CurrentThread = task.spawn(function() --[[ Line: 37 | Upvalues: v3 (ref), v1 (copy) ]]
				local v32, v4 = pcall(v3.Fn, table.unpack(v1, 1, v1.n))
				if not v32 then
					warn("Cancelable-wrapped function errored:", v4)
				end
				v3.CurrentThread = nil
			end)
			return v3.CurrentThread
		end
		task.cancel(v3.CurrentThread)
		v1 = table.pack(...)
		v3.CurrentThread = task.spawn(function() --[[ Line: 37 | Upvalues: v3 (ref), v1 (copy) ]]
			local v32, v4 = pcall(v3.Fn, table.unpack(v1, 1, v1.n))
			if not v32 then
				warn("Cancelable-wrapped function errored:", v4)
			end
			v3.CurrentThread = nil
		end)
		return v3.CurrentThread
	end
end
return t