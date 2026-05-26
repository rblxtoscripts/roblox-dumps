-- https://lua.expert/
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")
local GamepadService = game:GetService("GamepadService")
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InputTypeDetector")
local v2 = Sonar("CharacterControls")
local v3 = Sonar("InputImageLibrary")
local v4 = Sonar("GuiManager")
local v5 = Sonar("Signal")
local t = {}
local t2 = {}
local t3 = { "KeyboardControlLabel", "GamepadControlLabel", "MobileControlLabel" }
local t4 = {
	MouseButton1 = true
}
for k, v in pairs(Sonar("Constants").InputTypes) do
	t[v] = k
end
local v7 = Sonar("PlayerWrapper").GetClient()
local PlayerGui = game:GetService("Players").LocalPlayer.PlayerGui
local GamepadCursorGui = PlayerGui:WaitForChild("GamepadCursorGui")
local t5 = {}
local v8 = false
local v9 = v5.new()
local function resizeUIScaleAdded(p1, p2) --[[ resizeUIScaleAdded | Line: 49 | Upvalues: t5 (copy), t2 (copy) ]]
	if t5[p1] then
		if not p2 then
			return
		end
		t5[p1] = nil
	else
		if p1.Value == 1 then
			return
		end
		local v1 = p1.Parent
		if not v1:IsA("Scale") then
			v1:SetAttribute("OriginalSize", v1.Size)
		end
		local t = {
			ScaleValue = p1,
			Scale = p1.Value,
			Target = v1
		}
		t.Size = if v1:IsA("GuiObject") then v1:GetAttribute("OriginalSize") else v1:IsA("LayerCollector") and v1:GetAttribute("OriginalSize")
		t5[p1] = t
		t2.ResetUIScale(p1)
	end
end
function t2.ResetUIScale(p1, p2) --[[ ResetUIScale | Line: 72 | Upvalues: t5 (copy), v1 (copy) ]]
	local v12 = t5[p1]
	if not v12 then
		p1.Scale = p2 or 1
		return
	end
	local v2 = v1.IsMobileInputType() and v12.Scale or (v12.Target:GetAttribute("OriginalScale") or (if p2 then p2 else 1))
	if v12.Target:IsA("UIScale") then
		v12.Target.Scale = v2
	else
		local Size = v12.Size
		v12.Target.Size = UDim2.new(Size.X.Scale * v2, Size.X.Offset * v2, Size.Y.Scale * v2, Size.Y.Offset * v2)
	end
end
local function setUIShortcutLabels() --[[ setUIShortcutLabels | Line: 95 | Upvalues: t3 (copy), CollectionService (copy), v1 (copy) ]]
	for k, v in pairs(t3) do
		for k2, v2 in pairs(CollectionService:GetTagged(v)) do
			if not v2:GetAttribute("DoNotVisibility") then
				v2.Visible = v1.GetInputType() == k
			end
		end
	end
end
local function UIShortcutAdded(p1, p2) --[[ UIShortcutAdded | Line: 104 | Upvalues: v3 (copy), t4 (copy), t (copy), v1 (copy) ]]
	local v12 = p2:GetAttribute("KeyCode")
	if v12 and (p1 == 1 and p2:FindFirstChild("Top")) then
		(p2.Top:FindFirstChild("TextLabel") or (p2.Top:FindFirstChild("Keybind") or p2:FindFirstChildWhichIsA("TextLabel"))).Text = Enum.KeyCode[v12].Name
	elseif v12 then
		local v5 = v3:GetScaledImageLabel(t4[v12] and Enum.UserInputType[v12] or Enum.KeyCode[v12], "Dark", t[p1])
		if v5 then
			local v6 = p2:FindFirstChild("ControlLabel", true) or (p2:FindFirstChildWhichIsA("ImageLabel") or p2)
			v6.Image = v5.Image
			v6.ImageRectOffset = v5.ImageRectOffset
			v6.ImageRectSize = v5.ImageRectSize
			v5:Destroy()
		end
	end
	if p2:GetAttribute("DoNotVisibility") then
		return
	end
	p2.Visible = v1.GetInputType() == p1
end
function t2.InGamepadSelection() --[[ InGamepadSelection | Line: 128 | Upvalues: v1 (copy), GamepadService (copy), GuiService (copy) ]]
	if not v1.IsGamepadInputType() then
		return
	end
	if GamepadService.GamepadCursorEnabled then
		return true
	else
		return GuiService.SelectedObject
	end
end
function t2.SetGamepadSelection(p1) --[[ SetGamepadSelection | Line: 134 | Upvalues: v1 (copy), GamepadService (copy) ]]
	if v1.IsGamepadInputType() then
		GamepadService:EnableGamepadCursor(p1 or nil)
	end
