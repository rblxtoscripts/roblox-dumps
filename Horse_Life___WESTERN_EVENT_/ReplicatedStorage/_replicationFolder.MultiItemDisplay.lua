-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("LootboxService")
local v3 = Sonar("TimeSeed")
local v4 = Sonar("FormatNumber")
local v5 = Sonar("safeDestroy")
local v6 = Sonar("TableUtils")
local v7 = Sonar("Maid")
function t.new(p1) --[[ new | Line: 89 | Upvalues: v2 (copy), v1 (copy), t (copy), v7 (copy) ]]
	local v12 = v2.GetLootboxFromTable(p1.Items)
	if v12 then
		p1.Lootbox = v12
		return v1.AddComponent("LootboxDisplay", p1)
	end
	local v3 = setmetatable({}, t)
	v3.Maid = v7.new()
	v3.Config = p1
	v3.Items = v3.Config.Items
	if not v3.Items then
		warn("\226\154\160\239\184\143 MultiItemDisplay, Items is required for multi item display")
		return v3
	end
	v3.Instance = p1.Instance
	if not v3.Instance then
		warn("\226\154\160\239\184\143 MultiItemDisplay, Instance is required for multi item display")
		return v3
	end
	v3.Template = p1.Template or v1.FindElement(v3.Instance, "DefaultTemplate")
	v3.Config.Amount = v3.Config.Amount or {}
	v3:_init()
	return v3
end
function t._init(p1) --[[ _init | Line: 121 | Upvalues: v6 (copy) ]]
	local v1 = v6.Count(p1.Items)
	local v2 = p1.Config.MaxItems and (if p1.Config.MaxItems < v1 then true else false)
	local v3 = (not p1.Config.MaxItems or v2) and p1.Config.ItemDisplayType or (if v2 then "Group" else "List")
	if v3 == "Group" then
		p1:_createGroupedDisplay(v1)
		return
	end
	if v3 == "Cycle" then
		if v1 > 1 then
			p1:_createCycledDisplay(v1)
		else
			p1:_createListDisplay(v1)
		end
	else
		if v3 == "Scroll" then
			p1:_createScrolledDisplay(v1)
			return
		end
		if v3 ~= "List" then
			warn("\226\154\160\239\184\143 MultiItemDisplay, Invalid ItemDisplayType:", p1.Instance, v3)
		end
		p1:_createListDisplay(v1)
	end
end
function t._createGroupedDisplay(p1, p2) --[[ _createGroupedDisplay | Line: 147 | Upvalues: v1 (copy), v4 (copy) ]]
	local v12, v2 = p1:_getSingleItemDisplay()
	if not v2 then
		warn("\226\154\160\239\184\143 MultiItemDisplay, Could not find ImageLabel for multi item display", p1.Instance)
		return
	end
	v2.Image = p1.Config.GroupIcon or "rbxassetid://122975941450889"
	if not p1.Config.DoNotShowToolTip then
		p1.Maid:GiveTask(v1.AddComponent("ToolTip", {
			Instance = v2,
			Items = p1.Items
		}))
	end
	local v3 = v1.FindElement(v12, "AmountLabel")
	if not v3 then
		return
	end
	v3.Text = "x" .. v4.splice(p2)
	v3.Visible = true
end
function t._createCycledDisplay(p1, p2) --[[ _createCycledDisplay | Line: 170 | Upvalues: v7 (copy), v1 (copy), v3 (copy) ]]
	if not p1:_getSingleItemDisplay() then
		warn("\226\154\160\239\184\143 MultiItemDisplay, Could not find display instance for multi item display", p1.Instance)
	end
	local t = {}
	for v12, v2 in p1.Items do
		table.insert(t, v12)
	end
	local v32 = 0
	local v4 = v7.new()
	p1.Maid:GiveTask(v4)
	local function cycleDisplayedItem() --[[ cycleDisplayedItem | Line: 185 | Upvalues: v4 (copy), v32 (ref), t (copy), p1 (copy), v1 (ref), p2 (copy) ]]
		v4:DoCleaning()
		v32 = v32 % #t + 1
		local v12 = t[v32]
		local v2 = p1:_createItemDisplay(v12, p1.Items[v12])
		v4:GiveTask(v2)
		local v3 = v1.FindElement(v2.Instance, "CycleLabel") or p1.Config.AmountLabelAsCycleLabel and v1.FindElement(v2.Instance, "AmountLabel")
		if not v3 then
			return
		end
		v3.Text = ("%*/%*"):format(v32, p2)
		v3.Visible = true
	end
	local t2 = {
		Start = workspace:GetServerTimeNow()
	}
	t2.Duration = tonumber(p1.Config.Speed) or 3
	local v6 = v3.new(t2)
	p1.Maid:GiveTask(v6)
	p1.Maid:GiveTask(v6.SeedChanged:Connect(cycleDisplayedItem))
	cycleDisplayedItem()
