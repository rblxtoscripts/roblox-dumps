-- https://lua.expert/
local v1 = script.Parent.Parent.Parent.Parent
local Effects = game.ReplicatedStorage.Configuration.Effects
local selected = script.Parent.selected
local function scrollToSelected() --[[ scrollToSelected | Line: 5 | Upvalues: selected (copy) ]]
	local v1 = selected.Value.AbsolutePosition.Y - script.Parent.AbsolutePosition.Y + script.Parent.CanvasPosition.Y - script.Parent.AbsoluteSize.Y / 2 + selected.Value.AbsoluteSize.Y / 2
	local v2 = script.Parent.AbsoluteSize.Y / 2 - selected.Value.AbsoluteSize.Y * 1
	local TweenService = game:GetService("TweenService")
	local v3 = script.Parent
	local v4 = TweenInfo.new(0.35)
	local t = {}
	t.CanvasPosition = Vector2.new(0, (math.max(math.min(script.Parent.CanvasPosition.Y, v1 + v2), v1 - v2)))
	TweenService:Create(v3, v4, t):Play()
end
local t = {
	[Enum.KeyCode.DPadDown] = "NextSelectionDown",
	[Enum.KeyCode.DPadUp] = "NextSelectionUp",
	[Enum.KeyCode.DPadLeft] = "NextSelectionLeft",
	[Enum.KeyCode.DPadRight] = "NextSelectionRight"
}
local t2 = {
	[Vector3.new(0, -1, 0)] = "NextSelectionDown",
	[Vector3.new(0, 1, 0)] = "NextSelectionUp",
	[Vector3.new(-1, 0, 0)] = "NextSelectionLeft",
	[Vector3.new(1, 0, 0)] = "NextSelectionRight"
}
local function move(p1) --[[ move | Line: 30 | Upvalues: selected (copy), scrollToSelected (copy) ]]
	if not selected.Value then
		selected.Value = script.Parent.boxes.boxFrame.Regular
		return
	end
	local v2 = selected.Value[p1] or (selected.value:IsDescendantOf(script.Parent.effects) and script.Parent.effects or script.Parent.boxes)[p1]
	if not v2 then
		scrollToSelected()
		return
	end
	selected.Value = v2
	scrollToSelected()
end
game:GetService("UserInputService").InputBegan:Connect(function(p1) --[[ Line: 44 | Upvalues: v1 (copy), t (copy), move (copy) ]]
	if not v1.open.Value or v1.tab.Value ~= script.Parent then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if not t[p1.KeyCode] then
		return
	end
	move(t[p1.KeyCode])
end)
require(game.ReplicatedStorage.Library.Utility.thumbScroller2D)(Enum.KeyCode.Thumbstick1, function(p1, p2) --[[ Line: 53 | Upvalues: v1 (copy), t2 (copy), move (copy) ]]
	if not v1.open.Value or v1.tab.Value ~= script.Parent then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if not t2[p2] then
		return
	end
	local v2 = math.abs(p1.X)
	for i = 1, v2 + math.abs(p1.Y) do
		move(t2[p2])
	end
end)
v1.controller.Changed:Connect(function() --[[ Line: 65 | Upvalues: v1 (copy), selected (copy) ]]
	if not v1.controller.Value or selected.Value then
		return
	end
	selected.Value = script.Parent.boxes.boxFrame.Regular
end)