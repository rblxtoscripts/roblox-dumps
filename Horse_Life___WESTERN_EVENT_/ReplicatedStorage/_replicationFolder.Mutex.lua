-- https://lua.expert/
local t = {}
t.__index = t
function t.new(p1, p2) --[[ new | Line: 33 | Upvalues: t (copy) ]]
	assert(if typeof(p1) == "function" then true else false, "First argument must be a function")
	assert(if p2 == nil then true elseif typeof(p2) == "boolean" then true else false, "Second argument must be a boolean or nil")
	local v4 = setmetatable({}, t)
	v4.Fn = p1
	v4.Running = false
	v4.Pending = false
	return function(...) --[[ Line: 42 | Upvalues: p2 (copy), v4 (copy) ]]
		if p2 then
			v4.Pending = true
			if not v4.Running then
				local v1 = table.pack(...)
				task.spawn(function() --[[ Line: 48 | Upvalues: v4 (ref), v1 (copy) ]]
					repeat
						v4.Pending = false
						v4.Running = true
						local v3, v42 = pcall(v4.Fn, table.unpack(v1, 1, v1.n))
						if v3 then
							continue
						end
						warn("Mutex-wrapped function errored:", v42)
					until not v4.Pending
					v4.Running = false
				end)
			end
		elseif not v4.Running then
			v4.Running = true
			task.spawn(function(...) --[[ Line: 65 | Upvalues: v4 (ref) ]]
				local v1, v2 = pcall(v4.Fn, ...)
				v4.Running = false
				if v1 then
					return
				end
				warn("Mutex-wrapped function errored:", v2)
			end, ...)
		end
	end
end
return t