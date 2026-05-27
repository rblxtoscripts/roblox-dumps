-- https://lua.expert/
local t = {}
t.__index = t
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local TweenService = game:GetService("TweenService")
game:GetService("ProximityPromptService")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local StarterGui = game:GetService("StarterGui")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("FoVService")
local v2 = Sonar("LightingService")
local v3 = Sonar("PlayerWrapper")
local v4 = Sonar("GuiReplicationService")
local v5 = Sonar("safeDestroy")
local v6 = Sonar("Maid")
local v7 = Sonar("StorageUtils")
local v8 = Sonar("EventUtils")
local v9 = Sonar("InputTypeService")
local v10 = Sonar("Signal")
local v11 = Sonar("GuiInsets")
local v12 = Sonar("GameStates")
local v13 = Sonar("Lock")
local v14 = v7.GetConfig("GuiFramework")()
local DefaultGroup = v14.DefaultGroup
local AllGroup = v14.AllGroup
local v15 = DefaultGroup
local TweenStyle = v14.TweenStyle
local Offsets = v14.Offsets
local v16 = game:GetService("RunService"):IsStudio()
local t2 = {}
local t3 = {}
local t4 = {}
local t5 = {}
local t6 = {}
local t7 = {}
local t8 = {}
local t9 = {}
local t10 = {}
local v17 = nil
local v18 = v13.new()
v18:BindToLock(function(p1) --[[ Line: 439 | Upvalues: v3 (copy) ]]
	local Player = v3:GetClient().Player
	Player.CameraMinZoomDistance = if p1 then 1 else 0
end)
local function updateFOVState() --[[ updateFOVState | Line: 444 | Upvalues: t5 (copy), t2 (copy), v1 (copy), v14 (copy) ]]
	local v12 = nil
	local v2 = false
	local v3 = false
	for v4, v5 in t5 do
		local v6 = t2[v4]
		if v6 and v6.State.IsOpen then
			v2 = true
			if type(v5) == "number" then
				if v12 then
					v12 = math.max(v12, v5)
					continue
				end
				v12 = v5
				continue
			end
			if v5 == true then
				v3 = true
			end
		end
	end
	if not v1.getModifier(v14.FoVScreenModifier) then
		return
	end
	if not v2 then
		v1.setModifier(v14.FoVScreenModifier, false)
		return
	end
	if v3 then
		v1.setModifierValue(v14.FoVScreenModifier, "Reset")
	elseif v12 then
		v1.setModifierValue(v14.FoVScreenModifier, v12)
	end
	v1.setModifier(v14.FoVScreenModifier, true)
end
local function updateBlurState() --[[ updateBlurState | Line: 478 | Upvalues: t6 (copy), t2 (copy), v2 (copy), v14 (copy) ]]
	local v1 = nil
	local v22 = false
	local v3 = false
	for v4, v5 in t6 do
		local v6 = t2[v4]
		if v6 and v6.State.IsOpen then
			v22 = true
			if type(v5) == "number" then
				if v1 then
					v1 = math.max(v1, v5)
					continue
				end
				v1 = v5
				continue
			end
			if v5 == true then
				v3 = true
			end
		end
	end
	if not v2.getSetting(v14.LightingSettings.Open) then
		return
	end
	if not v22 then
		v2.setLightingMode(v14.LightingSettings.Open, false, false, true)
		return
	end
	if v1 then
		v2.setSettingDynamically(v14.LightingSettings.Open, "Blur", "Size", v1, true)
	elseif v3 then
		v2.setSettingDynamically(v14.LightingSettings.Open, "Blur", "Size", v2.getDefaultProperty(v14.LightingSettings.Open, "Blur", "Size"), true)
	end
	v2.setLightingMode(v14.LightingSettings.Open, true, false, true)
end
local function updateCustomEffectsState() --[[ updateCustomEffectsState | Line: 513 | Upvalues: t10 (copy), v14 (copy), t2 (copy) ]]
	for v1, v2 in t10 do
		local v3 = v14.GuiScreenEffects[v1]
		if v3 then
			local v4 = false
			for v5, v6 in v2 do
				local v7 = t2[v5]
				if v7 and v7.State.IsOpen then
					v4 = true
					break
				end
			end
			v3(v4)
		end
	end
end
local function updateControlsState() --[[ updateControlsState | Line: 533 | Upvalues: t7 (copy), t2 (copy), v3 (copy) ]]
	local v1 = false
	for k in pairs(t7) do
		local v2 = t2[k]
		if v2 and v2.State.IsOpen then
			v1 = true
			break
		end
	end
	v3:GetClient():SetControlsEnabled(not v1, "GuiScreen")
end
local function closeChatWindow() --[[ closeChatWindow | Line: 545 | Upvalues: StarterGui (copy) ]]
	pcall(StarterGui.SetCore, StarterGui, "ChatActive", false)
end
local function updateProximityPromptState() --[[ updateProximityPromptState | Line: 549 | Upvalues: t9 (copy), t2 (copy), v3 (copy) ]]
	local v1 = false
	for k in pairs(t9) do
		local v2 = t2[k]
		if v2 and v2.State.IsOpen then
			v1 = true
		end
	end
	v3:GetClient():SetProximityPromptsEnabled(not v1, "GuiScreen")
end
local function isGroupFullScreen(p1) --[[ isGroupFullScreen | Line: 562 | Upvalues: t3 (copy) ]]
	local v1 = t3[p1]
	if not v1 then
		return false
	end
	for v2, v3 in v1.Screens do
		if v3.Config.FullScreen and table.find(v3.Config.Groups, p1) then
			return true
		end
	end
	return false
