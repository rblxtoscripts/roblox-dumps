-- https://lua.expert/
local v1 = game:GetService("RunService"):IsStudio()
return function(...) --[[ Line: 4 | Upvalues: v1 (copy) ]]
	if v1 then
		debug.profilebegin("DebugWarn")
		warn(...)
		debug.profileend()
	end
end