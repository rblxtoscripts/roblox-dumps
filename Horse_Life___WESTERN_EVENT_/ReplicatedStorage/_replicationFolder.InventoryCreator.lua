-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("EventUtils")
local v5 = Sonar("PlayerWrapper")
local v6 = Sonar("TableUtils")
local v7 = Sonar("Signal")
local v8 = Sonar("ItemDataService")
function t.new(p1) --[[ new | Line: 18 | Upvalues: t (copy), v2 (copy), v5 (copy), v7 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22.PlayerWrapper = p1.PlayerWrapper or v5.GetClient()
	v22.LayoutSort = p1.LayoutSort
	v22.TabNavigator = p1.TabNavigator
	if not (v22.Config.Items or v22.Config.ItemFolders) then
		warn("\226\154\160\239\184\143 InventoryCreator, No items or item folders provided", v22.Config)
	end
	v22.GuiObjectsChangedSignal = v22.Maid:GiveTask(v7.new())
	v22.CreatedObjects = {}
	v22.ItemValueToGuiObject = {}
	v22.Stacks = {}
	v22.ItemValueToStackKey = {}
	v22.BlankSlots = {}
	v22.BlankSlotsCount = v22.Config.BlankGuiObjects or nil
	v22._blankSlotsByParent = {}
	v22.Maid:GiveTask(function() --[[ Line: 45 | Upvalues: v22 (copy) ]]
		v22._cleaningMaid = true
		for v1, v2 in v22.CreatedObjects do
			v2:Destroy()
		end
		for v3, v4 in v22.Stacks do
			if v4.CountChangedSignal and v4.CountChangedSignal.Destroy then
				v4.CountChangedSignal:Destroy()
			end
			for v5, v6 in v4.MetadataMaids do
				if v6 and v6.DoCleaning then
					v6:DoCleaning()
				end
			end
			v22.Stacks[v3] = nil
		end
		for v7, v8 in v22._blankSlotsByParent do
			for v9, v10 in v8 do
				if v10 and v10.Destroy then
					v10:Destroy()
				end
			end
		end
	end)
	if v22.Config.Init ~= false then
		v22:Init()
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 77 | Upvalues: v3 (copy) ]]
	v3(p1)
	p1._cleaningMaid = nil
end
function t._initSort(p1, p2) --[[ _initSort | Line: 82 ]]
	if not p1.LayoutSort then
		return
	end
	if p2 and p1.LayoutSort:_getFilter(p2.Name) then
		p1.LayoutSort:Filter(p2.Name)
	else
		p1.LayoutSort:UpdateVisibleGrid()
	end
	if p1.InitialisedSort then
		return
	end
	p1.InitialisedSort = true
	p1.LayoutSort:Sort(p1.LayoutSort.Config.DefaultSort or "Alphabet")
end
function t._getTabsItemIsIn(p1, p2) --[[ _getTabsItemIsIn | Line: 101 ]]
	local t = {}
	for v1, v2 in p1.TabNavigator:GetTabs() do
		if v2.Config.DisplayAll then
			table.insert(t, v1)
		end
		if v2.Config.Filter and v2.Config.Filter(p2, v2) then
			table.insert(t, v1)
		end
		if v2.Config.ItemTypes and table.find(v2.Config.ItemTypes, p2.ItemType.Name) then
			table.insert(t, v1)
		end
	end
	return t
end
function t._getParentInstance(p1, p2) --[[ _getParentInstance | Line: 119 | Upvalues: v1 (copy) ]]
	local v12
	if p2 then
		local v2 = p2.Instance and (p2.Instance:FindFirstChildOfClass("UIGridLayout") and p2.Instance or p2.Instance:FindFirstChild("UIGridFrame"))
		v12 = v2 or v1.FindElement(p2.Instance, "ScrollingFrame")
		if not v12 then
			v12 = v1.FindElement(p1.TabNavigator.Instance, "GridFrame")
		end
	else
		v12 = nil
	end
	if not v12 then
		v12 = v1.FindElement(p1.Instance, "GridFrame") or p1.Instance
	end
	return v12
end
function t.GetReserveTotal(p1) --[[ GetReserveTotal | Line: 140 ]]
	return math.max(0, p1.Config.ReserveTotal or 0)
