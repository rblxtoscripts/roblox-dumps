-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("ItemDataService")
local v5 = Sonar("GuiFrameworkService")
local v6 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 153 | Upvalues: t (copy), v2 (copy), v5 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Config = p1
	v22.Maid = v2.new()
	v22.Config = v5.GetComponentConfig(p1)
	v22.OverwriteItemData = p1.OverwriteItemData or {}
	v22.ItemData = p1.ItemData or {}
	v22.DataValue = v22.Config.DataValue
	local v52, v6 = v22:_getItemData()
	v22.OriginalData = v52[1]
	v22.DataType = v52[2]
	v22.VariationData = v6
	v22.Variation = if v6 then v6.Name or nil else nil
	if next(v22.OverwriteItemData) then
		v22.Data = table.clone(v22.OriginalData)
	else
		v22.Data = v22.OriginalData
	end
	v22.ValueChangedSignals = {}
	v22.ValueAddedSignals = {}
	v22.ValueRemovedSignals = {}
	if v22.DataValue then
		local function v8(p1, p2) --[[ setupNestedListeners | Line: 189 | Upvalues: v22 (copy), v8 (copy) ]]
			local v1 = p2 or "__root"
			v22.Maid:GiveTask(p1.ChildAdded:Connect(function(p1) --[[ Line: 192 | Upvalues: p2 (copy), v22 (ref), v1 (copy), v8 (ref) ]]
				if p1:IsA("ValueBase") then
					local v12 = p2 and p2 .. "/" .. p1.Name or p1.Name
					v22.Maid:GiveTask(p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 196 | Upvalues: v22 (ref), p1 (copy), v12 (copy) ]]
						v22:GetValueChangedSignal(p1.Name):Fire()
						v22:GetValueChangedSignal(v12):Fire()
					end))
					local v2 = v22.ValueAddedSignals[v1]
					if v2 then
						v2:Fire(p1.Name, p1.Value)
					end
				else
					if not p1:IsA("Folder") then
						return
					end
					v8(p1, p2 and p2 .. "/" .. p1.Name or p1.Name)
					local v4 = v22.ValueAddedSignals[v1]
					if not v4 then
						return
					end
					v4:Fire(p1.Name, {})
				end
			end))
			v22.Maid:GiveTask(p1.ChildRemoved:Connect(function(p1) --[[ Line: 219 | Upvalues: v22 (ref), v1 (copy) ]]
				local v12 = p1:IsA("ValueBase") and p1.Value or {}
				local v2 = v22.ValueRemovedSignals[v1]
				if not v2 then
					return
				end
				v2:Fire(p1.Name, v12)
			end))
		end
		v8(v22.DataValue, nil)
		for v9, v10 in v22.DataValue:GetDescendants() do
			if v10:IsA("Folder") then
				v8(v10, (v22:_getInstancePath(v10)))
				continue
			end
			local v11 = v22:_getInstancePath(v10)
			v22.Maid:GiveTask(v10:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 238 | Upvalues: v22 (copy), v10 (copy), v11 (copy) ]]
				v22:GetValueChangedSignal(v10.Name):Fire()
				v22:GetValueChangedSignal(v11):Fire()
			end))
		end
	end
	if v22.Config.Item ~= v22.OriginalData and type(v22.Config.Item) == "table" then
		for v12, v13 in v22.Config.Item do
			v22.ItemData[v12] = v13
		end
	end
	for v14, v15 in v22.OverwriteItemData do
		v22.Data[v14] = v15
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 262 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._getItemData(p1) --[[ _getItemData | Line: 266 | Upvalues: v6 (copy), v4 (copy) ]]
	if p1.DataValue then
		local v1, v2 = v6:GetItemDataByValue(p1.DataValue)
		if v1 then
			return { v1, "Item" }, v2
		end
	end
	local v3, v42
	if type(p1.Config.Item) == "table" then
		v3 = p1.Config.Item.Name
		if not v3 then
			v42 = p1.Config.Item
			v3 = type(v42) == "string" and p1.Config.Item or nil
		end
	else
		v42 = p1.Config.Item
		v3 = type(v42) == "string" and p1.Config.Item or nil
	end
	if v3 then
		local v5, v62 = v4.GetByName(v3)
		if v5 then
			if not v62 then
				local v7 = if type(p1.Config.Item) == "table" then p1.Config.Item.Variation or nil else nil
				v62 = v7 and v4.GetByName(v7) or nil
			end
			return { v5, "Item" }, v62
		end
		local v9 = v4.GetType(v3)
		if v9 then
			return { v9, "ItemType" }, nil
		end
		local v10 = v4.GetCategory(v3)
		if v10 then
			return { v10, "ItemCategory" }, nil
		end
		if type(p1.Config.Item) == "table" then
			return { p1.Config.Item, "Item" }, nil
		end
	end
	local t = {}
	t[1] = if type(p1.Config.Item) == "table" then p1.Config.Item or nil else nil
	t[2] = "Custom"
	return t
