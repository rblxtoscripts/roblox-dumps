-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("Maid")
local v2 = Sonar("safeDestroy")
local v3 = Sonar("GuiFrameworkService")
local v4 = Sonar("TableUtils")
local v5 = Sonar("FormatString")
local v6 = Sonar("Signal")
local v7 = game:GetService("RunService"):IsStudio()
local t2 = {}
function t.new(p1) --[[ new | Line: 22 | Upvalues: t (copy), v1 (copy), v3 (copy), t2 (copy) ]]
	local v2 = setmetatable({}, t)
	v2.Maid = v1.new()
	v2.Tabs = {}
	v2.Config = p1
	v2.Parent = p1.Instance
	v2.Instance = p1.Instance
	v2.LayoutOrderCycleIndex = 1
	v2.TabFrames = p1.TabFrames or v3.FindElement(p1.Instance, "TabFrames")
	v2.TabButtons = p1.TabButtons or v3.FindElement(p1.Instance, "TabButtons")
	v2.LeftCycleButton = p1.LeftCycleButton or v3.FindElement(v2.Parent, "LeftButton")
	v2.RightCycleButton = p1.RightCycleButton or v3.FindElement(v2.Parent, "RightButton")
	if v2.Config.Circular then
		v2.EvenLayoutOrderFixFrame = v3.FindElement(v2.Parent, "EvenLayoutOrder")
		if not v2.EvenLayoutOrderFixFrame then
			warn("\226\154\160\239\184\143 TabNavigator, EvenLayoutOrderFixFrame not found but circular is true, cycle may not align correctly")
		end
	end
	for v7, v8 in { v2.LeftCycleButton, v2.RightCycleButton } do
		if v8 then
			local v9 = if v8 == v2.LeftCycleButton then -1 else 1
			v3.AddComponent("Button", {
				Instance = v8,
				OnClick = function() --[[ OnClick | Line: 51 | Upvalues: v2 (copy), v9 (copy) ]]
					v2:CycleTabs(v9)
				end
			})
		end
	end
	for v11, v122 in p1.Tabs or {} do
		v2:AddTab(v11, v122)
	end
	if v2.TabFrames and not v2.Config.DoNotRegisterTabFramesFromInstance then
		for v13, v14 in v2.TabFrames:GetChildren() do
			if v14:IsA("GuiObject") and (not v14:HasTag("DefaultTemplate") and v14 ~= v2.TabButtons) then
				v2:AddTab(v14.Name)
			end
		end
	end
	if v2.TabButtons then
		for v15, v16 in v2.TabButtons:GetChildren() do
			if v16:IsA("GuiObject") and (v16:IsA("GuiButton") and not (v16:HasTag("DefaultTemplate") or v2.Config.Exclude and table.find(v2.Config.Exclude, v16))) then
				v2:AddTab(v16.Name, {
					DoNotCreateFrame = not v2.Config.CreateTabFramesFromButtons
				})
			end
		end
	end
	t2[v2.Parent] = v2
	return v2
end
function t.Destroy(p1) --[[ Destroy | Line: 110 | Upvalues: t2 (copy), v2 (copy) ]]
	for v1, v22 in p1.Tabs do
		v22.Maid:DoCleaning()
	end
	t2[p1.Parent] = nil
	v2(p1)
end
function t._getTabsInOrder(p1) --[[ _getTabsInOrder | Line: 119 ]]
	local t = {}
	for v1, v2 in p1.Tabs do
		if v2.LayoutOrder then
			table.insert(t, v2)
		end
	end
	table.sort(t, function(p1, p2) --[[ Line: 126 ]]
		return p1.LayoutOrder < p2.LayoutOrder
	end)
	return t
end
function t._applyCircularLayout(p1, p2, p3) --[[ _applyCircularLayout | Line: 132 ]]
	local v1 = #p2
	if v1 == 0 then
		return
	end
	local v2 = (1 / 0)
	for i = 0, v1 - 1 do
		local v4 = if i <= math.floor(v1 / 2) then i + 1 else i - (v1 - 1)
		local v5 = p2[(p3 - 1 + i) % v1 + 1]
		if v5 and v5.Button then
			v5.Button.LayoutOrder = v4
		end
		if v4 < v2 then
			v2 = v4
		end
	end
	if not p1.EvenLayoutOrderFixFrame then
		return
	end
	if v1 % 2 == 0 then
		p1.EvenLayoutOrderFixFrame.Visible = true
		p1.EvenLayoutOrderFixFrame.LayoutOrder = v2 - 1
		return
	end
	p1.EvenLayoutOrderFixFrame.Visible = false
