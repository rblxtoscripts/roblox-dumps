-- https://lua.expert/
local t = {}
function t.__index(p1, p2) --[[ Line: 37 | Upvalues: t (copy) ]]
	local v1 = t[p2]
	if v1 ~= nil then
		return v1
	end
	if p1.Config[p2] then
		return p1.Config[p2]
	else
		return nil
	end
end
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("safeDestroy")
local v4 = Sonar("GuiFrameworkService")
local v5 = Sonar("StorageUtils").GetConfig("GuiFramework")()
function t.new(p1) --[[ new | Line: 75 | Upvalues: t (copy), v2 (copy), v5 (copy), v1 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Maid = v2.new()
	v22.Config = p1
	v22.Instance = p1.Instance
	v22.ObjectsInSort = {}
	v22.ObjectMaids = {}
	v22.SortType = nil
	v22.Filters = p1.Filters or {}
	v22.Sorts = p1.Sorts or {}
	if p1.DefaultSorts then
		for k, v in pairs(v5.DefaultLayoutSorts) do
			if not v22.Sorts[k] then
				v22.Sorts[k] = v
			end
		end
	end
	for k, v in pairs(v22.Sorts) do
		v.Name = k
		if v.Get and not v.Run then
			function v.Run(p1, p2, p3, p4) --[[ Line: 104 | Upvalues: v (copy) ]]
				local t = { v.Get(p1, p2) }
				local t2 = { v.Get(p1, p3) }
				for i = 1, #t do
					local v1 = t[i]
					local v2 = t2[i]
					if v1 ~= v2 then
						local v3 = if v1 < v2 then true else false
						if p4 then
							return not v3
						else
							return v3
						end
					end
				end
				return false
			end
		end
	end
	v22.Priority = p1.Priority or {}
	if p1.DefaultPriorities then
		for k, v in pairs(v5.DefaultLayoutPriorities) do
			if not v22.Priority[k] then
				v22.Priority[k] = v
			end
		end
	end
	v22.Search = if type(p1.Search) == "table" then p1.Search else false
	v22.SortChangedSignal = v1.new()
	v22.Maid:GiveTask(v22.SortChangedSignal)
	v22.FilterChangedSignal = v1.new()
	v22.Maid:GiveTask(v22.FilterChangedSignal)
	v22.VisibleGridChangedSignal = v1.new()
	v22.Maid:GiveTask(v22.VisibleGridChangedSignal)
	v22:_initSearchFrame()
	v22:_initSortingFrame()
	for k, v in pairs(v22.Filters) do
		v22:AddFilter(k, v)
	end
	if not v22.SortType and next(v22.Sorts) then
		local v7 = nil
		for k, v in pairs(v22.Sorts) do
			if v.Default or v22.Config.DefaultSort == k then
				v7 = k
				break
			end
		end
		if not v7 then
			for k, v in pairs(v22.Sorts) do
				v7 = k
				break
			end
		end
		v22:Sort(v7)
	end
	if p1.TabNavigator then
		v22.TabNavigator = p1.TabNavigator
		v22.ObjectsInTabs = {}
		for v8, v9 in v22.TabNavigator:GetTabs() do
			v22.ObjectsInTabs[v8] = {}
			v22.TabNavigator:AddCallback(v8, "OnOpen", function() --[[ Line: 180 | Upvalues: v22 (copy) ]]
				v22:UpdateVisibleGrid({
					UpdatedFromTab = true
				})
			end)
			if v9.Config.DisplayAll then
				v22:AddFilter(v8, true)
				continue
			end
			local v10 = v9.Config.TabFilter or (if v9.Instance == nil then p1.TabFilter or v5.DefaultLayoutSortTabFilter else false)
			if v10 then
				v22:AddFilter(v8, {
					EmptyString = v9.Config.EmptyString,
					Run = function(p1, p2) --[[ Run | Line: 198 | Upvalues: v10 (copy), v9 (copy) ]]
						return v10(p1, v9, p2)
					end
				})
			end
		end
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 212 | Upvalues: v3 (copy) ]]
	v3(p1)
