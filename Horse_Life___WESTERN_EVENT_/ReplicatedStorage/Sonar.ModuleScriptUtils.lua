-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local v1 = nil
local v2 = RunService:IsServer()
function t.requireByName(p1, p2) --[[ requireByName | Line: 13 | Upvalues: RunService (copy), v2 (copy), v1 (ref) ]]
	assert(if type(p1) == "function" then true else false)
	assert(if type(p2) == "table" then true else false)
	local t = {}
	local function requireModule(p12) --[[ requireModule | Line: 19 | Upvalues: RunService (ref), t (copy), p1 (copy) ]]
		local v1 = workspace:GetAttribute("DebugRequires")
		local v2 = RunService:IsStudio() and (if v1 then not t[p12] else v1)
		t[p12] = true
		if not v2 then
			return p1(p12)
		end
		local v3 = os.clock()
		local v4 = p1(p12)
		local v5 = os.clock()
		if not (v1 < v5 - v3) then
			return v4
		end
		print("Sonar Require " .. p12.Name .. " returned in " .. string.format("%.3fs", v5 - v3) .. " (" .. p12.Name .. ")")
		return v4
	end
	return function(p1, p22) --[[ Line: 39 | Upvalues: v2 (ref), requireModule (copy), v1 (ref), p2 (copy) ]]
		local v12 = if p22 then p22 else {}
		local v22 = if type(v12) == "string" then {
	Yield = false,
	Deferred = false,
	Context = v12
} else v12
		if v22.Context == "Server" and not v2 then
			return nil
		end
		if v22.Context == "Client" and v2 then
			return nil
		end
		if typeof(p1) == "Instance" and p1:IsA("ModuleScript") then
			return requireModule(p1)
		end
		if type(p1) ~= "string" then
			error(("Error: module must be a string or ModuleScript, got \'%s\' for \'%s\'"):format(typeof(p1), p1.ClassName))
		end
		if v22.PlaceType then
			v1 = v1 or requireModule(p2.PlaceTypeService)
			if v1.GetPlaceType() ~= v22.PlaceType then
				return nil
			end
		end
		local v4 = p2[p1]
		if v22.Yield then
			while not v4 do
				v4 = p2[p1]
				task.wait()
			end
		end
		if v22.Deferred then
			local v5 = p2[p1]
			local v6 = nil
			local t = {}
			local t2 = {
				__index = function(p1, p2) --[[ __index | Line: 80 | Upvalues: v6 (ref), requireModule (ref), v5 (copy), t (copy) ]]
					if v6 == nil then
						v6 = requireModule(v5)
					end
					local v1 = v6[p2]
					if type(v1) == "function" then
						return function(p1, ...) --[[ Line: 86 | Upvalues: t (ref), v1 (copy), v6 (ref) ]]
							if p1 == t then
								return v1(v6, ...)
							else
								return v1(p1, ...)
							end
						end
					else
						return v1
					end
				end,
				__newindex = function(p1, p2, p3) --[[ __newindex | Line: 95 | Upvalues: v6 (ref), requireModule (ref), v5 (copy) ]]
					if v6 ~= nil then
						v6[p2] = p3
						return
					end
					v6 = requireModule(v5)
					v6[p2] = p3
				end,
				__call = function(p1, ...) --[[ __call | Line: 101 | Upvalues: v6 (ref), requireModule (ref), v5 (copy), t (copy) ]]
					if v6 == nil then
						v6 = requireModule(v5)
					end
					if p1 == t then
						return v6(v6, ...)
					else
						return v6(p1, ...)
					end
				end
			}
			return setmetatable(t, t2)
		end
		if v4 then
			return requireModule(v4)
		else
			error("Error: Library \'" .. tostring(p1) .. "\' does not exist.", 2)
		end
	end
end
function t.detectCyclicalRequires(p1) --[[ detectCyclicalRequires | Line: 126 ]]
	return p1
end
function t.getCyclicalStateFromStack(p1, p2) --[[ getCyclicalStateFromStack | Line: 157 ]]
	local v1 = ""
	for i = p2, #p1 do
		v1 = v1 .. p1[i].Name .. " -> "
	end
	return v1 .. p1[p2].Name
end
return t