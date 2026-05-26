-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("ServerCharacter", {
	Context = "Server",
	Deferred = true
})
local v3 = Sonar("CharacterData", {
	Deferred = true
})
local v4 = Sonar("Constants")
local IS_CLIENT = v4.IS_CLIENT
local IS_SERVER = v4.IS_SERVER
local IS_STUDIO = v4.IS_STUDIO
local v5 = v1.GetRemoteEvent("EffectReplicationRemote")
local v6 = v1.GetUnreliableRemoteEvent("EffectReplicationUnreliableRemote")
local t2 = {}
local t3 = {}
local function getModelPosition(p1) --[[ getModelPosition | Line: 30 ]]
	if not (p1 and p1.Parent) then
		return nil
	end
	if (type(p1) == "table" or typeof(p1) == "Instance" and p1:IsA("Model")) and p1.PrimaryPart then
		return p1.PrimaryPart.Position
	end
	local v1, v2 = pcall(p1.GetPivot, p1)
	if v1 and v2 then
		return v2.Position
	else
		return nil
	end
end
local function getInstancePosition(p1) --[[ getInstancePosition | Line: 49 | Upvalues: getModelPosition (copy) ]]
	if not (p1 and p1.Parent) then
		return nil
	end
	if p1:IsA("BasePart") then
		return p1.Position
	end
	if p1:IsA("Model") then
		return getModelPosition(p1)
	end
	local PrimaryPart = p1:FindFirstChild("PrimaryPart")
	if PrimaryPart and PrimaryPart:IsA("BasePart") then
		return PrimaryPart.Position
	end
	local v1 = p1:FindFirstChild("HumanoidRootPart") or p1:FindFirstChild("RootPart")
	if v1 and v1:IsA("BasePart") then
		return v1.Position
	else
		return nil
	end
end
local t4 = {
	CharacterData = {
		Name = "CharacterData",
		Priority = 100,
		Matches = function(p1) --[[ Matches | Line: 79 ]]
			return if type(p1) == "table" then if type(p1.IsA) == "function" then p1:IsA("CharacterData") else false else false
		end,
		GetPosition = function(p1) --[[ GetPosition | Line: 82 | Upvalues: getInstancePosition (copy), getModelPosition (copy) ]]
			if p1.CurrentCharacter and p1.CurrentCharacter.RootPart then
				return getInstancePosition(p1.CurrentCharacter.RootPart)
			end
			if p1.Model:IsA("Model") then
				return getModelPosition(p1.Model)
			else
				return nil
			end
		end,
		GetSourcePlayer = function(p1) --[[ GetSourcePlayer | Line: 93 ]]
			return p1.Player
		end,
		Serialize = function(p1) --[[ Serialize | Line: 96 ]]
			return p1.Model
		end,
		Deserialize = function(p1) --[[ Deserialize | Line: 99 | Upvalues: v3 (copy) ]]
			if typeof(p1) == "Instance" then
				return v3.GetDataFromModel(p1)
			else
				return nil
			end
		end
	},
	Instance = {
		Name = "Instance",
		Priority = 50,
		Matches = function(p1) --[[ Matches | Line: 109 ]]
			return typeof(p1) == "Instance"
		end,
		GetPosition = function(p1) --[[ GetPosition | Line: 112 | Upvalues: getModelPosition (copy), getInstancePosition (copy) ]]
			if not p1:IsA("Player") then
				return getInstancePosition(p1)
			end
			return if p1.Character then getModelPosition(p1.Character) or nil else nil
		end,
		GetSourcePlayer = function(p1) --[[ GetSourcePlayer | Line: 118 | Upvalues: Players (copy) ]]
			if p1:IsA("Player") then
				return p1
			end
			if p1:IsA("Model") then
				return Players:GetPlayerFromCharacter(p1)
			else
				return nil
			end
		end,
		Serialize = function(p1) --[[ Serialize | Line: 129 ]]
			return p1
		end,
		Deserialize = function(p1) --[[ Deserialize | Line: 132 ]]
			if typeof(p1) == "Instance" then
				return p1
			else
				return nil
			end
		end
	},
	Vector3 = {
		Name = "Vector3",
		Priority = 10,
		Matches = function(p1) --[[ Matches | Line: 142 ]]
			return typeof(p1) == "Vector3"
		end,
		GetPosition = function(p1) --[[ GetPosition | Line: 145 ]]
			return p1
		end,
		Serialize = function(p1) --[[ Serialize | Line: 148 ]]
			return p1
		end,
		Deserialize = function(p1) --[[ Deserialize | Line: 151 ]]
			if typeof(p1) == "Vector3" then
				return p1
			else
				return nil
			end
		end
	}
}
local function resolveForSource(p1, p2) --[[ resolveForSource | Line: 160 | Upvalues: t3 (copy) ]]
	local v1 = if p1 then p1.SourceResolver else p1
	if v1 then
		local v2 = t3[v1]
		if v2 then
			return v2
		else
			warn("EffectReplicationService, SourceResolver override not registered:", v1)
			return nil
		end
	else
		local v3 = (-1 / 0)
		local v4 = nil
		for v5, v6 in t3 do
			if v6.Matches and v6.Matches(p2) then
				local v7 = v6.Priority or 0
				if v3 < v7 then
					v3 = v7
					v4 = v6
				end
			end
		end
		return v4
	end