end
function t._passesReserveCheck(p1, p2) --[[ _passesReserveCheck | Line: 144 | Upvalues: v8 (copy) ]]
	local v1 = p1:GetReserveTotal()
	if v1 <= 0 then
		return true
	end
	if not (p2 and v8.IsItemStackable(p2)) then
		return true
	end
	return v1 < p2.Value
end
function t._canBuildGuiObject(p1, p2, p3, ...) --[[ _canBuildGuiObject | Line: 155 ]]
	if p1.Config.ItemTypes and not table.find(p1.Config.ItemTypes, p3.ItemType.Name) then
		return
	end
	if p1.Config.CanCreate and not p1.Config.CanCreate(p2, p3, ...) then
		return false
	end
	return p1:_passesReserveCheck(p2) and true or false
end
function t._getStackKey(p1, p2, p3) --[[ _getStackKey | Line: 175 | Upvalues: v8 (copy) ]]
	if not p1.Config.StackBy then
		return nil
	end
	if v8.IsItemStackable(p2) then
		return nil
	end
	local v1 = p1.Config.StackBy(p2, p3)
	if v1 == nil or v1 == "" then
		return nil
	else
		return tostring(v1)
	end
end
function t._ensureStack(p1, p2) --[[ _ensureStack | Line: 189 | Upvalues: v7 (copy) ]]
	local v1 = p1.Stacks[p2]
	if v1 then
		return v1
	else
		local t = {
			GuiObject = nil,
			RootDataValue = nil,
			Count = 0,
			_buildScheduled = false,
			Key = p2,
			Members = {},
			MemberInfo = {},
			MetadataMaids = {},
			CountChangedSignal = v7.new()
		}
		p1.Stacks[p2] = t
		return t
	end
end
function t._destroyStack(p1, p2) --[[ _destroyStack | Line: 209 ]]
	local v1 = p1.Stacks[p2]
	if not v1 then
		return
	end
	p1.Stacks[p2] = nil
	p1.CreatedObjects[p2] = nil
	for v2 in v1.Members do
		local v3 = v1.MetadataMaids[v2]
		if v3 then
			v3:DoCleaning()
		end
		p1.ItemValueToStackKey[v2] = nil
		p1.ItemValueToGuiObject[v2] = nil
	end
	if not (v1.CountChangedSignal and v1.CountChangedSignal.Destroy) then
		return
	end
	v1.CountChangedSignal:Destroy()
end
function t._watchMemberMetadata(p1, p2, p3) --[[ _watchMemberMetadata | Line: 232 | Upvalues: v2 (copy) ]]
	local v1 = p2.MetadataMaids[p3] or v2.new()
	p2.MetadataMaids[p3] = v1
	local function handleChange() --[[ handleChange | Line: 236 | Upvalues: p1 (copy), p3 (copy), p2 (copy) ]]
		local v1 = p1.ItemValueToStackKey[p3]
		if not v1 then
			return
		end
		local v2, v3 = p1.PlayerWrapper:GetItemDataByValue(p3)
		if not v2 then
			return
		end
		if p1:_getStackKey(p3, v2) == v1 then
			return
		end
		local v4 = p2.MemberInfo[p3]
		local v5 = if v4 then v4.Tab else v4
		p1:_removeItemFromStack(p3)
		p1:_routeItemValue(p3, v2, v3, v5, false)
	end
	v1:GiveTask(p3.ChildAdded:Connect(function(p1) --[[ Line: 257 | Upvalues: v1 (copy), handleChange (copy) ]]
		if p1:IsA("ValueBase") then
			v1:GiveTask(p1:GetPropertyChangedSignal("Value"):Connect(handleChange))
		end
		handleChange()
	end))
	v1:GiveTask(p3.ChildRemoved:Connect(handleChange))
	for v22, v3 in p3:GetChildren() do
		if v3:IsA("ValueBase") then
			v1:GiveTask(v3:GetPropertyChangedSignal("Value"):Connect(handleChange))
		end
	end
	if not p3:IsA("ValueBase") then
		return
	end
	v1:GiveTask(p3:GetPropertyChangedSignal("Value"):Connect(handleChange))
