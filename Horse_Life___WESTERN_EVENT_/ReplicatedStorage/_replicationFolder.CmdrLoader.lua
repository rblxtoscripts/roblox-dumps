-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GamePermissionsService")
local v2 = Sonar("LogService", "Server")
local v3 = Sonar("StorageUtils")
local v4 = Sonar("PlaceTypeService")
Sonar("PackageImportUtils").Import("Cmdr", "Server")()
local v5 = Sonar("Cmdr", "Server")
local v6 = Sonar("DebugToolsLoader")
local v7 = game:GetService("RunService"):IsStudio()
local v8 = game:GetService("RunService"):IsServer()
local v9 = v4.IsTestGame()
local v10 = v6.GetDebugToolConfig("Cmdr")
local v11 = v3.GetFromPath("ReplicatedStorage/Configs/ProjectConfigs")()
local t2 = {}
local v12 = v3.GetFromPath("ReplicatedStorage/Configs/DefaultConfigs/CmdrCommands")()
local v13 = v11 and v11:FindFirstChild("CmdrCommands")
t2[1] = v12
t2[2] = v13
local CmdrClient = ReplicatedStorage:WaitForChild("CmdrClient")
local LocalPlayer = Players.LocalPlayer
local function convertCommandToString(p1, p2) --[[ convertCommandToString | Line: 53 ]]
	for k, v in pairs(p2) do
		p1 = p1 .. "-" .. v
	end
	return p1
end
local function logCommand(p1) --[[ logCommand | Line: 62 | Upvalues: v8 (copy), v9 (copy), v7 (copy), v2 (copy) ]]
	if not v8 then
		return
	end
	if v9 then
		return
	end
	if v7 then
		return
	end
	local Alias = p1.Alias
	local t = {}
	local t2 = {
		Webhook = "AdminCommands"
	}
	for k, v in pairs(p1.RawArguments) do
		Alias = Alias .. "-" .. v
	end
	t[1] = p1.Executor
	t[2] = Alias
	t[3] = p1.Alias:find("ban")
	t2.Args = t
	v2.PostLog(t2)
end
local function _setupCmdr() --[[ _setupCmdr | Line: 80 | Upvalues: v8 (copy), v5 (ref), Sonar (copy), CmdrClient (copy), v10 (copy), LocalPlayer (copy), v1 (copy), logCommand (copy), t2 (copy) ]]
	if not v8 then
		v5 = Sonar(CmdrClient)
		v5:SetActivationKeys(v10.ActivationKeys)
		CmdrClient.Parent = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ClientScripts")
	end
	local v12 = v5.Registry or v5
	v12:RegisterHook("BeforeRun", function(p1) --[[ Line: 88 | Upvalues: v1 (ref) ]]
		p1.Object.Group = p1.Group
		local v12, v2 = v1.CanRunCommand(p1.Executor, p1.Object, true)
		if v12 == true then
		else
			return v2
		end
	end)
	v12:RegisterHook("AfterRun", function(p1) --[[ Line: 99 | Upvalues: logCommand (ref) ]]
		logCommand(p1)
	end)
	for v2, v3 in t2 do
		for v4, v52 in v3:GetChildren() do
			if v52.Name:find("Commands") then
				v12:RegisterCommandsIn(v52)
			end
			if v52.Name:find("Types") then
				v12:RegisterTypesIn(v52)
			end
		end
	end
end
local function canInitCmdr() --[[ canInitCmdr | Line: 119 | Upvalues: v6 (copy), LocalPlayer (copy) ]]
	return v6.CanUseDebugTool(LocalPlayer, "Cmdr")
end
function t.Init(p1) --[[ Init | Line: 124 | Upvalues: v8 (copy), _setupCmdr (copy), v6 (copy), LocalPlayer (copy), CmdrClient (copy) ]]
	if v8 then
		task.spawn(_setupCmdr)
		return
	end
	if v6.CanUseDebugTool(LocalPlayer, "Cmdr") then
		task.spawn(_setupCmdr)
	else
		CmdrClient:Destroy()
	end
end
t:Init()
return t