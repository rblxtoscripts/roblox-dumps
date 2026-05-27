-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Signal")
local v2 = Sonar("Maid")
local v3 = Sonar("GuiUtils")
local v4 = Sonar("ButtonTest")
local v5 = Sonar("Button")
function t.new(p1) --[[ new | Line: 18 | Upvalues: t (copy), v2 (copy), v1 (copy), v3 (copy), v4 (copy), v5 (copy) ]]
	local v22 = setmetatable(p1, t)
	v22.Maid = v2.new()
	v22.Grid = {}
	v22.SortType = nil
	v22.Priority = v22.Priority or {}
	v22.Filters = v22.Filters or {}
	v22.Sorts = v22.Sorts or {}
	for k, v in pairs(v22.Sorts) do
		v.Name = k
	end
	for k, v in pairs(v22.Filters) do
		v22:AddFilter(k, v)
	end
	v22.SortChangedSignal = v1.new()
	v22.Maid:GiveTask(v22.SortChangedSignal)
	v22.FilterChangedSignal = v1.new()
	v22.Maid:GiveTask(v22.FilterChangedSignal)
	if v22.Search then
		v3.CreateInputTextBox(v22.Search.TextBox, function() --[[ Line: 42 | Upvalues: v22 (copy) ]]
			v22:UpdateVisibleGrid()
		end, true)
	end
	if v22.Frame then
		v22.Maid:GiveTask(v22.SortChangedSignal:Connect(function() --[[ Line: 48 | Upvalues: v22 (copy) ]]
			v22:SetSortFrame()
		end))
		v22:SetSortFrame()
		v22.ReverseToggleButton = v22.Frame:FindFirstChild("Toggle", true)
		if v22.ReverseToggleButton then
			v22.Maid:GiveTask(v4.new(v22.ReverseToggleButton, {
				Click = function() --[[ Click | Line: 56 | Upvalues: v22 (copy) ]]
					v22:ReverseSort()
				end
			}))
			v22.Maid:GiveTask(v22.SortChangedSignal:Connect(function() --[[ Line: 60 | Upvalues: v22 (copy) ]]
				v22:SetToggleButton()
			end))
			v22:SetToggleButton()
		end
		v22.Maid:GiveTask(v5.new(v22.Frame, {
			Click = function() --[[ Click | Line: 67 | Upvalues: v22 (copy) ]]
				v22:SetDropdown()
			end
		}))
		for k, v in pairs(v22.Sorts) do
			v22:CreateSortDropdown(k, v)
		end
	end
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 80 ]]
	p1.Maid:Destroy()
	setmetatable(p1, nil)
end
function t.CreateSortDropdown(p1, p2, p3) --[[ CreateSortDropdown | Line: 85 | Upvalues: v5 (copy) ]]
	local Default = p1.Frame.Dropdown:FindFirstChild("Default", true)
	Default.Visible = false
	local v1 = Default:Clone()
	v1.Name = p2
	local SortText = p3.SortText
	if not SortText then
		SortText = "Sort by " .. (p3.DisplayName or p3.Name)
	end
	v1.TextLabel.Text = SortText
	local function setSortButton() --[[ setSortButton | Line: 93 | Upvalues: v1 (copy), p1 (copy), p2 (copy) ]]
		v1.Current.Visible = p1.SortType == p2
	end
	p1.Maid:GiveTask(p1.SortChangedSignal:Connect(setSortButton))
	v1.Current.Visible = if p1.SortType == p2 then true else false
	p1.Maid:GiveTask(v5.new(v1, {
		HoverLabel = v1.Hover,
		Click = function() --[[ Click | Line: 101 | Upvalues: p1 (copy), p2 (copy) ]]
			p1:Sort(p2)
			p1:SetDropdown(false)
		end
	}))
	v1.Visible = true
	v1.Parent = Default.Parent
end
function t.SetDropdown(p1, p2) --[[ SetDropdown | Line: 111 ]]
	if p2 == nil then
		p2 = not p1.Frame.Dropdown.Visible
	end
	task.defer(function() --[[ Line: 115 | Upvalues: p1 (copy), p2 (ref) ]]
		p1.Frame.Dropdown.Visible = p2
	end)
end
function t.SetSortFrame(p1) --[[ SetSortFrame | Line: 120 ]]
	local v1 = p1:GetSort()
	if not v1 then
		p1.Frame.Content.SortName.Text = ""
		return
	end
	p1.Frame.Content.SortName.Text = v1.DisplayName or v1.Name
end
function t.SetToggleButton(p1) --[[ SetToggleButton | Line: 129 ]]
	if p1:GetState(p1.SortType) == "Reversed" then
		p1.ReverseToggleButton.Top.ArrowLabel.Rotation = 180
	else
		p1.ReverseToggleButton.Top.ArrowLabel.Rotation = 0
	end
end
function t.AddSort(p1, p2, p3) --[[ AddSort | Line: 138 ]]
	p3.Name = p2
	p1.Sorts[p3] = p3
	p1:CreateSortDropdown(p2, p3)
end
function t.AddFilter(p1, p2, p3) --[[ AddFilter | Line: 145 ]]
	if type(p3) ~= "table" then
		p3 = {
			Run = p3
		}
	end
	p1.Filters[p2] = p3
