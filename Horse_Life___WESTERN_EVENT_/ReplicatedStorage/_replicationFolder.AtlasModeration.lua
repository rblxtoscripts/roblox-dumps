-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")
local v1 = game:GetService("RunService"):IsServer()
function t.InitServer(p1) --[[ InitServer | Line: 11 | Upvalues: ServerScriptService (copy), ReplicatedStorage (copy), t (copy) ]]
	local ModDashboardSource = script.ModDashboardSource
	local Config = script.Config
	local ModDashboardLoader = script.ModDashboardLoader
	ModDashboardSource.Parent = ServerScriptService
	Config.Parent = ModDashboardSource.Shared
	local v1 = require(ModDashboardLoader)
	ModDashboardLoader.Parent = ReplicatedStorage
	local v2 = v1("Config", {
		Deferred = true
	})
	local v3 = v1("QueryBuilder", {
		Deferred = true
	})
	function t.RegisterGamebeastModule(p1, p2) --[[ RegisterGamebeastModule | Line: 27 | Upvalues: v2 (copy) ]]
		v2.GamebeastModule = p2
		v2.GamebeastMarkers = p2:GetService("Markers")
	end
	function t.LogEvent(p1, p2, ...) --[[ LogEvent | Line: 33 | Upvalues: v2 (copy), v3 (copy) ]]
		if v2.GamebeastModule then
			v3.LogEvent(p2, ...)
		else
			warn("AtlasModeration: Gamebeast module not registered")
		end
	end
	function t.LoadProjectConfig(p1, p2) --[[ LoadProjectConfig | Line: 43 | Upvalues: Config (copy) ]]
		p2.Name = "ProjectConfig"
		p2.Parent = Config
	end
	function t.SetAuthorizationToken(p1, p2) --[[ SetAuthorizationToken | Line: 49 | Upvalues: v2 (copy) ]]
		v2.AuthorizationToken = p2
	end
	function t.Start(p1, p2) --[[ Start | Line: 54 | Upvalues: t (ref), v1 (copy) ]]
		t:LoadProjectConfig(p2.ProjectConfig)
		t:SetAuthorizationToken(p2.AuthorizationToken)
		t:RegisterGamebeastModule(p2.GamebeastModule)
		v1("ServerInit")
		script:SetAttribute("ServerLoaded", true)
	end
end
function t.InitClient(p1) --[[ InitClient | Line: 64 | Upvalues: ReplicatedStorage (copy) ]]
	repeat
		task.wait()
	until script:GetAttribute("ServerLoaded")
	require(ReplicatedStorage:WaitForChild("ModDashboardLoader"))("ClientInit")
end
function t.Init(p1) --[[ Init | Line: 74 | Upvalues: v1 (copy) ]]
	if v1 then
		p1:InitServer()
	else
		task.spawn(function() --[[ Line: 78 | Upvalues: p1 (copy) ]]
			p1:InitClient()
		end)
	end
end
t:Init()
return t