end
function t._resolveContainer(p1, p2) --[[ _resolveContainer | Line: 324 ]]
	if p2 then
		local v1 = string.split(p2, "/")
		if p1.DataValue then
			local DataValue = p1.DataValue
			for v2, v3 in v1 do
				local v4 = DataValue:FindFirstChild(v3)
				DataValue = v4
				if not v4 then
					break
				end
			end
			if DataValue then
				return DataValue
			end
		end
		local ItemData = p1.ItemData
		for v5, v6 in v1 do
			if type(ItemData) ~= "table" then
				break
			end
			ItemData = ItemData[v6]
			if ItemData == nil then
				break
			end
		end
		if ItemData ~= nil and ItemData ~= p1.ItemData then
			return ItemData
		end
		local Data = p1.Data
		for v7, v8 in v1 do
			if type(Data) ~= "table" then
				return nil
			end
			Data = Data[v8]
			if Data == nil then
				return nil
			end
		end
		return Data
	else
		return p1.DataValue or (p1.ItemData or p1.Data)
	end
end
function t._getInstancePath(p1, p2) --[[ _getInstancePath | Line: 376 ]]
	if not p1.DataValue or p2 == p1.DataValue then
		return nil
	end
	local v1, v2 = p2, {}
	while v1 and v1 ~= p1.DataValue do
		table.insert(v2, 1, v1.Name)
		v1 = v1.Parent
	end
	return table.concat(v2, "/")
end
function t.GetValues(p1, p2) --[[ GetValues | Line: 393 ]]
	local v1 = p1:_resolveContainer(p2)
	if not v1 then
		return nil
	end
	local t = {}
	if typeof(v1) == "Instance" then
		for v2, v3 in v1:GetChildren() do
			if v3:IsA("ValueBase") then
				t[v3.Name] = v3.Value
				continue
			end
			if v3:IsA("Folder") then
				t[v3.Name] = p1:GetValues(p2 and p2 .. "/" .. v3.Name or v3.Name)
			end
		end
		return t
	elseif type(v1) == "table" then
		return table.clone(v1)
	else
		return nil
	end
end
function t.GetValueInstance(p1, p2) --[[ GetValueInstance | Line: 424 ]]
	if not p1.DataValue then
		return nil
	end
	if string.find(p2, "/") then
		local v1 = string.split(p2, "/")
		local DataValue = p1.DataValue
		for v2, v3 in v1 do
			local v4 = DataValue:FindFirstChild(v3)
			if not v4 then
				return nil
			end
			DataValue = v4
		end
		return if DataValue:IsA("ValueBase") or DataValue:IsA("Folder") then if DataValue then DataValue else nil else nil
	else
		local v6 = p1.DataValue:FindFirstChild(p2)
		return if v6 and (v6:IsA("ValueBase") or v6:IsA("Folder")) then if v6 then v6 else nil else nil
	end
end
function t.GetValueInstances(p1, p2) --[[ GetValueInstances | Line: 450 ]]
	if not p1.DataValue then
		return {}
	end
	local v1 = p2 and p1:GetValueInstance(p2) or p1.DataValue
	if not v1 then
		return {}
	end
	local t = {}
	for v2, v3 in v1:GetChildren() do
		if v3:IsA("ValueBase") or v3:IsA("Folder") then
			t[v3.Name] = v3
		end
	end
	return t
end
function t.GetValueChangedSignal(p1, p2) --[[ GetValueChangedSignal | Line: 470 | Upvalues: v1 (copy) ]]
	if not p1.ValueChangedSignals[p2] then
		p1.ValueChangedSignals[p2] = v1.new()
		p1.Maid:GiveTask(p1.ValueChangedSignals[p2])
	end
	return p1.ValueChangedSignals[p2]
