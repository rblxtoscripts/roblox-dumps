-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local t = {}
local function readonly(p1) --[[ readonly | Line: 9 ]]
	return setmetatable(p1, {
		__index = function(p1, p2) --[[ __index | Line: 11 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end,
		__newindex = function(p1, p2, p3) --[[ __newindex | Line: 14 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end
	})
end
function t.classifyModuleScriptType(p1, p2) --[[ classifyModuleScriptType | Line: 22 | Upvalues: t (copy) ]]
	if p2 then
		local v1 = p1:FindFirstAncestorOfClass("ModuleScript")
		if v1 and v1:IsDescendantOf(p2) then
			return t.ScriptType.SUBMODULE
		end
	end
	local v2 = p1.Parent
	while v2 and v2 ~= p2 do
		local v3 = v2.Name
		if v3 == "Server" then
			return t.ScriptType.SERVER
		end
		if v3 == "Client" then
			return t.ScriptType.CLIENT
		end
		v2 = v2.Parent
	end
	return t.ScriptType.SHARED
end
function t.reparentModulesOfScriptType(p1, p2, p3) --[[ reparentModulesOfScriptType | Line: 44 ]]
	assert(if type(p1) == "table" then true else false)
	assert(if type(p2) == "string" then true else false)
	assert(if typeof(p3) == "Instance" then true else false)
	for k, v in pairs(p1[p2]) do
		if p3:FindFirstChild(v.Name) then
			warn((("Warning: %* could not be reparented because a duplicate name already exists!"):format((v:GetFullName()))))
			continue
		end
		v.Parent = p3
	end
end
function t.getReplicationMapForParent(p1) --[[ getReplicationMapForParent | Line: 59 | Upvalues: t (copy) ]]
	assert(typeof(p1) == "Instance")
	local t2 = {
		[t.ScriptType.SHARED] = {},
		[t.ScriptType.SERVER] = {},
		[t.ScriptType.CLIENT] = {},
		[t.ScriptType.SUBMODULE] = {}
	}
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("ModuleScript") then
			table.insert(t2[t.classifyModuleScriptType(v, p1)], v)
		end
	end
	return t2
end
function t.mergeModuleScriptIntoLookupTable(p1, p2, p3) --[[ mergeModuleScriptIntoLookupTable | Line: 79 ]]
	if p1[p2.Name] then
		warn((("Warning: %* could not be reparented because a duplicate name already exists!"):format((p2:GetFullName()))))
	else
		p1[p2.Name] = p2
	end
end
function t.mergeReplicationMapIntoLookupTable(p1, p2, p3) --[[ mergeReplicationMapIntoLookupTable | Line: 87 | Upvalues: t (copy) ]]
	for k, v in pairs(p3) do
		for k2, v2 in pairs(p2[v]) do
			t.mergeModuleScriptIntoLookupTable(p1, v2, p3)
		end
	end
end
t.ScriptType = readonly({
	SHARED = "shared",
	SERVER = "server",
	CLIENT = "client",
	SUBMODULE = "submodule"
})
function t.isInTable(p1, p2) --[[ isInTable | Line: 102 ]]
	assert(p1)
	assert(p2)
	for k, v in pairs(p1) do
		if v == p2 then
			return true
		end
	end
	return false
end
function t.createReplicationFolder(p1) --[[ createReplicationFolder | Line: 115 | Upvalues: ReplicatedStorage (copy) ]]
	assert(type(p1) == "string")
	assert(not ReplicatedStorage:FindFirstChild(p1), "Duplicate of _ReplicatedModules")
	local v3 = Instance.new("Folder")
	v3.Name = p1
	v3.Parent = ReplicatedStorage
	return v3
end
return t