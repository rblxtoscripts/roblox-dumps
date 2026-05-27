-- https://lua.expert/
local t = {}
t.__index = t
if game:GetService("RunService"):IsServer() then
	return t
end
local GuiService = game:GetService("GuiService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local CurrentCamera = workspace.CurrentCamera
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("Constants")
local v2 = Sonar("InputTypeDetector")
local v3 = Sonar(script:WaitForChild("InteractOption"))
local v4 = Sonar("Maid")
local v5 = Sonar("MathUtils")
local v6 = Sonar("NotificationsClient")
local v7 = Sonar("PlayerWrapper")
local v8 = Sonar("TutorialService")
local v9 = Sonar("UINavigator")
local MobileInput = v1.MobileInput
local InteractUnfocusedOrder = v1.InteractUnfocusedOrder
local InteractOpenOrder = v1.InteractOpenOrder
local InteractGui = script:WaitForChild("InteractGui")
local v10 = v7.GetClient()
local LocalPlayer = Players.LocalPlayer
local WorkspaceGui = LocalPlayer.PlayerGui:WaitForChild("WorkspaceGui")
WorkspaceGui.Name = "WorkspaceGui"
local v11 = nil
local v12 = nil
local v13 = true
local t2 = {}
local function getRadiusOfOptionButtons(p1) --[[ getRadiusOfOptionButtons | Line: 55 ]]
	local v1 = 1
	for k, v in pairs(p1) do
		local v2 = v:_getAbsoluteSize()
		if v1 < v2.Magnitude then
			v1 = v2.X
		end
	end
	return v1
end
function t.new(p1, p2) --[[ new | Line: 67 | Upvalues: t (copy), v4 (copy), InteractGui (copy), WorkspaceGui (copy), v9 (copy), MobileInput (copy), v2 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.IsObjectAModel = p1:IsA("Model")
	v22.AllowDuringTutorial = p2.AllowDuringTutorial and true or false
	v22.Maid = v4.new()
	v22.Options = {}
	v22.RangeInfo = {}
	v22.GetRange = p2.GetRange
	v22.OriginalScale = p2.Scale or 1
	v22.MenuPositionOffset = p2.MenuPositionOffset
	v22.PrimaryPartName = p2.PrimaryPart
	v22.PrimaryPart = p2.PrimaryPart
	v22.InteractGui = InteractGui:Clone()
	v22.InteractGui.Name = p1:GetFullName()
	v22.InteractGui.Parent = WorkspaceGui
	v22.Maid:GiveTask(v22.InteractGui)
	v22.ContainerFrame = v22.InteractGui.ContainerFrame
	v22.UIScale = v22.ContainerFrame.UIScale
	v22.UIScale:SetAttribute("OriginalScale", v22.OriginalScale)
	v22.UIScale.Scale = v22.OriginalScale
	v9.ResetUIScale(v22.UIScale, v22.OriginalScale)
	v22.OptionsFrame = v22.ContainerFrame.OptionsFrame
	v22.OptionsFrame.Default.Visible = false
	v22.InteractButton = v22.ContainerFrame.InteractButton
	v22.InteractionHintLabel = v22.InteractButton.ActionLabel
	v22.InputLabels = {}
	for k, v in pairs(v22.InteractButton.InputsFrame:GetChildren()) do
		v22.InputLabels[v.Name] = v
	end
	v22.MobileInputLabel = v22.InputLabels[tostring(MobileInput)]
	v22.Maid:GiveTask(v2.InputTypeChanged:Connect(function() --[[ Line: 106 | Upvalues: v22 (copy) ]]
		if not v22:_isFocused() then
			return
		end
		v22:_focusMenu()
	end))
	v22:_unfocusMenu()
	if p2.FillColor then
		v22.ContainerFrame.InteractButton.BackingLabel.Center.BackgroundColor3 = p2.FillColor
	end
	if p2.OutlineColor then
		v22.ContainerFrame.InteractButton.BackingLabel.BackgroundColor3 = p2.OutlineColor
	end
	if type(p2.Range) == "number" then
		v22.MinimumDistance = p2.Range
	end
	if p2 then
		v22:_addMain(p2)
	end
	t2[v22] = true
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 134 | Upvalues: t2 (copy), v11 (ref), v12 (ref) ]]
	p1._destroyed = true
	t2[p1] = nil
	if p1:_isFocused() then
		v11 = nil
	end
	if p1 ~= v12 then
		p1.Maid:Destroy()
		p1.Object = nil
		setmetatable(p1, nil)
		return
	end
	v12 = nil
	p1.Maid:Destroy()
	p1.Object = nil
	setmetatable(p1, nil)
end
function t._addMain(p1, p2) --[[ _addMain | Line: 151 | Upvalues: v3 (copy) ]]
	if p1.MainOption then
		error("There can only be 1 main option", 2)
	end
	p1.MainOption = v3.new(p1, p2)
	p1.Maid:GiveTask(p1.MainOption)
end
function t._addOption(p1, p2, p3) --[[ _addOption | Line: 163 | Upvalues: v3 (copy) ]]
	local v1 = p3 or p1
	if not v1.Options then
		v1.Options = {}
	end
	local v2 = v3.new(p1, p2, v1)
	v1.Options[#v1.Options + 1] = v2
	p1.Maid:GiveTask(v2)
	return v2
end
function t._openBranch(p1, p2) --[[ _openBranch | Line: 181 | Upvalues: v2 (copy) ]]
	if not p2.Options then
		return
	end
	if not next(p2.Options) then
		return
	end
	p1.LastTouchOpen = tick()
	p1.ContainerFrame.MinimizedLabel.Visible = false
	p1:_closeBranch(p1.PreviousBranch, p2)
	p1.PreviousBranch = p2
	local list = {}
	for i, v in ipairs(p2.Options) do
		if v:_visibility() then
			list[#list + 1] = v
		end
	end
	local v1 = 6.283185307179586 / #list
	for i, v in ipairs(list) do
		v:_animateOut(v1, 0.7, i, v2.IsGamepadInputType(), #list)
	end
end
function t._closeBranch(p1, p2, p3) --[[ _closeBranch | Line: 208 | Upvalues: GuiService (copy) ]]
	if not p2 then
		return
	end
	if not p2.Options then
		return
	end
	if not next(p2.Options) then
		return
	end
	p1.PreviousBranch = nil
	for i, v in ipairs(p2.Options) do
		if not p3 and (GuiService.SelectedObject and GuiService.SelectedObject == v.OptionButton) then
			GuiService.SelectedObject = nil
		end
		v:_animateIn()
	end
end
function t._getPrimaryPartOfObject(p1) --[[ _getPrimaryPartOfObject | Line: 224 ]]
	if not p1.IsObjectAModel then
		return p1.Object
	end
	if not p1.PrimaryPart then
		if p1.PrimaryPartName then
			p1.PrimaryPart = p1.Object:FindFirstChild(p1.PrimaryPartName)
		else
			p1.PrimaryPart = p1.Object.PrimaryPart
		end
	end
	return p1.PrimaryPart or p1.Object:FindFirstChildWhichIsA("BasePart")
end
function t._canShowMain(p1) --[[ _canShowMain | Line: 242 | Upvalues: v13 (ref) ]]
	if not v13 then
		return
	end
	if p1.MainOption then
		return p1.MainOption:_visibility()
	end
end
function t._canFocus(p1) --[[ _canFocus | Line: 250 ]]
	if p1.MainOption then
		return p1.MainOption:_canFocus()
	end
end
function t._isMenuInRangeAndVisible(p1) --[[ _isMenuInRangeAndVisible | Line: 257 | Upvalues: LocalPlayer (copy), v12 (ref) ]]
	local v1 = p1.LastOpenPosition or (p1.PrimaryPart:IsA("Bone") and p1.PrimaryPart.WorldCFrame.p or p1.PrimaryPart.Position)
	local v2 = if p1.GetRange then p1.GetRange() else p1.MinimumDistance
	local v3 = p1.GetVisible or nil
	local v4 = LocalPlayer:DistanceFromCharacter(v1 + (p1.MenuPositionOffset or Vector3.new(0, 0, 0)))
	if v4 <= 1 then
		return
	end
	local v5 = if v12 == p1 then v2 * 2 else v2
	if (if v4 < v5 then true else false) and v3 then
		if v3() then
			return true, 0
		else
			return false, 9000000000
		end
	else
		return v4 < v5, v4
	end
end
function t._positionMenuOnScreen(p1, p2, p3) --[[ _positionMenuOnScreen | Line: 285 | Upvalues: CurrentCamera (copy) ]]
	local v1, v2 = CurrentCamera:WorldToScreenPoint(p3 + (p1.MenuPositionOffset or Vector3.new(0, 0, 0)))
	if v2 and p2 then
		p1.ContainerFrame.Position = UDim2.fromOffset(v1.X, v1.Y)
	end
	p1.ContainerFrame.Visible = v2
end
function t._showMenu(p1) --[[ _showMenu | Line: 298 | Upvalues: v12 (ref) ]]
	if not v12 then
		p1.InteractGui.Enabled = true
		return
	end
	p1.InteractGui.Enabled = v12 == p1
end
function t._hideMenu(p1) --[[ _hideMenu | Line: 308 ]]
	p1.InteractGui.Enabled = false
end
function t._focusMenu(p1) --[[ _focusMenu | Line: 314 | Upvalues: v2 (copy), InteractOpenOrder (copy) ]]
	local v1 = p1.InputLabels[tostring(v2.GetInputType())] or p1.MobileInputLabel
	for k, v in pairs(p1.InputLabels) do
		v.Visible = v == v1
	end
	p1.InteractGui.DisplayOrder = InteractOpenOrder
	p1.InteractionHintLabel.Visible = v2.IsMobileInputType() or true
	if not (p1.MainOptionBranch and p1.MainOptionBranch.OnFocus) then
		return
	end
	p1.MainOptionBranch.OnFocus(p1)
end
function t._unfocusMenu(p1) --[[ _unfocusMenu | Line: 329 | Upvalues: InteractUnfocusedOrder (copy) ]]
	for k, v in pairs(p1.InputLabels) do
		v.Visible = v == p1.MobileInputLabel
	end
	p1.InteractGui.DisplayOrder = InteractUnfocusedOrder
	p1.InteractionHintLabel.Visible = false
	if not (p1.MainOptionBranch and p1.MainOptionBranch.OnUnfocus) then
		return
	end
	p1.MainOptionBranch.OnUnfocus(p1)
end
function t._isFocused(p1) --[[ _isFocused | Line: 343 | Upvalues: v11 (ref) ]]
	return v11 == p1
end
function t._openMenu(p1) --[[ _openMenu | Line: 349 | Upvalues: v12 (ref), InteractOpenOrder (copy), v2 (copy), v9 (copy), t2 (copy) ]]
	v12 = p1
	p1.InteractGui.DisplayOrder = InteractOpenOrder
	p1.LastOpenPosition = p1.PrimaryPart:IsA("Bone") and p1.PrimaryPart.WorldCFrame.p or p1.PrimaryPart.Position
	p1.OptionsFrame.Visible = true
	p1.ContainerFrame.OpenedLabel.Visible = true
	if v2.IsMobileInputType() then
		v9.ResetUIScale(p1.UIScale, p1.OriginalScale)
	else
		p1.UIScale.Scale = p1.OriginalScale
	end
	p1.InteractButton.Visible = false
	p1:_openBranch(p1)
	for k, v in pairs(t2) do
		k.InteractGui.Enabled = false
	end
end
function t._minimizeMenu(p1) --[[ _minimizeMenu | Line: 376 | Upvalues: v12 (ref), v9 (copy) ]]
	v12 = nil
	p1.InteractButton.Visible = false
	p1.ContainerFrame.OpenedLabel.Visible = false
	p1.MainOption:_mouseLeave()
	p1:_closeBranch(p1.PreviousBranch)
	p1.ContainerFrame.MinimizedLabel.Visible = true
	v9.ResetUIScale(p1.UIScale, p1.OriginalScale)
	p1.LastOpenPosition = nil
end
function t._closeMenu(p1, p2, p3) --[[ _closeMenu | Line: 395 | Upvalues: v12 (ref), v9 (copy), t2 (copy) ]]
	v12 = nil
	p1.InteractButton.Visible = true
	p1.ContainerFrame.MinimizedLabel.Visible = false
	p1.ContainerFrame.OpenedLabel.Visible = false
	p1.MainOption:_mouseLeave()
	p1:_closeBranch(p1.PreviousBranch)
	v9.ResetUIScale(p1.UIScale, p1.OriginalScale)
	p1.LastOpenPosition = nil
	if not p2 then
		return
	end
	for k, v in pairs(t2) do
		if not k:_canShowMain() then
			k:_showMenu()
		end
	end
end
function t.HandleMenuFromInput(p1, p2) --[[ HandleMenuFromInput | Line: 418 | Upvalues: v8 (copy), v10 (copy), v6 (copy), v12 (ref) ]]
	if p2 and not (v8.HasCompletedPrimaryTutorial(v10) or p2.AllowDuringTutorial) then
		v6.Notify({
			Message = "You can\'t use this during the tutorial!",
			Preset = "Red"
		})
		return
	end
	if v12 and v12._closeMenu then
		v12:_closeMenu(p2)
	end
	if not p2 then
		return
	end
	if next(p2.Options) and p2.MainOption:_canOpenBranch() then
		p2:_openMenu()
		return
	end
	p2.MainOption:_run(true)
end
function t.GetLastOpenMenu() --[[ GetLastOpenMenu | Line: 443 | Upvalues: v12 (ref) ]]
	return v12
end
local function updateMenus() --[[ updateMenus | Line: 448 | Upvalues: t2 (copy), v5 (copy), v11 (ref), t (copy) ]]
	local v1 = 250
	local v2 = nil
	for k, v in pairs(t2) do
		local v3
		if k.Object or k._destroyed then
			k.PrimaryPart = k.PrimaryPart or k:_getPrimaryPartOfObject()
			if k.PrimaryPart then
				local v52 = k.RangeInfo[1]
				local v6 = k.RangeInfo[2]
				if v52 then
					if k:_canShowMain() then
						k:_showMenu()
						if k:_canFocus() then
							if v6 < v1 then
								v3 = true
								v1 = v6
								v2 = k
							else
								v3 = nil
							end
							k.UIScale.Scale = v3 and k.OriginalScale or v5.map(v6, 5, 50, k.OriginalScale * 0.85, 0.3)
						end
					else
						k:_hideMenu()
					end
					local LastOpenPosition = k.LastOpenPosition
					if not LastOpenPosition then
						LastOpenPosition = k.PrimaryPart:IsA("Bone") and k.PrimaryPart.WorldCFrame.p or k.PrimaryPart.Position
					end
					k:_positionMenuOnScreen(v52, LastOpenPosition)
					continue
				end
				k:_hideMenu()
			end
			continue
		end
		k:Destroy()
	end
	if v2 then
		if not v2:_isFocused() then
			if v11 then
				v11:_unfocusMenu()
			end
			v2:_focusMenu()
		end
	elseif v11 then
		v11:_unfocusMenu()
		t:HandleMenuFromInput()
	end
	v11 = v2
end
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 507 | Upvalues: GuiService (copy), v12 (ref), t (copy), v11 (ref) ]]
	if p2 then
		return
	end
	if GuiService.SelectedObject then
		return
	end
	if (p1.UserInputType ~= Enum.UserInputType.Keyboard or p1.KeyCode ~= Enum.KeyCode.E) and p1.KeyCode ~= Enum.KeyCode.ButtonX then
		if p1.UserInputType ~= Enum.UserInputType.MouseButton1 then
			return
		end
		t:HandleMenuFromInput()
		return
	end
	if v12 then
		t:HandleMenuFromInput()
	else
		t:HandleMenuFromInput(v11)
	end
end)
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 523 | Upvalues: v12 (ref), t (copy) ]]
	if p2 then
		return
	end
	if p1.KeyCode ~= Enum.KeyCode.ButtonB and p1.KeyCode ~= Enum.KeyCode.ButtonSelect or not v12 then
		return
	end
	t:HandleMenuFromInput()
