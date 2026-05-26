-- https://lua.expert/
local t = {}
t.__index = t
local ProximityPromptService = game:GetService("ProximityPromptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Sonar = require(ReplicatedStorage:WaitForChild("Sonar"))
local v1 = Sonar("InputTypeDetector")
local v2 = Sonar("Maid")
local v3 = Sonar(script:WaitForChild("ProximityAction"))
local v4 = Sonar("GuiUtils")
local v5 = Sonar("EventUtils")
local v6 = Sonar("PlayerWrapper").GetClient()
local InteractGui = script:WaitForChild("InteractGui")
local LocalPlayer = game:GetService("Players").LocalPlayer
local t2 = {}
ProximityPromptService.MaxPromptsVisible = 2
function t.new(p1, p2) --[[ new | Line: 38 | Upvalues: t (copy), v2 (copy), InteractGui (copy), v4 (copy), v1 (copy), t2 (copy) ]]
	local v22 = setmetatable({}, t)
	v22.Object = p1
	v22.IsObjectAModel = p1:IsA("Model")
	v22.Maid = v2.new()
	v22.ValueChangedMaid = v2.new()
	v22.Actions = {}
	v22.FadeOut = {}
	v22.FadeIn = {}
	v22.RangeInfo = {}
	v22.PrimaryPartName = p2.PrimaryPart
	v22.IgnoreWorldSpaceOffset = p2.IgnoreWorldSpaceOffset
	v22.ContinueActionsOnClose = p2.ContinueActionsOnClose
	v22.InteractGui = InteractGui:Clone()
	v22.InteractGui.Name = p1:GetFullName()
	v4.ParentToWorkspaceGui(v22.InteractGui)
	v22.Maid:GiveTask(v22.InteractGui)
	v22.ContainerFrame = v22.InteractGui.ContainerFrame
	v22.BackgroundFrame = v22.ContainerFrame.BackgroundFrame
	v22.HintLabel = v22.ContainerFrame.HintLabel
	v22.ValueLabel = v22.ContainerFrame.ValueLabel
	v22.HintImageLabel = v22.ContainerFrame.HintImageLabel
	v22.ActionsFrame = v22.ContainerFrame.ActionsFrame
	v22.ProximityPrompt = Instance.new("ProximityPrompt")
	v22.ProximityPrompt.MaxActivationDistance = 100
	v22.ProximityPrompt.RequiresLineOfSight = false
	v22.ProximityPrompt.Style = Enum.ProximityPromptStyle.Custom
	v22.GetRange = p2.GetRange
	v22.GetVisible = p2.GetVisible
	v22.Range = p2.Range or 50
	v22.Maid:GiveTask(v22.ProximityPrompt.PromptShown:Connect(function() --[[ Line: 78 | Upvalues: v22 (copy) ]]
		v22:_openMenu()
	end))
	v22.Maid:GiveTask(v22.ProximityPrompt.PromptHidden:Connect(function() --[[ Line: 82 | Upvalues: v22 (copy) ]]
		v22:_closeMenu()
	end))
	v22.Maid:GiveTask(v1.InputTypeChanged:Connect(function() --[[ Line: 86 | Upvalues: v22 (copy) ]]
		v22:_updateControls()
	end))
	v22:_closeMenu()
	v22:_addAction(p2, true)
	t2[v22] = true
	return v22
end
function t.Destroy(p1) --[[ Destroy | Line: 98 | Upvalues: t2 (copy) ]]
	t2[p1] = nil
	if p1.Maid then
		p1.Maid:Destroy()
		p1.ValueChangedMaid:Destroy()
	end
	setmetatable(p1, nil)
end
function t._addAction(p1, p2, p3) --[[ _addAction | Line: 110 | Upvalues: v3 (copy) ]]
	local v1 = v3.new(p1, p2, p3)
	p1.Maid:GiveTask(v1)
	if p3 then
		p1.PrimaryAction = v1
	end
	return v1
end
function t._getPrimaryPartOfObject(p1) --[[ _getPrimaryPartOfObject | Line: 123 ]]
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
	return p1.PrimaryPart
end
function t._updateInteractFrame(p1) --[[ _updateInteractFrame | Line: 137 ]]
	p1.ContainerFrame.Size = UDim2.new(0, p1.ContainerFrame.Size.X.Offset, 0, p1.DefaultHintSize.Y.Offset + p1.ActionsFrame.UIListLayout.AbsoluteContentSize.Y * (1 / p1.ContainerFrame.UIScale.Scale))
end
function t._updateControls(p1) --[[ _updateControls | Line: 144 ]]
	for k, v in pairs(p1.Actions) do
		v:_setKeybind()
	end
end
function t._openMenu(p1) --[[ _openMenu | Line: 152 | Upvalues: v6 (copy) ]]
	for k, v in pairs(p1.Actions) do
		v:_setVisibility()
	end
	p1:_updateInteractFrame()
	if p1.PrimaryAction then
		p1.PrimaryAction:_value()
		p1.PrimaryAction:_updateContainerSize()
	end
	p1.InteractGui.Adornee = p1:_getPrimaryPartOfObject()
	p1.InteractGui.Enabled = true
	p1.InteractGui.Active = true
	p1.ProximityPrompt.Parent = p1.ProximityPrompt.Parent or p1:_getPrimaryPartOfObject()
	if p1.IgnoreWorldSpaceOffset then
		p1.InteractGui.StudsOffsetWorldSpace = Vector3.new(0, 0, 0)
	else
		local v2 = v6:GetCurrentCharacter()
		if v2 then
			local Root = v2.Root
			if Root then
				local v3 = p1:_getPosition()
				if Root.Position.Y < v3.Y then
					p1.InteractGui.StudsOffsetWorldSpace = -(Vector3.new(0, 0, 0)):lerp(Root.CFrame:PointToObjectSpace(v3) * Vector3.new(0, 1, 0), 0.75)
				else
					p1.InteractGui.StudsOffsetWorldSpace = Vector3.new(0, 0, 0)
				end
			end
		end
	end
	for i, v in ipairs(p1.FadeIn) do
		v:Play()
	end
end
function t._closeMenu(p1) --[[ _closeMenu | Line: 198 ]]
	p1.InteractGui.Active = false
	p1.InteractGui.Adornee = nil
	p1.InteractGui.Enabled = false
	if not p1.ContinueActionsOnClose then
		p1:_endRepeatActions()
	end
	for i, v in ipairs(p1.FadeOut) do
		v:Play()
	end
end
function t._isMenuOpen(p1) --[[ _isMenuOpen | Line: 213 ]]
	if not p1.ProximityPrompt.Enabled then
		return
	end
	if not p1.InteractGui.Adornee then
		return
	end
	if p1.InteractGui.Enabled then
		return true
	end
end
function t._isRepeatingAction(p1) --[[ _isRepeatingAction | Line: 222 ]]
	return p1.RepeatingAction
end
function t._runActions(p1, p2) --[[ _runActions | Line: 227 ]]
	for k, v in pairs(p1.Actions) do
		if v:_visibility() and v.KeyCode == p2 then
			v:_run()
			return
		end
	end
end
function t._endRepeatActions(p1, p2) --[[ _endRepeatActions | Line: 237 ]]
	for k, v in pairs(p1.Actions) do
		if not p2 or v.KeyCode == p2 then
			v:_endRepeat()
		end
	end
end
function t._getPosition(p1) --[[ _getPosition | Line: 245 ]]
	if p1.PrimaryPart:IsA("Attachment") then
		return p1.PrimaryPart.WorldPosition
	else
		return p1.PrimaryPart.Position
	end
end
function t._isMenuInRangeAndVisible(p1) --[[ _isMenuInRangeAndVisible | Line: 254 | Upvalues: LocalPlayer (copy) ]]
	local v1 = p1.GetRange and p1.GetRange() or p1.Range
	local v2 = LocalPlayer:DistanceFromCharacter(p1:_getPosition())
	if v2 < v1 and (p1.GetVisible and not p1.GetVisible()) then
		return false, 9000000000
	end
	return v2 < v1, v2
end
function t._canShow(p1) --[[ _canShow | Line: 274 ]]
	if p1.PrimaryAction then
		return p1.PrimaryAction:_visibility()
	end
end
function t._showMenu(p1) --[[ _showMenu | Line: 280 ]]
	p1.ProximityPrompt.Enabled = true
	p1.ProximityPrompt.Parent = p1.ProximityPrompt.Parent or p1.PrimaryPart
end
function t._hideMenu(p1) --[[ _hideMenu | Line: 287 ]]
	p1.ProximityPrompt.Enabled = false
	p1:_endRepeatActions()
end
function t.Enable(p1) --[[ Enable | Line: 295 | Upvalues: ProximityPromptService (copy) ]]
	ProximityPromptService.Enabled = true
end
function t.Disable(p1) --[[ Disable | Line: 301 | Upvalues: ProximityPromptService (copy) ]]
	ProximityPromptService.Enabled = false
end
local function updateMenus() --[[ updateMenus | Line: 306 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		k.PrimaryPart = k.PrimaryPart or k:_getPrimaryPartOfObject()
		if k.PrimaryPart then
			if k.RangeInfo[1] and k:_canShow() then
				k:_showMenu()
				continue
			end
			k:_hideMenu()
		end
	end
end
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 321 | Upvalues: UserInputService (copy), t2 (copy) ]]
	if UserInputService:GetFocusedTextBox() then
		return
	end
	for k, v in pairs(t2) do
		if k:_isMenuOpen() then
			k:_runActions(p1.KeyCode, "_run")
		end
	end
end)
UserInputService.InputEnded:Connect(function(p1, p2) --[[ Line: 331 | Upvalues: UserInputService (copy), t2 (copy) ]]
	if UserInputService:GetFocusedTextBox() then
		return
	end
	for k, v in pairs(t2) do
		k:_endRepeatActions(p1.KeyCode)
	end
end)
v5.spawnLoop(function() --[[ Line: 340 | Upvalues: t2 (copy) ]]
	for k, v in pairs(t2) do
		k.PrimaryPart = k.PrimaryPart or k:_getPrimaryPartOfObject()
		if k.PrimaryPart then
			local v2, v3 = k:_isMenuInRangeAndVisible()
			k.RangeInfo = { v2, v3 }
		end
	end
end, 0.5)
RunService.Heartbeat:Connect(updateMenus)
return t