end
function t._initSearchFrame(p1) --[[ _initSearchFrame | Line: 219 | Upvalues: v4 (copy), v5 (copy) ]]
	p1.SearchFrame = p1.Search and p1.Search.Instance or p1.Instance and v4.FindElement(p1.Instance, "SearchBarFrame")
	if p1.SearchFrame then
		if not p1.Search then
			p1.Search = {}
		end
		if not p1.Search.Run or p1.Search.Run == "Default" then
			p1.Search.Run = v5.DefaultLayoutSortSearch
		end
		local v2 = v4.AddComponent("InputTextBox", {
			Instance = p1.SearchFrame,
			OnTextChanged = function(p12, p2) --[[ OnTextChanged | Line: 240 | Upvalues: p1 (copy) ]]
				p1:UpdateVisibleGrid()
			end
		})
		p1.Search.TextBox = v2.TextBox
		p1.Maid:GiveTask(v2)
	else
		if not p1.Search then
			return
		end
		warn("\226\154\160\239\184\143 LayoutSort, Search frame not found, but search is enabled for", p1.Instance:GetFullName())
	end
end
function t._initSortingFrame(p1) --[[ _initSortingFrame | Line: 253 | Upvalues: v4 (copy) ]]
	p1.SortFrame = v4.FindElement(p1.Instance, "SortingOptionsFrame")
	if p1.SortFrame then
		p1.Maid:GiveTask(v4.AddComponent("Dropdown", {
			HideOptionWhenSelected = true,
			Instance = p1.SortFrame,
			Options = p1.Sorts,
			GetValue = function() --[[ GetValue | Line: 263 | Upvalues: p1 (copy) ]]
				return p1.SortType
			end,
			OnSelected = function(p12, p2) --[[ OnSelected | Line: 266 | Upvalues: p1 (copy) ]]
				p1:Sort(p2.Name, {
					DoNotReverse = true
				})
			end,
			Changed = p1.SortChangedSignal
		}))
	end
	p1.SortDirectionButton = v4.FindElement(p1.Instance, "SortingDirectionButton")
	if not p1.SortDirectionButton then
		return
	end
	p1.Maid:GiveTask(v4.AddComponent("Button", {
		Instance = p1.SortDirectionButton,
		OnClick = function() --[[ OnClick | Line: 280 | Upvalues: p1 (copy) ]]
			p1:_reverseSort()
		end
	}))
	p1.Maid:GiveTask(p1.SortChangedSignal:Connect(function() --[[ Line: 284 | Upvalues: p1 (copy) ]]
		p1:_setSortDirection()
	end))
	p1:_setSortDirection()
end
function t._getState(p1, p2) --[[ _getState | Line: 295 ]]
	if p1.SortType ~= p2 then
		return nil
	end
	if p1:_isSortReversed(p2) then
		return "Reversed"
	else
		return "Active"
	end
end
function t._setSortDirection(p1) --[[ _setSortDirection | Line: 309 | Upvalues: v4 (copy) ]]
	if not p1.SortDirectionButton then
		return
	end
	local v1 = v4.FindElement(p1.SortDirectionButton, "DirectionLabel")
	if not v1 then
		return
	end
	if not p1._originalRotation then
		p1._originalRotation = v1.Rotation
	end
	if p1:_getState(p1.SortType) == "Reversed" then
		v1.Rotation = p1._originalRotation + 180
	else
		v1.Rotation = p1._originalRotation
	end