end
function t.CycleTabs(p1, p2) --[[ CycleTabs | Line: 168 ]]
	local v1 = p2 or 1
	if p1.Config.Circular and p1.EvenLayoutOrderFixFrame then
		local v2 = p1:_getTabsInOrder()
		if not v2[1] then
			return
		end
		local v3 = p1:GetOpenedTab()
		local v4 = p1.LayoutOrderCycleIndex or 1
		if v3 then
			for v5, v6 in v2 do
				if v6 == v3 then
					v4 = v5
					break
				end
			end
		end
		local v7 = v4 + v1
		if v7 < 1 then
			v7 = #v2
		elseif #v2 < v7 then
			v7 = 1
		end
		p1.LayoutOrderCycleIndex = v7
		p1:_applyCircularLayout(v2, v7)
		p1:OpenTab(v2[v7].Name)
	else
		local v8 = p1:_getTabsInOrder()
		if not v8[1] then
			return
		end
		local v9 = p1:GetOpenedTab()
		local v10 = p1.LayoutOrderCycleIndex or 1
		if v9 then
			for v11, v12 in v8 do
				if v12 == v9 then
					v10 = v11
					break
				end
			end
		end
		local v13 = v10 + v1
		if p1.Config.Circular then
			if v13 < 1 then
				v13 = #v8
			elseif #v8 < v13 then
				v13 = 1
			end
		elseif v13 < 1 or #v8 < v13 then
			return
		end
		p1.LayoutOrderCycleIndex = v13
		if p1.Config.Circular and p1.EvenLayoutOrderFixFrame then
			p1:_applyCircularLayout(v8, v13)
		end
		p1:OpenTab(v8[v13].Name)
	end
end
function t._getTabLayoutOrder(p1, p2) --[[ _getTabLayoutOrder | Line: 236 ]]
	if p2.LayoutOrder then
		return p2.LayoutOrder
	end
	local t = {}
	for v1, v2 in p1.Tabs do
		if v2.LayoutOrder then
			t[v2.LayoutOrder] = true
		end
	end
	local count = 1
	while t[count] do
		count = count + 1
	end
	return count
