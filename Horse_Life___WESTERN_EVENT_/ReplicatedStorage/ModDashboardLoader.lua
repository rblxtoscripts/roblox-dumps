-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")
local ModuleScriptLoader = require(script:WaitForChild("ModuleScriptLoader"))
local ReplicationUtils = require(script:WaitForChild("ReplicationUtils"))
if RunService:IsServer() then
	local v1 = ReplicationUtils.createReplicationFolder("_modReplicationFolder")
	local v2 = ModuleScriptLoader.new({ ReplicationUtils.ScriptType.SHARED, ReplicationUtils.ScriptType.SERVER }, {
		[ReplicationUtils.ScriptType.CLIENT] = v1,
		[ReplicationUtils.ScriptType.SHARED] = v1
	})
	if ServerScriptService:FindFirstChild("ModDashboardSource") then
		v2:AddModulesFromParent(ServerScriptService.ModDashboardSource)
	end
	return v2
elseif RunService:IsClient() then
	local v3 = ModuleScriptLoader.new({ ReplicationUtils.ScriptType.SHARED, ReplicationUtils.ScriptType.CLIENT })
	v3:AddModulesFromParent(ReplicatedStorage:WaitForChild("_modReplicationFolder"))
	return v3
else
	error("Error: Unknown state")
end