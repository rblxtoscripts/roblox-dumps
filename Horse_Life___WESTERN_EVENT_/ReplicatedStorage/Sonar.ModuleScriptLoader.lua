-- https://lua.expert/
local ModuleScriptUtils = require(script.Parent:WaitForChild("ModuleScriptUtils"))
local ReplicationUtils = require(script.Parent:WaitForChild("ReplicationUtils"))
local t = {}
function t.new(p1, p2) --[[ new | Line: 10 | Upvalues: t (copy), ReplicationUtils (copy), ModuleScriptUtils (copy) ]]
	local v2 = setmetatable({}, t)
	v2._loadableScriptTypes = if p1 then p1 else { ReplicationUtils.ScriptType.SHARED, ReplicationUtils.ScriptType.SERVER, ReplicationUtils.ScriptType.CLIENT }
	v2._scriptTypeReplicationParentMap = if p2 then p2 else {}
	v2._lookupTable = {}
	v2._require = ModuleScriptUtils.requireByName(ModuleScriptUtils.detectCyclicalRequires(require), v2._lookupTable)
	return v2
end
function t.AddModuleToLookupTable(p1, p2) --[[ AddModuleToLookupTable | Line: 27 | Upvalues: ReplicationUtils (copy) ]]
	assert(if typeof(p2) == "Instance" then p2:IsA("ModuleScript") else false)
	ReplicationUtils.mergeModuleScriptIntoLookupTable(p1._lookupTable, p2)
end
function t.AddModule(p1, p2) --[[ AddModule | Line: 32 | Upvalues: ReplicationUtils (copy) ]]
	assert(if typeof(p2) == "Instance" then p2:IsA("ModuleScript") else false)
	local v2 = ReplicationUtils.classifyModuleScriptType(p2, nil)
	local v3
	if ReplicationUtils.isInTable(p1._loadableScriptTypes, v2) then
		ReplicationUtils.mergeModuleScriptIntoLookupTable(p1._lookupTable, p2)
		v3 = true
	else
		v3 = false
	end
	if p1._scriptTypeReplicationParentMap[v2] then
		p2.Parent = p1._scriptTypeReplicationParentMap[v2]
		v3 = true
	end
	if v3 then
		return
	end
	warn(("Warning: Added module %q but it was not replicated or added to lookup table"):format(p2:GetFullName()))
end
function t.AddModulesFromParent(p1, p2) --[[ AddModulesFromParent | Line: 56 | Upvalues: ReplicationUtils (copy) ]]
	assert(if typeof(p2) == "Instance" then true else false, "Modules must be added from parent")
	local v2 = ReplicationUtils.getReplicationMapForParent(p2)
	ReplicationUtils.mergeReplicationMapIntoLookupTable(p1._lookupTable, v2, p1._loadableScriptTypes)
	for k, v in pairs(p1._scriptTypeReplicationParentMap) do
		ReplicationUtils.reparentModulesOfScriptType(v2, k, v)
	end
end
function t.GetModule(p1, p2) --[[ GetModule | Line: 70 ]]
	return p1._lookupTable[p2]
end
function t.__call(p1, ...) --[[ __call | Line: 74 ]]
	return p1._require(...)
end
function t.__index(p1, p2) --[[ __index | Line: 78 | Upvalues: t (copy) ]]
	if t[p2] then
		return t[p2]
	else
		return p1._require(p2)
	end
end
return t