end
function t2.IsGamepadSelectionInFrame(p1) --[[ IsGamepadSelectionInFrame | Line: 142 | Upvalues: GuiService (copy) ]]
	if GuiService.SelectedObject then
		return GuiService.SelectedObject:IsDescendantOf(p1)
	end
end
function t2.IsGamepadSelectionObject(p1) --[[ IsGamepadSelectionObject | Line: 147 | Upvalues: GuiService (copy) ]]
	if not GuiService.SelectedObject then
		return
	end
	return GuiService.SelectedObject == p1
end
function t2.ResetGamepadSelection() --[[ ResetGamepadSelection | Line: 152 | Upvalues: v1 (copy), GamepadService (copy), GuiService (copy) ]]
	if v1.IsGamepadInputType() then
		GamepadService:DisableGamepadCursor()
		GuiService.SelectedObject = nil
	end
end
function t2.SetGamepadSelectionInFrame(p1, p2) --[[ SetGamepadSelectionInFrame | Line: 158 | Upvalues: t2 (copy) ]]
	if not p2 then
		p2 = p1:FindFirstChild("CloseButton", true)
	end
	if not p2 then
		return
	end
	t2.SetGamepadSelection(p2)
end
function t2.SetHUDNavigationEnabled(p1) --[[ SetHUDNavigationEnabled | Line: 167 | Upvalues: t2 (copy) ]]
	t2.HUDNavigation = p1
end
function t2.CanNavigateHUD() --[[ CanNavigateHUD | Line: 171 | Upvalues: t2 (copy) ]]
	return t2.HUDNavigation
end
function t2.SetUnselectableWhenSelected(p1) --[[ SetUnselectableWhenSelected | Line: 175 | Upvalues: GuiService (copy) ]]
	return GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 176 | Upvalues: GuiService (ref), p1 (copy) ]]
		if GuiService.SelectedObject ~= p1 then
			p1.Selectable = false
		end
	end)
end
function t2.SetTargetFrame(p1) --[[ SetTargetFrame | Line: 182 | Upvalues: t2 (copy), v4 (copy) ]]
	if p1 then
		local v1 = t2.TargetFrame and v4.getFrameFromInstance(t2.TargetFrame)
		if v1 and (v4.IsFrameOpen(t2.TargetFrame) and v1.Overlay) then
			return
		end
	end
	t2.TargetFrame = p1
end
function t2.ResetTargetFrame(p1) --[[ ResetTargetFrame | Line: 192 | Upvalues: t2 (copy) ]]
	if t2.TargetFrame ~= p1 then
		return
	end
	t2.TargetFrame = nil
end
function t2.ResetSelectionToTargetFrame() --[[ ResetSelectionToTargetFrame | Line: 198 | Upvalues: v4 (copy), t2 (copy) ]]
	local v1 = v4.getFrameFromInstance(t2.TargetFrame)
	local v2
	if v1 then
		v2 = v4.IsFrameOpen(v1.Frame)
		if v2 then
			v2 = type(v1.SelectOnOpen) == "function" and v1.SelectOnOpen(v1.Frame) or v1.SelectOnOpen
		end
	else
		v2 = v1
	end
	if v2 then
		t2.SetGamepadSelectionInFrame(v1, v2)
	else
		t2.ResetGamepadSelection()
	end
end
function t2.OverwriteUISelect(p1) --[[ OverwriteUISelect | Line: 211 | Upvalues: t2 (copy) ]]
	t2.OverwrittenUISelect = p1
