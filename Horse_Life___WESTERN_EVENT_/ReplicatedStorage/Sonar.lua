-- https://lua.expert/
local v0 = "\226\154\160\239\184\143 Sonar, the following modules could not be reparented because a duplicate name already exists:"
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerScriptService = game:GetService("ServerScriptService")
local ModuleScriptLoader = require(script:WaitForChild("ModuleScriptLoader"))
local ReplicationUtils = require(script:WaitForChild("ReplicationUtils"))
if not (RunService:IsServer() and RunService:IsClient()) and RunService:IsRunning() then
	if RunService:IsServer() then
		local v1 = ReplicationUtils.createReplicationFolder("_replicationFolder")
		local v2 = ModuleScriptLoader.new({ ReplicationUtils.ScriptType.SHARED, ReplicationUtils.ScriptType.SERVER }, {
			[ReplicationUtils.ScriptType.CLIENT] = v1,
			[ReplicationUtils.ScriptType.SHARED] = v1
		})
		if ServerScriptService:FindFirstChild("WorldModules") then
			workspace:SetAttribute("WorldModules", true)
			v2:AddModulesFromParent(ServerScriptService:WaitForChild("WorldModules"))
		else
			workspace:SetAttribute("WorldModules", false)
		end
		if ServerScriptService:FindFirstChild("Sonar") then
			v2:AddModulesFromParent(ServerScriptService:WaitForChild("Sonar"))
		end
		if ServerScriptService:FindFirstChild("Library") then
			v2:AddModulesFromParent(ServerScriptService.Library)
		end
		local v3 = ReplicationUtils.getDuplicateModules()
		if not next(v3) then
			workspace:SetAttribute("ModulesLoaded", true)
			return v2
		end
		warn(v0)
		warn(v3)
		workspace:SetAttribute("ModulesLoaded", true)
		return v2
	else
		if not RunService:IsClient() then
			error("Error: Unknown state")
		end
		local v4 = ModuleScriptLoader.new({ ReplicationUtils.ScriptType.SHARED, ReplicationUtils.ScriptType.CLIENT })
		while not workspace:GetAttribute("ModulesLoaded") do
			task.wait()
		end
		task.wait()
		v4:AddModulesFromParent(ReplicatedStorage:WaitForChild("_replicationFolder"))
		local v5 = ReplicationUtils.getDuplicateModules()
		if not next(v5) then
			return v4
		end
		warn(v0)
		warn(v5)
		return v4
	end
end
if RunService:IsRunning() then
	warn("Warning: Loading all modules in PlaySolo. It\'s recommended you use accurate play solo.")
end
local v6 = ModuleScriptLoader.new({ ReplicationUtils.ScriptType.SHARED, ReplicationUtils.ScriptType.SERVER, ReplicationUtils.ScriptType.CLIENT })
if ServerScriptService:FindFirstChild("Sonar") then
	v6:AddModulesFromParent(ServerScriptService:WaitForChild("Sonar"))
end
return v6