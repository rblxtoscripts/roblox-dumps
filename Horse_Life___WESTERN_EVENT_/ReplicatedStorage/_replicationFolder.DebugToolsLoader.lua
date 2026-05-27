-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GamePermissionsService")
local v2 = Sonar("PackageImportUtils").Import("DebugTools")()
local v3 = Sonar("StorageUtils")
local v4 = Sonar("PlaceTypeService")
local v5 = v3.GetConfig("DebugTools")()
local v6 = game:GetService("RunService"):IsServer()
local v7 = game:GetService("RunService"):IsStudio()
local v8 = v4.IsTestGame()
local t2 = {}
function t.CanUseDebugTool(p1, p2) --[[ CanUseDebugTool | Line: 27 | Upvalues: t (copy), v5 (copy), v1 (copy), v8 (copy) ]]
	local v12 = t.GetDebugToolConfig(p2)
	if not v12 then
		return false
	end
	if v5.PermissionAlwaysAllowed and v1.HasPermission(p1, v5.PermissionAlwaysAllowed) then
		return true
	end
	if v12.TestServersOnly and not v8 then
		return false
	end
	if v12.RequiredAdminGroups then
		local v2 = v1.GetAdminGroup(p1)
		if v12.RequiredAdminGroups == "Any" then
			if v2 ~= nil then
				return true
			end
		else
			for v3, v4 in v12.RequiredAdminGroups do
				if v2.Name == v4 then
					return true
				end
			end
		end
	else
		if not v12.RequiredPermissions then
			return false
		end
		for v52, v6 in v12.RequiredPermissions do
			if v1.HasPermission(p1, v6) then
				return true
			end
		end
	end
	return false
end
function t.GetDebugToolConfig(p1) --[[ GetDebugToolConfig | Line: 79 | Upvalues: v5 (copy) ]]
	return v5.Tools[p1]
end
function t.Init(p1) --[[ Init | Line: 84 | Upvalues: v5 (copy), v6 (copy), t (copy), Players (copy), v2 (copy), t2 (copy), Sonar (copy), v7 (copy) ]]
	task.defer(function() --[[ Line: 85 | Upvalues: v5 (ref), v6 (ref), t (ref), Players (ref), v2 (ref), t2 (ref), Sonar (ref), v7 (ref) ]]
		for v1, v22 in v5.Tools do
			local v3 = v6 or t.CanUseDebugTool(Players.LocalPlayer, v1)
			local v4 = v2:FindFirstChild(v1)
			if v3 then
				if v4 then
					if v22.InitOnServer and v6 then
						t2[v4.Name] = Sonar(v4)
					else
						if v22.InitOnClient and not v6 then
							t2[v4.Name] = Sonar(v4)
							continue
						end
						t2[v4.Name] = v22
					end
					continue
				end
				t2[v1] = v22
				continue
			end
			if v4 then
				v4:Destroy()
			end
		end
		if v6 or not (next(t2) and (v7 and v5.PrintDebugToolsInStudio)) and v7 then
			return
		end
		local v52 = "\240\159\148\167 Debug Tools:\nRoblox Stats: Shift-F1\nStreaming Debugger: Shift-F3 and Shift-1 (4 times)\nNetworking and FPS Info: Shift + F5\nMicroprofiler: Ctrl + F6, Ctrl + P to pause\n"
		for v62, v72 in t2 do
			local v8 = t.GetDebugToolConfig(v62)
			if v8 then
				local t3 = {}
				for v9, v10 in v8.ActivationKeys do
					if typeof(v10) == "EnumItem" then
						table.insert(t3, v10.Name)
					end
				end
				local v12 = table.concat(t3, " + ")
				v52 = v52 .. string.format("%s: %s%s\n", v62, v12, v8.ChatMessage and " or " .. v8.ChatMessage or "")
			end
		end
		print(v52)
	end)
end
t:Init()
return t