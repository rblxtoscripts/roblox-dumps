-- https://lua.expert/
local v1 = script.Parent.Parent.Parent.Parent
local UserInputService = game:GetService("UserInputService")
UserInputService.InputBegan:Connect(function(p1) --[[ Line: 4 | Upvalues: v1 (copy) ]]
	if not v1.open.Value or v1.tab.Value ~= script.Parent then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if p1.UserInputType.Value >= 12 and (p1.UserInputType.Value <= 19 and not script.Parent.selected.Value) then
		script.Parent.selected.Value = script.Parent.killparthue
		return
	end
	if p1.KeyCode == Enum.KeyCode.DPadDown then
		if script.Parent.selected.Value.NextSelectionDown then
			script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown
		end
	else
		if p1.KeyCode ~= Enum.KeyCode.DPadUp or not script.Parent.selected.Value.NextSelectionUp then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp
	end
end)
local v2 = false
UserInputService.InputChanged:Connect(function(p1) --[[ Line: 26 | Upvalues: v2 (ref) ]]
	if p1.KeyCode ~= Enum.KeyCode.Thumbstick1 then
		return
	end
	local VRService = game:GetService("VRService")
	if VRService:GetUserCFrameEnabled(Enum.UserCFrame.LeftHand) or VRService:GetUserCFrameEnabled(Enum.UserCFrame.RightHand) then
		return
	end
	if not (math.abs(p1.Position.X) < 0.4) then
		return
	end
	if p1.Position.Y > 0.8 then
		if v2 then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionUp or script.Parent.selected.Value
		v2 = true
		return
	end
	if p1.Position.Y < -0.8 then
		if v2 then
			return
		end
		script.Parent.selected.Value = script.Parent.selected.Value.NextSelectionDown or script.Parent.selected.Value
		v2 = true
		return
	end
	v2 = false
end)
local function updateOpen() --[[ updateOpen | Line: 51 | Upvalues: v1 (copy) ]]
	script.Parent.open.Value = if v1.tab.Value == script.Parent then v1.open.Value else false
end
v1.tab.Changed:Connect(updateOpen)
v1.open.Changed:Connect(updateOpen)