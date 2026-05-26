-- https://lua.expert/
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local v1 = script:FindFirstAncestorOfClass("ScreenGui")
local PlacePermissions = require(game.ReplicatedStorage.Library.Shared.PlacePermissions)
GuiService.AutoSelectGuiEnabled = false
local function scrollToSelected() --[[ scrollToSelected | Line: 24 ]]
	game:GetService("TweenService"):Create(script.Parent, TweenInfo.new(0.35), {
		CanvasPosition = Vector2.new(0, script.Parent.CanvasPosition.Y + script.Parent.selected.Value.AbsolutePosition.Y + script.Parent.selected.Value.AbsoluteSize.Y / 2 - script.Parent.AbsolutePosition.Y - script.Parent.AbsoluteSize.Y / 2)
	}):Play()
end
function selectUp() --[[ selectUp | Line: 28 | Upvalues: scrollToSelected (copy) ]]
	if script.Parent.selected.Value.NextSelectionUp then
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
	else
		local selected = script.Parent.selected.Value
		local NextSelectionUp = selected.Parent.NextSelectionUp
		if NextSelectionUp then
			local X = selected.AbsolutePosition.X
			local v1 = nil
			for k, v in pairs(NextSelectionUp:GetChildren()) do
				if v:IsA("GuiBase") and v.Visible and (math.abs(v.AbsolutePosition.X - X) < 5 and (not v1 or v1.AbsolutePosition.Y < v.AbsolutePosition.Y)) then
					v1 = v
				end
			end
			if v1 then
				script.Parent.selected.Value = v1
			end
		end
	end
	scrollToSelected()
end
function selectDown() --[[ selectDown | Line: 50 | Upvalues: scrollToSelected (copy) ]]
	if script.Parent.selected.Value.NextSelectionDown then
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
	else
		local selected = script.Parent.selected.Value
		local NextSelectionDown = selected.Parent.NextSelectionDown
		if NextSelectionDown then
			local X = selected.AbsolutePosition.X
			local v1 = nil
			for k, v in pairs(NextSelectionDown:GetChildren()) do
				if v:IsA("GuiBase") and v.Visible and (math.abs(v.AbsolutePosition.X - X) < 5 and (not v1 or v1.AbsolutePosition.Y > v.AbsolutePosition.Y)) then
					v1 = v
				end
			end
			if v1 then
				script.Parent.selected.Value = v1
			end
		end
	end
	scrollToSelected()
end
UserInputService.InputBegan:Connect(function(p1) --[[ Line: 73 ]]
	if not script.Parent.open.Value then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.UserInputType.Value >= 12 and (p1.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
		script.Parent.selected.Value = script.Parent.mutators.speed
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
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p1, p2) --[[ Line: 97 ]]
	if not script.Parent.open.Value then
		return
	end
	if not script.Parent.selected.Value then
		script.Parent.selected.Value = script.Parent.mutators.speed
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
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
local function updateOpen() --[[ updateOpen | Line: 126 | Upvalues: v1 (copy) ]]
	script.Parent.open.Value = v1.open.Value and v1.tab.Value == script.Parent
end
v1.open.Changed:Connect(updateOpen)
v1.tab.Changed:Connect(updateOpen)
if PlacePermissions.GAME_MODE ~= "ttoh" then
	return
end
script.Parent.gears.Visible = false
script.Parent.gearsLabel.Visible = false
script.Parent.mutators.Visible = false
script.Parent.mutatorsLabel.Visible = false