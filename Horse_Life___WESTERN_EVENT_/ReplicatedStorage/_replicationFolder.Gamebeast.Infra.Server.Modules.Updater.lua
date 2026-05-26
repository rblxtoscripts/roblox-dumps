-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
local Chat = game:GetService("Chat")
local MessagingService = game:GetService("MessagingService")
local v1 = shared.GBMod("Signal")
local v2 = shared.GBMod("MetaData")
local v3 = shared.GBMod("Utilities")
local v4 = shared.GBMod("GBRequests")
local v5 = shared.GBMod("InternalExperiments")
local v6 = shared.GBMod("InternalConfigs")
local v7 = shared.GBMod("DatastoreBackup").new(RunService:IsStudio())
t.ModuleUpdated = v1.new()
t.ConfigChanged = v1.new()
function t.UpdateConfigs(p1, p2, p3) --[[ UpdateConfigs | Line: 69 | Upvalues: v6 (copy), v5 (copy), v3 (copy) ]]
	local v2 = not p3 and v6:GetActiveConfig("GBConfigs").GBPublishTime or nil
	if v2 and p2.GBConfigs.GBPublishTime < v2 then
		return
	end
	v6:ApplyInternalConfigs(p2.GBConfigs)
	local v32 = p3 or not v6:IsReady()
	local Experiments = p2.GBConfigs.Experiments
	if Experiments then
		local v4 = coroutine.running()
		local v52 = false
		task.spawn(function() --[[ Line: 89 | Upvalues: v5 (ref), Experiments (copy), p2 (copy), v52 (ref), v4 (copy) ]]
			v5:UpdateStateFromAvailableExperiments(Experiments, {
				variables = p2.configs,
				options = p2.options
			})
			if v52 then
				return
			end
			v52 = true
			coroutine.resume(v4)
		end)
		task.delay(10, function() --[[ Line: 99 | Upvalues: v52 (ref), v3 (ref), v4 (copy) ]]
			if v52 then
				return
			end
			v52 = true
			v3.GBWarn("Initial experiment assignment taking unusually long, temporarily falling back to canonical config")
			coroutine.resume(v4)
		end)
		if not v52 then
			coroutine.yield()
		end
	end
	local v62 = v32
	for v7, v8 in v5.AssignedConfigByPlayer do
		v6:ApplyConfigs(v7, v8.variables, v8.options.privacy, v62)
	end
	if v5.AssignedServerConfig then
		v6:ApplyConfigs(nil, v5.AssignedServerConfig.variables, v5.AssignedServerConfig.options.privacy, v62)
	else
		v6:ApplyConfigs(nil, p2.configs, p2.options.privacy, v62)
	end
end
function t.GetBackupConfigs(p1) --[[ GetBackupConfigs | Line: 138 | Upvalues: v7 (copy), v3 (copy) ]]
	local v1, v2 = v7:Get("Configs")
	if not v1 then
		v3.GBWarn("Couldn\'t get configs from backup. Attempting to re-establish connection with Gamebeast...")
	end
	if v2 then
		v2.GBConfigs.Experiments = nil
	end
	return v2
end
function t.SaveConfigsToBackup(p1, p2) --[[ SaveConfigsToBackup | Line: 155 | Upvalues: v3 (copy), v7 (copy) ]]
	local v1 = v3.recursiveCopy(p2)
	v1.GBConfigs.Experiments = nil
	v7:Set("Configs", v1)
end
function t.Init(p1) --[[ Init | Line: 164 | Upvalues: v4 (copy), v2 (copy), v3 (copy), v5 (copy), v6 (copy), MessagingService (copy), Chat (copy) ]]
	task.spawn(function() --[[ Line: 167 | Upvalues: v4 (ref), v2 (ref), v3 (ref) ]]
		local v1, v22 = v4:GBRequestAsync("v1/latest/version?platform=roblox")
		if not (v1 and (v22.version and v2.version < v22.version)) then
			return
		end
		v3.GBWarn((("Gamebeast SDK is out of date! Please update to the latest version. %* -> %*"):format(v2.version, v22.version)))
	end)
	local function fetchConfigs() --[[ fetchConfigs | Line: 178 | Upvalues: v4 (ref) ]]
		local v1, v2 = v4:GBRequestAsync("v1/configurations", nil)
		if v1 then
			return v2.args
		else
			return nil
		end
	end
	local v1, v22 = v4:GBRequestAsync("v1/configurations", nil)
	local v32 = if v1 then v22.args else nil
	if not v32 then
		v3.GBWarn("Couldn\'t get configurations from Gamebeast. Attempting to load from backup...")
		local v42 = p1:GetBackupConfigs()
		if v42 then
			v32 = v42
		else
			repeat
				task.wait(10)
				v3.GBWarn("Attempting to establish connection...")
				local v52, v62 = v4:GBRequestAsync("v1/configurations", nil)
				v32 = if v52 then v62.args else nil
			until v32
			v3.GBWarn("Connection established, fetching configurations...")
		end
	end
	p1:UpdateConfigs(v32, true)
	v5.OnAssignedServerConfigChanged:Connect(function(p1) --[[ Line: 210 | Upvalues: v6 (ref), v5 (ref) ]]
		if not v6:IsReady() then
			return
		end
		if p1 then
			v6:ApplyConfigs(nil, p1.variables, p1.options.privacy)
			return
		end
		v6:ApplyConfigs(nil, v5.CanonicalServerConfig.variables, v5.CanonicalServerConfig.options.privacy)
	end)
	v5.OnAssignedPlayerConfigChanged:Connect(function(p1, p2) --[[ Line: 225 | Upvalues: v6 (ref) ]]
		if not v6:IsReady() then
			return
		end
		if p2 then
			v6:ApplyConfigs(p1, p2.variables, p2.options.privacy)
			return
		end
		v6:ApplyConfigs(p1, nil, nil)
	end)
	task.spawn(function() --[[ Line: 236 | Upvalues: v3 (ref), MessagingService (ref), Chat (ref), v4 (ref), p1 (copy) ]]
		v3.promiseReturn(1, function() --[[ Line: 237 | Upvalues: MessagingService (ref), v3 (ref), Chat (ref), v4 (ref), p1 (ref) ]]
			MessagingService:SubscribeAsync("GB_PROPAGATE", function(p12) --[[ Line: 238 | Upvalues: v3 (ref), Chat (ref), v4 (ref), p1 (ref) ]]
				if not p12.Data or p12.Data.fromServer == game.JobId then
					return
				end
				if p12.Data.requestType == "Kick" then
					local v1 = v3:FindPlayer(p12.Data.args.playerId)
					if v1 then
						v1:Kick((v3.promiseReturn(1, function() --[[ Line: 251 | Upvalues: Chat (ref), p12 (copy), v1 (copy) ]]
							return Chat:FilterStringForBroadcast(p12.Data.args.reason, v1)
						end)))
					end
				else
					if p12.Data.requestType ~= "UpdateConfigs" and p12.Data.requestType ~= "UpdateExperiments" then
						return
					end
					local v2, v32 = v4:GBRequestAsync("v1/configurations", nil)
					local v42 = if v2 then v32.args else nil
					if not v42 then
						v3.GBWarn("Failed to fetch configs after receiving propagation message. Will retry when next propagation message is received.")
						return
					end
					p1:UpdateConfigs(v42)
				end
			end)
		end)
	end)
end
return t