end)
UserInputService.InputEnded:Connect(function(p1, p2) --[[ Line: 531 | Upvalues: v12 (ref), t (copy) ]]
	if p2 then
		return
	end
	if v12 and (v12.LastTouchOpen and tick() - v12.LastTouchOpen < 0.5) then
		return
	end
	if p1.UserInputType == Enum.UserInputType.Touch and v12 then
		t:HandleMenuFromInput()
	end
end)
GuiService:GetPropertyChangedSignal("SelectedObject"):Connect(function() --[[ Line: 545 | Upvalues: v2 (copy), GuiService (copy), v12 (ref), t (copy) ]]
	if not v2.IsGamepadInputType() then
		return
	end
	if GuiService.SelectedObject then
		return
	end
	if not v12 then
		return
	end
	t:HandleMenuFromInput()
end)
task.spawn(function() --[[ Line: 554 | Upvalues: t2 (copy) ]]
	while wait(0.25) do
		for k, v in pairs(t2) do
			local v1, v2 = pcall(function() --[[ Line: 557 | Upvalues: k (copy) ]]
				k.PrimaryPart = k.PrimaryPart or k:_getPrimaryPartOfObject()
				if k.PrimaryPart then
					local v3, v4 = k:_isMenuInRangeAndVisible()
					k.RangeInfo = { v3, v4 }
				end
			end)
			if not v1 and v2 then
				warn("Interact menu error:", v2)
			end
		end
	end
end)
if v2.IsMobileInputType() then
	RunService.Heartbeat:Connect(updateMenus)
else
	RunService.RenderStepped:Connect(updateMenus)
end
function t.Enable(p1) --[[ Enable | Line: 579 | Upvalues: v13 (ref), updateMenus (copy) ]]
	v13 = true
	updateMenus()
end
function t.Disable(p1) --[[ Disable | Line: 587 | Upvalues: v13 (ref), t2 (copy) ]]
	v13 = false
	for k, v in pairs(t2) do
		if k:_canShowMain() then
			k:_showMenu()
			continue
		end
		k:_hideMenu()
	end
end
t.MinimumDistance = 18
return t