end
function t._setObjectVisible(p1, p2) --[[ _setObjectVisible | Line: 335 ]]
	local v1 = p1:_getFilter("FilterFirst")
	local v2 = if v1 then if type(v1.Run) == "boolean" then v1.Run else v1.Run(p1, p2) else true
	if v2 then
		local v4 = p1:_getFilter()
		if v4 ~= nil then
			v2 = if type(v4.Run) == "boolean" then v4.Run else v4.Run(p1, p2)
		end
	end
	if v2 and p1.Search then
		local Text = p1.Search.TextBox.Text
		v2 = if #Text > 0 and (p1.Search.CanSearch and not p1.Search.CanSearch(p1, p2)) then false else p1.Search.Run(p1, Text, p2)
	end
	if typeof(p2) == "Instance" and p2:IsA("GuiObject") then
		p2.Visible = v2
		return v2
	end
	if typeof(p2) == "table" and p2.SetVisible then
		p2:SetVisible(v2)
		return v2
	end
	warn("\226\154\160\239\184\143 LayoutSort, object is not an instance or a table with SetVisible", p2)
	return v2
end
function t._isSortReversed(p1, p2) --[[ _isSortReversed | Line: 385 ]]
	local v1 = p1:_getSort(p2)
	if v1 then
		return v1.Reversed
	end
