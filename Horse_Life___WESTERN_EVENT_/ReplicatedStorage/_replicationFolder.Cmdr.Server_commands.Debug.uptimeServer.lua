-- https://lua.expert/
local v1 = os.time()
return function() --[[ Line: 3 | Upvalues: v1 (copy) ]]
	local v12 = os.time() - v1
	return ("%dd %dh %dm %ds"):format(math.floor(v12 / 86400), math.floor(v12 / 3600) % 24, math.floor(v12 / 60) % 60, math.floor(v12) % 60)
end