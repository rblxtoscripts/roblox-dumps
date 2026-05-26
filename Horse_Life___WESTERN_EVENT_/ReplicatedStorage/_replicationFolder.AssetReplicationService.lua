-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("RemoteUtils")
local v2 = Sonar("PlayerWrapper")
local v3 = game:GetService("RunService"):IsServer()
local t = {}
local v4 = v1.GetRemoteFunction("ReplicateAssetRemote")
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local function getAssetFromPath(p1, p2, ...) --[[ getAssetFromPath | Line: 108 | Upvalues: t2 (copy) ]]
	local v1 = t2[p1.Name] or t2[p1.AssetType]
	if v1 then
		return v1(p1, p2, ...)
	end
	if type(p2) == "string" then
		return p1[p2]
	end
	for k, v in pairs(p2) do
		p1 = p1[v]
	end
	return p1
end
local function removeAssetFromPath(p1, p2) --[[ removeAssetFromPath | Line: 124 ]]
	if type(p2) == "string" then
		if p1[p2] then
			p1[p2] = nil
			return true
		end
	else
		for k, v in pairs(p2) do
			if k == #p2 then
				if p1[v] then
					p1[v] = nil
					return true
				end
				continue
			end
			p1 = p1[v]
		end
		return false
	end
end
local function yieldForAsset(p1, p2, p3, ...) --[[ yieldForAsset | Line: 148 | Upvalues: getAssetFromPath (copy), t (copy) ]]
	local v1 = nil
	while not v1 do
		local v2 = getAssetFromPath(p1, p2, ...)
		if not t[p3] then
			return v2
		end
		task.wait()
		v1 = v2
	end
	return v1
end
local function convertPathToString(p1, p2, p3, ...) --[[ convertPathToString | Line: 160 ]]
	local v1 = ""
	if type(p3) == "string" then
		v1 = p3
	else
		for k, v in pairs(p3) do
			v1 = v1 .. v
		end
	end
	return ("%*-%*-%*"):format(p1.Name, p2, v1)
end
local function setModelToPath(p1, p2, p3) --[[ setModelToPath | Line: 173 ]]
	for k, v in pairs(type(p2) == "string" and { p2 } or p2) do
		local v2 = p1[v]
		if not v2 then
			p1[v] = p3
			return p3
		end
		if v2 == p3 then
			return p3
		end
		p1 = v2
	end
	return nil
end
function t5.GetObjectToReplicate(p1, p2) --[[ GetObjectToReplicate | Line: 196 | Upvalues: t4 (copy) ]]
	local v1 = type(p1) == "table" and p1.Name or p1
	local v2 = if p2 then p2 elseif type(p1) == "table" then p1.AssetType or p1.ItemType.Name else false
	local v3, v4
	if v2 then
		v3 = t4[v2] and t4[v2][v1]
		v4 = v2
	else
		v4 = v2
		v3 = v2
	end
	if not v4 then
		for v5, v6 in t4 do
			v3 = v6[v1]
			if v3 then
				v4 = v5
				break
			end
		end
	end
	if not v3 and v4 then
		if not t4[v4] then
			t4[v4] = {}
		end
		local t = {
			Name = v1,
			AssetType = v4
		}
		t4[v4][v1] = t
		v3 = t
	end
	if v3 and not v3.DoNotReplicate then
		return v3, v4
	end
end
function t5.Get(p1, p2, ...) --[[ Get | Line: 239 | Upvalues: t5 (copy), getAssetFromPath (copy), convertPathToString (copy), t (copy), yieldForAsset (copy), v4 (copy), setModelToPath (copy), t3 (copy), removeAssetFromPath (copy) ]]
	local v1, v2 = t5.GetObjectToReplicate(p1)
	if not v1 then
		return
	end
	local v3 = p2 or "Model"
	local v42 = getAssetFromPath(v1, v3, ...)
	if v42 then
		return v42
	end
	local v5 = convertPathToString(v1, v2, v3)
	if t[v5] then
		return yieldForAsset(v1, v3, v5)
	end
	t[v5] = true
	local assetreplicationservicesetmodelfor = v4:InvokeServer({
		Name = v1.Name,
		AssetType = v2
	}, v3, ...)
	if not assetreplicationservicesetmodelfor then
		t[v5] = nil
		warn("\226\157\140 AssetReplicationService, Model still not found after server invoke: " .. tostring(v5))
		return
	end
	setModelToPath(v1, v3, assetreplicationservicesetmodelfor)
	local v6 = t3[v1.Name] or t3[v2]
	if v6 then
		v6(v1, assetreplicationservicesetmodelfor)
	end
	assetreplicationservicesetmodelfor.Destroying:Once(function() --[[ Line: 287 | Upvalues: t (ref), v5 (copy), removeAssetFromPath (ref), v1 (copy), v3 (ref) ]]
		t[v5] = nil
		if not removeAssetFromPath(v1, v3) then
			return
		end
		t[v5] = nil
	end)
	print("\226\172\135\239\184\143 AssetReplicationService, Set model for", assetreplicationservicesetmodelfor, v3)
	t[v5] = nil
	return assetreplicationservicesetmodelfor