end
function t._createListDisplay(p1, p2) --[[ _createListDisplay | Line: 211 ]]
	if not p1.Template and p2 > 1 then
		warn("\226\154\160\239\184\143 MultiItemDisplay, Template is required for multi item display")
		return
	end
	local t = {}
	for v1, v2 in p1.Items do
		table.insert(t, (p1.Maid:GiveTask(p1:_createItemDisplay(v1, v2))))
	end
	return t
end
function t._createScrolledDisplay(p1, p2) --[[ _createScrolledDisplay | Line: 227 | Upvalues: v1 (copy), v7 (copy), RunService (copy) ]]
	local v12 = p1.Instance:HasTag("ScrollingFrame") and p1.Instance or (p1.Instance:FindFirstChildOfClass("ScrollingFrame") or v1.FindElement(p1.Instance, "ScrollingFrame"))
	if v12 and v12:IsA("ScrollingFrame") then
		local v2 = v12:FindFirstChildWhichIsA("UIListLayout")
		if not v2 then
			warn("\226\154\160\239\184\143 MultiItemDisplay, ScrollingFrame must have a UIListLayout for Scroll display", p1.Instance)
			return
		end
		local Padding = v2.Padding
		if Padding.Scale ~= 0 then
			warn("\226\154\160\239\184\143 MultiItemDisplay, ScrollingFrame padding is defined with scale, which might cause display issues", p1.Instance)
		end
		local v3 = p1:_createListDisplay(p2)
		v12.ClipsDescendants = true
		v12.ScrollingEnabled = false
		v12.AutomaticCanvasSize = Enum.AutomaticSize.Y
		local function resetLayoutOrders() --[[ resetLayoutOrders | Line: 254 | Upvalues: v3 (copy) ]]
			for i, v in ipairs(v3) do
				v.Instance.LayoutOrder = i
			end
		end
		for i, v in ipairs(v3) do
			v.Instance.LayoutOrder = i
		end
		local v4 = 1
		local v5 = v3[v4]
		if not v5.Instance:FindFirstChildWhichIsA("UIAspectRatioConstraint") then
			warn("\226\154\160\239\184\143 MultiItemDisplay, Scrolling items do not have an UIAspectRatioConstraint, which might cause display issues", p1.Instance)
		end
		local v6 = if v12.ScrollingDirection == Enum.ScrollingDirection.X then "X" else "Y"
		local v72 = v6 == "X" and Vector2.new(1, 0) or Vector2.new(0, 1)
		local v8 = tonumber(p1.Config.Speed) or 15
		local function updateScroll(p12) --[[ updateScroll | Line: 275 | Upvalues: v2 (copy), v12 (copy), v6 (copy), v5 (ref), p2 (ref), v3 (copy), p1 (copy), v8 (copy), v72 (copy), Padding (copy), v4 (ref) ]]
			local AbsoluteContentSize = v2.AbsoluteContentSize
			local AbsoluteWindowSize = v12.AbsoluteWindowSize
			v12.CanvasSize = UDim2.fromOffset(AbsoluteContentSize.X, AbsoluteContentSize.Y)
			if AbsoluteContentSize[v6] <= AbsoluteWindowSize[v6] then
				return
			end
			if AbsoluteContentSize[v6] < AbsoluteWindowSize[v6] + v5.Instance.AbsoluteSize[v6] then
				for i = 1, p2 do
					local v1 = v3[i]
					table.insert(v3, (p1.Maid:GiveTask(p1:_createItemDisplay(v1.Item, v1.Amount.Value))))
				end
				p2 = p2 + p2
				for i, v in ipairs(v3) do
					v.Instance.LayoutOrder = i
				end
			end
			local v52 = v12
			v52.CanvasPosition = v52.CanvasPosition + v72 * (AbsoluteWindowSize[v6] / v8) * p12
			if not (v5.Instance.AbsolutePosition[v6] + v5.Instance.AbsoluteSize[v6] - v12.AbsolutePosition[v6] <= -Padding.Offset) then
				return
			end
			v4 = v4 % p2 + 1
			local v62 = v5.Instance
			v62.LayoutOrder = v62.LayoutOrder + p2
			v5 = v3[v4]
			local v7 = v12
			v7.CanvasPosition = v7.CanvasPosition - (v5.Instance.AbsoluteSize[v6] + Padding.Offset) * v72
			if not (v5.Instance.LayoutOrder >= 2147483647) then
				return
			end
			for i, v in ipairs(v3) do
				v.Instance.LayoutOrder = i
			end
		end
		local v9 = v1.FindGuiScreenAncestor(p1.Instance)
		if v9 then
			local v10 = v7.new()
			p1.Maid:GiveTask(v10)
			local function screenStateChanged() --[[ screenStateChanged | Line: 319 | Upvalues: v9 (copy), v10 (copy), RunService (ref), updateScroll (copy) ]]
				if v9:IsOpen() then
					v10:GiveTask(RunService.Heartbeat:Connect(updateScroll))
				else
					v10:DoCleaning()
				end
			end
			p1.Maid:GiveTask(v9:GetStateChangedSignal():Connect(screenStateChanged))
			if v9:IsOpen() then
				v10:GiveTask(RunService.Heartbeat:Connect(updateScroll))
			else
				v10:DoCleaning()
			end
		else
			warn("\226\154\160\239\184\143 MultiItemDisplay, Could not find ancestor GuiScreen. Scroll display\'s heartbeat will always be running", p1.Instance)
			p1.Maid:GiveTask(RunService.Heartbeat:Connect(updateScroll))
		end
	else
		warn("\226\154\160\239\184\143 MultiItemDisplay, Instance must be a ScrollingFrame for Scroll display", p1.Instance)
	end
