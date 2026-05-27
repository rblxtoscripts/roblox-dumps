-- https://lua.expert/
debug.setmemorycategory("ITEM_REPLICATION_SERVICE")
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("ItemDataService")
local v2 = Sonar("RemoteUtils")
local v3 = Sonar("PlayerWrapper")
local v4 = RunService:IsServer()
local t2 = {}
local v5 = v2.GetRemoteFunction("ReplicateItemRemote")
local t3 = {}
local t4 = {}
local t5 = {}
local function getModelFromPath(p1, p2, ...) --[[ getModelFromPath | Line: 29 | Upvalues: t4 (copy), t3 (copy) ]]
	local v1 = t4[p1.Name]
	if v1 then
		return v1(p1, p2, ...)
	end
	local v2 = t3[p1.ItemType]
	if v2 then
		return v2(p1, p2, ...)
	end
	if type(p2) == "string" then
		return p1[p2]
	end
	for k, v in pairs(p2) do
		p1 = p1[v]
	end
	return p1
end
local function yieldForModel(p1, p2, p3, ...) --[[ yieldForModel | Line: 51 | Upvalues: getModelFromPath (copy), RunService (copy), t2 (copy) ]]
	local v1 = getModelFromPath(p1, p2, ...)
	if not v1 then
		local v2
		repeat
			v2 = getModelFromPath(p1, p2, ...)
			RunService.Heartbeat:Wait()
		until v2 or not t2[p3]
		v1 = v2
	end
	return v1
end
local function getStringFromPath(p1) --[[ getStringFromPath | Line: 65 ]]
	if type(p1) == "string" then
		return p1
	end
	local v1 = ""
	for k, v in pairs(p1) do
		v1 = v1 .. v
	end
	return v1
end
local function setModelToPath(p1, p2, p3) --[[ setModelToPath | Line: 78 ]]
	if not p3 then
		warn("No model returned for", p1, p2)
		return
	end
	for k, v in pairs(type(p2) == "string" and { p2 } or p2) do
		local v2 = p1[v]
		if not v2 then
			p1[v] = p3
			return p3
		end
		p1 = v2
	end
end
local function getObjectData(p1, p2) --[[ getObjectData | Line: 102 | Upvalues: v1 (copy) ]]
	local _ = if p2 then p2 elseif type(p1) == "table" then p1.ItemType else false
	return type(p1) == "table" and v1.GetByName(p1.Name) or v1.GetByName(p1)
end
function t.Get(p1, p2, ...) --[[ Get | Line: 112 | Upvalues: v1 (copy), getModelFromPath (copy), t2 (copy), yieldForModel (copy), v5 (copy), setModelToPath (copy), t5 (copy) ]]
	local v12 = nil
	local _, v2
	if v12 then
		_ = v12
		v2 = p1
	elseif type(p1) == "table" then
		_ = p1.ItemType
		v2 = p1
	else
		_ = false
		v2 = p1
	end
	local v3, v4
	if type(v2) == "table" then
		local v52 = v1.GetByName(v2.Name)
		if v52 then
			v3 = v52
		else
			v4 = v1.GetByName(v2)
			v3 = v4
		end
	else
		v4 = v1.GetByName(v2)
		v3 = v4
	end
	if not v3 then
		return
	end
	local v6 = p2 or "Model"
	local v7 = getModelFromPath(v3, v6, ...)
	if v7 then
		return v7
	end
	local v9
	if type(v6) == "string" then
		v9 = v6
	else
		local v10 = ""
		for k, v in pairs(v6) do
			v10 = v10 .. v
		end
		v9 = v10
	end
	local v11 = v3.Name .. v3.ItemType .. v9
	if t2[v11] then
		return yieldForModel(v3, v6, v11)
	end
	t2[v11] = true
	local v122 = v5:InvokeServer({
		Name = v3.Name,
		ItemType = v3.ItemType
	}, v6, ...)
	if not v122 then
		t2[v11] = nil
		return
	end
	setModelToPath(v3, v6, v122)
	local v13 = t5[v3.Name] or t5[v3.ItemType]
	if v13 then
		v13(v3, v122)
	end
	return v122