end
function t.AddTab(p1, p2, p3) --[[ AddTab | Line: 256 | Upvalues: v1 (copy), v3 (copy), v6 (copy), v5 (copy), v4 (copy) ]]
	if p1.Tabs[p2] then
		return
	end
	local v2 = p3 or {}
	local v32 = v1.new()
	local v42 = v2.Button or p1.TabButtons and (p1.TabButtons:FindFirstChild(p2) or v3.FindElement(p1.TabButtons, "TabButton_" .. p2))
	if not v42 and (next(v2) and not (v2.DisplayAll or p1.Config.DoNotCreateButton)) then
		local v52 = p1.Config.TabButtonTemplate or v3.FindElement(p1.TabButtons, "DefaultTemplate", {
			IgnoreParent = true
		})
		if v52 then
			local v62 = v3.CloneTemplate(v52)
			v62.Name = p2
			v62.Visible = true
			v62.Parent = p1.TabButtons
			v2.TabButtonCreated = true
			v32:GiveTask(v62)
			v42 = v62
		end
	end
	local v7 = v2.Instance or p1.TabFrames and (p1.TabFrames:FindFirstChild(p2) or v3.FindElement(p1.TabFrames, "TabFrame_" .. p2))
	if not v7 and (next(v2) and not (v2.DoNotCreateFrame or p1.Config.DoNotCreateTabFrames)) then
		local v8, v9
		if type(v2.TabFrameTemplate) == "string" then
			v8 = v3.FindElement(p1.TabFrames, v2.TabFrameTemplate)
			if not v8 then
				v8 = v2.TabFrameTemplate
				if not v8 then
					v9 = p1.Config.TabFrameTemplate
					v8 = type(v9) == "string" and v3.FindElement(p1.TabFrames, p1.Config.TabFrameTemplate, {
						IgnoreParent = true
					}) or (p1.Config.TabFrameTemplate or v3.FindElement(p1.TabFrames, "DefaultTemplate", {
						IgnoreParent = true
					}))
				end
			end
		else
			v8 = v2.TabFrameTemplate
			if not v8 then
				v9 = p1.Config.TabFrameTemplate
				v8 = type(v9) == "string" and v3.FindElement(p1.TabFrames, p1.Config.TabFrameTemplate, {
					IgnoreParent = true
				}) or (p1.Config.TabFrameTemplate or v3.FindElement(p1.TabFrames, "DefaultTemplate", {
					IgnoreParent = true
				}))
			end
		end
		if v8 then
			local v10 = v3.CloneTemplate(v8)
			v10.Name = p2
			v10.Visible = false
			v10.Parent = p1.TabFrames
			v32:GiveTask(v10)
			v7 = v10
		end
	end
	if not (v7 or (v42 or v2.DisplayAll)) then
		warn("\226\154\160\239\184\143 TabNavigator, No tab frame or button found for", p2)
		return
	end
	local v11 = p1:_getTabLayoutOrder(v2)
	local v122 = v6.new()
	local t = {
		IsOpen = false,
		ContentsLoaded = false,
		Name = p2,
		Instance = v7,
		Button = v42,
		OnOpen = {},
		OnClose = {},
		OpenAsDefault = v2.OpenAsDefault,
		Config = v2,
		Maid = v32,
		ContentMaid = v1.new(),
		LayoutOrder = v11,
		StateChangedSignal = v122
	}
	if p1.Config.Metadata then
		for v13, v14 in p1.Config.Metadata do
			t[v13] = v14
		end
		for v15, v16 in p1.Config.Metadata do
			v2[v15] = v16
		end
	end
	v32:GiveTask(v122:Connect(function(p12) --[[ onStateChanged | Line: 338 | Upvalues: p1 (copy), t (copy) ]]
		if not p1.Config.OnStateChanged then
			return
		end
		p1.Config.OnStateChanged(t, true)
	end))
	if p1.Config.OnStateChanged then
		p1.Config.OnStateChanged(t, true)
	end
	if v42 then
		local t2 = {
			Instance = v3.FindElement(v42, "Button") or v42
		}
		t2.Preset = v2.ButtonPreset or p1.Config.ButtonPreset
		function t2.OnClick() --[[ OnClick | Line: 351 | Upvalues: v2 (ref), t (copy), p1 (copy), p2 (copy) ]]
			if v2.OnClick then
				v2.OnClick(t)
				return
			end
			if p1:IsTabOpen(p2) and p1.Config.OpenDefaultTabOnDeselect then
				p1:OpenDefaultTab()
			else
				p1:OpenTab(p2)
			end
		end
		t2.OnSelected = t.OnSelected or p1.Config.OnSelected
		t2.OnDeselected = t.OnDeselected or p1.Config.OnDeselected
		local v21 = v3.AddComponent("Button", t2)
		t.Maid:GiveTask(v21)
		if v2.TabButtonCreated then
			t.Maid:GiveTask(v42)
		end
		t.TabButton = v21
		local v22 = v3.FindElement(v42, "NameLabel")
		if v22 then
			v22.Text = v5.GetDisplayName(v2, t.Name)
		elseif not p1.Config.DoNotShowToolTip then
			t.Maid:GiveTask(v3.AddComponent("ToolTip", {
				Instance = v42,
				Text = v5.GetDisplayName(v2, v5.separateWordsInString(p2))
			}))
		end
		if v2.ButtonImage then
			local v23 = v3.FindElement(v42, "Viewport")
			if v23 then
				v23.Image = v2.ButtonImage
				if v2.ButtonColor then
					v23.ImageColor3 = v2.ButtonColor
				end
			end
		end
		table.insert(t.OnOpen, function() --[[ Line: 396 | Upvalues: v21 (copy) ]]
			v21:Select()
			v21:SetSubState("TabSelected", true)
		end)
		table.insert(t.OnClose, function() --[[ Line: 401 | Upvalues: v21 (copy) ]]
			v21:Deselect()
			v21:SetSubState("TabSelected", false)
		end)
		if v2.TabButtonCreated then
			v42.LayoutOrder = t.LayoutOrder
		end
	end
	for v24, v25 in { "OnOpen", "OnClose" } do
		if p1.Config[v25] then
			table.insert(t[v25], p1.Config[v25])
		end
		if v2[v25] then
			table.insert(t[v25], v2[v25])
		end
	end
	for v30, v31 in v2 do
		if v30:sub(1, 2) == "On" and not t[v30] then
			t[v30] = v31
		end
	end
	p1.Tabs[p2] = t
	if p1.Config.Circular and p1.EvenLayoutOrderFixFrame then
		p1.EvenLayoutOrderFixFrame.Visible = v4.Count(p1.Tabs) % 2 == 0
	end
	if v2.OnCreated then
		v2.OnCreated(t)
	end
	if p1.Config.OnCreated then
		p1.Config.OnCreated(t)
	end
	return t
