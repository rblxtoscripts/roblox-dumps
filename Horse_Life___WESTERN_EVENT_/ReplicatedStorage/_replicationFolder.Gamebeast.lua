-- https://lua.expert/
local t = {}
local RunService = game:GetService("RunService")
require(script.Infra.Types)
local t2 = {
	sdkWarningsEnabled = {
		value = true,
		validator = function(p1) --[[ validator | Line: 54 ]]
			return type(p1) == "boolean"
		end
	},
	includeWarningStackTrace = {
		value = false,
		validator = function(p1) --[[ validator | Line: 60 ]]
			return type(p1) == "boolean"
		end
	},
	sdkDebugEnabled = {
		value = false,
		validator = function(p1) --[[ validator | Line: 66 ]]
			return type(p1) == "boolean"
		end
	},
	customUrl = {
		value = nil,
		validator = function(p1) --[[ validator | Line: 72 ]]
			return if type(p1) == "string" then true else p1 == nil
		end
	},
	environment = {
		value = nil,
		validator = function(p1) --[[ validator | Line: 78 ]]
			return if p1 == "production" or p1 == "studio" then true else p1 == nil
		end
	}
}
local t3 = {}
local t4 = {}
local v1 = false
local v2 = false
local v3 = RunService:IsServer()
local function RequireModule(p1) --[[ RequireModule | Line: 95 ]]
	if p1.Loaded then
		return p1.Module
	else
		local v1 = require(p1.Instance)
		p1.Module = v1
		p1.Loaded = true
		return v1
	end
end
local function AddModule(p1, p2) --[[ AddModule | Line: 107 | Upvalues: t4 (copy), t3 (copy) ]]
	if p2 then
		t4[p1.Name] = {
			Name = p1.Name,
			Instance = p1
		}
	else
		t3[p1.Name] = {
			Loaded = false,
			Module = nil,
			Name = p1.Name,
			Instance = p1
		}
	end
end
local function AddModuleFolder(p1) --[[ AddModuleFolder | Line: 125 | Upvalues: AddModule (copy), v2 (ref), t3 (copy), t4 (copy) ]]
	local function v1(p1, p2) --[[ search | Line: 127 | Upvalues: AddModule (ref), v1 (copy) ]]
		for i, v in ipairs(p1:GetChildren()) do
			if v:IsA("ModuleScript") then
				AddModule(v, p2)
			end
			v1(v, p2)
		end
	end
	v1(p1:WaitForChild("Modules"))
	v1(p1:WaitForChild("Public"), true)
	local function moduleAddedLate(p1, p2) --[[ moduleAddedLate | Line: 139 | Upvalues: AddModule (ref), v2 (ref), t3 (ref) ]]
		if not p1:IsA("ModuleScript") then
			return
		end
		AddModule(p1, p2)
		if not v2 or p2 then
			return
		end
		local v1 = t3[p1.Name]
		if v1.Loaded then
			local Module = v1.Module
			return
		end
		v1.Module = require(v1.Instance)
		v1.Loaded = true
	end
	p1.Modules.DescendantAdded:Connect(moduleAddedLate)
	p1.Public.DescendantAdded:Connect(function(p1) --[[ Line: 149 | Upvalues: t4 (ref) ]]
		if not p1:IsA("ModuleScript") then
			return
		end
		t4[p1.Name] = {
			Name = p1.Name,
			Instance = p1
		}
	end)
end
local function FindModule(p1, p2, p3) --[[ FindModule | Line: 154 ]]
	local v1 = tick()
	while tick() - v1 < (p3 or 5) do
		if p1[p2] then
			return p1[p2]
		end
		task.wait()
	end
	error("Gamebeast service \"" .. p2 .. "\" not found!")
end
local function GetModule(p1) --[[ GetModule | Line: 166 | Upvalues: FindModule (copy), t3 (copy) ]]
	return FindModule(t3, p1)
end
local function GetPublicModule(p1) --[[ GetPublicModule | Line: 170 | Upvalues: FindModule (copy), t4 (copy) ]]
	return FindModule(t4, p1)
end
local function StartSDK() --[[ StartSDK | Line: 174 | Upvalues: v1 (ref), v3 (copy), AddModuleFolder (copy), AddModule (copy), FindModule (copy), t3 (copy), t2 (copy), v2 (ref) ]]
	if v1 then
		return
	end
	v1 = true
	AddModuleFolder(v3 and script.Infra.Server or script.Infra.Client)
	AddModuleFolder(script.Infra.Shared)
	AddModule(script.Infra:WaitForChild("MetaData"))
	local v22 = FindModule(t3, "DataCache")
	local v32
	if v22.Loaded then
		v32 = v22.Module
	else
		local v4 = require(v22.Instance)
		v22.Module = v4
		v22.Loaded = true
		v32 = v4
	end
	local t = {}
	for v5, v6 in t2 do
		t[v5] = v6.value
	end
	v32:Set("Settings", t)
	for v7, v8 in t3 do
		if v8.Loaded then
			local Module = v8.Module
			continue
		end
		v8.Module = require(v8.Instance)
		v8.Loaded = true
	end
	v2 = true
	for v9, v10 in t3 do
		if type(v10.Module) == "table" then
			local v11 = rawget(v10.Module, "Init")
			if v11 then
				task.spawn(v11, v10.Module)
			end
		end
	end
end
function t.GetService(p1, p2) --[[ GetService | Line: 234 | Upvalues: StartSDK (copy), FindModule (copy), t4 (copy) ]]
	StartSDK()
	local v1 = string.gsub(p2, "Service", "")
	local v2 = FindModule(t4, v1)
	if v2 then
		return require(v2.Instance)
	else
		error("Gamebeast service \"" .. v1 .. "\" not found!")
	end
end
function t.Setup(p1, p2) --[[ Setup | Line: 246 | Upvalues: v3 (copy), t2 (copy), StartSDK (copy), FindModule (copy), t3 (copy) ]]
	if v3 == true then
		assert(p2, "Gamebeast SDK requires a setup config on the server.")
		assert(p2.key, "Gamebeast SDK requires a key to be set in the setup config.")
	end
	if v3 == false then
		local v1 = if p2 then p2 else {}
		assert(v1.key == nil, "Gamebeast SDK key should not be set on the client.")
		p2 = v1
	end
	local v2 = p2.sdkSettings or {}
	for v32, v4 in t2 do
		if v2[v32] == nil then
			v2[v32] = v4.value
		end
		if v4.validator(v2[v32]) == false then
			error(("The value of the Gamebeast SDK setting \"%*\" is invalid."):format(v32), 2)
		end
	end
	StartSDK()
	local v5 = FindModule(t3, "DataCache")
	local v6
	if v5.Loaded then
		v6 = v5.Module
	else
		local v7 = require(v5.Instance)
		v5.Module = v7
		v5.Loaded = true
		v6 = v7
	end
	v6:Set("Key", p2.key)
	v6:Set("Settings", v2)
end
function shared.GBMod(p1) --[[ Line: 277 | Upvalues: FindModule (copy), t3 (copy) ]]
	local v1 = FindModule(t3, p1)
	if not v1 then
		return
	end
	if v1.Loaded then
		return v1.Module
	else
		local v2 = require(v1.Instance)
		v1.Module = v2
		v1.Loaded = true
		return v2
	end
end
return t