end
function t._setEmptyString(p1, p2) --[[ _setEmptyString | Line: 394 | Upvalues: v4 (copy) ]]
	local v1 = p1.EmptyLabel or (p1.EmptyString and p1.EmptyString.Instance or v4.FindElement(p1.Instance, "EmptyLabel"))
	if not v1 then
		return
	end
	p1.EmptyLabel = v1
	local EmptyString = p1.EmptyString
	if not EmptyString then
		EmptyString = {}
		EmptyString.Text = v1:IsA("TextLabel") and v1.Text
	end
	p1.EmptyString = EmptyString
	if not p2 then
		v1.Visible = false
		return
	end
	local v3 = p1:_getFilter()
	local v42 = p1.Search and (if #p1.Search.TextBox.Text > 0 then true else false)
	if v1:IsA("TextLabel") then
		v1.Text = if v42 then "No items found with this search..." else v3 and v3.EmptyString or p1.EmptyString.Text
	end
	v1.Visible = true
end
function t._getFilter(p1, p2) --[[ _getFilter | Line: 422 ]]
	return p1.Filters[if p2 then p2 else p1.FilterType]
end
function t._getSort(p1, p2) --[[ _getSort | Line: 430 ]]
	return p1.Sorts[if p2 then p2 else p1.SortType]
end
function t._reverseSort(p1, p2, p3) --[[ _reverseSort | Line: 438 ]]
	local v2 = p1:_getSort(p2)
	if not v2 then
		return
	end
	if not v2.Reversable then
		return
	end
	v2.Reversed = not v2.Reversed
	p1.SortChangedSignal:Fire()
	if (if p3 then p3 else {}).DoNotUpdateLayout then
		return v2.Reversed
	end
	p1:UpdateLayout()
	return v2.Reversed
end
function t._getLayoutOrderUsingPriority(p1, p2, p3) --[[ _getLayoutOrderUsingPriority | Line: 460 ]]
	local sum = 0
	for k, v in pairs(p1.Priority) do
		local v1
		if not v.CanRun or v.CanRun(p2) then
			local v2 = v.Run(p2)
			if v2 then
				v1 = if type(v2) == "number" and v2 then v2 else v.Priority
				sum = sum + v1
			end
		end
	end
	return p3 + sum * -10000
end
function t._getObjectsInSort(p1, p2) --[[ _getObjectsInSort | Line: 476 ]]
	if p1.TabNavigator and not p1:_includeAllObjects() then
		local v1 = p1.TabNavigator:GetOpenedTab()
		if v1 then
			return p1.ObjectsInTabs[v1.Name]
		else
			return {}
		end
	else
		return p1.ObjectsInSort
	end
end
function t._includeAllObjects(p1) --[[ _includeAllObjects | Line: 491 ]]
	if p1.TabNavigator then
		return not p1.TabNavigator:AreTabsIndividualFrames()
	else
		return true
	end
end
function t.AddSort(p1, p2, p3) --[[ AddSort | Line: 502 ]]
	p3.Name = p2
	p1.Sorts[p3] = p3
end
function t.AddFilter(p1, p2, p3) --[[ AddFilter | Line: 511 ]]
	if type(p3) ~= "table" then
		p3 = {
			Run = p3
		}
	end
	p1.Filters[p2] = p3
end
function t.Add(p1, p2, p3) --[[ Add | Line: 525 | Upvalues: v2 (copy) ]]
	local v22 = p3 or {}
	if p1.ObjectsInTabs and not v22.Tabs then
		warn("\226\154\160\239\184\143 LayoutSort, TabNavigator is found but no tab is specified")
		return
	end
	p1.ObjectsInSort[p2] = true
	local v3 = nil
	if p1.ObjectsInTabs then
		for k, v in pairs(v22.Tabs) do
			v3 = p1.ObjectsInTabs[v]
			if not v3 then
				warn("\226\154\160\239\184\143 LayoutSort, Tab not found", v)
				return
			end
			v3[p2] = true
		end
	end
	local v4 = type(p2) == "table" and p2.Maid or p1.ObjectMaids[p2]
	if not v4 then
		local v5 = v2.new()
		p1.ObjectMaids[p2] = v5
		v4 = v5
	end
	for k, v in pairs({ p1.Sorts, p1.Priority }) do
		for k2, v5 in pairs(v) do
			local v6
			local v7 = v5.Changed and v5.Changed(p2)
			if v7 then
				v6 = if type(v7) == "table" and (not v7.Destroy and v7) then v7 else { v7 }
				for k3, v8 in pairs(v6) do
					v4:GiveTask(v8:Connect(function() --[[ Line: 561 | Upvalues: v3 (ref), p1 (copy), v5 (copy), p2 (copy) ]]
						if v3 and v3 ~= p1:_getObjectsInSort() then
							return
						end
						if not v5.CanRun or v5.CanRun(p2) then
							p1:UpdateLayout()
						end
					end))
				end
			end
		end
	end
	if not v22.DoNotUpdateVisibility and p1:_setObjectVisible(p2) then
		p1:_setEmptyString(false)
	end
	if v22.DoNotUpdateLayout then
		return p2
	end
	p1:UpdateLayout()
	return p2
end
function t.Remove(p1, p2) --[[ Remove | Line: 592 ]]
	p1.ObjectsInSort[p2] = nil
	local v1 = nil
	if p1.ObjectsInTabs then
		for v2, v3 in p1.ObjectsInTabs do
			v3[p2] = nil
			if p1.TabNavigator and p1.TabNavigator:IsTabOpen(v2) then
				v1 = v3
			end
		end
	end
	local v4 = p1.ObjectMaids[p2]
	if v4 then
		v4:DoCleaning()
		p1.ObjectMaids[p2] = nil
	end
	if (not v1 or next(v1)) and next(p1.ObjectsInSort) then
		return
	end
	p1:_setEmptyString(true)
end
function t.RemoveAll(p1) --[[ RemoveAll | Line: 623 ]]
	p1.ObjectsInSort = {}
	if not p1.ObjectsInTabs then
		return
	end
	for v1, v2 in p1.ObjectsInTabs do
		p1.ObjectsInTabs[v1] = {}
	end
end
function t.UpdateLayout(p1) --[[ UpdateLayout | Line: 634 ]]
	local tbl = {}
	for k, v in pairs(p1:_getObjectsInSort()) do
		tbl[#tbl + 1] = k
	end
	local v1 = p1:_getSort()
	if not v1 then
		return
	end
	table.sort(tbl, function(p12, p2) --[[ Line: 643 | Upvalues: v1 (copy), p1 (copy) ]]
		return v1.Run(p1, p12, p2, v1.Reversed)
	end)
	for k, v in pairs(tbl) do
		local v2 = p1:_getLayoutOrderUsingPriority(v, k)
		if typeof(v) == "Instance" and v:IsA("GuiObject") then
			v.LayoutOrder = v2
			continue
		end
		if typeof(v) == "table" and v.SetLayoutOrder then
			v:SetLayoutOrder(v2)
			continue
		end
		warn("\226\154\160\239\184\143 LayoutSort, object is not an instance or a table with SetLayoutOrder", v)
	end
end
function t.GetFirst(p1) --[[ GetFirst | Line: 661 ]]
	local t = {}
	for k, v in pairs(p1:_getObjectsInSort()) do
		t[#t + 1] = k
	end
	local v1 = p1:_getSort()
	if v1 then
		table.sort(t, function(p12, p2) --[[ Line: 669 | Upvalues: v1 (copy), p1 (copy) ]]
			return v1.Run(p1, p12, p2, v1.Reversed)
		end)
	end
	return t[1]
end
function t.UpdateVisibleGrid(p1, p2) --[[ UpdateVisibleGrid | Line: 679 ]]
	local v2 = nil
	for k, v in pairs(p1:_getObjectsInSort(if p2 then p2 else {})) do
		if p1:_setObjectVisible(k) then
			v2 = true
		end
	end
	p1:_setEmptyString(not v2)
	if not p1.VisibleGridChangedSignal then
		return
	end
	p1.VisibleGridChangedSignal:Fire()
end
function t.Filter(p1, p2) --[[ Filter | Line: 698 ]]
	if p1:_getFilter(p2) then
		p1.FilterType = p2
		p1.FilterChangedSignal:Fire()
		p1:UpdateVisibleGrid()
	end
end
function t.Sort(p1, p2, p3) --[[ Sort | Line: 712 ]]
	local v1 = if p3 then p3 else {}
	if not p1:_getSort(p2) then
		return
	end
	if p1.SortType == p2 and (not v1.DoNotReverse and p1:_reverseSort(p2)) then
		return
	end
	p1.SortType = p2
	p1.Reversed = false
	p1.SortChangedSignal:Fire()
	if v1.DoNotUpdateLayout then
		return
	end
	p1:UpdateLayout()
end
function t.SortDefault(p1) --[[ SortDefault | Line: 737 ]]
	if p1.Config.DefaultSort then
		p1:Sort(p1.Config.DefaultSort)
	end
end
function t.Update(p1) --[[ Update | Line: 747 ]]
	p1:UpdateVisibleGrid()
	p1:UpdateLayout()
end
function t.SortSlots(p1, p2) --[[ SortSlots | Line: 759 ]]
	local v1 = p1:_getSort()
	if v1 and v1.Run then
		table.sort(p2, function(p12, p2) --[[ Line: 765 | Upvalues: v1 (copy), p1 (copy) ]]
			return v1.Run(p1, p12 and p12.GuiObject or p12, p2 and p2.GuiObject or p2, v1.Reversed)
		end)
	end
end
function t.FilterSlots(p1, p2, p3) --[[ FilterSlots | Line: 779 ]]
	local v1 = p1:_getFilter("FilterFirst")
	local v2 = p1:_getFilter(p3)
	local v3 = p1.Search and p1.Search.TextBox and p1.Search.TextBox.Text
	for v5, v6 in p2 do
		local v4
		local v7 = v6 and v6.GuiObject or v6
		v4 = if v1 then if type(v1.Run) == "boolean" then v1.Run else v1.Run(p1, v7) else true
		if v4 and v2 then
			v4 = if type(v2.Run) == "boolean" then v2.Run else v2.Run(p1, v7)
		end
		if v4 and (p1.Search and (v3 and #v3 > 0)) then
			v4 = if p1.Search.CanSearch and not p1.Search.CanSearch(p1, v7) then false elseif p1.Search.Run(p1, v3, v7) then true else false
		end
		if v6 then
			v6.Visible = v4 and true or false
		end
	end
end
return t