end
function t.RemoveTab(p1, p2) --[[ RemoveTab | Line: 445 ]]
	local v1 = p1:_getTab(p2)
	if not v1 then
		return
	end
	v1.Maid:DoCleaning()
	p1.Tabs[p2] = nil
end
function t._getTab(p1, p2) --[[ _getTab | Line: 453 ]]
	if type(p2) == "string" then
		return p1.Tabs[p2]
	end
	if typeof(p2) ~= "Instance" then
		return nil
	end
	for v1, v2 in p1.Tabs do
		if v2.Instance == p2 then
			return v2
		end
	end
	return nil
end
function t._runCallbacks(p1, p2, p3, p4) --[[ _runCallbacks | Line: 467 | Upvalues: v7 (copy) ]]
	local v2 = if p4 then p4 else {}
	for v3, v4 in p2 do
		if v7 then
			v4(p3, v2)
			continue
		end
		local v5, v6 = pcall(v4, p3, v2)
		if not v5 then
			warn("\226\154\160\239\184\143 TabNavigator, Error in", p3.Name, "callback:", v6, debug.traceback())
		end
	end
end
function t.AreTabsIndividualFrames(p1) --[[ AreTabsIndividualFrames | Line: 482 ]]
	for v1, v2 in p1.Tabs do
		if v2.Instance then
			return true
		end
	end
	return false
end
function t.GetDisplayAllTabs(p1, p2) --[[ GetDisplayAllTabs | Line: 491 ]]
	local t = {}
	for v1, v2 in p1.Tabs do
		if v2.Config.DisplayAll and (not p2 or (not p2.IsOpen or v2.IsOpen)) then
			t[v2.Name] = v2
		end
	end
	return t
end
function t.HasDisplayAllTab(p1) --[[ HasDisplayAllTab | Line: 505 ]]
	for v1, v2 in p1.Tabs do
		if v2.Config.DisplayAll then
			return true
		end
	end
	return false
end
function t.CanOpenTab(p1, p2, p3) --[[ CanOpenTab | Line: 514 ]]
	local v1 = p1:_getTab(p2)
	if not v1 then
		return false
	end
	if not v1.Config.CanOpen then
		return true
	end
	if v1.Config.CanOpen(v1, if p3 then p3.Args else p3) then
		return true
	else
		return false
	end
end
function t.OpenTab(p1, p2, p3) --[[ OpenTab | Line: 527 ]]
	local v1 = p1:_getTab(p2)
	if not v1 then
		warn("\226\154\160\239\184\143 TabNavigator, Tab not found", p2)
		return
	end
	if not p1:CanOpenTab(p2, p3) then
		return false
	end
	local IsOpen = v1.IsOpen
	v1.IsOpen = true
	v1.StateChangedSignal:Fire()
	if not p1.Config.MultipleTabsOpen then
		p1:CloseAllTabs(p2)
	end
	if v1.Instance then
		v1.Instance.Visible = true
	end
	if IsOpen or not v1.OnOpen then
		return true
	end
	p1:_runCallbacks(v1.OnOpen, v1, if p3 then p3.Args else p3)
	return true
