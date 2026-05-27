-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("ItemDataService")
local v2 = Sonar("StorageUtils")
local v3 = Sonar("Signal")
local v4 = Sonar("EventUtils")
local v5 = Sonar("NotificationsService")
local v6 = Sonar("TableUtils")
local v7 = Sonar("AnalyticsService")
local v8 = Sonar("PlayerWrapper")
local v9 = Sonar("Constants")
local v10 = v2.GetConfig("ItemsWrapper")()
local ItemTypeToItemFoldersMap = v10.ItemTypeToItemFoldersMap
local ItemHandlers = v10.ItemHandlers
local OverItemLimitHandlers = v10.OverItemLimitHandlers
local ItemActionHandlers = v10.ItemActionHandlers
local ItemActionPresets = v10.ItemActionPresets
local ItemStreamHandlers = v10.ItemStreamHandlers
local ItemDataHandlers = v10.ItemDataHandlers
local v11 = v2.GetConfig("ItemStream")()
local v12 = game:GetService("RunService"):IsServer()
function t._getItemStreamIdentifier(p1, p2) --[[ _getItemStreamIdentifier | Line: 133 | Upvalues: v1 (copy), v11 (copy) ]]
	local v2 = if p2.Value and v1.IsItemStackable(p2.Value) then "" else v11.StringSeparator .. (p2.Id or p2.Value.Name)
	return p2.Name .. v2 .. (type(p2.ItemStream) == "string" and v11.StringSeparator .. p2.ItemStream or "")
end
function t._postItemAnalytics(p1, p2) --[[ _postItemAnalytics | Line: 143 | Upvalues: v1 (copy), v9 (copy), v10 (copy), v7 (copy) ]]
	return task.spawn(function() --[[ Line: 144 | Upvalues: p2 (copy), v1 (ref), v9 (ref), p1 (copy), v10 (ref), v7 (ref) ]]
		local ItemType = p2.ItemType
		if not ItemType then
			local v12 = v1.GetItemType(p2.Currency) and v12.Name
			ItemType = v12
		end
		if not ItemType then
			warn("\226\154\160\239\184\143 ItemsWrapper, _postItemAnalytics, Item type not found for", p2.Currency, p2)
			return
		end
		if v9.IS_STUDIO then
			print("\240\159\147\138 ItemsWrapper, Posting item analytics", p1.Player, p2)
		end
		local t = {
			{
				Key = "FlowType",
				Value = p2.FlowType
			},
			{
				Key = "Currency",
				Value = p2.Currency
			},
			{
				Key = "ItemType",
				Value = ItemType
			},
			{
				Key = "SourceLocation",
				Value = p2.SourceLocation or "Unknown"
			},
			{
				Key = "Variation",
				Value = p2.Variation
			}
		}
		if p2.ItemPurchased then
			table.insert(t, {
				Key = "ItemPurchased",
				Value = p2.ItemPurchased
			})
		end
		if v10.AnalyticsWalletCurrencyName then
			table.insert(t, {
				Key = "WalletSize",
				Value = p1:GetTotalOwnedAmount(v10.AnalyticsWalletCurrencyName)
			})
		end
		v7.ReportEvent("ResourceEvent", {
			Player = p1.Player,
			Value = p2.Amount,
			Data = t
		})
	end)