end
function t._addItemToStack(p1, p2, p3, p4, p5, p6) --[[ _addItemToStack | Line: 276 ]]
	if p2.Members[p3] then
		return
	end
	p2.Members[p3] = true
	p2.MemberInfo[p3] = {
		Item = p4,
		Variation = p5,
		Tab = p6
	}
	p2.Count = p2.Count + 1
	p1.ItemValueToGuiObject[p3] = p2.GuiObject
	p1.ItemValueToStackKey[p3] = p2.Key
	p1:_watchMemberMetadata(p2, p3)
	if not (p2.CountChangedSignal and p2.CountChangedSignal._bindableEvent) then
		return
	end
	p2.CountChangedSignal:Fire()
end
function t._removeItemFromStack(p1, p2) --[[ _removeItemFromStack | Line: 299 ]]
	local v1 = p1.ItemValueToStackKey[p2]
	if not v1 then
		return false
	end
	local v2 = p1.Stacks[v1]
	if not v2 then
		return false
	end
	if not v2.Members[p2] then
		return false
	end
	local isRootDataValue = v2.RootDataValue == p2
	v2.Members[p2] = nil
	v2.MemberInfo[p2] = nil
	if v2.MetadataMaids[p2] then
		v2.MetadataMaids[p2]:DoCleaning()
		v2.MetadataMaids[p2] = nil
	end
	v2.Count = v2.Count - 1
	p1.ItemValueToStackKey[p2] = nil
	p1.ItemValueToGuiObject[p2] = nil
	if v2.Count <= 0 then
		local GuiObject = v2.GuiObject
		p1:_destroyStack(v1)
		if not (GuiObject and GuiObject.Destroy) then
			return true
		end
		GuiObject:Destroy()
	else
		if v2.CountChangedSignal and v2.CountChangedSignal._bindableEvent then
			v2.CountChangedSignal:Fire()
		end
		if if v2.Count > p1:GetReserveTotal() then true else false then
			if not isRootDataValue then
				return true
			end
			local v4 = nil
			for v5 in v2.Members do
				v4 = v5
				break
			end
			if not v4 then
				return true
			end
			v2.RootDataValue = v4
			if v2.GuiObject then
				local GuiObject = v2.GuiObject
				v2.GuiObject = nil
				for v6 in v2.Members do
					p1.ItemValueToGuiObject[v6] = nil
				end
				if GuiObject.Destroy then
					GuiObject:Destroy()
				end
				p1.CreatedObjects[v2.Key] = nil
			end
			p1:_scheduleStackBuild(v2)
		else
			if not v2.GuiObject then
				return true
			end
			local GuiObject = v2.GuiObject
			v2.GuiObject = nil
			v2.RootDataValue = nil
			for v7 in v2.Members do
				p1.ItemValueToGuiObject[v7] = nil
			end
			if GuiObject.Destroy then
				GuiObject:Destroy()
			end
			p1.CreatedObjects[v2.Key] = nil
		end
	end
	return true
end
function t._routeItemValue(p1, p2, p3, p4, p5, p6) --[[ _routeItemValue | Line: 385 ]]
	if not p1:_canBuildGuiObject(p2, p3, p4) then
		return
	end
	local v1 = p1:_getStackKey(p2, p3)
	if not v1 then
		p1:_buildGuiObject({
			StackKey = nil,
			DataValue = p2,
			Item = p3,
			Variation = p4,
			FromInit = p6,
			Tab = p5
		})
		return
	end
	local v2 = p1:_ensureStack(v1)
	p1:_addItemToStack(v2, p2, p3, p4, p5)
	if v2.Count > p1:GetReserveTotal() and not v2.GuiObject then
		v2.RootDataValue = v2.RootDataValue or p2
		p1:_scheduleStackBuild(v2)
	end
	p1.GuiObjectsChangedSignal:Fire()
