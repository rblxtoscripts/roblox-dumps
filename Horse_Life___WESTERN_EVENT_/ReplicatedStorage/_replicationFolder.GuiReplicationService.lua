-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("StorageUtils")
local v3 = game:GetService("RunService"):IsServer()
local GuiReplicationIds = v2.GetConfig("GuiFramework")().GuiReplicationIds
local v5 = not v3 and (not v3 and Players.LocalPlayer):WaitForChild("PlayerGui")
local GuiReplication = ServerStorage:FindFirstChild("GuiReplication")
local t2 = {}
local t3 = {}
local t4 = {}
local v6 = v1.GetRemoteFunction("GuiReplicationService")
function t.GetGuiScreenTag(p1) --[[ GetGuiScreenTag | Line: 92 ]]
	for v1, v2 in p1:GetTags() do
		if v2:find("GuiScreen") then
			return v2
		end
	end
	return false
end
function t.GetIndex(p1) --[[ GetIndex | Line: 101 | Upvalues: GuiReplicationIds (copy) ]]
	return table.find(GuiReplicationIds, p1)
end
function t.GetOrCreateReplicationFolder() --[[ GetOrCreateReplicationFolder | Line: 105 | Upvalues: v3 (copy) ]]
	if not v3 then
		return workspace:WaitForChild("ReplicatedGuis")
	end
	local ReplicatedGuis = workspace:FindFirstChild("ReplicatedGuis")
	if not ReplicatedGuis then
		local ReplicatedGuis_2 = Instance.new("Folder")
		ReplicatedGuis_2.Name = "ReplicatedGuis"
		ReplicatedGuis_2.Parent = workspace
		ReplicatedGuis = ReplicatedGuis_2
	end
	return ReplicatedGuis
end
function t.GetOrCreateGuiLayersFolder() --[[ GetOrCreateGuiLayersFolder | Line: 119 | Upvalues: ReplicatedStorage (copy) ]]
	local ReplicatedGuiLayers = ReplicatedStorage:FindFirstChild("ReplicatedGuiLayers")
	if not ReplicatedGuiLayers then
		local ReplicatedGuiLayers_2 = Instance.new("Folder")
		ReplicatedGuiLayers_2.Name = "ReplicatedGuiLayers"
		ReplicatedGuiLayers_2.Parent = ReplicatedStorage
		ReplicatedGuiLayers = ReplicatedGuiLayers_2
	end
	return ReplicatedGuiLayers
end
function t.GetReplicatedScreenValue() --[[ GetReplicatedScreenValue | Line: 129 | Upvalues: t (copy) ]]
	local v1 = t.GetOrCreateReplicationFolder()
	local GuiScreens = v1:FindFirstChild("GuiScreens")
	if not GuiScreens then
		local GuiScreens_2 = Instance.new("StringValue")
		GuiScreens_2.Name = "GuiScreens"
		GuiScreens_2.Parent = v1
		GuiScreens = GuiScreens_2
	end
	return GuiScreens
end
function t.CollectUIScreenData(p1) --[[ CollectUIScreenData | Line: 142 | Upvalues: t (copy) ]]
	local t2 = {}
	local function v1(p1) --[[ scanForUIScreens | Line: 145 | Upvalues: t (ref), t2 (copy), v1 (copy) ]]
		for v12, v2 in p1:GetChildren() do
			local v3 = t.GetGuiScreenTag(v2)
			if v3 then
				t2[if type(v3) == "string" and v3 then v3 else v2.Name] = true
			end
			v1(v2)
		end
	end
	v1(p1)
	return t2
end
function t.UpdateReplicatedScreenData(p1) --[[ UpdateReplicatedScreenData | Line: 159 | Upvalues: v3 (copy), t (copy), HttpService (copy) ]]
	if v3 then
		t.GetReplicatedScreenValue().Value = HttpService:JSONEncode(p1)
	else
		warn("\226\154\160\239\184\143 GuiReplicationService, UpdateReplicatedScreenData can only be called on the server")
	end
end
function t.GetReplicatedScreenData() --[[ GetReplicatedScreenData | Line: 169 | Upvalues: t (copy), HttpService (copy) ]]
	local v1 = t.GetReplicatedScreenValue()
	local v2, v3 = pcall(function() --[[ Line: 172 | Upvalues: HttpService (ref), v1 (copy) ]]
		return HttpService:JSONDecode(v1.Value)
	end)
	if v2 then
		return v3
	else
		warn("\226\154\160\239\184\143 GuiReplicationService, Failed to decode screen data:", v3)
		return nil
	end
