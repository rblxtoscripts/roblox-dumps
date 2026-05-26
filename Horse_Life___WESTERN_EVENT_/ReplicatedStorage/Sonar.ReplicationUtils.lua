-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local v1 = game:GetService("RunService"):IsStudio()
local t = { "ServerInit", "ClientInit" }
local t2 = {}
local t3 = {}
local function readonly(p1) --[[ readonly | Line: 18 ]]
	return setmetatable(p1, {
		__index = function(p1, p2) --[[ __index | Line: 20 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end,
		__newindex = function(p1, p2, p3) --[[ __newindex | Line: 23 ]]
			error(("Bad index %q"):format((tostring(p2))), 2)
		end
	})
end
function t2.classifyModuleScriptType(p1, p2) --[[ classifyModuleScriptType | Line: 31 | Upvalues: t2 (copy) ]]
	if p2 then
		local v1 = p1:FindFirstAncestorOfClass("ModuleScript")
		if v1 and v1:IsDescendantOf(p2) then
			return t2.ScriptType.SUBMODULE
		end
	end
	local v2 = p1.Parent
	while v2 and v2 ~= p2 do
		local v3 = v2.Name
		if v3 == "Server" then
			return t2.ScriptType.SERVER
		end
		if v3 == "Client" then
			return t2.ScriptType.CLIENT
		end
		v2 = v2.Parent
	end
	return t2.ScriptType.SHARED
end
function t2.reparentModulesOfScriptType(p1, p2, p3) --[[ reparentModulesOfScriptType | Line: 53 | Upvalues: v1 (copy), t (copy), t3 (copy) ]]
	assert(if type(p1) == "table" then true else false)
	assert(if type(p2) == "string" then true else false)
	assert(if typeof(p3) == "Instance" then true else false)
	for k, v in pairs(p1[p2]) do
		if p3:FindFirstChild(v.Name) then
			if v1 and not (table.find(t, v.Name) or table.find(t3, v.Name)) then
				table.insert(t3, v.Name)
			end
			continue
		end
		v.Parent = p3
	end
end
function t2.getReplicationMapForParent(p1) --[[ getReplicationMapForParent | Line: 72 | Upvalues: t2 (copy) ]]
	assert(typeof(p1) == "Instance")
	local t = {
		[t2.ScriptType.SHARED] = {},
		[t2.ScriptType.SERVER] = {},
		[t2.ScriptType.CLIENT] = {},
		[t2.ScriptType.SUBMODULE] = {}
	}
	for k, v in pairs(p1:GetDescendants()) do
		if v:IsA("ModuleScript") then
			table.insert(t[t2.classifyModuleScriptType(v, p1)], v)
		end
	end
	return t
end
function t2.mergeModuleScriptIntoLookupTable(p1, p2, p3) --[[ mergeModuleScriptIntoLookupTable | Line: 92 | Upvalues: v1 (copy), t (copy), t3 (copy) ]]
	if p1[p2.Name] then
		if v1 and not (table.find(t, p2.Name) or table.find(t3, p2.Name)) then
			table.insert(t3, p2.Name)
		end
	else
		p1[p2.Name] = p2
	end
end
function t2.mergeReplicationMapIntoLookupTable(p1, p2, p3) --[[ mergeReplicationMapIntoLookupTable | Line: 104 | Upvalues: t2 (copy) ]]
	for k, v in pairs(p3) do
		for k2, v2 in pairs(p2[v]) do
			t2.mergeModuleScriptIntoLookupTable(p1, v2, p3)
		end
	end
end
t2.ScriptType = readonly({
	SHARED = "shared",
	SERVER = "server",
	CLIENT = "client",
	SUBMODULE = "submodule"
})
function t2.isInTable(p1, p2) --[[ isInTable | Line: 119 ]]
	assert(p1)
	assert(p2)
	for k, v in pairs(p1) do
		if v == p2 then
			return true
		end
	end
	return false
end
function t2.createReplicationFolder(p1) --[[ createReplicationFolder | Line: 132 | Upvalues: ReplicatedStorage (copy) ]]
	assert(type(p1) == "string")
	assert(not ReplicatedStorage:FindFirstChild(p1), "Duplicate of _ReplicatedModules")
	local v3 = Instance.new("Folder")
	v3.Name = p1
	v3.Parent = ReplicatedStorage
	return v3
end
function t2.getDuplicateModules() --[[ getDuplicateModules | Line: 143 | Upvalues: t3 (copy) ]]
	return t3
end
return t2