end
function t._scheduleStackBuild(p1, p2) --[[ _scheduleStackBuild | Line: 414 ]]
	if not p2._buildScheduled then
		p2._buildScheduled = true
		task.defer(function() --[[ Line: 420 | Upvalues: p2 (copy), p1 (copy) ]]
			p2._buildScheduled = false
			if p1._cleaningMaid then
				return
			end
			if p1.Stacks[p2.Key] ~= p2 then
				return
			end
			if p2.GuiObject then
				return
			end
			if p2.Count <= p1:GetReserveTotal() then
				return
			end
			local RootDataValue = p2.RootDataValue
			if not (RootDataValue and p2.Members[RootDataValue]) then
				RootDataValue = nil
				for v1 in p2.Members do
					RootDataValue = v1
					break
				end
			end
			if not RootDataValue then
				return
			end
			p2.RootDataValue = RootDataValue
			local v2 = p2.MemberInfo[RootDataValue]
			local v3 = if v2 then v2.Item else v2
			local v4 = if v2 then v2.Variation else v2
			local v5 = if v2 then v2.Tab else v2
			if not v3 then
				local v6, v7 = p1.PlayerWrapper:GetItemDataByValue(RootDataValue)
				v3 = v6
				v4 = v7
			end
			if v3 then
				p1:_buildGuiObject({
					FromInit = false,
					DataValue = RootDataValue,
					Item = v3,
					Variation = v4,
					Tab = v5,
					StackKey = p2.Key,
					ExistingStack = p2
				})
				p1.GuiObjectsChangedSignal:Fire()
			end
		end)
	end
end
function t._buildGuiObject(p1, p2) --[[ _buildGuiObject | Line: 475 | Upvalues: v1 (copy), v4 (copy) ]]
	local DataValue = p2.DataValue
	local ExistingStack = p2.ExistingStack
	local v12 = p1:_getParentInstance(p2.Tab)
	local t = {
		Parent = v12,
		Template = v1.FindElement(v12, "DefaultTemplate", {
			IgnoreParent = true
		})
	}
	t.DoNotSetVisibility = p1.TabNavigator and p1.LayoutSort and true
	t.DataValue = DataValue
	for v42, v5 in type(p1.Config.GuiObject) == "function" and p1.Config.GuiObject(DataValue) or p1.Config.GuiObject do
		if type(v5) == "table" then
			v5 = table.clone(v5)
		end
		t[v42] = v5
	end
	if ExistingStack then
		t.IndexedStack = ExistingStack
		if not t.Amount then
			t.Amount = {
				Value = function(p12) --[[ Value | Line: 502 | Upvalues: p1 (copy) ]]
					return p1:GetAvailableStackTotal(p12)
				end,
				Changed = function(p12) --[[ Changed | Line: 503 | Upvalues: p1 (copy) ]]
					local v1 = p1:GetStackChangedSignal(p12)
					return if v1 then { v1 } or {} else {}
				end
			}
		end
	end
	local v7 = v1.AddComponent("GuiObject", t)
	if p1.Config.OnCreated then
		p1.Config.OnCreated(v7)
	end
	if p1.Config.OnRemoved then
		v7:GiveTask(function() --[[ Line: 518 | Upvalues: p1 (copy), v7 (copy) ]]
			p1.Config.OnRemoved(v7)
		end)
	end
	if ExistingStack then
		ExistingStack.GuiObject = v7
		p1.CreatedObjects[ExistingStack.Key] = v7
		for v8 in ExistingStack.Members do
			p1.ItemValueToGuiObject[v8] = v7
		end
	else
		p1.CreatedObjects[DataValue] = v7
	end
	p1.ItemValueToGuiObject[DataValue] = v7
	v7:GiveTask(function() --[[ Line: 534 | Upvalues: p1 (copy), v7 (copy), ExistingStack (copy), DataValue (copy) ]]
		if p1.LayoutSort then
			p1.LayoutSort:Remove(v7)
		end
		if ExistingStack then
			if p1.Stacks[ExistingStack.Key] == ExistingStack and ExistingStack.GuiObject == v7 then
				ExistingStack.GuiObject = nil
				ExistingStack.RootDataValue = nil
				for v1 in ExistingStack.Members do
					p1.ItemValueToGuiObject[v1] = nil
				end
				p1.CreatedObjects[ExistingStack.Key] = nil
			end
		else
			p1.CreatedObjects[DataValue] = nil
			p1.ItemValueToGuiObject[DataValue] = nil
		end
		if p1._cleaningMaid then
			return
		end
		p1.GuiObjectsChangedSignal:Fire()
	end)
	local function canMaintainGuiObject() --[[ canMaintainGuiObject | Line: 558 | Upvalues: p1 (copy), DataValue (copy), p2 (copy), v7 (copy) ]]
		if p1:_canBuildGuiObject(DataValue, p2.Item, p2.Variation) then
			return
		end
		v7:Destroy()
	end
	if p1.Config.CanCreateChanged then
		for v9, v10 in v4.getConnectionEvents(p1.Config.CanCreateChanged(DataValue)) do
			v7:GiveTask(v10:Connect(canMaintainGuiObject))
		end
	end
	if p1.LayoutSort then
		local t2 = {}
		local v11, v122
		if p1.TabNavigator then
			v11 = p1:_getTabsItemIsIn(v7.Item)
			if v11 then
				v122 = v7
			else
				v11 = nil
				v122 = v7
			end
		else
			v11 = nil
			v122 = v7
		end
		t2.Tabs = v11
		t2.DoNotUpdateLayout = p2.FromInit
		t2.DoNotUpdateVisibility = p2.FromInit
		p1.LayoutSort:Add(v122, t2)
	end
	p1.GuiObjectsChangedSignal:Fire()