end
function t.CloseTab(p1, p2, p3) --[[ CloseTab | Line: 557 ]]
	local v1 = p1:_getTab(p2)
	if not v1 then
		warn("\226\154\160\239\184\143 TabNavigator, Tab not found", p2)
		return
	end
	v1.WasOpen = if v1.IsOpen == true then true else false
	v1.IsOpen = false
	v1.StateChangedSignal:Fire()
	if v1.Instance then
		v1.Instance.Visible = false
	end
	if not v1.WasOpen or v1.IsOpen then
		return true
	end
	p1:_runCallbacks(v1.OnClose, v1, if p3 then p3.Args else p3)
	return true
end
function t.CloseAllTabs(p1, p2) --[[ CloseAllTabs | Line: 579 ]]
	local v2 = p2 and p1:_getTab(p2) or nil
	for v3, v4 in p1.Tabs do
		if v4 ~= v2 then
			p1:CloseTab(v4.Name)
		end
	end
end
function t.AddCallback(p1, p2, p3, p4) --[[ AddCallback | Line: 589 ]]
	local v1 = p1:_getTab(p2)
	if not v1 then
		warn("\226\154\160\239\184\143 TabNavigator, Tab not found", p2)
		return false
	end
	if p3 ~= "OnOpen" and p3 ~= "OnClose" then
		return false
	end
	table.insert(v1[p3], p4)
	return true
end
function t.OpenDefaultTab(p1) --[[ OpenDefaultTab | Line: 604 ]]
	for v1, v2 in p1.Tabs do
		if v2.OpenAsDefault then
			p1:OpenTab(v1)
			return
		end
	end
	local v3 = (1 / 0)
	local v4 = nil
	for v5, v6 in p1.Tabs do
		if v6.Instance and (v6.LayoutOrder and v6.LayoutOrder < v3) then
			v3 = v6.LayoutOrder
			v4 = v5
		end
	end
	if v4 then
		p1:OpenTab(v4)
		return
	end
	for v7, v8 in p1.Tabs do
		p1:OpenTab(v7)
		return
	end
end
function t.GetOpenedTab(p1) --[[ GetOpenedTab | Line: 635 ]]
	for v1, v2 in p1.Tabs do
		if v2.IsOpen then
			return v2
		end
	end
	return nil
end
function t.IsTabOpen(p1, p2) --[[ IsTabOpen | Line: 644 ]]
	local v1 = p1:_getTab(p2)
	return if v1 then v1.IsOpen else v1
end
function t.GetTabs(p1) --[[ GetTabs | Line: 649 ]]
	return p1.Tabs
end
function t.GetTab(p1, ...) --[[ GetTab | Line: 653 ]]
	return p1:_getTab(...)
end
function t.GetTotalTabs(p1) --[[ GetTotalTabs | Line: 657 | Upvalues: v4 (copy) ]]
	return v4.Count(p1.Tabs)
end
function t.Return(p1) --[[ Return | Line: 661 ]]
	if not p1.Config.ReturnToTab then
		return
	end
	p1:OpenTab(p1.Config.ReturnToTab)
end
function t.ResetTabs(p1, p2) --[[ ResetTabs | Line: 667 ]]
	local v2 = if p2 then p2 else {}
	for v3, v4 in p1.Tabs do
		if not (v2.ExcludeTabs and table.find(v2.ExcludeTabs, v4.Name)) then
			p1:CloseTab(v4.Name)
			v4.ContentsLoaded = false
			v4.ContentMaid:DoCleaning()
		end
	end
end
function t.ResetTab(p1, p2) --[[ ResetTab | Line: 681 ]]
	local v1 = p1:_getTab(p2)
	if not v1 then
		return
	end
	v1.IsOpen = false
	v1.ContentsLoaded = false
	v1.ContentMaid:DoCleaning()
end
function t.RefreshTabs(p1) --[[ RefreshTabs | Line: 691 ]]
	local v1 = p1:GetOpenedTab()
	p1:ResetTabs()
	if not v1 then
		return
	end
	p1:OpenTab(v1.Name)
end
function t.GetNavigator(p1) --[[ GetNavigator | Line: 699 | Upvalues: t2 (copy) ]]
	if t2[p1] then
		return t2[p1]
	end
	for v1, v2 in t2 do
		if v2:_getTab(p1) then
			return v2
		end
	end
	return nil
end
return t