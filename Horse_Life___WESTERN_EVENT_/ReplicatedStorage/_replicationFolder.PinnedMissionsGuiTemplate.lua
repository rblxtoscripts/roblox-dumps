-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")
local Sonar = require(ReplicatedStorage.Sonar)
local v1 = Sonar("GuiFrameworkService")
local v2 = Sonar("Maid")
local v3 = Sonar("MissionsService")
local v4 = Sonar("Global")
local v5 = Sonar("TableUtils")
local v6 = Sonar("Signal")
local v7 = Sonar("KeyCodeLabel")
local v8 = Sonar("InputTypeService")
local v9 = Sonar("PlayerWrapper").GetClient()
function t.new(p1) --[[ new | Line: 22 | Upvalues: t (copy), v1 (copy), v7 (copy), v2 (copy), v6 (copy), v9 (copy), v4 (copy), v8 (copy), GuiService (copy) ]]
	local v22 = setmetatable({}, t)
	v22.GuiProvider = p1
	v22.PinnedScreen = p1:GetScreen("PinnedMissions")
	v22.PinnedScreenInstance = v22.PinnedScreen.Instance
	v22.ShrinkButton = v1.FindElement(v22.PinnedScreenInstance, "ShrinkButton")
	v22.ExpandButton = v1.FindElement(v22.PinnedScreenInstance, "ExpandButton")
	v22.KeyCodeLabel = v7.Get(v22.PinnedScreenInstance)
	v22.OptionsFrame = v22.ShrinkButton.Parent
	v22.GuiAnimationMaid = v2.new()
	v22.PinnedMissionsChangedSignal = v6.new()
	v22.PinnedMissionsOrTasksMap = {}
	v22.Visible = true
	for v3, v42 in { v22.ShrinkButton, v22.ExpandButton } do
		v1.AddComponent("Button", {
			Instance = v42,
			OnClick = function() --[[ OnClick | Line: 49 | Upvalues: v22 (copy) ]]
				v22:_toggleVisible()
			end
		})
		local v5 = v1.FindElement(v42, "NotificationBadge")
		if v5 then
			v1.AddComponent("NotificationBadge", {
				Instance = v5,
				Amount = function() --[[ Amount | Line: 58 | Upvalues: v22 (copy) ]]
					return v22:_getTotalClaimablePinnedMissions()
				end,
				Changed = { v9:GetMissionsChangedSignal() }
			})
		end
	end
	v22.PinnedTabNavigator = v1.AddComponent("TabNavigator", {
		Instance = v22.PinnedScreenInstance
	})
	v22.TabFrameProperties = v1.GetProperties(v22.PinnedTabNavigator.TabFrames, { "Position" })
	v22.OptionsFrameProperties = v1.GetProperties(v22.OptionsFrame, { "Position" })
	v9:GetMissionPinChangedSignal():Connect(function(p1) --[[ Line: 75 | Upvalues: v22 (copy) ]]
		if p1:IsPinned() then
			v22:_addMission(p1)
		else
			v22:_removeMission(p1)
		end
	end)
	for v62, v72 in v9:GetPinnedMissions({
		WithTasks = true
	}) do
		v22:_addMission(v72)
	end
	v22:_toggleVisible(v22.Visible)
	v22.PinnedScreen:AddCallback("CanOpen", function() --[[ Line: 88 | Upvalues: v4 (ref) ]]
		return not v4.AnimationQueueRunning_ItemStream
	end)
	v22.PinnedScreen:AddStateChangedEvents({ v4:GetStateChangedSignal("AnimationQueueRunning_ItemStream") })
	if v22.KeyCodeLabel then
		v22.KeyCodeLabel:BindToControls("OpenPinnedMissions", {
			InputBegan = function(p1, p2, p3) --[[ InputBegan | Line: 97 | Upvalues: v8 (ref), v22 (copy), GuiService (ref) ]]
				if not v8.IsGamepadInputType() then
					v22:_toggleVisible()
					return
				end
				GuiService.SelectedObject = v22.ShrinkButton.Visible and v22.ShrinkButton or v22.ExpandButton
			end
		})
	end
	return v22
end
function t._getMissionCategoryName(p1, p2) --[[ _getMissionCategoryName | Line: 111 ]]
	return p2:GetMissionName() .. "-" .. p2:GetIdentifier()