end
function t._trackItems(p1, p2) --[[ _trackItems | Line: 580 | Upvalues: v2 (copy), v4 (copy) ]]
	local t = {}
	local function itemRemoved(p12) --[[ itemRemoved | Line: 584 | Upvalues: p1 (copy), t (copy) ]]
		if p1.ItemValueToStackKey[p12] then
			p1:_removeItemFromStack(p12)
		else
			local v1 = p1.CreatedObjects[p12]
			if v1 and v1.Destroy then
				v1:Destroy()
			end
		end
		local v2 = t[p12]
		if not (v2 and v2.Destroy) then
			return
		end
		v2:Destroy()
	end
	local function itemAdded(p12, p22) --[[ itemAdded | Line: 600 | Upvalues: p1 (copy), p2 (copy), v2 (ref), t (copy), v4 (ref) ]]
		if not p22 then
			task.wait()
		end
		local v1, v22 = p1.PlayerWrapper:GetItemDataByValue(p12)
		if not v1 then
			return
		end
		if p2 and not (p1.ListeningForAllItems or table.find(p1:_getTabsItemIsIn(v1), p2.Name)) then
			return
		end
		local v42 = v2.new()
		v42:GiveTask(function() --[[ Line: 622 | Upvalues: t (ref), p12 (copy) ]]
			t[p12] = nil
		end)
		t[p12] = v42
		local function tryBuildGuiObject(p13) --[[ tryBuildGuiObject | Line: 627 | Upvalues: p1 (ref), p12 (copy), v1 (copy), v22 (copy), p2 (ref) ]]
			if not (p1.ItemValueToStackKey[p12] or p1.ItemValueToGuiObject[p12]) then
				p1:_routeItemValue(p12, v1, v22, p2, p13)
			end
		end
		if p1.Config.CanCreateChanged then
			for v5, v6 in v4.getConnectionEvents(p1.Config.CanCreateChanged(p12)) do
				v42:GiveTask(v6:Connect(function() --[[ Line: 636 | Upvalues: p1 (ref), p12 (copy), v1 (copy), v22 (copy), p2 (ref) ]]
					if p1.ItemValueToStackKey[p12] then
						return
					end
					if p1.ItemValueToGuiObject[p12] then
						return
					end
					p1:_routeItemValue(p12, v1, v22, p2, false)
				end))
			end
		end
		if p1.ItemValueToStackKey[p12] then
			return
		end
		if p1.ItemValueToGuiObject[p12] then
			return
		end
		p1:_routeItemValue(p12, v1, v22, p2, p22)
	end
	local function trackDataFolder(p12) --[[ trackDataFolder | Line: 644 | Upvalues: p1 (copy), itemAdded (copy), itemRemoved (copy) ]]
		p1.Maid:GiveTask(p12.ChildAdded:Connect(itemAdded))
		p1.Maid:GiveTask(p12.ChildRemoved:Connect(itemRemoved))
		for v1, v2 in p12:GetChildren() do
			itemAdded(v2, true)
		end
	end
	for v22, v3 in p1.Config.ItemFolders or {} do
		local v42 = type(v3) == "string" and p1.PlayerWrapper:GetItemFolder(v3) or v3
		if v42 then
			trackDataFolder(v42)
			continue
		end
		warn("\226\154\160\239\184\143 InventoryCreator, No data folder found for", v3)
	end
	for v6, v7 in p1.Config.Items or {} do
		local v8 = type(v7) == "string" and p1.PlayerWrapper:GetItemValue(v7) or v7
		if v8 and typeof(v8) == "Instance" then
			itemAdded(v8, true)
			continue
		end
		warn("\226\154\160\239\184\143 InventoryCreator, No item value found for", v8)
	end