end
function t.new(p1) --[[ new | Line: 195 | Upvalues: t (copy), v10 (copy), ItemTypeToItemFoldersMap (copy), v12 (copy), v3 (copy), v4 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = p1.Maid
	v2.Player = p1.Player
	v2.PlayerWrapper = p1
	v2.PlayerData = p1.PlayerData
	v2.Drops = {}
	if v2.PlayerData then
		v2._itemStreamIds = {}
		v2._batchId = 0
		v2.ItemFolders = v10.ItemFolders(v2.PlayerData)
		for v32, v42 in ItemTypeToItemFoldersMap do
			if not v2.ItemFolders[v42] then
				warn("\226\154\160\239\184\143 ItemsWrapper, Item folder not found for item type", v32, v42)
			end
		end
		v2.ItemValuesByFolder = v10.ItemValueMap(v2.PlayerData)
		v2.ItemValueMap = {
			ByName = {},
			ByValue = {}
		}
		for v5, v6 in v2.ItemValuesByFolder do
			if v2.ItemFolders[v5] then
				for v7, v8 in v6 do
					v2.ItemValueMap.ByName[v7] = v8
					v2.ItemValueMap.ByValue[v8] = v7
				end
				continue
			end
			warn("\226\154\160\239\184\143 ItemsWrapper, Item values by folder not found for item folder", v5)
		end
		if v12 then
			v2.ItemStreamReplication = Instance.new("Folder")
			v2.ItemStreamReplication.Name = "ItemStream"
			v2.ItemStreamReplication.Parent = p1.LocalReplication
			v2.Maid:GiveTask(v2.ItemStreamReplication)
		else
			v2.ItemStreamReplication = p1.LocalReplication:WaitForChild("ItemStream")
		end
		v2.PlayerWrapper:SetProperty("ItemStreamReplication", v2.ItemStreamReplication)
		v2.ItemLimitsByData = {}
		for v9, v102 in v10.ItemLimits(v2.PlayerWrapper) do
			v102.Type = v9
			v2.ItemLimitsByData[v9] = v102
			if v102.ItemTypes then
				for v11, v122 in v102.ItemTypes do
					if v2.ItemLimitsByData[v122] then
						warn("\226\154\160\239\184\143 ItemsWrapper, ItemLimits, Item type already exists for", v122, v9)
						continue
					end
					v2.ItemLimitsByData[v122] = v102
				end
			end
			if v102.ItemFolders then
				for v13, v14 in v102.ItemFolders do
					local v15 = v2.ItemFolders[v14]
					if v15 then
						if v2.ItemLimitsByData[v14] then
							warn("\226\154\160\239\184\143 ItemsWrapper, ItemLimits, Item folder already exists for", v15, v9)
							continue
						end
						v2.ItemLimitsByData[v14] = v102
						continue
					end
					warn("\226\154\160\239\184\143 ItemsWrapper, ItemLimits, Item folder not found for", v15, v9)
				end
			end
			if not v102.GetAmount then
				function v102.GetAmount() --[[ Line: 282 | Upvalues: v102 (copy), v2 (copy) ]]
					local sum = 0
					if v102.ItemTypes then
						for v1, v22 in v102.ItemTypes do
							local v3 = v2:GetTotalOwnedAmount(v22)
							if v3 then
								sum = sum + v3
							end
						end
					end
					if v102.ItemFolders then
						for v4, v5 in v102.ItemFolders do
							local v6 = v2:GetTotalOwnedAmount(v5)
							if v6 then
								sum = sum + v6
							end
						end
					end
					return sum
				end
			end
			v102.ChangedSignal = v3.new()
			v2.Maid:GiveTask(v102.ChangedSignal)
			if v102.Changed then
				v102.Changed = v4.getConnectionEvents(v102.Changed)
				for v16, v17 in v102.Changed do
					v2.Maid:GiveTask(v17:Connect(function() --[[ Line: 313 | Upvalues: v102 (copy) ]]
						v102.ChangedSignal:Fire()
					end))
				end
			end
		end
		v2.TrackedItemFolderAmounts = {}
		for v18, v19 in v2.ItemFolders do
			v2:_trackItemFolder(v18, v19)
		end
		v2.ItemAddedSignal = v2.PlayerWrapper:GetSignal("ItemAddedSignal")
	end
	return v2
end
function t.GetItemNameByValue(p1, p2) --[[ GetItemNameByValue | Line: 331 | Upvalues: v1 (copy) ]]
	local v12 = p1.ItemValueMap.ByValue[p2]
	if v12 then
		return v12
	else
		return v1.GetItemNameByDataValue(p2)
	end
end
function t.GetItemDataByValue(p1, p2) --[[ GetItemDataByValue | Line: 339 | Upvalues: v1 (copy) ]]
	local v12 = p1.ItemValueMap.ByValue[p2]
	if v12 then
		return v1.GetByName(v12)
	else
		return v1.GetByDataValue(p2)
	end
end
function t._getTotalOwnedValueAddedSignal(p1, p2) --[[ _getTotalOwnedValueAddedSignal | Line: 347 | Upvalues: v3 (copy) ]]
	if not p1.TotalOwnedValueAddedSignals then
		p1.TotalOwnedValueAddedSignals = {}
	end
	if not p1.TotalOwnedValueAddedSignals[p2] then
		p1.TotalOwnedValueAddedSignals[p2] = v3.new()
	end
	return p1.TotalOwnedValueAddedSignals[p2]
end
function t._getUniqueOwnedValueAddedSignal(p1, p2) --[[ _getUniqueOwnedValueAddedSignal | Line: 359 | Upvalues: v3 (copy) ]]
	if not p1.UniqueOwnedValueAddedSignals then
		p1.UniqueOwnedValueAddedSignals = {}
	end
	if not p1.UniqueOwnedValueAddedSignals[p2] then
		p1.UniqueOwnedValueAddedSignals[p2] = v3.new()
	end
	return p1.UniqueOwnedValueAddedSignals[p2]
end
function t._trackItemFolder(p1, p2, p3) --[[ _trackItemFolder | Line: 371 | Upvalues: v1 (copy) ]]
	local t = {
		ItemTypes = {},
		TotalOwnedValue = Instance.new("IntValue"),
		UniqueOwnedValue = Instance.new("IntValue")
	}
	p1.TrackedItemFolderAmounts[p2] = t
	local function setTotalOwnedInItemFolder() --[[ setTotalOwnedInItemFolder | Line: 385 | Upvalues: t (copy), p1 (copy), p2 (copy) ]]
		local sum = 0
		for v1, v2 in t.ItemTypes do
			sum = sum + v2.TotalOwnedValue.Value
		end
		t.TotalOwnedValue.Value = sum
		t.TotalOwned = sum
		local v3 = p1:_getItemLimitHandlers(p2)
		if not v3 then
			return
		end
		v3.ChangedSignal:Fire()
	end
	local function setUniqueOwnedInItemFolder() --[[ setUniqueOwnedInItemFolder | Line: 400 | Upvalues: t (copy) ]]
		local sum = 0
		for v1, v2 in t.ItemTypes do
			sum = sum + v2.UniqueOwnedValue.Value
		end
		t.UniqueOwnedValue.Value = sum
		t.UniqueOwned = sum
	end
	local function getOrTrackItemType(p12) --[[ getOrTrackItemType | Line: 410 | Upvalues: t (copy), p1 (copy) ]]
		local v1 = t.ItemTypes[p12]
		if not v1 then
			local t2 = {
				TotalOwnedValue = Instance.new("IntValue"),
				UniqueOwnedValue = Instance.new("IntValue"),
				Items = {}
			}
			t.ItemTypes[p12] = t2
			p1:_getTotalOwnedValueAddedSignal(p12):Fire(t2.TotalOwnedValue)
			p1:_getUniqueOwnedValueAddedSignal(p12):Fire(t2.UniqueOwnedValue)
			v1 = t2
		end
		return v1
	end
	local function setTotalOwnedInItemType(p12) --[[ setTotalOwnedInItemType | Line: 431 | Upvalues: getOrTrackItemType (copy), p1 (copy), t (copy), p2 (copy) ]]
		local v1 = getOrTrackItemType(p12)
		local sum = 0
		for v2, v3 in v1.Items do
			sum = sum + v3.TotalOwnedValue.Value
		end
		v1.TotalOwnedValue.Value = sum
		v1.TotalOwned = sum
		local v4 = p1:_getItemLimitHandlers(p12)
		if v4 then
			v4.ChangedSignal:Fire()
		end
		local sum_2 = 0
		for v5, v6 in t.ItemTypes do
			sum_2 = sum_2 + v6.TotalOwnedValue.Value
		end
		t.TotalOwnedValue.Value = sum_2
		t.TotalOwned = sum_2
		local v7 = p1:_getItemLimitHandlers(p2)
		if not v7 then
			return
		end
		v7.ChangedSignal:Fire()
	end
	local function setUniqueOwnedInItemType(p1) --[[ setUniqueOwnedInItemType | Line: 449 | Upvalues: getOrTrackItemType (copy), t (copy) ]]
		local v1 = getOrTrackItemType(p1)
		local count = 0
		for v2, v3 in v1.Items do
			if v3.TotalOwnedValue.Value > 0 then
				count = count + 1
			end
		end
		v1.UniqueOwnedValue.Value = count
		v1.UniqueOwned = count
		local sum = 0
		for v4, v5 in t.ItemTypes do
			sum = sum + v5.UniqueOwnedValue.Value
		end
		t.UniqueOwnedValue.Value = sum
		t.UniqueOwned = sum
	end
	local function getOrTrackItem(p12, p2) --[[ getOrTrackItem | Line: 466 | Upvalues: v1 (ref), getOrTrackItemType (copy), p1 (copy) ]]
		local v12 = getOrTrackItemType(v1.GetItemType(p12).Name)
		local v2 = v12.Items[p12]
		if not v2 then
			local t = {}
			t.TotalOwnedValue = if v1.IsItemStackable(p2) and p2 then p2 else Instance.new("IntValue")
			t.Stackable = v1.IsItemStackable(p2)
			t.Values = {}
			v12.Items[p12] = t
			p1:_getTotalOwnedValueAddedSignal(p12):Fire(t.TotalOwnedValue)
			p1:_getUniqueOwnedValueAddedSignal(p12):Fire(t.TotalOwnedValue)
			v2 = t
		end
		return v2, v12
	end
	local function removeItem(p12) --[[ removeItem | Line: 487 | Upvalues: p1 (copy), getOrTrackItem (copy), v1 (ref), setTotalOwnedInItemType (copy), setUniqueOwnedInItemType (copy) ]]
		local v12 = p1:GetItemNameByValue(p12)
		local v2 = p1:GetItemDataByValue(p12)
		if v12 and v2 then
			local v3 = getOrTrackItem(v12, p12)
			if not v3 then
				return
			end
			if v3.Values[p12] then
				v3.Values[p12] = nil
				if v1.IsItemStackable(p12) then
					v3.TotalOwnedValue.Value = math.max(0, v3.TotalOwnedValue.Value - p12.Value)
				else
					v3.TotalOwnedValue.Value = math.max(0, v3.TotalOwnedValue.Value - 1)
				end
				v3.TotalOwned = v3.TotalOwnedValue.Value
			end
			setTotalOwnedInItemType(v2.ItemType.Name)
			setUniqueOwnedInItemType(v2.ItemType.Name)
		else
			warn("\226\154\160\239\184\143 ItemsWrapper, removeItem, Item data not found for", p12, p12:IsA("ValueBase") and p12.Value)
		end
	end
	local function addItem(p12, p2) --[[ addItem | Line: 521 | Upvalues: p1 (copy), getOrTrackItem (copy), v1 (ref), removeItem (copy), setTotalOwnedInItemType (copy), setUniqueOwnedInItemType (copy) ]]
		if p2 then
			task.wait()
		end
		local v12 = p1:GetItemNameByValue(p12)
		if v12 then
			local v2 = p1:GetItemDataByValue(p12)
			if v12 and v2 then
				local v3 = getOrTrackItem(v12, p12)
				local v4 = v1.IsItemStackable(p12)
				p12.Destroying:Once(function() --[[ Line: 540 | Upvalues: p1 (ref), removeItem (ref), p12 (copy) ]]
					if p1.PlayerWrapper._inGame and not p1.PlayerWrapper._removingFromGame then
						removeItem(p12)
					end
				end)
				local function addValue() --[[ addValue | Line: 549 | Upvalues: v3 (copy), p12 (copy), v4 (copy), setTotalOwnedInItemType (ref), v2 (copy), setUniqueOwnedInItemType (ref) ]]
					if v3.Values[p12] then
						if not v4 then
							v3.TotalOwned = v3.TotalOwnedValue.Value
							setTotalOwnedInItemType(v2.ItemType.Name)
							setUniqueOwnedInItemType(v2.ItemType.Name)
							return
						end
						v3.TotalOwnedValue.Value = p12.Value
					else
						v3.Values[p12] = true
						if v4 then
							v3.TotalOwnedValue.Value = p12.Value
						else
							local TotalOwnedValue = v3.TotalOwnedValue
							TotalOwnedValue.Value = TotalOwnedValue.Value + 1
						end
					end
					v3.TotalOwned = v3.TotalOwnedValue.Value
					setTotalOwnedInItemType(v2.ItemType.Name)
					setUniqueOwnedInItemType(v2.ItemType.Name)
				end
				if p12:IsA("IntValue") or p12:IsA("NumberValue") then
					p12:GetPropertyChangedSignal("Value"):Connect(addValue)
				end
				addValue()
			else
				warn("\226\154\160\239\184\143 ItemsWrapper, addItem, Item data not found for", p12, p12:IsA("ValueBase") and p12.Value)
			end
		else
			warn("\226\154\160\239\184\143 ItemsWrapper, addItem, Item name not found for", p12, p12:IsA("ValueBase") and p12.Value)
		end
	end
	p1.Maid:GiveTask(p3.ChildAdded:Connect(addItem))
	for k, v in pairs(p3:GetChildren()) do
		addItem(v, true)
	end
	local v12 = p1.ItemValuesByFolder[p2]
	if not v12 then
		return
	end
	for v2, v3 in v12 do
		addItem(v3, true)
	end
end
function t.GetTotalOwnedValue(p1, p2) --[[ GetTotalOwnedValue | Line: 592 ]]
	local v1 = p1.TrackedItemFolderAmounts[p2]
	if v1 then
		return v1.TotalOwnedValue
	end
	for v2, v3 in p1.TrackedItemFolderAmounts do
		local v4 = v3.ItemTypes[p2]
		if v4 then
			return v4.TotalOwnedValue
		end
		for v5, v6 in v3.ItemTypes do
			local v7 = v6.Items[p2]
			if v7 then
				return v7.TotalOwnedValue
			end
		end
	end
	return nil
end
function t.GetTotalOwnedAmount(p1, p2) --[[ GetTotalOwnedAmount | Line: 618 ]]
	local v1 = p1:GetTotalOwnedValue(p2)
	if v1 then
		return v1.Value
	else
		return 0
	end
end
function t.GetTotalOwnedChangedSignal(p1, p2) --[[ GetTotalOwnedChangedSignal | Line: 627 | Upvalues: v3 (copy) ]]
	local v1 = v3.new()
	local function totalValueAdded(p1) --[[ totalValueAdded | Line: 630 | Upvalues: v1 (copy) ]]
		if p1 then
			v1:GiveTask(p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 635 | Upvalues: v1 (ref), p1 (copy) ]]
				v1:Fire(p1.Value)
			end))
			v1:Fire(p1.Value)
		end
	end
	local v2 = p1:GetTotalOwnedValue(p2)
	if v2 then
		totalValueAdded(v2)
	else
		v1:GiveTask(p1:_getTotalOwnedValueAddedSignal(p2):Connect(function(p1) --[[ Line: 645 | Upvalues: totalValueAdded (copy) ]]
			totalValueAdded(p1)
		end))
	end
	return v1