end
local function isAnyFullScreenGroupOpen(p1) --[[ isAnyFullScreenGroupOpen | Line: 577 | Upvalues: t3 (copy), isGroupFullScreen (copy) ]]
	local v2 = if type(p1) == "table" and p1 then p1 else { p1 }
	for v3, v4 in t3 do
		if not table.find(v2, v3) and (v4.State.IsOpen and isGroupFullScreen(v3)) then
			return true
		end
	end
	return false
end
local function hasOpenScreensInGroup(p1) --[[ hasOpenScreensInGroup | Line: 592 | Upvalues: t3 (copy) ]]
	local v1 = t3[p1]
	if not v1 then
		return false
	end
	for v2, v3 in v1.Screens do
		if v3.State.IsOpen then
			return true
		end
	end
	return false
end
local function areFramesInLayerCollectorVisible(p1) --[[ areFramesInLayerCollectorVisible | Line: 604 ]]
	for v1, v2 in p1 do
		if v2.Instance and v2.Instance.Visible then
			return true
		end
	end
	return false
end
local function getInstanceWithTag(p1) --[[ getInstanceWithTag | Line: 613 | Upvalues: CollectionService (copy), StarterGui (copy) ]]
	local t = {}
	for v1, v2 in CollectionService:GetTagged(p1) do
		if not v2:IsDescendantOf(StarterGui) then
			table.insert(t, v2)
		end
	end
	if not (#t > 1) then
		return t[1]
	end
	warn("\226\154\160\239\184\143 GuiProvider: Multiple screens found for tag:", p1)
	return t[1]
end
local function recalculateCurrentScreenLayer() --[[ recalculateCurrentScreenLayer | Line: 633 | Upvalues: v17 (ref), t2 (copy) ]]
	v17 = nil
	for v1, v2 in t2 do
		if v2.State.IsOpen and v2.OpenedWithLayer ~= nil then
			if v17 == nil then
				v17 = v2.OpenedWithLayer
				continue
			end
			v17 = math.max(v17, v2.OpenedWithLayer)
		end
	end
	if v17 ~= 0 then
		return v17
	end
	v17 = nil
	return v17
end
local function updateCurrentScreenLayer(p1) --[[ updateCurrentScreenLayer | Line: 654 | Upvalues: v17 (ref) ]]
	if p1 == nil then
		return
	end
	if v17 == nil then
		v17 = p1
		return
	end
	v17 = math.max(v17, p1)
end
local function checkOpenBlocking(p1) --[[ checkOpenBlocking | Line: 666 | Upvalues: v17 (ref) ]]
	if v17 == nil then
		return true
	end
	if p1 == nil then
		return false
	end
	if p1 < v17 then
		return false
	else
		return true
	end
end
local function closeScreensByPriority(p1, p2, p3) --[[ closeScreensByPriority | Line: 684 | Upvalues: t2 (copy), AllGroup (copy) ]]
	local v2 = if p2 then p2 else {}
	if not v2.FullScreen then
		return
	end
	local v3, v4 = if p3 then p3 else {}, v2
	for v5, v6 in t2 do
		if not table.find(v3, v5) and (v6:IsOpen() and not (table.find(v6.Config.Groups, AllGroup) or v6.Config.Overlay)) then
			local OpenedWithLayer = v6.OpenedWithLayer
			if p1 == nil then
				v6:Close(v4)
				continue
			end
			if OpenedWithLayer == nil then
				v6:Close(v4)
				continue
			end
			if OpenedWithLayer < p1 then
				v6:Close(v4)
			end
		end
	end
end
function t._runCallbacks(p1, p2, p3, p4) --[[ _runCallbacks | Line: 729 | Upvalues: t2 (copy), v14 (copy), v16 (copy) ]]
	local v1 = t2[p3]
	if not v1 then
		return
	end
	local v3 = p4 or {}
	for v4, v5 in p2 do
		if v14.ThreadedCallbacks then
			task.spawn(function() --[[ Line: 738 | Upvalues: v5 (copy), v1 (copy), v3 (ref) ]]
				local v12, v2 = pcall(v5, v1, v3)
				if v12 then
					return
				end
				warn("\226\157\140 GuiScreen, Error running callback:", v2, debug.traceback())
			end)
			continue
		end
		if v16 then
			v5(v1, v3)
			continue
		end
		local v6, v7 = pcall(v5, v1, v3)
		if not v6 then
			warn("\226\157\140 GuiScreen, Error running callback:", v7, debug.traceback())
		end
	end
end
function t._waitForScreenInitialized(p1, p2) --[[ _waitForScreenInitialized | Line: 757 ]]
	if not (p1.Instance or p1.RequestingReplication) then
		return false
	end
	local IsOpen = p1.State.IsOpen
	local v1 = tick()
	local v2 = false
	while not p1.State.Initialized do
		if p1.State.IsOpen ~= IsOpen then
			return false
		end
		if p1.LastOperation ~= p2 then
			return false
		end
		if not v2 and tick() - v1 >= 5 then
			warn("\226\157\140 GuiScreen, Infinite yield on screen being initialized:", p1.Name)
			v2 = true
		end
		task.wait()
	end
	return true
end
function t._replicateScreen(p1) --[[ _replicateScreen | Line: 788 | Upvalues: v4 (copy) ]]
	if p1.State.Initialized then
		return
	end
	if p1.RequestingReplication then
		return
	end
	local v1 = nil
	local v2 = v4.GetReplicatedScreenData()
	if v2 then
		for v3, v42 in v2 do
			if v42[p1.Config.Tag] then
				v1 = v3
				break
			end
		end
	end
	if v1 then
		p1.RequestingReplication = true
		v4.Get(v1)
	end
	return v1
end
function t._updateLayerCollectorVisibility(p1, p2) --[[ _updateLayerCollectorVisibility | Line: 817 | Upvalues: t4 (copy) ]]
	local v1 = t4[p2]
	if not v1 then
		return
	end
	p1.Maid.DisableLayerCollector = nil
	local v2 = false
	for v3, v4 in v1 do
		if v4.Instance and v4.Instance.Visible then
			v2 = true
			break
		end
	end
	if v2 then
		p2.Enabled = true
	else
		p1.Maid.DisableLayerCollector = task.delay(1, function() --[[ Line: 825 | Upvalues: p2 (copy), v1 (copy) ]]
			local v2 = false
			for v3, v4 in v1 do
				if v4.Instance and v4.Instance.Visible then
					v2 = true
					break
				end
			end
			p2.Enabled = v2
		end)
	end
end
function t._calculateClosePosition(p1, p2, p3) --[[ _calculateClosePosition | Line: 833 ]]
	local Position = p2.Position
	local Size = p2.Size
	if p3 == "Up" then
		return UDim2.new(Position.X.Scale, Position.X.Offset, 0 - Size.Y.Scale * 1.5, Position.Y.Offset - Size.Y.Offset * 1.5)
	end
	if p3 == "Down" then
		return UDim2.new(Position.X.Scale, Position.X.Offset, 1 + Size.Y.Scale * 1.5, Position.Y.Offset + Size.Y.Offset * 1.5)
	end
	if p3 == "Left" then
		return UDim2.new(0 - Size.X.Scale * 1.5, Position.X.Offset - Size.X.Offset * 1.5, Position.Y.Scale, Position.Y.Offset)
	end
	if p3 == "Right" then
		return UDim2.new(1 + Size.X.Scale * 1.5, Position.X.Offset + Size.X.Offset * 1.5, Position.Y.Scale, Position.Y.Offset)
	else
		return UDim2.new(Position.X.Scale, Position.X.Offset, 1 + Size.Y.Scale * 1.5, Position.Y.Offset + Size.Y.Offset * 1.5)
	end
end
function t._applyDeviceInsetAdjustment(p1, p2) --[[ _applyDeviceInsetAdjustment | Line: 867 | Upvalues: v11 (copy) ]]
	if p1.Config.DeviceInset then
		local v1 = v11.GetDeviceScreenInsets()
		return UDim2.new(p2.X.Scale, p2.X.Offset + v1.X / 2 * p1.Config.DeviceInset.X, p2.Y.Scale, p2.Y.Offset + v1.Y / 2 * p1.Config.DeviceInset.Y)
	else
		return p2
	end
end
function t._updatePositionsWithDeviceInsets(p1) --[[ _updatePositionsWithDeviceInsets | Line: 884 ]]
	if not p1.Config.DeviceInset then
		return
	end
	if p1.BasePositions.Open then
		p1.Config.Position = p1:_applyDeviceInsetAdjustment(p1.BasePositions.Open)
	end
	if p1.BasePositions.Close then
		p1.Config.ClosePosition = p1:_applyDeviceInsetAdjustment(p1.BasePositions.Close)
	end
	if p1.Instance and p1.State.IsOpen then
		p1.Instance.Position = p1.Config.Position
		return
	end
	if not p1.Instance or p1.State.IsOpen then
		return
	end
	p1.Instance.Position = p1.Config.ClosePosition
end
function t._setPosition(p1, p2, p3) --[[ _setPosition | Line: 905 | Upvalues: TweenStyle (copy), TweenService (copy) ]]
	if not p1.Instance then
		return
	end
	local v1 = if p2 == "Open" then true else false
	local v2 = v1 and p1.Config.Position or p1.Config.ClosePosition
	local v3 = v1 and TweenStyle.Open or TweenStyle.Close
	if p3 == false or p3 == nil and p1.Config.TweenStyle == false then
		p3 = nil
	elseif p3 == nil and p1.Config.TweenStyle == true then
		p3 = v3
	elseif p3 == nil and typeof(p1.Config.TweenStyle) == "table" then
		local TweenStyle_3 = p1.Config.TweenStyle
		if TweenStyle_3.Direction == nil and TweenStyle_3.TweenInfo == nil then
			local v4 = TweenStyle_3[p2]
			p3 = if v4 == nil then nil elseif typeof(v4) == "string" then v3 elseif v4 == true then v3 else v4
		else
			p3 = if TweenStyle_3.Direction == p2 then TweenStyle_3.TweenInfo or v3 else nil
		end
	elseif p3 == nil then
		p3 = if typeof(p1.Config.TweenStyle) == "string" then if p1.Config.TweenStyle == p2 then v3 else nil else p1.Config.TweenStyle or v3
	end
	if p3 and typeof(p3) == "TweenInfo" then
		local v5 = TweenService:Create(p1.Instance, p3, {
			Position = v2
		})
		if not v1 then
			v5.Completed:Connect(function(p12) --[[ Line: 958 | Upvalues: p1 (copy) ]]
				if p12 == Enum.PlaybackState.Completed then
					p1.Instance.Visible = false
				end
			end)
		end
		v5:Play()
	else
		p1.Instance.Position = v2
		if v1 then
			return
		end
		p1.Instance.Visible = false
	end
end
function t._resolveDeviceSpecificConfig(p1, p2) --[[ _resolveDeviceSpecificConfig | Line: 975 | Upvalues: v9 (copy) ]]
	if typeof(p2) == "table" and p2.Device then
		local v2 = p2.Device[v9.GetDeviceType()]
		if v2 == nil then
			v2 = p2.Device.Default
		end
		return v2
	else
		return p2
	end
end
function t._processPositionConfig(p1, p2, p3, p4) --[[ _processPositionConfig | Line: 990 | Upvalues: Offsets (copy) ]]
	if not p2 then
		return p3.Position
	end
	if typeof(p2) == "UDim2" then
		return p2
	end
	if typeof(p2) == "string" then
		if p4 then
			return p1:_calculateClosePosition(p3, p2)
		else
			return p3.Position
		end
	else
		if typeof(p2) ~= "table" then
			return p3.Position
		end
		local v1 = if p2.Position then if p4 then p1:_calculateClosePosition(p3, p2.Position) else p3.Position else p3.Position
		if p2.Offset then
			local Offset = p2.Offset
			if typeof(Offset) == "boolean" and Offset == true then
				Offset = p4 and Offsets.ClosePosition or Offsets.Position
			end
			if typeof(Offset) == "UDim2" then
				v1 = UDim2.new(v1.X.Scale + Offset.X.Scale, v1.X.Offset + Offset.X.Offset, v1.Y.Scale + Offset.Y.Scale, v1.Y.Offset + Offset.Y.Offset)
			end
		end
		return v1
	end
end
function t._shouldBeVisible(p1, p2) --[[ _shouldBeVisible | Line: 1048 | Upvalues: t3 (copy), AllGroup (copy), v15 (ref) ]]
	local IsOpen = p1.State.IsOpen
	if not IsOpen then
		for v1, v2 in p1.Config.Groups do
			local v3 = t3[v2]
			if v3 and (v3.State and v3.State.IsOpen) then
				IsOpen = true
				break
			end
		end
	end
	if not IsOpen and p2 and ((if table.find(p1.Config.Groups or {}, AllGroup) == nil then false else true) or (if p1.Config.Overlay == true then true else false)) then
		local v7 = t3[v15]
		if v7 and (v7.State and v7.State.IsOpen) then
			IsOpen = true
		end
	end
	return IsOpen
end
function t._init(p1, p2) --[[ _init | Line: 1076 | Upvalues: t4 (copy), v12 (copy), v11 (copy) ]]
	if p1.Instance and p1.State.Initialized then
		warn("\226\154\160\239\184\143 GuiScreen, Screen", p1.Name, "already has an instance. New instance will not be set up.")
		return
	end
	if p1._initializing then
		return
	end
	p1._initializing = true
	local v1 = p1:_resolveDeviceSpecificConfig(p1.Config.Position)
	local v2 = p1:_resolveDeviceSpecificConfig(p1.Config.ClosePosition)
	local v3 = p1:_processPositionConfig(v1, p2, false)
	local v4 = p1:_processPositionConfig(v2, p2, true)
	if not v2 then
		v4 = v3
	end
	p1.BasePositions.Open = v3
	p1.BasePositions.Close = v4
	p1.Config.Position = p1:_applyDeviceInsetAdjustment(v3)
	p1.Config.ClosePosition = p1:_applyDeviceInsetAdjustment(v4)
	p1.Instance = p2
	p2.Visible = false
	if p1.Config.InstanceAdded then
		for v5, v6 in p1.Config.InstanceAdded do
			local v7, v8 = pcall(v6, p1, p2)
			if not v7 then
				warn("\226\154\160\239\184\143 GuiScreen, Error in", p1.Name, "InstanceAdded callback:", v8, "\n", debug.traceback())
			end
		end
	end
	if p1.Config.Init and not p1.State.Initialized then
		for v9, v10 in p1.Config.Init do
			local v112, v122 = pcall(v10, p1)
			if not v112 then
				warn("\226\154\160\239\184\143 GuiScreen, Error in", p1.Name, "Init callback:", v122, "\n", debug.traceback())
			end
		end
	end
	local v13 = p2:FindFirstAncestorWhichIsA("LayerCollector")
	if v13 then
		if not t4[v13] then
			t4[v13] = {}
		end
		t4[v13][p1.Name] = p1
		p1.Maid:GiveTask(p2:GetPropertyChangedSignal("Visible"):Connect(function() --[[ Line: 1141 | Upvalues: p1 (copy), v13 (copy) ]]
			p1:_updateLayerCollectorVisibility(v13)
		end))
		p1:_updateLayerCollectorVisibility(v13)
	end
	if p1.Config.Changed then
		p1:AddStateChangedEvents(p1.Config.Changed)
	end
	p1:AddStateChangedEvents({ v12:GetChangedSignal("Disable_" .. p1.Name) })
	if p1.Config.DeviceInset then
		p1.Maid:GiveTask(v11.GetInsetsChangedSignal():Connect(function() --[[ Line: 1157 | Upvalues: p1 (copy) ]]
			p1:_updatePositionsWithDeviceInsets()
		end))
	end
	local v14 = p1:_shouldBeVisible(true)
	p1.State.Initialized = true
	if p1.LastOperation ~= 0 then
		return
	end
	if v14 then
		p1:Open({})
		return
	end
	p2.Position = p1.Config.ClosePosition
	p2.Visible = false
end
function t.new(p1) --[[ new | Line: 1177 | Upvalues: t2 (copy), v10 (copy), t (copy), v6 (copy), t10 (copy), updateCustomEffectsState (copy), t3 (copy), AllGroup (copy), CollectionService (copy), getInstanceWithTag (copy) ]]
	if not p1.Groups or #p1.Groups == 0 then
		error("\226\157\140 GuiScreen, Screen must be registered with at least one group")
	end
	local v1 = p1.Name or p1.Tag
	if t2[v1] then
		error((("\226\157\140 GuiScreen, Screen already exists: %*"):format(v1)))
	end
	local v3 = setmetatable({
		LastOperation = 0,
		Name = v1,
		State = {
			IsOpen = false,
			Initialized = false
		},
		Config = p1,
		BasePositions = {
			Open = nil,
			Close = nil
		},
		StateChangedSignal = v10.new()
	}, t)
	v3.Maid = v6.new()
	v3.Instance = p1.Instance
	v3.Tag = p1.Tag or p1.Name
	for v5, v62 in { "Init", "InstanceAdded", "OnOpen", "OnClose", "CanOpen" } do
		if type(p1[v62]) ~= "table" then
			p1[v62] = { p1[v62] }
		end
	end
	if p1.Effects then
		for v8, v9 in p1.Effects do
			if v8 ~= "FoV" and v8 ~= "Blur" then
				t10[v8] = {}
			end
		end
		updateCustomEffectsState()
	end
	t2[v3.Name] = v3
	for v102, v11 in p1.Groups do
		if not t3[v11] then
			local t5 = {}
			local t6 = {}
			t6.IsOpen = v11 == AllGroup
			t5.State = t6
			t5.StateChangedSignal = v10.new()
			t5.Screens = {}
			t3[v11] = t5
		end
		t3[v11].Screens[v3.Name] = v3
	end
	if v3.Instance then
		task.defer(t._init, v3, v3.Instance)
		return v3
	end
	local function init(p12) --[[ init | Line: 1240 | Upvalues: v3 (copy), p1 (copy) ]]
		if p12 then
			v3:_init(p12)
			v3.Maid[p1.Tag .. "Added"] = nil
			v3.Maid[p12] = nil
		end
	end
	v3.Maid[p1.Tag .. "Added"] = CollectionService:GetInstanceAddedSignal(p1.Tag):Connect(function(p12) --[[ Line: 1251 | Upvalues: getInstanceWithTag (ref), p1 (copy), v3 (copy), init (copy) ]]
		local v1 = getInstanceWithTag(p1.Tag)
		if v1 then
			task.defer(init, v1)
		else
			v3.Maid[v1] = v1.AncestryChanged:Connect(function() --[[ Line: 1254 | Upvalues: v1 (ref), getInstanceWithTag (ref), p1 (ref), init (ref) ]]
				v1 = getInstanceWithTag(p1.Tag)
				if not v1 then
					return
				end
				task.defer(init, v1)
			end)
		end
	end)
	for v14, v15 in CollectionService:GetTagged(p1.Tag) do
		local v16 = getInstanceWithTag(p1.Tag)
		if v16 then
			task.defer(init, v16)
		end
	end
	return v3
end
function t.Destroy(p1) --[[ Destroy | Line: 1275 | Upvalues: v5 (copy) ]]
	v5(p1)
end
function t.Reset(p1) --[[ Reset | Line: 1280 | Upvalues: t2 (copy) ]]
	p1:CloseAllScreens()
	for v1, v2 in t2 do
		v2:Close()
	end
end
function t.Open(p1, p2) --[[ Open | Line: 1289 | Upvalues: v12 (copy), isAnyFullScreenGroupOpen (copy), v17 (ref), closeScreensByPriority (copy), t5 (copy), updateFOVState (copy), t6 (copy), updateBlurState (copy), t10 (copy), updateCustomEffectsState (copy), t8 (copy), t9 (copy), updateProximityPromptState (copy), v9 (copy), t7 (copy), updateControlsState (copy), StarterGui (copy), GamepadService (copy), GuiService (copy), v18 (copy) ]]
	local v1 = if p2 then p2 else {}
	p1.LastOperation = tick()
	if v12:Get("Disable_" .. p1.Name) then
		return
	end
	p1:_replicateScreen()
	if not p1:_waitForScreenInitialized(p1.LastOperation) then
		warn("\226\154\160\239\184\143 GuiScreen,", p1.Name, "could not be initialized!")
		return
	end
	local v2 = v1.FromGroup or false
	if not v2 and (v1.DoNotOpenIfFullScreen and isAnyFullScreenGroupOpen(p1.Config.Groups)) then
		return
	end
	local v3 = v1
	if p1.Config.CanOpen then
		for v4, v5 in p1.Config.CanOpen do
			local v6, v7 = pcall(v5, p1, v3.Args)
			if not v6 then
				warn("\226\154\160\239\184\143 GuiScreen, Error in CanOpen check for", p1.Name, ":", v7)
				return
			end
			if not v7 then
				return
			end
		end
	end
	local ScreenLayer = v3.ScreenLayer
	if ScreenLayer == nil then
		ScreenLayer = p1.Config.ScreenLayer
	end
	local v8 = if v3.FullScreen == false then false else v3.FullScreen or p1.Config.FullScreen
	if not v2 then
		if not (v3.ForceOpen or (if v17 == nil then true elseif ScreenLayer == nil then false elseif ScreenLayer < v17 then false else true)) then
			return false
		end
		closeScreensByPriority(ScreenLayer, {
			OpenDefaultGroup = false,
			FullScreen = v8,
			Args = v3.Args
		}, { p1.Name })
		if ScreenLayer ~= nil and v17 == nil then
			v17 = ScreenLayer
		elseif ScreenLayer ~= nil then
			v17 = math.max(v17, ScreenLayer)
		end
	end
	p1.OpenedWithLayer = ScreenLayer
	p1.State.IsOpen = true
	p1.StateChangedSignal:Fire(p1.State.IsOpen)
	if p1.Instance then
		p1.Instance.Visible = true
		p1:_setPosition("Open", v3.TweenStyle)
	end
	if p1.Config.Effects then
		if p1.Config.Effects.FoV then
			t5[p1.Name] = p1.Config.Effects.FoV
			updateFOVState()
		end
		if p1.Config.Effects.Blur then
			t6[p1.Name] = p1.Config.Effects.Blur
			updateBlurState()
		end
		for v11, v122 in p1.Config.Effects do
			if v11 ~= "FoV" and v11 ~= "Blur" then
				t10[v11][p1.Name] = v122
				updateCustomEffectsState()
			end
		end
	end
	if v3.FullScreen or p1.Config.FullScreen then
		t8[p1.Name] = true
	end
	if v3.DisableProximityPrompts ~= false and (v3.DisableProximityPrompts or (p1.Config.DisableProximityPrompts or t8[p1.Name])) then
		t9[p1.Name] = true
		updateProximityPromptState()
	end
	if v3.DisableControls ~= false and (v3.DisableControls or (p1.Config.DisableControls or t8[p1.Name] and v9.IsMobileInputType())) then
		t7[p1.Name] = true
		updateControlsState()
	end
	if v3.CloseChatWindow or (p1.Config.CloseChatWindow or v9.IsMobileInputType() and t8[p1.Name]) then
		pcall(StarterGui.SetCore, StarterGui, "ChatActive", false)
	end
	if v3.GamepadCursor ~= false and (v3.GamepadCursor or p1.Config.GamepadCursor and v9.IsGamepadInputType()) then
		local v13 = type(p1.Config.GamepadCursor) == "function" and p1.Config.GamepadCursor() or p1.Config.GamepadCursor
		if not v13 or v13 == true then
			v13 = nil
		end
		GamepadService:EnableGamepadCursor(v13)
		GuiService.SelectedObject = v13
	end
	if p1.Config.AllowFirstPerson == false or v8 and not p1.Config.AllowFirstPerson then
		v18:Lock(p1.Name)
	end
	if p1.Config.OnOpen then
		p1:_runCallbacks(p1.Config.OnOpen, p1.Name, v3.Args)
	end
	return p1.State.IsOpen
end
function t.Close(p1, p2) --[[ Close | Line: 1440 | Upvalues: t5 (copy), updateFOVState (copy), t6 (copy), updateBlurState (copy), t10 (copy), updateCustomEffectsState (copy), t7 (copy), updateControlsState (copy), t9 (copy), updateProximityPromptState (copy), t8 (copy), recalculateCurrentScreenLayer (copy), v18 (copy), t3 (copy) ]]
	local v1 = if p2 then p2 else {}
	if not p1.State.IsOpen then
		return
	end
	p1.LastOperation = tick()
	p1.OpenedWithLayer = nil
	p1.State.IsOpen = false
	p1.StateChangedSignal:Fire(p1.State.IsOpen)
	if p1.Instance then
		p1:_setPosition("Close", v1.TweenStyle)
	end
	local v2 = v1
	if p1.Config.Effects then
		if p1.Config.Effects.FoV then
			t5[p1.Name] = nil
			updateFOVState()
		end
		if p1.Config.Effects.Blur then
			t6[p1.Name] = nil
			updateBlurState()
		end
		for v3, v4 in p1.Config.Effects do
			if v3 ~= "FoV" and v3 ~= "Blur" then
				t10[v3][p1.Name] = nil
				updateCustomEffectsState()
			end
		end
	end
	if t7[p1.Name] then
		t7[p1.Name] = nil
		updateControlsState()
	end
	if t9[p1.Name] then
		t9[p1.Name] = nil
		updateProximityPromptState()
	end
	if t8[p1.Name] then
		t8[p1.Name] = nil
	end
	recalculateCurrentScreenLayer()
	v18:Unlock(p1.Name)
	if p1.Config.OnClose then
		p1:_runCallbacks(p1.Config.OnClose, p1.Name, v2.Args)
	end
	for v6, v7 in p1.Config.Groups do
		local v5
		local v8 = t3[v7]
		if v8 and v8.State.IsOpen then
			local v9 = t3[v7]
			v5 = false
			if v9 then
				for v10, v11 in v9.Screens do
					if v11.State.IsOpen then
						v5 = true
						break
					end
				end
			end
			if not v5 then
				p1:CloseGroup(v7, v2)
			end
		end
	end
end
function t.Update(p1, p2) --[[ Update | Line: 1520 ]]
	local v1 = if p2 then p2 else {}
	local v2 = p1:_shouldBeVisible()
	local v3
	if v2 then
		v2, v3 = p1:Open(v1), v1
	else
		v3 = v1
	end
	if v2 then
		return
	end
	p1:Close(v3)
end
function t.OpenGroup(p1, p2, p3) --[[ OpenGroup | Line: 1538 | Upvalues: t3 (copy), isAnyFullScreenGroupOpen (copy), v15 (ref), isGroupFullScreen (copy), v17 (ref), closeScreensByPriority (copy), AllGroup (copy) ]]
	local v1 = if p3 then p3 else {}
	local ForceOpen = v1.ForceOpen
	local v2
	if ForceOpen then
		v2 = v1
	elseif v1.Args == nil then
		v2 = v1
		ForceOpen = false
	else
		v2 = v1
		ForceOpen = true
	end
	v2.ForceOpen = ForceOpen
	local v3 = t3[p2]
	if not v3 then
		warn("\226\154\160\239\184\143 GuiScreen, Group not found:", p2)
		return
	end
	if v3.State.IsOpen and not v2.ForceOpen then
		return
	end
	local ScreenLayer = v2.ScreenLayer
	local t = {}
	for v4 in v3.Screens do
		table.insert(t, v4)
	end
	if ScreenLayer == nil then
		for v5, v6 in v3.Screens do
			if v6.Config.ScreenLayer then
				ScreenLayer = math.max(ScreenLayer or 0, v6.Config.ScreenLayer)
			end
		end
	end
	if isAnyFullScreenGroupOpen(p2) and not v2.ForceOpen then
		if v2.DoNotOpenIfFullScreen then
			return
		end
		if p2 == v15 and v2.FullScreen == nil then
			v2.FullScreen = true
		end
	end
	local v8 = if v2.FullScreen == false then false else v2.FullScreen or (if v2.FullScreen == nil then isGroupFullScreen(p2) else false)
	if not (v2.ForceOpen or (if v17 == nil then true elseif ScreenLayer == nil then false elseif ScreenLayer < v17 then false else true)) then
		return false
	end
	if v2.CloseAllScreens == true then
		p1:CloseAllScreens({
			OpenDefaultGroup = false,
			Args = v2.Args
		})
	else
		closeScreensByPriority(ScreenLayer, {
			OpenDefaultGroup = false,
			FullScreen = v8,
			Args = v2.Args
		}, {
			Args = v2.Args
		})
	end
	if ScreenLayer ~= nil and v17 == nil then
		v17 = ScreenLayer
	elseif ScreenLayer ~= nil then
		v17 = math.max(v17, ScreenLayer)
	end
	local IsOpen = v3.State.IsOpen
	v3.State.IsOpen = true
	if not IsOpen then
		v3.StateChangedSignal:Fire(true)
	end
	for v11, v12 in v3.Screens do
		local t2 = {
			FromGroup = true,
			Args = v2.Args,
			ScreenLayer = v2.ScreenLayer
		}
		t2.FullScreen = if p2 == v15 then false else v2.FullScreen
		t2.DisableControls = v2.DisableControls
		t2.DisableProximityPrompts = v2.DisableProximityPrompts
		v12:Open(t2)
	end
	if v2.CloseAllScreens == true or (p2 == AllGroup or not t3[AllGroup]) then
		return true
	end
	p1:OpenGroup(AllGroup, {
		ForceOpen = true,
		Args = v2.Args
	})
	return true
end
function t.CloseGroup(p1, p2, p3) --[[ CloseGroup | Line: 1648 | Upvalues: t3 (copy), AllGroup (copy), isAnyFullScreenGroupOpen (copy), v15 (ref), v17 (ref) ]]
	local v1 = if p3 then p3 else {}
	local v2 = t3[p2]
	if not v2 then
		warn("\226\154\160\239\184\143 GuiScreen, Group not found:", p2)
		return
	end
	if not v2.State.IsOpen then
		return
	end
	v2.State.IsOpen = false
	v2.StateChangedSignal:Fire(false)
	v1.ClosedGroups = v1.ClosedGroups or {}
	table.insert(v1.ClosedGroups, p2)
	local v4 = v1
	for v5, v6 in v2.Screens do
		if not (v4.IgnoreOverlays and v6.Config.Overlay) then
			v6:Close({
				Args = v4.Args,
				TweenStyle = v4.TweenStyle
			})
			if v4.CloseSiblingGroups then
				for v7, v8 in v6.Config.Groups do
					if v8 ~= p2 and (v8 ~= AllGroup and (not table.find(v4.ClosedGroups, v8) and t3[v8])) then
						p1:CloseGroup(v8, v4)
					end
				end
			end
		end
	end
	if v4.OpenDefaultGroup == false or (isAnyFullScreenGroupOpen(AllGroup) or (t3[v15].State.IsOpen or v17 ~= nil)) then
		return true
	end
	p1:OpenDefaultGroup()
	return true
end
function t.OpenGroups(p1, p2) --[[ OpenGroups | Line: 1709 ]]
	local v2 = if p2 then p2 else {}
	for v3, v4 in p1.Config.Groups do
		p1:OpenGroup(v4, v2)
	end
end
function t.CloseGroups(p1, p2) --[[ CloseGroups | Line: 1716 ]]
	local v1 = if p2 then p2 else {}
	if v1.CloseSiblingGroups == nil then
		v1.CloseSiblingGroups = true
	end
	local v2 = v1
	for v3, v4 in p1.Config.Groups do
		p1:CloseGroup(v4, v2)
	end
end
function t.OpenDefaultGroup(p1, p2) --[[ OpenDefaultGroup | Line: 1727 | Upvalues: t3 (copy), v15 (ref), GamepadService (copy), GuiService (copy) ]]
	if t3[v15] then
		p1:OpenGroup(v15, p2)
	else
		p2.ForceOpen = true
		p1:OpenGroup("All", p2)
	end
	GamepadService:DisableGamepadCursor()
	GuiService.SelectedObject = nil
end
function t.CloseDefaultGroup(p1, p2) --[[ CloseDefaultGroup | Line: 1739 | Upvalues: v15 (ref) ]]
	p1:CloseGroup(v15, p2)
end
function t.IsOpen(p1) --[[ IsOpen | Line: 1743 ]]
	return p1.State.IsOpen
end
function t.IsClosed(p1) --[[ IsClosed | Line: 1747 ]]
	return not p1.State.IsOpen
end
function t.WaitUntilClosed(p1) --[[ WaitUntilClosed | Line: 1751 ]]
	while p1:IsOpen() do
		task.wait(0.1)
	end
end
function t.IsInitialized(p1) --[[ IsInitialized | Line: 1757 ]]
	return p1.State.Initialized
end
function t.WaitForScreenInitialized(p1) --[[ WaitForScreenInitialized | Line: 1761 ]]
	while not p1:IsInitialized() do
		task.wait(0.1)
	end
end
function t.GetLastOperationTimestamp(p1) --[[ GetLastOperationTimestamp | Line: 1767 ]]
	return p1.LastOperation
end
function t.AddCallback(p1, p2, p3) --[[ AddCallback | Line: 1771 ]]
	table.insert(p1.Config[p2], p3)
	if p2 ~= "Init" or not p1.State.Initialized then
		return true
	end
	local v2, v3 = pcall(p3, p1)
	if v2 then
		return true
	end
	warn("\226\154\160\239\184\143 GuiScreen, Error in", p1.Name, "Init callback:", v3)
	return true
end
function t.AddStateChangedEvents(p1, p2, p3) --[[ AddStateChangedEvents | Line: 1784 | Upvalues: v8 (copy) ]]
	local v2 = p3 or {}
	for v3, v4 in v8.getConnectionEvents(p2) do
		if v4 then
			p1.Maid:GiveTask(v4:Connect(function() --[[ Line: 1790 | Upvalues: p1 (copy), v2 (ref) ]]
				p1:Update(v2)
			end))
		end
	end
end
function t.GetStateChangedSignal(p1) --[[ GetStateChangedSignal | Line: 1797 ]]
	return p1.StateChangedSignal
end
function t.ObserveState(p1, p2) --[[ ObserveState | Line: 1801 ]]
	task.spawn(p2, p1.State.IsOpen)
	return p1.StateChangedSignal:Connect(p2)
end
function t.CloseAllScreens(p1, p2) --[[ CloseAllScreens | Line: 1806 | Upvalues: t (copy) ]]
	local v1 = if p2 then p2 else {}
	if v1.OpenDefaultGroup == nil then
		v1.OpenDefaultGroup = false
	end
	local v2 = v1
	for v3, v4 in t.GetGroupMap() do
		p1:CloseGroup(v3, v2)
	end
	for v5, v6 in t.GetScreenMap() do
		if not (v2.IgnoreOverlays and v6.Config.Overlay) then
			v6:Close(v2)
		end
	end
end
function t.SetDefaultGroup(p1) --[[ SetDefaultGroup | Line: 1831 | Upvalues: v15 (ref), DefaultGroup (copy) ]]
	v15 = if p1 then p1 else DefaultGroup
	return true
end
function t.GetScreenMap() --[[ GetScreenMap | Line: 1836 | Upvalues: t2 (copy) ]]
	return t2
end
function t.GetGroupMap() --[[ GetGroupMap | Line: 1840 | Upvalues: t3 (copy) ]]
	return t3
end
function t.GetGroup(p1) --[[ GetGroup | Line: 1844 | Upvalues: t3 (copy) ]]
	return t3[p1]
end
function t.GetDefaultGroup() --[[ GetDefaultGroup | Line: 1848 | Upvalues: DefaultGroup (copy) ]]
	return DefaultGroup
end
function t.GetAllGroup() --[[ GetAllGroup | Line: 1852 | Upvalues: AllGroup (copy) ]]
	return AllGroup
end
function t.GetCurrentDefaultGroup() --[[ GetCurrentDefaultGroup | Line: 1856 | Upvalues: v15 (ref), DefaultGroup (copy), t (copy) ]]
	local v1 = v15 or DefaultGroup
	return v1, t.GetGroup(v1)
end
function t.Init(p1) --[[ Init | Line: 1862 | Upvalues: v2 (copy), v14 (copy), v1 (copy), Sonar (copy) ]]
	if not v2.getSetting(v14.LightingSettings.Open) then
		warn("\226\154\160\239\184\143 GuiScreen,", v14.LightingSettings.Open, "not found in LightingConfig. Some UI effects may not work as expected.")
	end
	if not v1.getModifier(v14.FoVScreenModifier) then
		warn("\226\154\160\239\184\143 GuiScreen,", v14.FoVScreenModifier, "not found in FoVConfig. Some UI effects may not work as expected.")
	end
	task.spawn(function() --[[ Line: 1871 | Upvalues: Sonar (ref), v14 (ref), p1 (copy) ]]
		Sonar("CharacterControls"):AddControls("OpenDefaultGroup", v14.Keybinds.OpenDefaultGroup, {
			InputBegan = function(p12, p2, p3) --[[ InputBegan | Line: 1876 | Upvalues: p1 (ref) ]]
				p1:OpenDefaultGroup({
					DoNotOpenIfFullScreen = true
				})
			end
		})
	end)
end
t:Init()
return t