end
function t.GetGuiObject(p1, p2) --[[ GetGuiObject | Line: 674 ]]
	return p1.ItemValueToGuiObject[p2] or p1.CreatedObjects[p2]
end
function t.GetAllGuiObjects(p1) --[[ GetAllGuiObjects | Line: 678 ]]
	return p1.CreatedObjects
end
function t.GetTotalGuiObjects(p1) --[[ GetTotalGuiObjects | Line: 682 | Upvalues: v6 (copy) ]]
	return v6.Count(p1.CreatedObjects)
end
function t.GetStackTotal(p1, p2) --[[ GetStackTotal | Line: 686 | Upvalues: v8 (copy) ]]
	if p2.IndexedStack then
		return p2.IndexedStack.Count
	end
	if p2.DataValue and v8.IsItemStackable(p2.DataValue) then
		return p2.DataValue.Value
	else
		return 1
	end
end
function t.GetAvailableStackTotal(p1, p2) --[[ GetAvailableStackTotal | Line: 696 ]]
	return math.max(0, p1:GetStackTotal(p2) - p1:GetReserveTotal())
end
function t.GetInStack(p1, p2) --[[ GetInStack | Line: 700 ]]
	if not p2.IndexedStack then
		return nil
	end
	local t = {}
	for v1 in p2.IndexedStack.Members do
		table.insert(t, v1)
	end
	return t
end
function t.GetAvailableInStack(p1, p2, p3) --[[ GetAvailableInStack | Line: 711 ]]
	if not p2.IndexedStack then
		return nil
	end
	local IndexedStack = p2.IndexedStack
	local v1 = p3 and p3.ReserveTotal or p1:GetReserveTotal()
	local RootDataValue = IndexedStack.RootDataValue
	local t = {}
	if v1 <= 0 then
		if RootDataValue and IndexedStack.Members[RootDataValue] then
			table.insert(t, RootDataValue)
		end
		for v2 in IndexedStack.Members do
			if v2 ~= RootDataValue then
				table.insert(t, v2)
			end
		end
	else
		local count = 0
		if RootDataValue and (IndexedStack.Members[RootDataValue] and count < v1) then
			count = count + 1
		end
		for v3 in IndexedStack.Members do
			if v3 ~= RootDataValue then
				if count < v1 then
					count = count + 1
					continue
				end
				table.insert(t, v3)
			end
		end
	end
	return t
end
function t.GetStackChangedSignal(p1, p2) --[[ GetStackChangedSignal | Line: 749 | Upvalues: v7 (copy), v8 (copy) ]]
	if p2.IndexedStack then
		local v1 = v7.new()
		v1.Maid:GiveTask(p2.IndexedStack.CountChangedSignal:Connect(function() --[[ Line: 753 | Upvalues: v1 (copy) ]]
			v1:Fire()
		end))
		return v1
	end
	if p2.DataValue and v8.IsItemStackable(p2.DataValue) then
		return p2.DataValue:GetPropertyChangedSignal("Value")
	else
		return nil
	end