end
function t._getTotalClaimablePinnedMissions(p1) --[[ _getTotalClaimablePinnedMissions | Line: 115 | Upvalues: v9 (copy) ]]
	local count = 0
	for v1, v2 in v9:GetPinnedMissions({
		WithTasks = true
	}) do
		if v2:IsClaimable() then
			count = count + 1
		end
	end
	return count
end
function t._addMission(p1, p2) --[[ _addMission | Line: 125 | Upvalues: v1 (copy) ]]
	local v12 = p2.Mission or p2
	local v2 = p1:_addCategory(p1:_getMissionCategoryName(v12), v12)
	local v3 = p1.PinnedMissionsOrTasksMap[v12.MissionValue]
	if not v3 then
		v3 = {}
		p1.PinnedMissionsOrTasksMap[v12.MissionValue] = v3
	end
	local function createMission(p1) --[[ createMission | Line: 139 | Upvalues: v1 (ref), v2 (copy) ]]
		return v1.AddComponent("GuiObject", {
			DisplayType = "MissionsDisplay",
			Parent = v2.Instance,
			Mission = p1
		})
	end
	if p2.Mission then
		v3[p2.TaskValue] = v1.AddComponent("GuiObject", {
			DisplayType = "MissionsDisplay",
			Parent = v2.Instance,
			Mission = p2
		})
	else
		for v4, v5 in v12:GetTasks() do
			v3[v5.TaskValue] = v1.AddComponent("GuiObject", {
				DisplayType = "MissionsDisplay",
				Parent = v2.Instance,
				Mission = v5
			})
		end
	end
	p1.PinnedMissionsChangedSignal:Fire(v12)
end
function t._removeMission(p1, p2) --[[ _removeMission | Line: 160 ]]
	if p2.Mission then
		local v1 = p1.PinnedMissionsOrTasksMap[p2.Mission.MissionValue]
		if not v1 then
			return
		end
		local v2 = v1[p2.TaskValue]
		if v2 then
			v2:Destroy()
			v1[p2.TaskValue] = nil
		end
		if not next(v1) then
			p1.PinnedMissionsOrTasksMap[p2.Mission.MissionValue] = nil
			p1.PinnedMissionsChangedSignal:Fire(p2.Mission)
			p1:_removeCategory(p1:_getMissionCategoryName(p2.Mission))
		end
	else
		for v3, v4 in p2:GetTasks() do
			p1:_removeMission(v4)
		end
	end
end
function t._addCategory(p1, p2, p3) --[[ _addCategory | Line: 187 | Upvalues: v3 (copy), v1 (copy), v5 (copy) ]]
	local v12 = p1.PinnedTabNavigator:_getTab(p2)
	if v12 then
		return v12
	end
	local v2 = not next(p1.PinnedTabNavigator:GetTabs())
	local v32 = v3.GetColorForCategory(p3.MissionData.Category)
	local v4 = p1.PinnedTabNavigator:AddTab(p2, {
		ButtonImage = "rbxassetid://93545486097791",
		DisplayName = p3:GetDisplayName(),
		ButtonColor = v32
	})
	local v52 = v1.FindElement(v4.Button, "NotificationBadge")
	if v52 then
		v4.Maid:GiveTask(v1.AddComponent("NotificationBadge", {
			Instance = v52,
			Amount = function() --[[ Amount | Line: 209 | Upvalues: p3 (copy) ]]
				return p3:GetTotalClaimable()
			end,
			Changed = { p3:GetChangedSignal() }
		}))
	end
	v4.Instance.Header.Visible = true
	local v6 = v1.AddComponent("MissionsDisplay", {
		Instance = v4.Instance.Header,
		Mission = p3
	})
	local function setProgressLabels() --[[ setProgressLabels | Line: 224 | Upvalues: p1 (copy), p3 (copy), v5 (ref), v6 (copy), v1 (ref), v4 (ref) ]]
		local v12 = p1.PinnedMissionsOrTasksMap[p3.MissionValue]
		if v12 and v5.Count(v12) <= 1 then
			for v2, v3 in v6.ProgressLabels do
				v3.Visible = false
			end
		else
			if not v6:_getTimeToComplete() then
				return
			end
			for v42, v52 in { "Left", "Right" } do
				local v62 = v1.FindElement(v4.Instance.Header, "ProgressLabel" .. v52)
				if v62 then
					v62.Visible = v52 == "Right"
				end
			end
		end
	end
	v4.Maid:GiveTask(p1.PinnedMissionsChangedSignal:Connect(function(p1) --[[ Line: 241 | Upvalues: p3 (copy), setProgressLabels (copy) ]]
		if p1 ~= p3 then
			return
		end
		setProgressLabels()
	end))
	v4.Maid:GiveTask(v6)
	if v2 then
		p1.PinnedTabNavigator:OpenDefaultTab()
	end
	p1:_updateMultipleTabs()
	return v4