end
function t.SetVisible(p1, p2) --[[ SetVisible | Line: 155 ]]
	local v1 = p1:GetFilter("PreFilter")
	local v2 = if v1 then if type(v1.Run) == "boolean" then v1.Run else v1.Run(p2) else true
	if v2 then
		local v4 = p1:GetFilter()
		if v4 ~= nil then
			v2 = if type(v4.Run) == "boolean" then v4.Run else v4.Run(p2)
		end
	end
	if v2 and p1.Search then
		v2 = p1.Search.Run(p1.Search.TextBox.Text, p2)
	end
	p2:SetVisible(v2)
	return v2
end
function t.GetFilter(p1, p2) --[[ GetFilter | Line: 189 ]]
	return p1.Filters[if p2 then p2 else p1.FilterType]
end
function t.Filter(p1, p2) --[[ Filter | Line: 193 ]]
	if p1:GetFilter(p2) then
		p1.FilterType = p2
		p1.FilterChangedSignal:Fire()
		p1:UpdateVisibleGrid()
	end
end
function t.UpdateVisibleGrid(p1) --[[ UpdateVisibleGrid | Line: 203 ]]
	local v1 = nil
	for k, v in pairs(p1.Grid) do
		if p1:SetVisible(k) then
			v1 = true
		end
	end
	p1:SetEmptyString(not v1)
end
function t.SetEmptyString(p1, p2) --[[ SetEmptyString | Line: 213 ]]
	if not p1.EmptyString then
		return
	end
	if not p2 then
		p1.EmptyString.Label.Visible = false
		return
	end
	local v1 = p1:GetFilter()
	p1.EmptyString.Label.Text = if p1.Search and (if #p1.Search.TextBox.Text > 0 then true else false) then "No items found with this search..." else v1 and v1.EmptyString or p1.EmptyString.Text
	p1.EmptyString.Label.Visible = true
end
function t.GetSort(p1, p2) --[[ GetSort | Line: 229 ]]
	return p1.Sorts[if p2 then p2 else p1.SortType]
end
function t.GetState(p1, p2) --[[ GetState | Line: 233 ]]
	if p1.SortType ~= p2 then
		return nil
	end
	if p1:IsSortReversed(p2) then
		return "Reversed"
	else
		return "Active"
	end
end
function t.Sort(p1, p2, p3) --[[ Sort | Line: 245 ]]
	if not p1:GetSort(p2) then
		return
	end
	if p1.SortType == p2 then
		p1:ReverseSort(p2, p3)
		return
	end
	p1.SortType = p2
	p1.Reversed = false
	p1.SortChangedSignal:Fire()
	if p3 then
		return
	end
	p1:UpdateLayout()
end
function t.IsSortReversed(p1, p2) --[[ IsSortReversed | Line: 262 ]]
	local v1 = p1:GetSort(p2)
	if v1 then
		return v1.Reversed
	end
end
function t.ReverseSort(p1, p2, p3) --[[ ReverseSort | Line: 268 ]]
	local v1 = p1:GetSort(p2)
	if not v1 then
		return
	end
	if not v1.Reversable then
		return
	end
	v1.Reversed = not v1.Reversed
	p1.SortChangedSignal:Fire()
	if p3 then
		return
	end
	p1:UpdateLayout()
end
function t.UpdateLayout(p1) --[[ UpdateLayout | Line: 281 ]]
	local t = {}
	for v1, v2 in p1.Grid do
		t[#t + 1] = v1
	end
	local v3 = p1:GetSort()
	if not v3 then
		return
	end
	table.sort(t, function(p1, p2) --[[ Line: 290 | Upvalues: v3 (copy) ]]
		return v3.Run(p1, p2, v3.Reversed)
	end)
	for v4, v5 in t do
		v5:SetLayoutOrder(p1:GetLayoutOrderUsingPriority(v5, v4))
	end
end
function t.GetLayoutOrderUsingPriority(p1, p2, p3) --[[ GetLayoutOrderUsingPriority | Line: 299 ]]
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
function t.Add(p1, p2, p3) --[[ Add | Line: 312 ]]
	p1.Grid[p2] = true
	for k, v in pairs({ p1.Sorts, p1.Priority }) do
		for k2, v2 in pairs(v) do
			local v1
			local v22 = v2.Changed and v2.Changed(p2)
			if v22 then
				v1 = if type(v22) == "table" and (not v22.Destroy and v22) then v22 else { v22 }
				for k3, v3 in pairs(v1) do
					p2:GiveTask(v3:Connect(function() --[[ Line: 320 | Upvalues: v2 (copy), p2 (copy), p1 (copy) ]]
						if not v2.CanRun or v2.CanRun(p2) then
							p1:UpdateLayout()
						end
					end))
				end
			end
		end
	end
	if p1:SetVisible(p2) then
		p1:SetEmptyString(false)
	end
	if p3 then
		return
	end
	p1:UpdateLayout()
end
function t.Remove(p1, p2) --[[ Remove | Line: 338 ]]
	p1.Grid[p2] = nil
	if next(p1.Grid) then
		p1:UpdateVisibleGrid()
	else
		p1:SetEmptyString(true)
	end
end
function t.RemoveAll(p1) --[[ RemoveAll | Line: 348 ]]
	p1.Grid = {}
	if next(p1.Grid) then
		p1:UpdateVisibleGrid()
	else
		p1:SetEmptyString(true)
	end
end
return t