end
function t.GetUniqueOwnedValue(p1, p2) --[[ GetUniqueOwnedValue | Line: 653 ]]
	local v1 = p1.TrackedItemFolderAmounts[p2]
	if v1 then
		return v1.UniqueOwnedValue
	end
	for v2, v3 in p1.TrackedItemFolderAmounts do
		local v4 = v3.ItemTypes[p2]
		if v4 then
			return v4.UniqueOwnedValue
		end
		for v5, v6 in v3.ItemTypes do
			local v7 = v6.Items[p2]
			if v7 then
				return v7.TotalOwnedValue
			end
		end
	end
	return nil
end
function t.GetUniqueOwnedAmount(p1, p2) --[[ GetUniqueOwnedAmount | Line: 676 ]]
	if type(p2) == "table" then
		local sum = 0
		for v1, v2 in p2 do
			sum = sum + p1:GetUniqueOwnedAmount(v2)
		end
		return sum
	else
		local v3 = p1:GetUniqueOwnedValue(p2)
		if v3 then
			return v3.Value
		else
			return 0
		end
	end
end
function t.GetUniqueOwnedChangedSignal(p1, p2) --[[ GetUniqueOwnedChangedSignal | Line: 693 | Upvalues: v3 (copy) ]]
	if type(p2) == "table" then
		local v1 = v3.new()
		for v2, v32 in p2 do
			v1:GiveTask(p1:GetUniqueOwnedChangedSignal(v32):Connect(function() --[[ Line: 699 | Upvalues: v1 (copy), p1 (copy), p2 (copy) ]]
				v1:Fire(p1:GetUniqueOwnedAmount(p2))
			end))
		end
		return v1
	else
		local v4 = v3.new()
		local function uniqueValueAdded(p1) --[[ uniqueValueAdded | Line: 709 | Upvalues: v4 (copy) ]]
			if p1 then
				v4:GiveTask(p1:GetPropertyChangedSignal("Value"):Connect(function() --[[ Line: 714 | Upvalues: v4 (ref), p1 (copy) ]]
					v4:Fire(p1.Value)
				end))
				v4:Fire(p1.Value)
			end
		end
		local v5 = p1:GetUniqueOwnedValue(p2)
		if v5 then
			uniqueValueAdded(v5)
		else
			v4:GiveTask(p1:_getUniqueOwnedValueAddedSignal(p2):Connect(function(p1) --[[ Line: 724 | Upvalues: uniqueValueAdded (copy) ]]
				uniqueValueAdded(p1)
			end))
		end
		return v4
	end