end
function t.Get(p1) --[[ Get | Line: 184 | Upvalues: t (copy), t3 (copy), t4 (copy), v6 (copy), v5 (copy) ]]
	local v1 = t.GetIndex(p1)
	if not v1 then
		warn("\226\157\140 GuiReplicationService, Invalid GUI name: " .. tostring(p1))
		return nil
	end
	if t3[p1] then
		return t3[p1]
	end
	if t4[p1] then
		while t4[p1] and not t3[p1] do
			task.wait()
		end
		return t3[p1]
	else
		t4[p1] = true
		local v2, v3 = pcall(function() --[[ Line: 207 | Upvalues: v6 (ref), v1 (copy) ]]
			return v6:InvokeServer(v1)
		end)
		if not v2 then
			t4[p1] = nil
			warn("\226\157\140 GuiReplicationService, InvokeServer failed for \'" .. tostring(p1) .. "\': " .. tostring(v3))
			return nil
		end
		if not v3 then
			t4[p1] = nil
			warn("\226\154\160\239\184\143 GuiReplicationService, Server denied or failed to replicate GUI: " .. tostring(p1))
			return nil
		end
		local v4 = t.GetOrCreateReplicationFolder()
		local v52 = v4:WaitForChild(p1)
		local v62 = v4:WaitForChild(p1):WaitForChild(p1)
		if v62 then
			v62.Parent = v5
			t3[p1] = v62
			print("\226\172\135\239\184\143 GuiReplicationService, Pulled UI:", p1)
			v52:Destroy()
			t4[p1] = nil
			return v62
		else
			t4[p1] = nil
			warn("\226\157\140 GuiReplicationService, GUI object still not found after server invoke: " .. tostring(p1))
			return nil
		end
	end
end
function t.Init(p1) --[[ Init | Line: 241 | Upvalues: v3 (copy), GuiReplication (ref), ServerStorage (copy), GuiReplicationIds (copy), t (copy), t2 (copy), v6 (copy) ]]
	if not v3 then
		return
	end
	if not GuiReplication then
		warn(string.format("\226\154\160\239\184\143 GuiReplicationService, GuiReplicationFolder not found in ServerStorage. Creating new %s folder.", "GuiReplication"))
		GuiReplication = Instance.new("Folder")
		GuiReplication.Name = "GuiReplication"
		GuiReplication.Parent = ServerStorage
	end
	for v1, v2 in GuiReplication:GetChildren() do
		if not table.find(GuiReplicationIds, v2.Name) then
			warn(string.format("\226\154\160\239\184\143 GuiReplicationService, Found GUI \'%s\' in replication folder that is not in GuiReplication", v2.Name))
		end
	end
	local t3 = {}
	for v32, v4 in GuiReplicationIds do
		local v5 = GuiReplication and GuiReplication:FindFirstChild(v4)
		if not v5 then
			warn("\226\154\160\239\184\143 GuiReplicationService, ReplicatedGui not found for interfaceName: " .. tostring(v4) .. ". Creating placeholder ScreenGui.")
			local ScreenGui = Instance.new("ScreenGui")
			ScreenGui.Name = v4
			v5 = ScreenGui
		end
		local Model = Instance.new("Model")
		Model.Name = v4
		Model.ModelStreamingMode = Enum.ModelStreamingMode.PersistentPerPlayer
		local Part = Instance.new("Part")
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanQuery = false
		Part.CanTouch = false
		Part.EnableFluidForces = false
		Part.Transparency = 1
		Part.Position = Vector3.new(10000, -10000, 10000)
		Part.Parent = Model
		v5.ResetOnSpawn = false
		v5.Parent = Model
		Model.Parent = t.GetOrCreateReplicationFolder()
		t2[v4] = Model
		t3[v4] = t.CollectUIScreenData(v5)
	end
	t.UpdateReplicatedScreenData(t3)
	function v6.OnServerInvoke(p1, p2) --[[ Line: 292 | Upvalues: t2 (ref), GuiReplicationIds (ref) ]]
		local v1 = t2[GuiReplicationIds[p2]]
		if v1 then
			v1:AddPersistentPlayer(p1)
			return true
		else
			warn("\226\157\140 GuiReplicationService, Requested GUI not found for index: " .. tostring(p2))
			return false
		end
	end
end
t:Init()
return t