end
function t.GetAvailableEntries(p1, p2, p3) --[[ GetAvailableEntries | Line: 765 ]]
	local v1 = p1:GetAvailableInStack(p2, p3)
	if v1 then
		local v2 = table.create(#v1)
		for v3, v4 in v1 do
			table.insert(v2, {
				Amount = 1,
				DataValue = v4
			})
		end
		return v2
	else
		local v5 = p3 and p3.ReserveTotal or p1:GetReserveTotal()
		return {
			{
				Amount = math.max(0, p1:GetStackTotal(p2) - v5),
				DataValue = p2.DataValue
			}
		}
	end
end
function t._ensureBlankSlotsForParent(p1, p2) --[[ _ensureBlankSlotsForParent | Line: 779 | Upvalues: v1 (copy) ]]
	if not p1.BlankSlotsCount or (not p2 or p1._blankSlotsByParent[p2]) then
		return
	end
	local v12 = v1.FindElement(p1.Instance, "DefaultBlank", {
		IgnoreParent = true
	}) or v1.FindElement(p2, "DefaultBlank", {
		IgnoreParent = true
	})
	if not v12 then
		return
	end
	local t = {}
	for i = 1, p1.BlankSlotsCount do
		local v2 = v1.AddComponent("GuiObject", {
			Parent = p2,
			Template = v12,
			Name = "BlankSlot_" .. i,
			LayoutOrder = i + 10000000
		})
		t[i] = v2
		p1.Maid:GiveTask(v2)
	end
	p1._blankSlotsByParent[p2] = t
	if not p1._blankSlotsSignalConnected then
		p1._blankSlotsSignalConnected = true
		p1.Maid:GiveTask(p1.GuiObjectsChangedSignal:Connect(function() --[[ Line: 804 | Upvalues: p1 (copy) ]]
			p1:_updateBlankSlotsVisibility()
		end))
	end
	p1:_updateBlankSlotsVisibility()
end
function t._updateBlankSlotsVisibility(p1) --[[ _updateBlankSlotsVisibility | Line: 811 ]]
	if not p1.BlankSlotsCount or next(p1._blankSlotsByParent) == nil then
		return
	end
	local count = 0
	for v1, v2 in p1.CreatedObjects do
		if v2 and (v2.Instance and v2.Instance.Visible) then
			count = count + 1
		end
	end
	for v3, v4 in p1._blankSlotsByParent do
		for i = 1, p1.BlankSlotsCount do
			local v5 = v4[i]
			if v5 and (v5.Instance and v5.Instance.Visible ~= nil) then
				local v6 = count < i
				if v5.Instance.Visible ~= v6 then
					v5.Instance.Visible = v6
				end
			end
		end
	end
end
function t.GetGuiObjectsChangedSignal(p1) --[[ GetGuiObjectsChangedSignal | Line: 834 ]]
	return p1.GuiObjectsChangedSignal
end
function t.Init(p1) --[[ Init | Line: 838 ]]
	if p1._initialized then
		return
	end
	p1._initialized = true
	if p1.LayoutSort then
		if p1.LayoutSort.VisibleGridChangedSignal then
			p1.Maid:GiveTask(p1.LayoutSort.VisibleGridChangedSignal:Connect(function() --[[ Line: 846 | Upvalues: p1 (copy) ]]
				p1:_updateBlankSlotsVisibility()
			end))
		end
		if p1.LayoutSort.SortChangedSignal then
			p1.Maid:GiveTask(p1.LayoutSort.SortChangedSignal:Connect(function() --[[ Line: 851 | Upvalues: p1 (copy) ]]
				p1:_updateBlankSlotsVisibility()
			end))
		end
	end
	if p1.TabNavigator then
		for v1, v2 in p1.TabNavigator:GetTabs() do
			p1.TabNavigator:AddCallback(v2.Name, "OnOpen", function(p12, p2) --[[ Line: 860 | Upvalues: p1 (copy) ]]
				if if p1.TabNavigator:HasDisplayAllTab() and not p12.Config.DisplayAll then false else true then
					p1:_trackItems(p12)
				end
				p1:_initSort(p12)
				p1:_ensureBlankSlotsForParent(p1:_getParentInstance(p12))
				p1:_updateBlankSlotsVisibility()
			end)
		end
	else
		p1:_trackItems()
		p1:_initSort()
		p1:_ensureBlankSlotsForParent(p1:_getParentInstance(nil))
	end
	if not p1.TabNavigator then
		return
	end
	p1.TabNavigator:OpenDefaultTab()
end
return t