end
function t._applyAmountModifiers(p1, p2, p3, p4) --[[ _applyAmountModifiers | Line: 732 | Upvalues: v1 (copy) ]]
	if p2.Modifiers then
		local v12 = p1.PlayerWrapper:GetWithModifiers("Item_" .. p3.Name .. "Multiplier")
		if v12 then
			p4 = p4 * v12
		end
		local v2 = v1.GetItemType(p3.Name)
		if v2 then
			local v3 = p1.PlayerWrapper:GetWithModifiers("Item_" .. v2.Name .. "Multiplier")
			if v3 then
				p4 = p4 * v3
			end
		end
	end
	return math.ceil(p4 or 1)
end
function t._handleOverItemLimit(p1, p2, p3) --[[ _handleOverItemLimit | Line: 751 | Upvalues: OverItemLimitHandlers (copy), v10 (copy), v5 (copy) ]]
	local v1 = nil
	local v2 = p2.IfOverLimit and OverItemLimitHandlers[p2.IfOverLimit]
	if v2 then
		v1 = v2(p1.PlayerWrapper, p2, p3)
	end
	if v1 ~= true then
		v1 = string.format(v10.OverItemLimitHandlers.Default, p3.Type)
	end
	if type(v1) == "string" then
		v5.Notify(p1.Player, v1)
	end
	return v1