end
function t.GetObject(p1) --[[ GetObject | Line: 168 | Upvalues: v1 (copy) ]]
	local ItemType = p1.ItemType
	local v12 = nil
	local _ = if v12 then v12 elseif type(ItemType) == "table" then ItemType.ItemType else false
	local v2, v3
	if type(ItemType) == "table" then
		local v4 = v1.GetByName(ItemType.Name)
		if v4 then
			v2 = v4
		else
			v3 = v1.GetByName(ItemType)
			v2 = v3
		end
	else
		v3 = v1.GetByName(ItemType)
		v2 = v3
	end
	return v2
end
function t.Replicate(p1, p2, p3, ...) --[[ Replicate | Line: 173 | Upvalues: v1 (copy), getModelFromPath (copy), t (copy) ]]
	local ReplicationGui = p1.ReplicationGui
	local ItemType = p2.ItemType
	local _, v12
	if ItemType then
		_ = ItemType
		v12 = p2
	elseif type(p2) == "table" then
		_ = p2.ItemType
		v12 = p2
	else
		_ = false
		v12 = p2
	end
	local v2, v3
	if type(v12) == "table" then
		local v4 = v1.GetByName(v12.Name)
		if v4 then
			v2 = v4
		else
			v3 = v1.GetByName(v12)
			v2 = v3
		end
	else
		v3 = v1.GetByName(v12)
		v2 = v3
	end
	if not v2 then
		return
	end
	if v2.DontReplicate then
		return
	end
	local v5 = getModelFromPath(v2, p3, ...)
	if not v5 then
		return
	end
	local v7
	if type(p3) == "string" then
		v7 = p3
	else
		local v8 = ""
		for k, v in pairs(p3) do
			v8 = v8 .. v
		end
		v7 = v8
	end
	local v9 = v2.Name .. v2.ItemType .. v7
	local v10 = ReplicationGui:FindFirstChild(v9)
	if not v10 then
		local v11 = v5:Clone()
		v11.Name = v9
		v11.Parent = ReplicationGui
		if not p1.ReplicatedObjects then
			p1.ReplicatedObjects = {}
			p1.Maid:GiveTask(function() --[[ Line: 196 | Upvalues: t (ref), p1 (copy) ]]
				local v1, v2 = pcall(t.ClearAllReplicatedItems, p1)
				if v1 then
					return
				end
				warn(v2)
			end)
		end
		p1.ReplicatedObjects[v2.Name] = {
			Category = v2.Category,
			Model = v11
		}
		v10 = v11
	end
	return v10
end
function t.AddItemHandler(p1, p2) --[[ AddItemHandler | Line: 213 | Upvalues: t4 (copy) ]]
	t4[p1] = p2
end
function t.AddItemTypeHandler(p1, p2) --[[ AddItemTypeHandler | Line: 217 | Upvalues: t3 (copy) ]]
	t3[p1] = p2
end
function t.AddModelReceivedCallback(p1, p2) --[[ AddModelReceivedCallback | Line: 221 | Upvalues: t5 (copy) ]]
	t5[p1] = p2
end
function t.ClearReplicatedItemsOfType(p1, p2, p3) --[[ ClearReplicatedItemsOfType | Line: 226 ]]
	if not p1.ReplicatedObjects then
		return
	end
	for k, v in pairs(p1.ReplicatedObjects) do
		if v.Category == p2 and not table.find(p3, k) then
			v.Model:Destroy()
			p1.ReplicatedObjects[k] = nil
		end
	end
end
function t.ClearAllReplicatedItems(p1) --[[ ClearAllReplicatedItems | Line: 237 ]]
	for k, v in pairs(p1.ReplicatedObjects) do
		v.Model:Destroy()
		p1.ReplicatedObjects[k] = nil
	end
	p1.ReplicatedObjects = nil
end
function t.Init(p1) --[[ Init | Line: 245 | Upvalues: v1 (copy), t (copy), v4 (copy), v5 (copy), v3 (copy) ]]
	v1.GetOrReplicateModel = t.Get
	if not v4 then
		return
	end
	function v5.OnServerInvoke(p1, ...) --[[ Line: 249 | Upvalues: v3 (ref), t (ref) ]]
		local v1 = v3.getWrapperFromPlayer(p1)
		if v1 then
			return t.Replicate(v1, ...)
		end
	end
end
t:Init()
return t