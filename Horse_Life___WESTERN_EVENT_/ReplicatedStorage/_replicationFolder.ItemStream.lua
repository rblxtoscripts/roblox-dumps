-- https://lua.expert/
local t = {}
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("StorageUtils")
local v2 = Sonar("GuiFrameworkService")
local v3 = Sonar("ItemDataService")
local v4 = v1.GetConfig("ItemStream")()
local AnimationPresets = v4.AnimationPresets
local v5 = Sonar("PlayerWrapper").GetClient()
local ItemStreamReplication = v5.ItemStreamReplication
local t2 = {}
local function isBatch(p1) --[[ isBatch | Line: 24 | Upvalues: v4 (copy) ]]
	return string.find(p1, v4.BatchPrefixString)
end
local function getContentsFromIdentifier(p1) --[[ getContentsFromIdentifier | Line: 28 | Upvalues: v4 (copy) ]]
	local v1 = string.split(p1, v4.StringSeparator)
	local v42 = tonumber(v1[2]) and v1[2]
	return v1[1], v42, v42 and v1[3] or v1[2]
end
local function v6(p1, p2, p3) --[[ resolveAnimationPreset | Line: 43 | Upvalues: Sonar (copy), AnimationPresets (copy), v6 (copy) ]]
	local v1 = (p3 or 0) + 1
	if v1 > 5 then
		warn("\226\154\160\239\184\143 ItemStream, Animation resolution exceeded max depth", p2)
		return nil
	end
	local v2 = if typeof(p1) == "Instance" then Sonar(p1) else p1
	local v4 = type(v2)
	if v4 == "function" then
		local v62 = v2(p2.Items or { p2 })
		if v62 == nil then
			warn("\226\154\160\239\184\143 ItemStream, Animation resolver returned nil", p2)
			return nil
		end
		local v7 = typeof(v62)
		if v7 == "string" then
			local v8 = AnimationPresets[v62]
			if v8 then
				return v6(v8, p2, v1)
			else
				warn("\226\154\160\239\184\143 ItemStream, Unknown animation preset returned from resolver", v62, p2)
				return nil
			end
		else
			if v7 ~= "Instance" and (type(v62) ~= "function" and type(v62) ~= "table") then
				warn("\226\154\160\239\184\143 ItemStream, Invalid animation resolver result type", v7, p2)
				return nil
			end
			return v6(v62, p2, v1)
		end
	elseif v4 == "table" then
		return v2
	else
		warn("\226\154\160\239\184\143 ItemStream, Invalid animation type", v2, p2)
		return nil
	end
end
local function queueItemAnimation(p1) --[[ queueItemAnimation | Line: 94 | Upvalues: AnimationPresets (copy), v6 (copy), v3 (copy), v2 (copy) ]]
	local v1 = p1.Animation and AnimationPresets[p1.Animation]
	if not v1 and p1.DataValue then
		v1 = AnimationPresets.Default
	end
	if not v1 then
		warn("\226\154\160\239\184\143 ItemStream, No animation preset found", p1)
		return
	end
	local v22 = v6(v1, p1)
	if not v22 then
		return
	end
	p1.Animation = v22
	p1.Sequence = v22.Sequence
	if p1.Name then
		p1.Item = v3.GetByName(p1.Name)
	elseif p1.Items then
		for v32, v4 in p1.Items do
			v4.Item = v3.GetByName(v4.Name)
		end
	end
	return v2.QueueAnimation(p1)
end
local function batchAdded(p1) --[[ batchAdded | Line: 130 | Upvalues: ItemStreamReplication (copy), HttpService (copy), v4 (copy), v5 (copy), v3 (copy), queueItemAnimation (copy) ]]
	local v1 = ItemStreamReplication:GetAttribute(p1)
	if not v1 then
		return
	end
	local v2 = HttpService:JSONDecode(v1)
	local v32 = string.split(p1, v4.StringSeparator)
	local _ = v32[1]
	local t, v7 = {}, tonumber(v32[2]) and v32[2] and v32[3] or v32[2]
	for v8, v9 in v2 do
		local v10 = v9[1]
		local v11 = v9[2]
		local v12 = string.split(v10, v4.StringSeparator)
		local v13 = v12[1]
		local v15 = tonumber(v12[2]) and v12[2]
		if not (v15 and v12[3]) then
			local _2 = v12[2]
		end
		local v16 = v5:WaitForItemValue(v15 or v13, 5)
		if v16 then
			local v17, v18 = v3.GetItemNameAndVariation(v13)
			t[v8] = {
				Identifier = v10,
				Name = v17,
				Variation = v18,
				Id = v15,
				Amount = v11,
				DataValue = v16
			}
		end
	end
	if queueItemAnimation({
		Identifier = p1,
		Animation = v7,
		Items = t
	}) then
		return
	end
	for v19, v20 in t do
		queueItemAnimation(v20)
	end
end
local function itemAdded(p1) --[[ itemAdded | Line: 180 | Upvalues: t2 (copy), v4 (copy), v5 (copy), ItemStreamReplication (copy), v3 (copy), queueItemAnimation (copy) ]]
	if t2[p1] then
		return
	end
	t2[p1] = true
	local v1 = string.split(p1, v4.StringSeparator)
	local v42 = tonumber(v1[2]) and v1[2]
	local v6 = v1[1]
	local v7 = v42
	local v8 = v42 and v1[3] or v1[2]
	local v9 = v5:WaitForItemValue(v7 or v6, 5)
	if v9 then
		local v10 = nil
		local function addItem() --[[ addItem | Line: 199 | Upvalues: ItemStreamReplication (ref), p1 (copy), v10 (ref), v3 (ref), v6 (copy), queueItemAnimation (ref), v8 (copy), v9 (copy), v7 (copy) ]]
			local v1 = ItemStreamReplication:GetAttribute(p1)
			if not v1 then
				return
			end
			local v2 = string.split(v1, "_")
			local v4 = tonumber(v2[1])
			if v10 and v4 <= v10 then
				return
			end
			v10 = v4
			local v62 = tonumber(v2[2])
			if not (v62 <= 0) then
				local v72, v82 = v3.GetItemNameAndVariation(v6)
				queueItemAnimation({
					Identifier = p1,
					Animation = v8,
					DataValue = v9,
					Amount = v62,
					Name = v72,
					Variation = v82,
					Id = v7
				})
			end
		end
		ItemStreamReplication:GetAttributeChangedSignal(p1):Connect(addItem)
		addItem()
	end
end
function t.QueueItemStream(p1) --[[ QueueItemStream | Line: 241 | Upvalues: queueItemAnimation (copy) ]]
	return queueItemAnimation(p1)
end
function t.Init(p1) --[[ Init | Line: 245 | Upvalues: ItemStreamReplication (copy), v4 (copy), batchAdded (copy), itemAdded (copy) ]]
	ItemStreamReplication.AttributeChanged:Connect(function(p1) --[[ Line: 247 | Upvalues: ItemStreamReplication (ref), v4 (ref), batchAdded (ref), itemAdded (ref) ]]
		if not ItemStreamReplication:GetAttribute(p1) then
			return
		end
		if string.find(p1, v4.BatchPrefixString) then
			batchAdded(p1)
		else
			itemAdded(p1)
		end
	end)
end
t:Init()
return t