end
function t._handleItemActions(p1, p2, p3) --[[ _handleItemActions | Line: 773 | Upvalues: v6 (copy), ItemActionPresets (copy), ItemActionHandlers (copy) ]]
	local v1 = p3 and v6.DeepCopy(p3) or {}
	local v2, v3
	if typeof(v1.Preset) == "table" then
		v2 = v1.Preset
		v3 = v1
		if not v2 then
			v2 = { v1.Preset }
		end
	else
		v3 = v1
		v2 = { v1.Preset }
	end
	for i, v in ipairs(v2) do
		local v4 = ItemActionPresets[v]
		if v4 then
			v6.MergeOriginal(v3, v4, true)
			continue
		end
		warn("\226\154\160\239\184\143 ItemsWrapper, Invalid ItemActionPreset:", v)
	end
	v6.MergeOriginal(v3, ItemActionPresets.Default, true)
	v3.Preset = nil
	for v5, v62 in v3 do
		local v7 = ItemActionHandlers[v5]
		if v7 then
			local v8 = v7(p1.PlayerWrapper, p2, v62)
			if v8 and type(v8) == "table" then
				for v9, v10 in v8 do
					if p2[v9] == nil then
						p2[v9] = v10
						continue
					end
					warn("\226\154\160\239\184\143 ItemsWrapper, Action handler", v5, "is trying to add", v9, "to the result info, but it already exists", p2[v9], p2)
				end
			end
			continue
		end
		warn("\226\154\160\239\184\143 ItemsWrapper, Invalid ItemActionHandler:", v5)
	end
	return p2
end
function t._handleItemData(p1, p2, p3) --[[ _handleItemData | Line: 815 | Upvalues: ItemDataHandlers (copy) ]]
	for v1, v2 in ItemDataHandlers do
		if p2[v1] ~= nil then
			p2[v1] = v2(p1.PlayerWrapper, p2, p3)
		end
	end
	return p2
end
function t._handleItemStream(p1, p2, p3, p4) --[[ _handleItemStream | Line: 832 | Upvalues: ItemStreamHandlers (copy) ]]
	if p3 == false then
		return false
	end
	local v1 = ItemStreamHandlers[p3]
	local v2 = if v1 then v1(p1.PlayerWrapper, p2, p3, p4) else p3
	if type(v2) == "function" then
		v2 = v2(p2)
	else
		local _ = type(p3) == "string"
	end
	if v2 == true then
		v2 = nil
	end
	return v2
end
function t._getItemLimitHandlers(p1, p2) --[[ _getItemLimitHandlers | Line: 872 | Upvalues: v1 (copy) ]]
	local v12 = p1.ItemLimitsByData[p2]
	if not v12 then
		local v2 = v1.GetItemType(p2)
		if v2 then
			v12 = p1.ItemLimitsByData[v2.Name]
			if not v12 then
				local v3 = p1:GetItemFolder(v2.Name)
				if v3 then
					v12 = p1.ItemLimitsByData[v3]
				end
			end
		end
	end
	if v12 then
		return v12, v12.Type
	end
end
function t.GetItemValue(p1, p2, p3) --[[ GetItemValue | Line: 911 ]]
	if not p2 or p2 == "" then
		return
	end
	local v2, v3, v4, v5 = nil, nil, if p3 then p3 else {}, nil
	for v6, v7 in p1.ItemFolders do
		local v8 = p1.ItemValuesByFolder[v6]
		if v8 then
			local v9 = v8[p2]
			if v9 then
				v2 = v9
				v3 = v7
				v5 = v6
				break
			end
		end
		local v10 = v7:FindFirstChild(p2)
		if v10 then
			v2 = v10
			v3 = v7
			v5 = v6
			break
		end
	end
	if not (v2 and v3) then
		return
	end
	if v4.FoldersToSearch and not (table.find(v4.FoldersToSearch, v3) or table.find(v4.FoldersToSearch, v5)) then
		return
	end
	if v4.ItemsToSearch and not table.find(v4.ItemsToSearch, (p1:GetItemNameByValue(v2))) then
		return
	end
	if v4.ItemTypesToSearch then
		local v12 = p1:GetItemDataByValue(v2)
		local v13 = if v12 then v12.ItemType else v12
		if not (v13 and table.find(v4.ItemTypesToSearch, v13.Name)) then
			return
		end
	end
	return v2
