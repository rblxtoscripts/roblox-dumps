-- https://lua.expert/
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
GuiService.AutoSelectGuiEnabled = false
local function setDefaultSelection() --[[ setDefaultSelection | Line: 22 ]]
	local v1 = nil
	for k, v in pairs(script.Parent:GetDescendants()) do
		if v.Name == "selectable" and (not v:FindFirstAncestorWhichIsA("LuaSourceContainer") and (not v1 or (v1.AbsolutePosition.Y > v.Parent.AbsolutePosition.Y or v1.AbsolutePosition.Y == v.Parent.AbsolutePosition.Y and v1.AbsolutePosition.X > v.Parent.AbsolutePosition.X))) then
			v1 = v.Parent
		end
	end
	script.Parent.selected.Value = v1
end
local function scrollToSelected() --[[ scrollToSelected | Line: 36 ]]
	game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.35), {
		CanvasPosition = Vector2.new(0, script.Parent.CanvasPosition.Y + script.Parent.selected.Value.AbsolutePosition.Y + script.Parent.selected.Value.AbsoluteSize.Y / 2 - script.Parent.AbsolutePosition.Y - script.Parent.AbsoluteSize.Y / 2)
	}):Play()
end
function selectUp() --[[ selectUp | Line: 40 | Upvalues: scrollToSelected (copy) ]]
	if script.Parent.selected.Value.NextSelectionUp then
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
	else
		local selected = script.Parent.selected.Value
		local NextSelectionUp = selected.Parent.NextSelectionUp
		if NextSelectionUp then
			local X = selected.AbsolutePosition.X
			local v1 = X + selected.AbsoluteSize.X
			local v2 = nil
			for k, v in pairs(NextSelectionUp:GetChildren()) do
				if v:IsA("GuiBase") then
					local X_2 = v.AbsolutePosition.X
					if X < X_2 + v.AbsoluteSize.X and (X_2 < v1 and (not v2 or v2.AbsolutePosition.Y < v.AbsolutePosition.Y)) then
						v2 = v
					end
				end
			end
			if v2 then
				script.Parent.selected.Value = v2
			end
		end
	end
	scrollToSelected()
end
function selectDown() --[[ selectDown | Line: 68 | Upvalues: scrollToSelected (copy) ]]
	if script.Parent.selected.Value.NextSelectionDown then
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
	else
		local selected = script.Parent.selected.Value
		local NextSelectionDown = selected.Parent.NextSelectionDown
		if not NextSelectionDown then
			scrollToSelected()
			return
		end
		local X = selected.AbsolutePosition.X
		local v1 = X + selected.AbsoluteSize.X
		local v2 = nil
		for k, v in pairs(NextSelectionDown:GetChildren()) do
			if v:IsA("GuiBase") then
				local X_2 = v.AbsolutePosition.X
				if X < X_2 + v.AbsoluteSize.X and (X_2 < v1 and (not v2 or v2.AbsolutePosition.Y > v.AbsolutePosition.Y)) then
					v2 = v
				end
			end
		end
		if not v2 then
			scrollToSelected()
			return
		end
		script.Parent.selected.Value = v2
	end
	scrollToSelected()
end
UserInputService.InputBegan:Connect(function(p1) --[[ Line: 97 | Upvalues: setDefaultSelection (copy) ]]
	if not script:FindFirstAncestorOfClass("ScreenGui").open.Value or script:FindFirstAncestorOfClass("ScreenGui"):FindFirstChild("tab") and script:FindFirstAncestorOfClass("ScreenGui").tab.Value ~= script.Parent then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.UserInputType.Value >= 12 and (p1.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
		setDefaultSelection()
		return
	end
	if p1.KeyCode == Enum.KeyCode.DPadDown then
		selectDown()
		return
	end
	if p1.KeyCode == Enum.KeyCode.DPadUp then
		selectUp()
		return
	end
	if p1.KeyCode == Enum.KeyCode.DPadLeft then
		if script.Parent.selected.Value.NextSelectionLeft then
			script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
		end
	else
		if p1.KeyCode ~= Enum.KeyCode.DPadRight or not script.Parent.selected.Value.NextSelectionRight then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
	end
end)
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p1, p2) --[[ Line: 125 | Upvalues: setDefaultSelection (copy) ]]
	if not script.Parent.selected.Value then
		setDefaultSelection()
		return
	end
	for i = 1, math.abs(p1.X) do
		if p2.X == -1 then
			if script.Parent.selected.Value.NextSelectionLeft then
				script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionLeft
			end
			continue
		end
		if script.Parent.selected.Value.NextSelectionRight then
			script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionRight
		end
	end
	for j = 1, math.abs(p1.Y) do
		if p2.Y == -1 then
			selectDown()
			continue
		end
		selectUp()
	end
end)