end
function t2.Init(p1) --[[ Init | Line: 215 | Upvalues: GuiService (copy), UserInputService (copy), GamepadCursorGui (copy), GamepadService (copy), v8 (ref), v9 (copy), CurrentCamera (copy), v7 (copy), t3 (copy), CollectionService (copy), UIShortcutAdded (copy), v1 (copy), setUIShortcutLabels (copy), resizeUIScaleAdded (copy), t5 (copy), t2 (copy), v2 (copy), v4 (copy), PlayerGui (copy) ]]
	GuiService.AutoSelectGuiEnabled = false
	GuiService.GuiNavigationEnabled = true
	UserInputService.MouseIconEnabled = true
	GamepadCursorGui.Enabled = not game:GetService("RunService"):IsStudio()
	v9:Connect(function() --[[ setCursor | Line: 222 | Upvalues: GamepadCursorGui (ref), GamepadService (ref), v8 (ref) ]]
		GamepadCursorGui.GamepadCursor.ImageLabel.Visible = not GamepadService.GamepadCursorEnabled
		GamepadCursorGui.GamepadCursor.Position = v8 and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, 0, 0.333, 0)
	end)
	GamepadCursorGui.GamepadCursor.ImageLabel.Visible = not GamepadService.GamepadCursorEnabled
	local GamepadCursor = GamepadCursorGui.GamepadCursor
	GamepadCursor.Position = v8 and UDim2.new(0.5, 0, 0.5, 0) or UDim2.new(0.5, 0, 0.333, 0)
	local function setInFirstPerson() --[[ setInFirstPerson | Line: 244 | Upvalues: CurrentCamera (ref), v7 (ref), v8 (ref), v9 (ref) ]]
		if not CurrentCamera.CameraSubject then
			return
		end
		if not v7.Head then
			return
		end
		if CurrentCamera:GetAttribute("Override") then
			return
		end
		local v2 = (CurrentCamera.CFrame.Position - (CurrentCamera.CameraSubject:IsA("Humanoid") and v7.Head or CurrentCamera.CameraSubject).Position).Magnitude < 2
		local v3 = v2 ~= v8
		v8 = v2
		if not v3 then
			return
		end
		v8 = v2
		v9:Fire()
	end
	game:GetService("RunService").Heartbeat:Connect(setInFirstPerson)
	for k, v in pairs(t3) do
		CollectionService:GetInstanceAddedSignal(v):Connect(function(...) --[[ Line: 264 | Upvalues: UIShortcutAdded (ref), k (copy) ]]
			UIShortcutAdded(k, ...)
		end)
		for k2, v3 in pairs(CollectionService:GetTagged(v)) do
			UIShortcutAdded(k, v3)
		end
	end
	v1.InputTypeChanged:Connect(setUIShortcutLabels)
	setUIShortcutLabels()
	CollectionService:GetInstanceRemovedSignal("MobileUIScale"):Connect(function(p1) --[[ Line: 275 | Upvalues: resizeUIScaleAdded (ref) ]]
		resizeUIScaleAdded(p1, true)
	end)
	CollectionService:GetInstanceAddedSignal("MobileUIScale"):Connect(resizeUIScaleAdded)
	for k, v in pairs(CollectionService:GetTagged("MobileUIScale")) do
		task.spawn(resizeUIScaleAdded, v)
	end
	v1.InputTypeChanged:Connect(function() --[[ Line: 282 | Upvalues: t5 (ref), t2 (ref) ]]
		for k, v in pairs(t5) do
			t2.ResetUIScale(k)
		end
	end)
	v2:AddControls("GamepadCloseFrame", { Enum.KeyCode.ButtonB }, {
		InputBegan = function() --[[ InputBegan | Line: 291 | Upvalues: v4 (ref), t2 (ref) ]]
			local v1 = v4.getFrameFromInstance(t2.TargetFrame)
			if not v1 then
				return
			end
			if not v1.ShortcutToClose then
				return
			end
			if v4.MainFrameOpen == v1.Frame then
				v4.CloseMainFrame(v1.Frame, {
					ExcludeInteractMenu = v1.ExcludeInteractMenu
				})
			else
				v4.CloseFrame(v1.Frame)
			end
			t2.ResetGamepadSelection()
			t2.SetTargetFrame()
			for k, v in pairs(v4.GetAll()) do
				if v4.IsFrameOpen(k) and v4.getFrameFromInstance(k).ShortcutToClose then
					t2.SetTargetFrame(k)
					return
				end
			end
		end
	}, function() --[[ Line: 318 | Upvalues: t2 (ref) ]]
		return t2.CanNavigateHUD()
	end, nil, true)
	local Stables = PlayerGui.HUDGui.RightFrame.Other:FindFirstChild("Stables", true)
	v2:AddControls("GamepadSelectUI", { Enum.KeyCode.ButtonSelect, Enum.KeyCode.ButtonB }, {
		InputBegan = function(p1, p2) --[[ InputBegan | Line: 327 | Upvalues: t2 (ref), v7 (ref), GamepadService (ref), v4 (ref), Stables (copy) ]]
			if t2.OverwrittenUISelect then
				return t2.OverwrittenUISelect(v7, p2)
			end
			if GamepadService.GamepadCursorEnabled then
				t2.ResetGamepadSelection()
				return
			end
			local v1 = v4.getFrameFromInstance(t2.TargetFrame)
			local v2
			if v1 then
				v2 = v4.IsFrameOpen(v1.Frame)
				if v2 then
					v2 = type(v1.SelectOnOpen) == "function" and v1.SelectOnOpen(v1.Frame) or v1.SelectOnOpen
				end
			else
				v2 = v1
			end
			if p2.KeyCode ~= Enum.KeyCode.ButtonSelect then
				return
			end
			if v2 then
				t2.SetGamepadSelectionInFrame(v1, v2)
			else
				t2.SetGamepadSelection(Stables)
			end
		end
	}, function() --[[ Line: 348 | Upvalues: t2 (ref) ]]
		return t2.CanNavigateHUD()
	end)
	t2.SetHUDNavigationEnabled(true)
end
t2:Init()
return t2