end
function t.FindFirstItemValueByName(p1, p2, p3) --[[ FindFirstItemValueByName | Line: 981 ]]
	if not p2 or p2 == "" then
		return
	end
	local v2 = if p3 then p3 else {}
	for v3, v4 in p1.TrackedItemFolderAmounts do
		if not v2.FoldersToSearch or table.find(v2.FoldersToSearch, v3) then
			for v5, v6 in v4.ItemTypes do
				if not v2.ItemTypesToSearch or table.find(v2.ItemTypesToSearch, v5) then
					local v7 = v6.Items[p2]
					if v7 and (not v2.ItemsToSearch or table.find(v2.ItemsToSearch, p2)) then
						for v8 in v7.Values do
							return v8
						end
					end
				end
			end
		end
	end
	return nil
end
function t.GetAllItemValuesByName(p1, p2, p3) --[[ GetAllItemValuesByName | Line: 1015 ]]
	if not p2 or p2 == "" then
		return {}
	end
	local v2, v3 = if p3 then p3 else {}, {}
	for v4, v5 in p1.TrackedItemFolderAmounts do
		if not v2.FoldersToSearch or table.find(v2.FoldersToSearch, v4) then
			for v6, v7 in v5.ItemTypes do
				if not v2.ItemTypesToSearch or table.find(v2.ItemTypesToSearch, v6) then
					local v8 = v7.Items[p2]
					if v8 and (not v2.ItemsToSearch or table.find(v2.ItemsToSearch, p2)) then
						for v9 in v8.Values do
							v3[#v3 + 1] = v9
						end
					end
				end
			end
		end
	end
	return v3
end
function t.WaitForItemValue(p1, p2, p3) --[[ WaitForItemValue | Line: 1050 ]]
	local v1 = os.clock()
	local v2 = p1:GetItemValue(p2)
	if not v2 then
		local v3
		repeat
			task.wait()
			v3 = p1:GetItemValue(p2)
		until v3 or p3 and p3 < os.clock() - v1
		v2 = v3
	end
	return v2
end
function t.GetItemFolder(p1, p2) --[[ GetItemFolder | Line: 1074 | Upvalues: ItemTypeToItemFoldersMap (copy) ]]
	local v1 = p1.ItemFolders[p2]
	local v2
	if v1 then
		v2 = p2
	else
		local v3 = ItemTypeToItemFoldersMap[p2] or ItemTypeToItemFoldersMap.Default
		if v3 then
			v1 = p1.ItemFolders[v3]
			v2 = v3
		else
			v2 = p2
		end
	end
	return v1, v2
end
function t.HasRequiredItemAmount(p1, p2, p3) --[[ HasRequiredItemAmount | Line: 1089 | Upvalues: v1 (copy) ]]
	local v12 = p1:GetItemValue(p2)
	if v12 and v1.IsItemStackable(v12) then
		if v12.Value < p3 then
			return false
		end
	elseif p1:GetTotalOwnedAmount(p2) < p3 then
		return false
	end
	return true
end
function t.GetItemAmountToUse(p1, p2, p3) --[[ GetItemAmountToUse | Line: 1107 | Upvalues: v1 (copy) ]]
	local v2 = p1:GetItemValue(p2)
	if not v2 then
		return 0
	end
	local v3 = if v1.IsItemStackable(v2) then math.clamp(p3 or 1, 0, v2.Value) else 1
	if v3 <= 0 then
		return 0
	else
		return v3
	end
end
function t.CanGiveItem(p1, p2, p3, ...) --[[ CanGiveItem | Line: 1142 ]]
	local v2 = p1:GetItemLimit(p2, ...)
	if not v2 then
		return true
	end
	return (p3 or 1) <= v2.AmountLeft, v2
end
function t.IsOverItemLimit(p1, p2, p3) --[[ IsOverItemLimit | Line: 1153 | Upvalues: v10 (copy), v12 (copy), v5 (copy) ]]
	local v1 = if p3 then p3 else {}
	local v2 = p1:GetItemLimit(p2, v1)
	if not v2 then
		return true
	end
	local v3 = v2.AmountLeft <= 0
	if v3 and v1.Notify then
		local v4 = string.format(v10.OverItemLimitHandlers.Default, p2)
		if v12 then
			v5.Notify(p1.Player, v4)
		else
			local t = {
				Response = v4
			}
			t.Args = if type(v1.Notify) == "table" then v1.Notify or {} else {}
			v5.Notify(t)
		end
	end
	return v3, v2
end
function t.GetItemLimit(p1, p2) --[[ GetItemLimit | Line: 1191 ]]
	local v1, v2 = p1:_getItemLimitHandlers(p2)
	if v1 then
		local v3 = v1.GetAmount(p1, v1)
		local v4 = v1.GetLimit(p1, v1)
		local v5 = v4 - v3
		return {
			Limit = v4,
			Amount = v3,
			AmountLeft = math.max(0, v5),
			AmountOverLimit = v5,
			Type = v2
		}
	end
end
function t.GetItemsChangedSignal(p1, p2) --[[ GetItemsChangedSignal | Line: 1211 ]]
	local v1 = p1:_getItemLimitHandlers(p2)
	if v1 then
		return v1.ChangedSignal
	end
end
function t.CanGiveItems(p1, p2) --[[ CanGiveItems | Line: 1220 ]]
	local t = {}
	local t2 = {}
	for v1, v2 in p2 do
		local v3, v4 = p1:_getItemLimitHandlers(v2.Name)
		if v3 then
			local v5 = t[v4]
			if not v5 then
				local v6 = p1:GetItemLimit(v4)
				t[v4] = v6
				t2[v4] = v6.AmountLeft
				v5 = v6
			end
			local v7 = t2[v4] - v2.Amount
			if v7 < 0 then
				return false, v5
			end
			t2[v4] = v7
		end
	end
	return true
end
function t.GiveItems(p1, p2) --[[ GiveItems | Line: 1254 ]]
	local t = {}
	for v2, v3 in p2.Items do
		local v1
		v1 = if type(v3) == "table" and v3 then v3 else {}
		v1.Name = v1.Name or v2
		v1.Amount = v1.Amount or v3
		v1.Amount = p1:_applyAmountModifiers(p2, v1, v1.Amount)
		t[#t + 1] = v1
	end
	p2.Items = t
	if not p2.IgnoreLimit then
		local v4, v5 = p1:CanGiveItems(t)
		if not v4 then
			if p2.IfOverLimit == false then
				return
			end
			p1:_handleOverItemLimit(p2, v5)
			return
		end
	end
	local t2 = {}
	for v6, v7 in p2.Items do
		local t3 = {
			Item = v7,
			IfOverLimit = false,
			IgnoreLimit = true,
			Modifiers = false
		}
		t3.AnalyticsSource = v7.AnalyticsSource or p2.AnalyticsSource
		v7.AnalyticsSource = nil
		for v9, v10 in p2 do
			if v9 ~= "Items" and t3[v9] == nil then
				t3[v9] = v10
			end
		end
		t3.ItemStream = p2.ItemStream and false
		local _, v11 = p1:GiveItem(t3)
		if v11 then
			for v12, v13 in v11 do
				t2[#t2 + 1] = v13
			end
		end
	end
	if p2.ItemStream then
		p1:AddItemStream({
			Batch = true,
			Items = t2,
			ItemStream = p1:_handleItemStream(t2, p2.ItemStream, true)
		})
	end
	return t2
end
function t.GiveItem(p1, p2) --[[ GiveItem | Line: 1350 | Upvalues: v1 (copy), ItemHandlers (copy), v9 (copy) ]]
	local Item = p2.Item
	if not Item then
		warn("\226\154\160\239\184\143 ItemsWrapper, Item must be provided to GiveItem", p2)
		return
	end
	if not Item.Name then
		warn("\226\154\160\239\184\143 ItemsWrapper, Item must have a Name to be given", Item, p2)
		return
	end
	local v12 = p1:_handleItemData(Item, p2)
	v12.Amount = p1:_applyAmountModifiers(p2, v12, v12.Amount)
	if not p2.IgnoreLimit then
		local v2, v3 = p1:CanGiveItem(v12.Name, v12.Amount)
		if not v2 then
			if p2.IfOverLimit == false then
				return
			end
			p1:_handleOverItemLimit(p2, v3)
			return
		end
	end
	local v4 = v1.GetItemType(v12.Name) or {}
	if not next(v4) then
		warn("\226\154\160\239\184\143 ItemsWrapper, GiveItem, No item type found for", v12.Name, p2)
	end
	local v5 = ItemHandlers[v12.Name] or (ItemHandlers[v4.Name] or ItemHandlers.Default)
	if not v5 then
		warn("\226\154\160\239\184\143 ItemsWrapper, GiveItem, No item handler found for", v12.Name, p2)
		return
	end
	local v6 = v1.GetItemNameWithVariation(v12.Name, v12.Variation)
	local v7 = p1:GetItemValue(v6)
	local t = {}
	for i = 1, v12.Amount do
		local v8
		local v92, v10 = pcall(function() --[[ Line: 1399 | Upvalues: v5 (copy), p1 (copy), v12 (ref), p2 (copy) ]]
			return v5(p1, v12, p2)
		end)
		if v92 then
			v8 = type(v10) == "table" and (v10.Value or v10.DataValue) or (if typeof(v10) == "Instance" and v10 then v10 elseif v7 then v7 else p1:GetItemValue(v6))
			if v8 then
				local v11 = v1.IsItemStackable(v8)
				if type(v10) ~= "table" then
					local t2 = {}
					t2.Amount = if type(v10) == "number" and v10 then v10 else v11 and v12.Amount or 1
					t2.Value = v8
					t2.Name = v11 and v8.Name or v12.Name
					t2.Variation = v12.Variation
					t2.Item = v12
					v10 = t2
				end
				if type(p2.OnSuccess) == "function" then
					p2.OnSuccess(v10)
				end
				local v14 = p1:_handleItemActions(v10, p2.Actions)
				v14.ItemStream = p1:_handleItemStream(v14, p2.ItemStream)
				if p2.Analytics ~= false and p2.AnalyticsSource ~= false then
					local t2 = {
						FlowType = "Source",
						Amount = v14.Amount,
						Currency = v14.Item.Name,
						Variation = v12.Variation
					}
					t2.SourceLocation = p2.AnalyticsSource or p2.Analytics
					p1:_postItemAnalytics(t2)
				end
				local v16 = v14
				t[#t + 1] = v16
				p1.ItemAddedSignal:Fire(v16)
				if type(v16.ItemStream) == "string" or v16.ItemStream == nil then
					p1:AddItemStream(v16)
				end
				if v9.IS_STUDIO then
					print("\240\159\148\183 ItemsWrapper, Giving item", v16.Name, v16.Amount, v16)
				end
				if v11 then
					break
				end
			else
				warn("\226\154\160\239\184\143 ItemsWrapper, GiveItem, No data value found for", v12.Name, p2.Source or p2.AnalyticsSource, p2, v10)
				return
			end
		else
			warn("\226\154\160\239\184\143 ItemsWrapper, GiveItem, Error calling item handler for", v12.Name, p2.Source or p2.AnalyticsSource, p2, v10)
			return
		end
	end
	return t[1], t
end
function t.RemoveItem(p1, p2) --[[ RemoveItem | Line: 1502 | Upvalues: v1 (copy) ]]
	local v12 = p2.Value or p1:GetItemValue(p2.Name)
	if not v12 then
		warn("\226\154\160\239\184\143 ItemsWrapper, RemoveItem, Item value not found for", p2.Name, p2)
		return
	end
	local v2 = false
	local v3 = v1.GetByDataValue(v12)
	local v4
	if v1.IsItemStackable(v12) then
		local v7 = math.clamp(0, p2.Amount or 1, v12.Value)
		v12.Value = v12.Value - v7
		if v12.Value <= 0 and v3.ItemType.DestroyWhenValueIsZero ~= false then
			v12:Destroy()
			v4 = v7
			v2 = true
		else
			v4 = v7
		end
	else
		v12:Destroy()
		v4 = 1
		v2 = true
	end
	if p2.Analytics ~= false and p2.AnalyticsSource ~= false then
		local t = {
			FlowType = "Sink",
			Amount = v4,
			Currency = v3.Name
		}
		t.SourceLocation = p2.AnalyticsSource or p2.Analytics
		t.ItemPurchased = p2.ItemPurchased
		p1:_postItemAnalytics(t)
	end
	return {
		Amount = v4,
		Value = v12,
		Destroyed = v2
	}
end
function t.ReturnItem(p1, p2) --[[ ReturnItem | Line: 1546 ]] end
function t.AddItemStream(p1, p2) --[[ AddItemStream | Line: 1554 | Upvalues: v11 (copy), HttpService (copy) ]]
	local v1, v2
	if p2.Batch == true then
		p1._batchId = p1._batchId + 1
		local t = {}
		for v3, v4 in p2.Items do
			t[v3] = { p1:_getItemStreamIdentifier(v4), v4.Amount }
		end
		v1 = p1:_getItemStreamIdentifier({
			Name = v11.BatchPrefixString,
			Id = p1._batchId,
			ItemStream = p2.ItemStream
		})
		v2 = HttpService:JSONEncode(t)
	else
		local v5 = p1:_getItemStreamIdentifier(p2)
		if not p1._itemStreamIds[v5] then
			p1._itemStreamIds[v5] = 0
		end
		local v6 = p1._itemStreamIds[v5] + 1
		p1._itemStreamIds[v5] = v6
		v2 = v6 .. "_" .. p2.Amount
		v1 = v5
	end
	p1.ItemStreamReplication:SetAttribute(v1, v2)
	task.delay(v11.ItemStreamAttributeClearDelay, function() --[[ Line: 1593 | Upvalues: p1 (copy), v1 (ref), v2 (ref) ]]
		if not p1.ItemStreamReplication then
			return
		end
		if p1.ItemStreamReplication:GetAttribute(v1) == v2 then
			p1.ItemStreamReplication:SetAttribute(v1, nil)
		end
	end)
end
function t.Init(p1) --[[ Init | Line: 1605 | Upvalues: ItemTypeToItemFoldersMap (copy), v1 (copy), v8 (copy), v10 (copy) ]]
	local v12 = false
	for v2, v3 in ItemTypeToItemFoldersMap do
		if v2 == "Default" then
			v12 = true
			continue
		end
		if not v1.GetType(v2) then
			warn("\226\154\160\239\184\143 ItemsWrapper, Item type not found for item folder map", v2)
		end
	end
	if v12 then
		v8.bindToPlayers({
			AfterInit = function(p1_2, p2_2) --[[ AfterInit | Line: 1623 | Upvalues: v10 (ref) ]]
				if not p2_2.PlayerData then
					return
				end
				if not v10.Init then
					return
				end
				v10.Init(p2_2)
			end
		})
		return
	end
	warn("\226\154\160\239\184\143 ItemsWrapper, Default item folder not found in map, add it to ItemsWrapperConfig.ItemTypeToItemFoldersMap")
	v8.bindToPlayers({
		AfterInit = function(p1_2, p2_2) --[[ AfterInit | Line: 1623 | Upvalues: v10 (ref) ]]
			if not p2_2.PlayerData then
				return
			end
			if not v10.Init then
				return
			end
			v10.Init(p2_2)
		end
	})
end
t:Init()
return t