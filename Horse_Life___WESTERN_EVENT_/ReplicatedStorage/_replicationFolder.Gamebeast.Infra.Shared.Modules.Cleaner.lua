-- https://lua.expert/
local t = {}
t.__index = t
function t.new() --[[ new | Line: 33 | Upvalues: t (copy) ]]
	local v2 = setmetatable({}, t)
	v2._toClean = {}
	return v2
end
function t.Add(p1, p2) --[[ Add | Line: 43 ]]
	if typeof(p2) == "table" and typeof(p2.Destroy) ~= "function" then
		error("Object does not have a Destroy method.")
	end
	table.insert(p1._toClean, p2)
end
function t.Destroy(p1) --[[ Destroy | Line: 51 ]]
	for i, v in ipairs(p1._toClean) do
		if typeof(v) == "RBXScriptConnection" then
			v:Disconnect()
			continue
		end
		v:Destroy()
	end
end
t.Clean = t.Destroy
return t