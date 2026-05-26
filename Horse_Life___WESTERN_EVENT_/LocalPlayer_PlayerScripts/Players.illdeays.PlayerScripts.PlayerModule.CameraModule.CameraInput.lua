-- https://lua.expert/
require(game.ReplicatedStorage:WaitForChild("Sonar"))
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local VRService = game:GetService("VRService")
game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Default = Enum.ContextActionPriority.Default.Value
local v1 = Vector2.new(1, 0.77) * math.rad(0.5)
local v2 = Vector2.new(1, 0.77) * math.rad(7)
local v3 = Vector2.new(1, 0.66) * math.rad(1)
local v4 = Vector2.new(1, 0.77) * math.rad(4)
local v5, v6 = pcall(function() --[[ Line: 29 ]]
	return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen")
end)
local v7 = v5 and v6
local v8 = Instance.new("BindableEvent")
local v9 = Instance.new("BindableEvent")
local v10 = v8.Event
local v11 = v9.Event
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 43 | Upvalues: v8 (copy) ]]
	if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
		return
	end
	v8:Fire()
end)
UserInputService.InputEnded:Connect(function(p1, p2) --[[ Line: 49 | Upvalues: v9 (copy) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
		return
	end
	v9:Fire()
end)
local function thumbstickCurve(p1) --[[ thumbstickCurve | Line: 60 ]]
	local v2 = (math.exp((math.abs(p1) - 0.1) / 0.9 * 2) - 1) / (math.exp(2) - 1)
	return math.sign(p1) * math.clamp(v2, 0, 1)
end
local function adjustTouchPitchSensitivity(p1) --[[ adjustTouchPitchSensitivity | Line: 74 ]]
	local CurrentCamera = workspace.CurrentCamera
	if not CurrentCamera then
		return p1
	end
	local v1 = CurrentCamera.CFrame:ToEulerAnglesYXZ()
	if p1.Y * v1 >= 0 then
		return p1
	else
		return Vector2.new(1, (1 - (math.abs(v1) * 2 / math.pi) ^ 0.75) * 0.75 + 0.25) * p1
	end
end
local function isInDynamicThumbstickArea(p1) --[[ isInDynamicThumbstickArea | Line: 100 | Upvalues: LocalPlayer (copy) ]]
	local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
	local v1 = if PlayerGui then PlayerGui:FindFirstChild("TouchGui") else PlayerGui
	local v2 = if v1 then v1:FindFirstChild("TouchControlFrame") else v1
	local v3 = if v2 then v2:FindFirstChild("DynamicThumbstickFrame") else v2
	if not v3 then
		return false
	end
	if not v1.Enabled then
		return false
	end
	local AbsolutePosition = v3.AbsolutePosition
	local v4 = AbsolutePosition + v3.AbsoluteSize
	return if p1.X >= AbsolutePosition.X and (p1.Y >= AbsolutePosition.Y and p1.X <= v4.X) then p1.Y <= v4.Y else false
end
local v12 = 1 / 60
RunService.Stepped:Connect(function(p1, p2) --[[ Line: 125 | Upvalues: v12 (ref) ]]
	v12 = p2
end)
local t = {}
local t2 = {}
local v13 = 0
local function incPanInputCount() --[[ incPanInputCount | Line: 135 | Upvalues: v13 (ref) ]]
	v13 = math.max(0, v13 + 1)
end
local function decPanInputCount() --[[ decPanInputCount | Line: 139 | Upvalues: v13 (ref) ]]
	v13 = math.max(0, v13 - 1)
end
local function resetPanInputCount() --[[ resetPanInputCount | Line: 143 | Upvalues: v13 (ref) ]]
	v13 = 0
end
local t3 = {
	Thumbstick2 = Vector2.new()
}
local t4 = {
	Left = 0,
	Right = 0,
	I = 0,
	O = 0
}
local t5 = {
	Wheel = 0,
	Pinch = 0,
	Movement = Vector2.new(),
	Pan = Vector2.new()
}
local t6 = {
	Pinch = 0,
	Move = Vector2.new()
}
local v14 = Instance.new("BindableEvent")
t.gamepadZoomPress = v14.Event
local v15 = if VRService.VREnabled then Instance.new("BindableEvent") or nil else nil
if VRService.VREnabled then
	t.gamepadReset = v15.Event
end
function t.getRotationActivated() --[[ getRotationActivated | Line: 176 | Upvalues: v13 (ref), t3 (copy) ]]
	return if v13 > 0 then true else t3.Thumbstick2.Magnitude > 0
end
function t.getRotation(p1) --[[ getRotation | Line: 180 | Upvalues: UserGameSettings (copy), t4 (copy), v12 (ref), t3 (copy), t5 (copy), adjustTouchPitchSensitivity (copy), t6 (copy), v4 (copy), v1 (copy), v2 (copy), v3 (copy) ]]
	local v13 = Vector2.new(1, UserGameSettings:GetCameraYInvertValue())
	local v22 = Vector2.new(t4.Right - t4.Left, 0) * v12
	local v32 = adjustTouchPitchSensitivity(t6.Move)
	if p1 then
		v22 = Vector2.new()
	end
	return (v22 * math.rad(120) + t3.Thumbstick2 * v4 + t5.Movement * v1 + t5.Pan * v2 + v32 * v3) * v13
end
function t.getZoomDelta() --[[ getZoomDelta | Line: 204 | Upvalues: t4 (copy), t5 (copy), t6 (copy) ]]
	return (t4.O - t4.I) * 0.1 + (-t5.Wheel + t5.Pinch) * 1 + -t6.Pinch * 0.04
end
local function thumbstick(p1, p2, p3) --[[ thumbstick | Line: 214 | Upvalues: t3 (copy), thumbstickCurve (ref) ]]
	if game:GetService("GuiService").SelectedObject and game:GetService("GuiService").SelectedObject:IsA("ScrollingFrame") then
		return Enum.ContextActionResult.Sink
	else
		local Position = p3.Position
		t3[p3.KeyCode.Name] = Vector2.new(thumbstickCurve(Position.X), -thumbstickCurve(Position.Y))
		return Enum.ContextActionResult.Pass
	end
end
local function mouseMovement(p1) --[[ mouseMovement | Line: 224 | Upvalues: t5 (copy) ]]
	local Delta = p1.Delta
	t5.Movement = Vector2.new(Delta.X, Delta.Y)
end
local function mouseWheel(p1, p2, p3) --[[ mouseWheel | Line: 229 | Upvalues: t5 (copy) ]]
	t5.Wheel = p3.Position.Z
	return Enum.ContextActionResult.Pass
end
local function keypress(p1, p2, p3) --[[ keypress | Line: 234 | Upvalues: LocalPlayer (copy), t4 (copy) ]]
	if not LocalPlayer.Character or LocalPlayer.Character.Humanoid.SeatPart then
		return Enum.ContextActionResult.Pass
	end
	t4[p3.KeyCode.Name] = if p2 == Enum.UserInputState.Begin then 1 else 0
	return Enum.ContextActionResult.Pass
end
local function gamepadZoomPress(p1, p2, p3) --[[ gamepadZoomPress | Line: 241 | Upvalues: v14 (copy) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	v14:Fire()
end
local function gamepadReset(p1, p2, p3) --[[ gamepadReset | Line: 247 | Upvalues: v15 (copy) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	v15:Fire()
end
local function resetInputDevices() --[[ resetInputDevices | Line: 253 | Upvalues: t3 (copy), t4 (copy), t5 (copy), t6 (copy) ]]
	for k, v in pairs({ t3, t4, t5, t6 }) do
		for k2, v2 in pairs(v) do
			if type(v2) == "boolean" then
				v[k2] = false
				continue
			end
			v[k2] = v[k2] * 0
		end
	end
end
local t7 = {}
local v16 = nil
local v17 = nil
local function touchBegan(p1, p2) --[[ touchBegan | Line: 277 | Upvalues: v16 (ref), isInDynamicThumbstickArea (copy), v13 (ref), t7 (ref) ]]
	assert(if p1.UserInputType == Enum.UserInputType.Touch then true else false)
	assert(if p1.UserInputState == Enum.UserInputState.Begin then true else false)
	if v16 == nil and (isInDynamicThumbstickArea(p1.Position) and not p2) then
		v16 = p1
		return
	end
	if not p2 then
		v13 = math.max(0, v13 + 1)
	end
	t7[p1] = p2
end
local function touchEnded(p1, p2) --[[ touchEnded | Line: 297 | Upvalues: v16 (ref), t7 (ref), v17 (ref), v13 (ref) ]]
	assert(p1.UserInputType == Enum.UserInputType.Touch)
	assert(p1.UserInputState == Enum.UserInputState.End)
	if p1 == v16 then
		v16 = nil
	end
	if t7[p1] ~= false then
		t7[p1] = nil
		return
	end
	v17 = nil
	v13 = math.max(0, v13 - 1)
	t7[p1] = nil
end
local function touchChanged(p1, p2) --[[ touchChanged | Line: 316 | Upvalues: v16 (ref), t7 (ref), t6 (copy), v17 (ref) ]]
	assert(if p1.UserInputType == Enum.UserInputType.Touch then true else false)
	assert(if p1.UserInputState == Enum.UserInputState.Change then true else false)
	if p1 == v16 then
		return
	end
	if t7[p1] == nil then
		t7[p1] = p2
	end
	local t = {}
	for k, v in pairs(t7) do
		if not v then
			table.insert(t, k)
		end
	end
	if #t == 1 and t7[p1] == false then
		local Delta = p1.Delta
		local v3 = t6
		v3.Move = v3.Move + Vector2.new(Delta.X, Delta.Y)
	end
	if #t ~= 2 then
		v17 = nil
		return
	end
	local Magnitude = (t[1].Position - t[2].Position).Magnitude
	if v17 then
		local v4 = t6
		v4.Pinch = v4.Pinch + (Magnitude - v17)
	end
	v17 = Magnitude
end
local function resetTouchState() --[[ resetTouchState | Line: 360 | Upvalues: t7 (ref), v16 (ref), v17 (ref), v7 (ref), v13 (ref) ]]
	t7 = {}
	v16 = nil
	v17 = nil
	if not v7 then
		return
	end
	v13 = 0
end
local function pointerAction(p1, p2, p3, p4) --[[ pointerAction | Line: 370 | Upvalues: t5 (copy) ]]
	if p4 then
		return
	end
	t5.Wheel = p1
	t5.Pan = p2
	t5.Pinch = -p3
end
local function inputBegan(p1, p2) --[[ inputBegan | Line: 378 | Upvalues: touchBegan (ref), v13 (ref) ]]
	if p1.UserInputType == Enum.UserInputType.Touch then
		touchBegan(p1, p2)
		return
	end
	if p1.UserInputType ~= Enum.UserInputType.MouseButton2 or p2 then
		return
	end
	v13 = math.max(0, v13 + 1)
end
local function inputChanged(p1, p2) --[[ inputChanged | Line: 387 | Upvalues: touchChanged (ref), t5 (copy) ]]
	if p1.UserInputType == Enum.UserInputType.Touch then
		touchChanged(p1, p2)
		return
	end
	if p1.UserInputType ~= Enum.UserInputType.MouseMovement then
		return
	end
	local Delta = p1.Delta
	t5.Movement = Vector2.new(Delta.X, Delta.Y)
end
local function inputEnded(p1, p2) --[[ inputEnded | Line: 396 | Upvalues: touchEnded (ref), v13 (ref) ]]
	if p1.UserInputType == Enum.UserInputType.Touch then
		touchEnded(p1, p2)
		return
	end
	if p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
		return
	end
	v13 = math.max(0, v13 - 1)
end
local v18 = false
function t.setInputEnabled(p1) --[[ setInputEnabled | Line: 407 | Upvalues: v18 (ref), resetInputDevices (copy), resetTouchState (ref), ContextActionService (copy), thumbstick (copy), Default (copy), keypress (copy), VRService (copy), gamepadReset (copy), gamepadZoomPress (copy), t2 (ref), UserInputService (copy), inputBegan (copy), inputChanged (copy), inputEnded (copy), pointerAction (copy), v7 (ref) ]]
	if v18 == p1 then
		return
	end
	v18 = p1
	resetInputDevices()
	resetTouchState()
	if p1 then
		ContextActionService:BindActionAtPriority("RbxCameraThumbstick", thumbstick, false, Default, Enum.KeyCode.Thumbstick2)
		ContextActionService:BindActionAtPriority("RbxCameraKeypress", keypress, false, Default, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O)
		if VRService.VREnabled then
			ContextActionService:BindAction("RbxCameraGamepadReset", gamepadReset, false, Enum.KeyCode.ButtonL3)
		end
		ContextActionService:BindAction("RbxCameraGamepadZoom", gamepadZoomPress, false, Enum.KeyCode.ButtonR3)
		table.insert(t2, UserInputService.InputBegan:Connect(inputBegan))
		table.insert(t2, UserInputService.InputChanged:Connect(inputChanged))
		table.insert(t2, UserInputService.InputEnded:Connect(inputEnded))
		table.insert(t2, UserInputService.PointerAction:Connect(pointerAction))
		if v7 then
			local MenuOpened = game:GetService("GuiService").MenuOpened
			table.insert(t2, MenuOpened:connect(resetTouchState))
		end
	else
		ContextActionService:UnbindAction("RbxCameraThumbstick")
		ContextActionService:UnbindAction("RbxCameraMouseMove")
		ContextActionService:UnbindAction("RbxCameraMouseWheel")
		ContextActionService:UnbindAction("RbxCameraKeypress")
		ContextActionService:UnbindAction("RbxCameraGamepadZoom")
		if VRService.VREnabled then
			ContextActionService:UnbindAction("RbxCameraGamepadReset")
		end
		for k, v in pairs(t2) do
			v:Disconnect()
		end
		t2 = {}
	end
end
function t.getInputEnabled() --[[ getInputEnabled | Line: 479 | Upvalues: v18 (ref) ]]
	return v18
end
function t.resetInputForFrameEnd() --[[ resetInputForFrameEnd | Line: 483 | Upvalues: t5 (copy), t6 (copy) ]]
	t5.Movement = Vector2.new()
	t6.Move = Vector2.new()
	t6.Pinch = 0
	t5.Wheel = 0
	t5.Pan = Vector2.new()
	t5.Pinch = 0
end
UserInputService.WindowFocused:Connect(resetInputDevices)
UserInputService.WindowFocusReleased:Connect(resetInputDevices)
local v19 = false
local v20 = false
local v21 = 0
function t.getHoldPan() --[[ getHoldPan | Line: 504 | Upvalues: v19 (ref) ]]
	return v19
end
function t.getTogglePan() --[[ getTogglePan | Line: 508 | Upvalues: v20 (ref) ]]
	return v20
end
function t.getPanning() --[[ getPanning | Line: 512 | Upvalues: v20 (ref), v19 (ref) ]]
	return v20 or v19
end
function t.setTogglePan(p1) --[[ setTogglePan | Line: 516 | Upvalues: v20 (ref) ]]
	v20 = p1
end
local v22 = false
local v23 = nil
local v24 = nil
function t.enableCameraToggleInput() --[[ enableCameraToggleInput | Line: 524 | Upvalues: v22 (ref), v19 (ref), v20 (ref), v23 (ref), v24 (ref), v10 (ref), v21 (ref), v11 (ref), UserInputService (copy) ]]
	if v22 then
		return
	end
	v22 = true
	v19 = false
	v20 = false
	if v23 then
		v23:Disconnect()
	end
	if v24 then
		v24:Disconnect()
	end
	v23 = v10:Connect(function() --[[ Line: 541 | Upvalues: v19 (ref), v21 (ref) ]]
		v19 = true
		v21 = tick()
	end)
	v24 = v11:Connect(function() --[[ Line: 546 | Upvalues: v19 (ref), v21 (ref), v20 (ref), UserInputService (ref) ]]
		v19 = false
		if not (tick() - v21 < 0.3 and (v20 or UserInputService:GetMouseDelta().Magnitude < 2)) then
			return
		end
		v20 = not v20
	end)
end
function t.disableCameraToggleInput() --[[ disableCameraToggleInput | Line: 554 | Upvalues: v22 (ref), v23 (ref), v24 (ref) ]]
	if not v22 then
		return
	end
	v22 = false
	if v23 then
		v23:Disconnect()
		v23 = nil
	end
	if not v24 then
		return
	end
	v24:Disconnect()
	v24 = nil
end
return t