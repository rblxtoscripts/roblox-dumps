-- https://lua.expert/
local v1 = require(game.ReplicatedStorage:WaitForChild("Library")):Load("Utility")
local t = {}
local ListItem = require(script:WaitForChild("ListItem"))
local UIEvents = game.Players.LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("UIEvents")
game:GetService("GuiService")
t.__index = t
function t.new(p1, p2, p3, p4) --[[ new | Line: 14 | Upvalues: t (copy) ]]
	local t2 = {}
	setmetatable(t2, t)
	t2.ListItems = {}
	t2.Object = p1
	t2.Type = "ListView"
	t2.ScrollingFrame = p1.Parent
	t2.Template = nil
	t2.WindowData = p2
	t2.CurrentSelection = nil
	t2.NumListItems = 0
	t2.Data = nil
	t2.MultiSelectMode = false
	t2.NumColumbs = 0
	t2.Header = p3
	t2.Footer = p4
	t2.InternalHeader = nil
	t2.InternalFooter = nil
	t2.UILayout = p1:FindFirstChild("UIGridLayout") or p1:FindFirstChild("UIListLayout") or p1:FindFirstChild("UITableLayout")
	t2.GamepadSelectFirstItemOnRefresh = false
	t2.ListOffset = p1.AbsolutePosition.Y - t2.ScrollingFrame.AbsolutePosition.Y
	t2.RecycleRows = true
	t2.AutoResize = false
	t2.MinListItemSizeX = 0
	t2.MaxListItemSizeX = (1 / 0)
	t2.MinNumColumbs = 1
	t2.MaxNumColumbs = 10000
	return t2
end
function t.GetColumb(p1, p2) --[[ GetColumb | Line: 51 ]]
	local NumColumbs = p1.NumColumbs
	local v1 = #p1.ListItems
	local count = 0
	local t = {}
	for i, v in ipairs(p1.ListItems) do
		if p2 == "Left" and math.fmod(count, NumColumbs) == 0 or p2 == "Right" and (math.fmod(count, NumColumbs) == NumColumbs - 1 or count == v1) then
			table.insert(t, v)
		end
		count = count + 1
	end
	return t
end
function t.SetCellPadding(p1, p2) --[[ SetCellPadding | Line: 68 ]]
	p1.UILayout.CellPadding = p2
end
function t.GetListItemIndex(p1, p2) --[[ GetListItemIndex | Line: 72 ]]
	for i, v in ipairs(p1.ListItems) do
		if v == p2 then
			return i
		end
	end
end
function t.GetListItemByDataProperyValue(p1, p2, p3) --[[ GetListItemByDataProperyValue | Line: 80 ]]
	for i, v in ipairs(p1.ListItems) do
		if v.ItemData[p2] == p3 then
			return v
		end
	end
end
function t.JumpToListItem(p1, p2) --[[ JumpToListItem | Line: 89 ]]
	local ScrollingFrame = p1.ScrollingFrame
	local Object = p2.Object
	ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	p1.ScrollingFrame.CanvasPosition = Vector2.new(0, Object.AbsolutePosition.Y - ScrollingFrame.AbsolutePosition.Y + (-(ScrollingFrame.AbsoluteSize.Y / 2) + Object.AbsoluteSize.Y / 2))