end
function t5.Replicate(p1, p2, p3, ...) --[[ Replicate | Line: 303 | Upvalues: t5 (copy), getAssetFromPath (copy), convertPathToString (copy) ]]
	local v1, v2 = t5.GetObjectToReplicate(p2)
	if not v1 then
		return
	end
	local v3 = getAssetFromPath(v1, p3, ...)
	if not v3 then
		return
	end
	local v4 = convertPathToString(v1, v2, p3)
	local v5 = p1.LocalReplication:FindFirstChild(v4)
	if not v5 then
		local v6 = v3:Clone()
		v6.Name = v4
		v6.Parent = p1.LocalReplication
		p1.ReplicatedAssets[v1.Name] = {
			AssetType = v2,
			Asset = v6
		}
		v5 = v6
	end
	return v5
end
function t5.AddAssetsToReplicate(p1, p2) --[[ AddAssetsToReplicate | Line: 335 | Upvalues: t4 (copy) ]]
	if not t4[p1] then
		t4[p1] = {}
	end
	if typeof(p2) == "Instance" then
		p2 = p2:GetChildren()
	end
	if typeof(p2) == "Instance" then
		p2 = p2:GetChildren()
	end
	for v3, v4 in p2 do
		if typeof(v4) == "Instance" then
			v4 = {
				Name = v4.Name,
				Model = v4
			}
		end
		if v4.Name then
			v4.AssetType = p1
			t4[p1][v4.Name] = v4
			continue
		end
		warn("\226\154\160\239\184\143 AssetReplicationService, Asset has no name", v4)
	end
end
function t5.AddAssetCallback(p1, p2) --[[ AddAssetCallback | Line: 367 | Upvalues: t2 (copy) ]]
	if t2[p1] then
		warn("\226\154\160\239\184\143 AssetReplicationService, Object handler already exists for", p1)
	else
		t2[p1] = p2
	end
end
function t5.AddAssetReplicatedCallback(p1, p2) --[[ AddAssetReplicatedCallback | Line: 375 | Upvalues: t3 (copy) ]]
	if t3[p1] then
		warn("\226\154\160\239\184\143 AssetReplicationService, Asset replicated callback already exists for", p1)
	else
		t3[p1] = p2
	end
end
function t5.ClearReplicatedItemsOfType(p1, p2, p3) --[[ ClearReplicatedItemsOfType | Line: 383 ]]
	if not p1.ReplicatedAssets then
		return
	end
	for k, v in pairs(p1.ReplicatedAssets) do
		if v.AssetType == p2 and not table.find(p3, k) then
			v.Asset:Destroy()
			p1.ReplicatedAssets[k] = nil
		end
	end
end
function t5.ClearAllReplicatedAssetsForPlayer(p1) --[[ ClearAllReplicatedAssetsForPlayer | Line: 402 ]]
	for k, v in pairs(p1.ReplicatedAssets) do
		v.Asset:Destroy()
		p1.ReplicatedAssets[k] = nil
	end
	p1.ReplicatedAssets = nil
end
function t5.Init(p1) --[[ Init | Line: 410 | Upvalues: v3 (copy), v2 (copy), t5 (copy), v4 (copy) ]]
	if not v3 then
		return
	end
	v2.bindToPlayers({
		OnAdded = function(p1, p2) --[[ OnAdded | Line: 413 | Upvalues: t5 (ref) ]]
			p2.ReplicatedAssets = {}
			p2.Maid:GiveTask(function() --[[ Line: 415 | Upvalues: t5 (ref), p2 (copy), p1 (copy) ]]
				local v1, v2 = pcall(t5.ClearAllReplicatedAssetsForPlayer, p2)
				if v1 then
					return
				end
				warn("\226\154\160\239\184\143 AssetReplicationService, Error removing replicated items on leave", p1, v2)
			end)
		end
	})
	function v4.OnServerInvoke(p1, ...) --[[ Line: 424 | Upvalues: v2 (ref), t5 (ref) ]]
		local v1 = v2.getWrapperFromPlayer(p1)
		if v1 then
			return t5.Replicate(v1, ...)
		end
	end
end
t5:Init()
return t5