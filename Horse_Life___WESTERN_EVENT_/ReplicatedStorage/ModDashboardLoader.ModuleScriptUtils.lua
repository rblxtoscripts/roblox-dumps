-- https://lua.expert/
local t = {}
local v1 = game:GetService("RunService"):IsServer()
function t.requireByName(p1, p2) --[[ requireByName | Line: 11 | Upvalues: v1 (copy) ]]
	assert(if type(p1) == "function" then true else false)
	assert(if type(p2) == "table" then true else false)
	return function(p12, p22) --[[ Line: 15 | Upvalues: v1 (ref), p1 (copy), p2 (copy) ]]
		local v12 = if p22 then p22 else {}
		local v2 = if type(v12) == "string" then {
	Yield = false,
	Deferred = false,
	Context = v12
} else v12
		if v2.Context == "Server" and not v1 then
			return nil
		end
		if v2.Context == "Client" and v1 then
			return nil
		end
		if typeof(p12) == "Instance" and p12:IsA("ModuleScript") then
			return p1(p12)
		end
		if type(p12) ~= "string" then
			error(("Error: module must be a string or ModuleScript, got \'%s\' for \'%s\'"):format(typeof(p12), p12.ClassName))
		end
		local v3 = p2[p12]
		if v2.Yield then
			while not v3 do
				v3 = p2[p12]
				task.wait()
			end
		end
		if v2.Deferred then
			local v4 = p2[p12]
			local v5 = nil
			local t = {
				__index = function(p12, p2) --[[ __index | Line: 48 | Upvalues: v5 (ref), p1 (ref), v4 (copy) ]]
					if v5 ~= nil then
						return v5[p2]
					end
					v5 = p1(v4)
					return v5[p2]
				end,
				__newindex = function(p12, p2, p3) --[[ __newindex | Line: 54 | Upvalues: v5 (ref), p1 (ref), v4 (copy) ]]
					if v5 == nil then
						v5 = p1(v4)
					end
					v5[p2] = p3
				end,
				__call = function(p12, ...) --[[ __call | Line: 60 | Upvalues: v5 (ref), p1 (ref), v4 (copy) ]]
					if v5 ~= nil then
						return v5(...)
					end
					v5 = p1(v4)
					return v5(...)
				end
			}
			return setmetatable({}, t)
		end
		if v3 then
			return p1(v3)
		else
			error("Error: Library \'" .. tostring(p12) .. "\' does not exist.", 2)
		end
	end
end
function t.detectCyclicalRequires(p1) --[[ detectCyclicalRequires | Line: 82 ]]
	return p1
end
function t.getCyclicalStateFromStack(p1, p2) --[[ getCyclicalStateFromStack | Line: 113 ]]
	local v1 = ""
	for i = p2, #p1 do
		v1 = v1 .. p1[i].Name .. " -> "
	end
	return v1 .. p1[p2].Name
end
return t