end
local function invokeClientRender(p1, p2, p3) --[[ invokeClientRender | Line: 185 ]]
	if not p1.OnClientRender then
		return
	end
	p1.OnClientRender(p2, table.unpack(p3, 1, p3.n or #p3))
end
function t.Register(p1) --[[ Register | Line: 193 | Upvalues: t2 (copy) ]]
	if type(p1) ~= "table" then
		warn("EffectReplicationService.Register, expected table, got:", (type(p1)))
		return
	end
	local v1 = p1.Name
	if type(v1) ~= "string" or #v1 == 0 then
		warn("EffectReplicationService.Register, effect type requires Name string")
		return
	end
	local v2 = t2[v1]
	if not v2 then
		t2[v1] = p1
		return
	end
	for v3, v4 in p1 do
		v2[v3] = v4
	end
end
function t.RegisterEffectSource(p1, p2) --[[ RegisterEffectSource | Line: 215 | Upvalues: t3 (copy) ]]
	if type(p1) ~= "string" or #p1 == 0 then
		warn("EffectReplicationService.RegisterEffectSource, name must be a string")
		return
	end
	if type(p2) == "table" then
		p2.Name = p2.Name or p1
		t3[p1] = p2
	else
		warn("EffectReplicationService.RegisterEffectSource, resolver must be a table")
	end
end
function t.GetEffectType(p1) --[[ GetEffectType | Line: 229 | Upvalues: t2 (copy) ]]
	return t2[p1]
end
function t.GetEffectSource(p1) --[[ GetEffectSource | Line: 233 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
local function fireServer(p1) --[[ fireServer | Line: 237 | Upvalues: t2 (copy), resolveForSource (copy), v6 (copy), v5 (copy), v2 (copy), IS_STUDIO (copy) ]]
	local effectreplicationservicereplicatingeffect = p1.Name
	local Source = p1.Source
	if not effectreplicationservicereplicatingeffect then
		warn("EffectReplicationService.Fire, missing Name")
		return
	end
	if Source == nil then
		warn("EffectReplicationService.Fire, missing Source for effect:", effectreplicationservicereplicatingeffect)
		return
	end
	local v1 = t2[effectreplicationservicereplicatingeffect]
	local v22 = resolveForSource(v1, Source)
	if not v22 then
		warn("EffectReplicationService.Fire, no matching SourceResolver for effect:", effectreplicationservicereplicatingeffect)
		return
	end
	local function resolveField(p12, p2) --[[ resolveField | Line: 256 | Upvalues: p1 (copy), v1 (copy) ]]
		if p1[p12] ~= nil then
			return p1[p12]
		end
		if v1 and v1[p12] ~= nil then
			return v1[p12]
		else
			return p2
		end
	end
	local v3 = p1.Args or {}
	local v4 = if p1.CanFire == nil then if v1 and v1.CanFire ~= nil then v1.CanFire else nil else p1.CanFire
	if v4 then
		local v52, v62 = v4(Source, v3)
		if not v52 then
			return false, v62
		end
	end
	local v7 = if p1.OnServerFire == nil then if v1 and v1.OnServerFire ~= nil then v1.OnServerFire else nil else p1.OnServerFire
	if v7 then
		local v8 = v7(Source, v3)
		if type(v8) == "table" then
			v3 = v8
		end
	end
	local v9 = if p1.RenderRadius == nil then if v1 and v1.RenderRadius ~= nil then v1.RenderRadius else 2000 else p1.RenderRadius
	local v10 = if p1.IncludeSourcePlayer == nil then if v1 and v1.IncludeSourcePlayer ~= nil then v1.IncludeSourcePlayer else true else p1.IncludeSourcePlayer
	local v11 = if p1.Unreliable == nil then if v1 and v1.Unreliable ~= nil then v1.Unreliable else false else p1.Unreliable
	local v12 = if p1.FireToAllClients == nil then if v1 and v1.FireToAllClients ~= nil then v1.FireToAllClients else false else p1.FireToAllClients
	local v13 = v22.Serialize and v22.Serialize(Source) or Source
	local v14 = v11 and v6 or v5
	local v15 = v3.n or #v3
	if v12 then
		v14:FireAllClients(effectreplicationservicereplicatingeffect, v13, table.unpack(v3, 1, v15))
		return true
	end
	local v16 = v22.GetPosition and v22.GetPosition(Source)
	if typeof(v16) ~= "Vector3" then
		warn("\226\154\160\239\184\143 EffectReplicationService.Fire, resolver returned invalid Position for effect:", effectreplicationservicereplicatingeffect, v22.Name)
		return
	end
	local t = {}
	local t3 = {}
	local function addPlayer(p1) --[[ addPlayer | Line: 305 | Upvalues: t3 (copy), t (copy) ]]
		if p1 and not t3[p1] then
			t3[p1] = true
			table.insert(t, p1)
		end
	end
	if v2 and v2.CharacterOctree then
		for v17, v18 in v2.CharacterOctree:RadiusSearch(v16, v9) do
			local v19 = if v18 then v18.Player else v18
			if v19 and not t3[v19] then
				t3[v19] = true
				table.insert(t, v19)
			end
		end
	end
	if v10 and v22.GetSourcePlayer then
		local v20 = v22.GetSourcePlayer(Source)
		if v20 and not t3[v20] then
			t3[v20] = true
			table.insert(t, v20)
		end
	end
	if p1.ExtraPlayers then
		for v21, v222 in p1.ExtraPlayers do
			if v222 and not t3[v222] then
				t3[v222] = true
				table.insert(t, v222)
			end
		end
	end
	if IS_STUDIO then
		print("\226\150\182\239\184\143 EffectReplicationService, Replicating effect:", effectreplicationservicereplicatingeffect, "to all clients", v22.Name)
	end
	for v23, v24 in t do
		v14:FireClient(v24, effectreplicationservicereplicatingeffect, v13, table.unpack(v3, 1, v15))
	end
	return true
end
local function fireClient(p1) --[[ fireClient | Line: 341 | Upvalues: t2 (copy) ]]
	local v1 = p1.Name
	if not v1 then
		warn("\226\154\160\239\184\143 EffectReplicationService.Fire, missing Name")
		return
	end
	local v2 = t2[v1]
	if not (v2 and v2.OnClientRender) then
		return
	end
	local v3 = p1.Args or {}
	if not v2.OnClientRender then
		return
	end
	v2.OnClientRender(p1.Source, table.unpack(v3, 1, v3.n or #v3))
end
function t.Fire(p1) --[[ Fire | Line: 357 | Upvalues: IS_SERVER (copy), fireServer (copy), fireClient (copy) ]]
	if type(p1) ~= "table" then
		warn("\226\154\160\239\184\143 EffectReplicationService.Fire, expected info table")
		return
	end
	if IS_SERVER then
		return fireServer(p1)
	else
		return fireClient(p1)
	end
end
local function deserializePayload(p1) --[[ deserializePayload | Line: 370 | Upvalues: t3 (copy) ]]
	local t = {}
	for v1, v2 in t3 do
		if v2.Deserialize then
			table.insert(t, v2)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 377 ]]
		return (p1.Priority or 0) > (p2.Priority or 0)
	end)
	for v3, v4 in t do
		local v5 = v4.Deserialize(p1)
		if v5 ~= nil then
			return v5
		end
	end
	return p1
end
local function onRemoteReceived(p1, p2, ...) --[[ onRemoteReceived | Line: 390 | Upvalues: t2 (copy), deserializePayload (copy) ]]
	local v1 = t2[p1]
	if not v1 then
		return
	end
	local v2 = deserializePayload(p2)
	local v3 = table.pack(...)
	if not v1.OnClientRender then
		return
	end
	v1.OnClientRender(v2, table.unpack(v3, 1, v3.n or #v3))
end
function t.Init() --[[ Init | Line: 400 | Upvalues: IS_CLIENT (copy), v5 (copy), onRemoteReceived (copy), v6 (copy), t4 (copy), t (copy) ]]
	if IS_CLIENT then
		v5.OnClientEvent:Connect(onRemoteReceived)
		v6.OnClientEvent:Connect(onRemoteReceived)
	end
	for v1, v2 in t4 do
		t.RegisterEffectSource(v1, v2)
	end
end
task.defer(t.Init)
return t