end
function t.UpdateData(p1, p2, p3, p4, p5) --[[ UpdateData | Line: 102 | Upvalues: v1 (copy), ListItem (copy) ]]
	if not p2 then
		p2 = {}
	end
	p1.Template = p3
	p1.Data = p2
	p1.NumListItems = #p2
	p3.Visible = false
	local list = {}
	for i, v in ipairs(p3:GetChildren()) do
		if v:IsA("GuiButton") and v.Visible then
			table.insert(list, v.LayoutOrder, v.Name)
		end
	end
	if p1.UILayout:IsA("UIGridLayout") then
		local Offset = p1.UILayout.CellPadding.X.Offset
		local v3 = math.clamp((p1.Object.AbsoluteSize.X + Offset) / (p3.AbsoluteSize.X + Offset), p1.MinNumColumbs, p1.MaxNumColumbs)
		local v4 = v1:Round(v3, 1)
		local v5 = math.ceil(v3)
		local v6 = math.floor(v3)
		local v9 = p1.Object.AbsoluteSize.X / v6 - p1.UILayout.CellPadding.X.Offset + math.floor(p1.UILayout.CellPadding.X.Offset / v6)
		local v12 = p1.Object.AbsoluteSize.X / v5 - p1.UILayout.CellPadding.X.Offset + math.floor(p1.UILayout.CellPadding.X.Offset / v5)
		local v13
		if v4 < p1.MinNumColumbs then
			v13 = p1.Object.AbsoluteSize.X / p1.MinNumColumbs - p1.UILayout.CellPadding.X.Offset + math.floor(p1.UILayout.CellPadding.X.Offset / p1.MinNumColumbs)
			p1.NumColumbs = p1.MinNumColumbs
		elseif v9 < p1.MaxListItemSizeX and v5 - v4 >= 0.8 then
			p1.NumColumbs = v6
			v13 = v9
		elseif p1.MinListItemSizeX <= v12 and v4 - v6 > 0.2 then
			p1.NumColumbs = v5
			v13 = v12
		elseif v12 < p1.MinListItemSizeX then
			p1.NumColumbs = v6
			v13 = v9
		elseif p1.MaxListItemSizeX < v9 then
			p1.NumColumbs = v5
			v13 = v12
		else
			p1.NumColumbs = v6
			v13 = v9
		end
		local v16 = p3.AbsoluteSize.X / p3.AbsoluteSize.Y
		if p3:FindFirstChild("AspectRatio") then
			v16 = p3.AspectRatio.Value
		end
		p1.UILayout.CellSize = UDim2.new(0, math.floor(v13), 0, (math.floor(v13 / v16)))
	else
		p1.NumColumbs = 1
	end
	p1.NumRows = math.ceil(#p2 / p1.NumColumbs)
	local v18 = 0
	for i, v in ipairs(p2) do
		if not p1.RecycleRows and p1.ListItems[i] then
			p1.ListItems[i]:Delete()
			p1.ListItems[i] = nil
		end
		local v19 = p1.RecycleRows and p1.ListItems[i] or ListItem.new(p1, p1.WindowData)
		v19:SetTemplate(p3)
		v19:UpdateDisplay(v, i, p4)
		v19.Object.LayoutOrder = i
		p1.ListItems[i] = v19
		local v20 = p1.ListItems[i - 1]
		if #list == 0 then
			if v20 and p1.UILayout:IsA("UIGridLayout") then
				v20.Object.NextSelectionRight = v19.Object
				v19.Object.NextSelectionLeft = v20.Object
			end
			if i - p1.NumColumbs > 0 then
				v19.Object.NextSelectionUp = p1.ListItems[i - p1.NumColumbs].Object
				p1.ListItems[i - p1.NumColumbs].Object.NextSelectionDown = v19.Object
			else
				v19.Object.NextSelectionUp = nil
			end
		else
			local v21 = nil
			for i2, v2 in ipairs(list) do
				local v22 = v19.Object[v2]
				if i - p1.NumColumbs > 0 then
					v22.NextSelectionUp = p1.ListItems[i - p1.NumColumbs].Object[v2]
					p1.ListItems[i - p1.NumColumbs].Object[v2].NextSelectionDown = v22
				else
					v22.NextSelectionUp = nil
				end
				if v21 then
					v22.NextSelectionLeft = v21
					v21.NextSelectionRight = v22
				end
				v21 = v19.Object[v2]
			end
		end
		v19.Object.NextSelectionDown = nil
		v19.Object.NextSelectionRight = nil
		v18 = i
	end
	for i = v18 + 1, #p1.ListItems do
		if p1.ListItems[i] and p1.ListItems[i].Object then
			p1.ListItems[i]:Delete()
			p1.ListItems[i] = nil
		end
	end
	if _G.GamepadEnabled and (p1.GamepadSelectFirstItemOnRefresh and #p2 > 0) then
		if #list == 0 then
			game:GetService("GuiService").SelectedObject = p1.ListItems[1].Object
		else
			game:GetService("GuiService").SelectedObject = p1.ListItems[1].Object[list[1]]
		end
	end
	local v23 = p1.Header and p1.Header.AbsoluteSize.Y or p1.ScrollingFrame.AbsolutePosition.Y - p1.WindowData.Object.AbsolutePosition.Y
	local v24 = p1.Footer and p1.Footer.AbsoluteSize.Y or 0
	if p1.AutoResize then
		p1.ScrollingFrame.Size = UDim2.new(p1.ScrollingFrame.Size.X.Scale, p1.ScrollingFrame.Size.X.Offset, 1, -(v23 + v24))
	end
	local v25 = p1.InternalHeader and p1.InternalHeader.AbsoluteSize.Y or 0
	local v26 = p1.InternalFooter and p1.InternalFooter.AbsoluteSize.Y or 0
	if p1.UILayout:IsA("UIGridLayout") then
		p1.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, p1.NumRows * (p1.UILayout.CellSize.Y.Offset + p1.UILayout.CellPadding.Y.Offset) + (v25 + v26))
	elseif p1.UILayout:IsA("UIListLayout") then
		p1.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, p1.NumRows * (p3.AbsoluteSize.Y + p1.UILayout.Padding.Offset) + (v25 + v26))
	elseif p1.UILayout:IsA("UITableLayout") then
		p1.ScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, p1.NumRows * (p3.AbsoluteSize.Y + p1.UILayout.Padding.Y.Offset) + (v25 + v26))
	end
	if not p5 then
		p1.ScrollingFrame.CanvasPosition = Vector2.new(0, 0)
	end
	p1:SetSelection(nil)
	if p1.Footer or p1.InternalFooter then
		for i, v in ipairs(p1.ListItems) do
			if v.Object.NextSelectionDown == nil then
				local v27 = p1.InternalFooter or p1.Footer
				v.Object.NextSelectionDown = v27
				v27.NextSelectionUp = v.Object
			end
		end
		if p1.Footer and p1.InternalFooter then
			p1.Footer.NextSelectionUp = p1.InternalFooter
			p1.InternalFooter.NextSelectionUp = p1.Footer
		end
	end
	if not (p1.Header or p1.InternalHeader) then
		return
	end
	for i, v in ipairs(p1.ListItems) do
		if v.Object.NextSelectionUp == nil then
			local v28 = p1.InternalHeader or p1.Header
			v.Object.NextSelectionUp = v28
			if v28.NextSelectionDown == nil or v28.NextSelectionDown.Parent == nil then
				v28.NextSelectionDown = v.Object
			end
		end
	end
	if not (p1.Header and p1.InternalHeader) then
		return
	end
	p1.Header.NextSelectionDown = p1.InternalHeader
	p1.InternalHeader.NextSelectionDown = p1.Header
end
function t.DisableListItems(p1, p2) --[[ DisableListItems | Line: 357 ]]
	for i, v in ipairs(p1.ListItems) do
		v.Disabled = p2
	end
end
function t.SetSelection(p1, p2, p3) --[[ SetSelection | Line: 365 | Upvalues: UIEvents (copy) ]]
	if not p1.MultiSelectMode and p1.CurrentSelection then
		p1.CurrentSelection:SetSelected(false)
	end
	if not p2 then
		return
	end
	p2:SetSelected(true)
	p1.CurrentSelection = p2
	UIEvents.ListItemPressed:Fire(p1.WindowData.Object, p1.Object, if p3 then p3 else p2.Object, p2.ItemData)
end
return t