end
function t._createItemDisplay(p1, p2, p3) --[[ _createItemDisplay | Line: 335 | Upvalues: v1 (copy) ]]
	local v12 = type(p3) == "table" and p3.Name or p2
	local v2 = type(p3) == "table" and p3.Amount or p3
	local v3 = type(p3) == "table" and p3.DisplayName or nil
	local t = {
		DisplayType = "ItemDisplay",
		Template = p1.Template
	}
	t.Parent = p1.Template and p1.Instance
	t.Instance = not p1.Template and p1.Instance
	t.Item = if type(p3) == "table" and p3 then p3 else v12
	t.DisplayName = v3
	t.Amount = {
		Value = v2,
		AlwaysVisible = p1.Config.Amount.AlwaysVisible,
		Format = p1.Config.Amount.Format
	}
	t.ItemData = type(p3) == "table" and p3.ItemData or {}
	t.DoNotSetViewport = p1.Config.DoNotSetViewport
	t.DoNotShowToolTip = p1.Config.DoNotShowToolTip
	local v9 = v1.AddComponent("GuiObject", t)
	if p1.Config.ItemAdded then
		local v10 = if typeof(p3) == "table" and p3 then p3 else {
	Name = v12,
	Amount = v2
}
		v10.Name = v12
		v10.Amount = v2
		p1.Config.ItemAdded(p1, v9, v10)
	end
	return v9
end
function t._getSingleItemDisplay(p1) --[[ _getSingleItemDisplay | Line: 375 | Upvalues: v1 (copy) ]]
	local v12 = p1:_findImageLabel(p1.Instance)
	local v2 = p1.Instance
	if not v12 and p1.Template then
		local v3 = v1.CloneTemplate(p1.Template)
		v3.Visible = true
		v3.Parent = p1.Instance
		v2, v12 = v3, p1:_findImageLabel(v3)
	end
	return v2, v12
end
function t._findImageLabel(p1, p2) --[[ _findImageLabel | Line: 393 | Upvalues: v1 (copy) ]]
	local v12 = v1.FindElement(p2, "ImageLabel")
	if v12 and not v12:HasTag("DefaultTemplate") then
		return v12
	else
		return p2.ClassName:find("Image") and p2
	end
end
function t.Destroy(p1) --[[ Destroy | Line: 402 | Upvalues: v5 (copy) ]]
	if p1.Config.OnDestroyed then
		p1.Config.OnDestroyed(p1)
	end
	v5(p1)
end
return t