end
function t._removeCategory(p1, p2) --[[ _removeCategory | Line: 258 ]]
	p1.PinnedTabNavigator:RemoveTab(p2)
	p1:_updateMultipleTabs()
	p1.PinnedTabNavigator:OpenDefaultTab()
end
function t._setTabButtonSizes(p1) --[[ _setTabButtonSizes | Line: 265 ]]
	local v1 = p1.PinnedTabNavigator:GetTotalTabs()
	local v2 = (1 - p1.PinnedTabNavigator.TabButtons.UIListLayout.Padding.Scale * (v1 - 1)) / v1
	for v3, v4 in p1.PinnedTabNavigator:GetTabs() do
		v4.Button.Size = UDim2.new(v4.Button.Size.X.Scale, 0, v2, 0)
	end
end
function t._toggleVisible(p1, p2) --[[ _toggleVisible | Line: 275 ]]
	p1.Visible = if p2 == nil or not p2 then not p1.Visible else p2
	p1.ShrinkButton.Visible = p1.Visible
	p1.ExpandButton.Visible = not p1.Visible
	p1:_updateMultipleTabs()
end
function t._updateMultipleTabs(p1) --[[ _updateMultipleTabs | Line: 284 | Upvalues: v1 (copy) ]]
	p1.OptionsFrame.Visible = next(p1.PinnedTabNavigator:GetTabs())
	local v12 = p1.PinnedTabNavigator:GetTotalTabs() > 1
	if v12 then
		p1.TabFramesOpenPosition = UDim2.new(p1.OptionsFrame.Size.X.Scale + 0.1, p1.TabFrameProperties.Position.X.Offset, p1.TabFrameProperties.Position.Y.Scale, p1.TabFrameProperties.Position.Y.Offset)
	else
		p1.TabFramesOpenPosition = UDim2.new(-0.225, p1.TabFrameProperties.Position.X.Offset, p1.ShrinkButton.Size.Y.Scale + 0.01, p1.TabFrameProperties.Position.Y.Offset)
	end
	if p1.Visible then
		v1.spring(p1.PinnedTabNavigator.TabFrames, 0.8, 3, {
			Stop = true,
			Position = p1.TabFramesOpenPosition
		})
	else
		v1.spring(p1.PinnedTabNavigator.TabFrames, 0.8, 3, {
			Stop = true,
			Position = p1.TabFramesOpenPosition + UDim2.new(-10, 0, 0, 0)
		})
	end
	local v2 = v1.GetInOrderOfLayout(p1.PinnedTabNavigator:GetTabs())
	p1.GuiAnimationMaid.AnimatingScale = nil
	if v12 and p1.Visible then
		p1.GuiAnimationMaid.AnimatingScale = task.spawn(function() --[[ Line: 309 | Upvalues: v2 (copy), v1 (ref) ]]
			for i = 1, #v2 do
				v1.spring(v2[i].Button.UIScale, 1, 4, {
					Priority = 1,
					Stop = true,
					Scale = 1
				})
				task.wait(0.05)
			end
		end)
	else
		p1.GuiAnimationMaid.AnimatingScale = task.spawn(function() --[[ Line: 317 | Upvalues: v2 (copy), v1 (ref) ]]
			for i = #v2, 1, -1 do
				v1.spring(v2[i].Button.UIScale, 1, 4, {
					Priority = 1,
					Stop = true,
					Scale = 0
				})
				task.wait(0.05)
			end
		end)
	end
	p1:_setTabButtonSizes()
end
function t.Init(p1) --[[ Init | Line: 329 ]] end
t:Init()
return t