end
function t.GetValue(p1, p2) --[[ GetValue | Line: 478 ]]
	if string.find(p2, "/") then
		local v1 = string.split(p2, "/")
		if p1.DataValue then
			local DataValue = p1.DataValue
			for v2, v3 in v1 do
				local v4 = DataValue:FindFirstChild(v3)
				if not v4 then
					break
				end
				if v2 == #v1 and v4:IsA("ValueBase") then
					return v4.Value
				end
				DataValue = v4
			end
		end
		local ItemData = p1.ItemData
		for v5, v6 in v1 do
			if type(ItemData) ~= "table" then
				break
			end
			ItemData = ItemData[v6]
		end
		if ItemData ~= nil and ItemData ~= p1.ItemData then
			return ItemData
		end
		local Data = p1.Data
		for v7, v8 in v1 do
			if type(Data) ~= "table" then
				return nil
			end
			Data = Data[v8]
		end
		return Data
	else
		if p1.DataValue then
			local v9 = p1.DataValue:FindFirstChild(p2)
			if v9 and v9:IsA("ValueBase") then
				return v9.Value
			end
		end
		local v10 = p1[p2]
		if v10 == nil then
			v10 = p1.ItemData[p2]
		end
		if v10 == nil then
			v10 = p1.Config[p2]
		end
		return v10
	end
end
function t.SetValue(p1, p2, p3) --[[ SetValue | Line: 548 ]]
	if p1.DataValue then
		warn("SetValue not supported for DataValue-backed providers")
		return
	end
	local v1 = string.split(p2, "/")
	local Data = p1.Data
	for i = 1, #v1 - 1 do
		local v2 = v1[i]
		if type(Data[v2]) ~= "table" then
			Data[v2] = {}
		end
		Data = Data[v2]
	end
	local v4 = v1[#v1]
	local v5 = Data[v4]
	Data[v4] = p3
	p1:GetValueChangedSignal(p2):Fire()
	p1:GetValueChangedSignal(v4):Fire()
	local v7 = (if #v1 > 1 then table.concat(v1, "/", 1, #v1 - 1) or nil else nil) or "__root"
	if v5 == nil and p3 ~= nil then
		local v8 = p1.ValueAddedSignals[v7]
		if v8 then
			v8:Fire(v4, p3)
		end
	else
		if v5 == nil or p3 ~= nil then
			return
		end
		local v9 = p1.ValueRemovedSignals[v7]
		if not v9 then
			return
		end
		v9:Fire(v4, v5)
	end
end
function t.RemoveValue(p1, p2) --[[ RemoveValue | Line: 595 ]]
	if p1.DataValue then
		warn("RemoveValue not supported for DataValue-backed providers")
		return false
	end
	local v1 = string.split(p2, "/")
	local Data = p1.Data
	for i = 1, #v1 - 1 do
		local v2 = v1[i]
		if type(Data[v2]) ~= "table" then
			return false
		end
		Data = Data[v2]
	end
	local v4 = v1[#v1]
	local v5 = Data[v4]
	if v5 == nil then
		return false
	end
	Data[v4] = nil
	p1:GetValueChangedSignal(p2):Fire()
	p1:GetValueChangedSignal(v4):Fire()
	local v7 = p1.ValueRemovedSignals[(if #v1 > 1 then table.concat(v1, "/", 1, #v1 - 1) or nil else nil) or "__root"]
	if not v7 then
		return true
	end
	v7:Fire(v4, v5)
	return true
end
function t.GetValueAddedSignal(p1, p2) --[[ GetValueAddedSignal | Line: 639 | Upvalues: v1 (copy) ]]
	local v12 = p2 or "__root"
	if not p1.ValueAddedSignals[v12] then
		p1.ValueAddedSignals[v12] = v1.new()
		p1.Maid:GiveTask(p1.ValueAddedSignals[v12])
	end
	return p1.ValueAddedSignals[v12]
end
function t.GetValueRemovedSignal(p1, p2) --[[ GetValueRemovedSignal | Line: 649 | Upvalues: v1 (copy) ]]
	local v12 = p2 or "__root"
	if not p1.ValueRemovedSignals[v12] then
		p1.ValueRemovedSignals[v12] = v1.new()
		p1.Maid:GiveTask(p1.ValueRemovedSignals[v12])
	end
	return p1.ValueRemovedSignals[v12]
end
return t