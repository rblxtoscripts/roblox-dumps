-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local ServerStorage = game:GetService("ServerStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("TableUtils")
local SHALLOW_OVERWRITE_CONFIGS = Sonar("Constants").SHALLOW_OVERWRITE_CONFIGS
local v2 = RunService:IsServer()
local Configs = ReplicatedStorage:WaitForChild("Configs")
local v3 = v2 and ServerStorage:WaitForChild("ServerConfigs")
local tbl = { ReplicatedStorage:WaitForChild("Storage"), ReplicatedStorage:FindFirstChild("WorldStorage") }
local t2 = {}
local function getConfigModule(p1, p2) --[[ getConfigModule | Line: 30 | Upvalues: v2 (copy), v3 (copy), Configs (copy) ]]
	if not v2 then
		return Configs:WaitForChild(p2):WaitForChild(p1)
	end
	return v3[p2]:FindFirstChild(p1) or Configs[p2]:FindFirstChild(p1)
end
local function moduleScriptAdded(p1) --[[ moduleScriptAdded | Line: 39 | Upvalues: t2 (copy) ]]
	if not p1:IsA("ModuleScript") then
		return
	end
	if not t2[p1.Name] then
		t2[p1.Name] = p1
	end
end
function t.GetFromPath(p1) --[[ GetFromPath | Line: 46 ]]
	local v1 = string.split(p1, "/")
	local v2 = game
	for v3, v4 in v1 do
		v2 = v2:WaitForChild(v4)
	end
	return v2
end
function t.Get(p1) --[[ Get | Line: 60 | Upvalues: t2 (copy), RunService (copy) ]]
	local v1 = t2[p1]
	if not v1 then
		local v2 = debug.traceback()
		task.delay(5, function() --[[ Line: 65 | Upvalues: v1 (ref), p1 (copy), v2 (copy) ]]
			if not v1 then
				warn(p1, "not found in Storage!")
				warn(v2)
			end
		end)
		repeat
			v1 = t2[p1]
			if v1 then
				continue
			end
			RunService.Heartbeat:Wait()
		until v1
	end
	return v1
end
function t.GetConfig(p1, p2) --[[ GetConfig | Line: 83 | Upvalues: v2 (copy), v3 (copy), Configs (copy), RunService (copy), Sonar (copy), getConfigModule (copy), v1 (copy), SHALLOW_OVERWRITE_CONFIGS (copy) ]]
	return function() --[[ Line: 84 | Upvalues: p2 (copy), v2 (ref), p1 (copy), v3 (ref), Configs (ref), RunService (ref), Sonar (ref), getConfigModule (ref), v1 (ref), SHALLOW_OVERWRITE_CONFIGS (ref) ]]
		if p2 == "Server" and not v2 then
			return nil
		end
		if p2 == "Client" and v2 then
			return nil
		end
		local v12 = p1:find("Config") and p1 or p1 .. "Config"
		local v22 = if v2 then v3.DefaultConfigs:FindFirstChild(v12) or Configs.DefaultConfigs:FindFirstChild(v12) else Configs:WaitForChild("DefaultConfigs"):WaitForChild(v12)
		if not v22 then
			error((("\226\157\140 StorageUtils, DefaultConfig \'%*\' not found in DefaultConfigs!"):format(v12)))
		end
		local v32 = nil
		while v32 == nil do
			v32 = if v2 then if if v2 then v3.ProjectConfigs:FindFirstChild(v12) or Configs.ProjectConfigs:FindFirstChild(v12) else Configs:WaitForChild("ProjectConfigs"):WaitForChild(v12) then true else false else v22:GetAttribute("HasProjectConfig")
			if v32 == nil then
				RunService.Heartbeat:Wait()
			end
		end
		if not v32 then
			return Sonar(v22)
		end
		local v7 = Sonar(getConfigModule(v12, "ProjectConfigs"))
		local v8 = Sonar(v22)
		if v1.Contains(SHALLOW_OVERWRITE_CONFIGS, v12) then
			v1.Overwrite(v8, v7)
			return v8
		end
		if not SHALLOW_OVERWRITE_CONFIGS[v12] then
			v1.DeepOverwrite(v8, v7)
			return v8
		end
		local v9 = SHALLOW_OVERWRITE_CONFIGS[v12]
		local t, v10 = {}, v8
		for v11, v122 in v9 do
			t[v122] = true
		end
		local t2 = {}
		for k, v in pairs(v7) do
			if not t[k] then
				t2[k] = v
			end
		end
		v1.DeepOverwrite(v10, t2)
		for v13, v14 in v9 do
			local v15 = v10[v14]
			local v16 = v7[v14]
			if type(v15) == "table" and type(v16) == "table" then
				v1.Overwrite(v15, v16)
				continue
			end
			v10[v14] = v16
		end
		return v10
	end
end
for k, v in pairs(tbl) do
	v.DescendantAdded:Connect(moduleScriptAdded)
	for k2, v4 in pairs(v:GetDescendants()) do
		if v4:IsA("ModuleScript") and not t2[v4.Name] then
			t2[v4.Name] = v4
		end
	end
end
return t