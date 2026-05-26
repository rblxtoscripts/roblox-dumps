-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("StorageUtils")
local v2 = Sonar("EventUtils")
local v3 = game:GetService("RunService"):IsServer()
local WrappersToInit = v1.GetConfig("PlayerWrapper")().WrappersToInit
local LocalPlayer = Players.LocalPlayer
local function initModule(p1, p2, p3) --[[ initModule | Line: 25 | Upvalues: Sonar (copy) ]]
	if p3 == false then
		return
	end
	local function load() --[[ load | Line: 28 | Upvalues: Sonar (ref), p1 (copy) ]]
		local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), p1 (ref) ]]
			return Sonar(p1)
		end)
		if not v1 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(p1, v2))
		end
		return v2
	end
	if not p2 then
		return task.spawn(load)
	end
	local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), p1 (copy) ]]
		return Sonar(p1)
	end)
	if not v1 then
		error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(p1, v2))
	end
	return v2
end
function t.Init(p1) --[[ Init | Line: 48 | Upvalues: v3 (copy), LocalPlayer (copy), Sonar (copy), WrappersToInit (copy), v2 (copy) ]]
	local v1 = os.clock()
	if v3 then
		print("\226\143\179 Server, Starting initialization...")
	else
		print("\226\143\179 Client, Starting initialization...")
		LocalPlayer:SetAttribute("LoadingStage", "Started")
		LocalPlayer:SetAttribute("ClientInitialising", true)
	end
	local v22 = "AnalyticsService"
	local function load() --[[ load | Line: 28 | Upvalues: Sonar (ref), v22 (copy) ]]
		local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v22 (ref) ]]
			return Sonar(p1)
		end)
		if not v1 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v22, v2))
		end
		return v2
	end
	local v32 = "AnalyticsService"
	local v4, v5 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v32 (copy) ]]
		return Sonar(v32)
	end)
	if not v4 then
		error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("AnalyticsService", v5))
	end
	v5:Init()
	if not v3 then
		local v6 = "PlayerWrapper"
		local function load_2() --[[ load | Line: 28 | Upvalues: Sonar (ref), v6 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v6 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v6, v2))
			end
			return v2
		end
		local v7 = "PlayerWrapper"
		local v8, v9 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v7 (copy) ]]
			return Sonar(v7)
		end)
		if not v8 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("PlayerWrapper", v9))
		end
		v9:Init()
	end
	for v10, v11 in WrappersToInit do
		if (v10 ~= "Server" or v3) and (v10 ~= "Client" or not v3) then
			for v12, v13 in v11 do
				local function load_2() --[[ load | Line: 28 | Upvalues: Sonar (ref), v12 (copy) ]]
					local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v12 (ref) ]]
						return Sonar(p1)
					end)
					if not v1 then
						error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v12, v2))
					end
					return v2
				end
				local v14, v15 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v12 (copy) ]]
					return Sonar(v12)
				end)
				if not v14 then
					error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v12, v15))
				end
				if v15.Init then
					v15:Init()
				end
			end
		end
	end
	if v3 then
		local v16 = "AnalyticsService"
		local function load_2() --[[ load | Line: 28 | Upvalues: Sonar (ref), v16 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v16 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v16, v2))
			end
			return v2
		end
		local v17 = "AnalyticsService"
		local v18, v19 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v17 (copy) ]]
			return Sonar(v17)
		end)
		if not v18 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("AnalyticsService", v19))
		end
		v19:Init()
		local v20 = "GuiReplicationService"
		local function load_3() --[[ load | Line: 28 | Upvalues: Sonar (ref), v20 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v20 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v20, v2))
			end
			return v2
		end
		task.spawn(load_3)
		local v21 = "DebugToolsLoader"
		local function load_4() --[[ load | Line: 28 | Upvalues: Sonar (ref), v21 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v21 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v21, v2))
			end
			return v2
		end
		task.spawn(load_4)
		local v222 = "CmdrLoader"
		local function load_5() --[[ load | Line: 28 | Upvalues: Sonar (ref), v222 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v222 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v222, v2))
			end
			return v2
		end
		task.spawn(load_5)
		local v23 = "ServerInit"
		local function load_6() --[[ load | Line: 28 | Upvalues: Sonar (ref), v23 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v23 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v23, v2))
			end
			return v2
		end
		local v24 = "ServerInit"
		local v25, v26 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v24 (copy) ]]
			return Sonar(v24)
		end)
		if not v25 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("ServerInit", v26))
		end
		v26:Init()
		if v2.yieldForAttributeReplicated(workspace, "WorldModules") then
			local v27 = "WorldServerInit"
			local function load_7() --[[ load | Line: 28 | Upvalues: Sonar (ref), v27 (copy) ]]
				local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v27 (ref) ]]
					return Sonar(p1)
				end)
				if not v1 then
					error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v27, v2))
				end
				return v2
			end
			task.spawn(load_7)
		end
		local v28 = "DataUpdateService"
		local function load_7() --[[ load | Line: 28 | Upvalues: Sonar (ref), v28 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v28 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v28, v2))
			end
			return v2
		end
		local v29 = "DataUpdateService"
		local v30, v31 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v29 (copy) ]]
			return Sonar(v29)
		end)
		if not v30 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("DataUpdateService", v31))
		end
		v31:Init()
	else
		local v322 = "GameStates"
		local function load_2() --[[ load | Line: 28 | Upvalues: Sonar (ref), v322 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v322 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v322, v2))
			end
			return v2
		end
		local v33 = "GameStates"
		local v34, v35 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v33 (copy) ]]
			return Sonar(v33)
		end)
		if not v34 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("GameStates", v35))
		end
		v35:Init()
		local v36 = "GuiReplicationService"
		local function load_3() --[[ load | Line: 28 | Upvalues: Sonar (ref), v36 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v36 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v36, v2))
			end
			return v2
		end
		task.spawn(load_3)
		local v37 = "GuiFrameworkService"
		local function load_4() --[[ load | Line: 28 | Upvalues: Sonar (ref), v37 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v37 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v37, v2))
			end
			return v2
		end
		task.spawn(load_4)
		local v38 = "DebugToolsLoader"
		local function load_5() --[[ load | Line: 28 | Upvalues: Sonar (ref), v38 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v38 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v38, v2))
			end
			return v2
		end
		task.spawn(load_5)
		local v39 = "CmdrLoader"
		local function load_6() --[[ load | Line: 28 | Upvalues: Sonar (ref), v39 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v39 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v39, v2))
			end
			return v2
		end
		task.spawn(load_6)
		local v40 = "ClientInit"
		local function load_7() --[[ load | Line: 28 | Upvalues: Sonar (ref), v40 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v40 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v40, v2))
			end
			return v2
		end
		local v41 = "ClientInit"
		local v42, v43 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v41 (copy) ]]
			return Sonar(v41)
		end)
		if not v42 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("ClientInit", v43))
		end
		v43:Init()
		if v2.yieldForAttributeReplicated(workspace, "WorldModules") then
			local v44 = "WorldClientInit"
			local function load_8() --[[ load | Line: 28 | Upvalues: Sonar (ref), v44 (copy) ]]
				local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v44 (ref) ]]
					return Sonar(p1)
				end)
				if not v1 then
					error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v44, v2))
				end
				return v2
			end
			task.spawn(load_8)
		end
		local v45 = "JoinSequenceService"
		local function load_8() --[[ load | Line: 28 | Upvalues: Sonar (ref), v45 (copy) ]]
			local v1, v2 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v45 (ref) ]]
				return Sonar(p1)
			end)
			if not v1 then
				error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format(v45, v2))
			end
			return v2
		end
		local v46 = "JoinSequenceService"
		local v47, v48 = pcall(function() --[[ Line: 29 | Upvalues: Sonar (ref), v46 (copy) ]]
			return Sonar(v46)
		end)
		if not v47 then
			error(("\226\157\140 CoreInit, Error loading module \'%s\': %s"):format("JoinSequenceService", v48))
		end
		v48:Init()
	end
	local v50 = math.floor((os.clock() - v1) * 1000 + 0.5)
	if v3 then
		print(string.format("\226\156\133 Server, Initialization completed in %dms", v50))
	else
		print(string.format("\226\156\133 Client, Initialization completed in %dms", v50))
		LocalPlayer:SetAttribute("LoadingStage", true)
	end
end
return t