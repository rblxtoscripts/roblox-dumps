-- https://lua.expert/
local ContextActionService = game:GetService("ContextActionService")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local VRService = game:GetService("VRService")
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local UserCameraInputDt = require(CommonUtils:WaitForChild("FlagUtil")).getUserFlag("UserCameraInputDt")
local LocalPlayer = Players.LocalPlayer
local Medium = Enum.ContextActionPriority.Medium.Value
local v1 = Vector2.new(1, 0.77) * math.rad(4)
local v2 = Vector2.new(1, 0.77) * math.rad(0.5)
local v3 = Vector2.new(1, 0.77) * math.rad(7)
local v4 = Vector2.new(1, 0.66) * math.rad(1)
if UserCameraInputDt then
	v1 = v1 * 60
end
local v5, v6 = pcall(function() --[[ Line: 41 ]]
	return UserSettings():IsUserFeatureEnabled("UserResetTouchStateOnMenuOpen")
end)
local v7 = v5 and v6
local v8, v9 = pcall(function() --[[ Line: 49 ]]
	return UserSettings():IsUserFeatureEnabled("UserClearPanOnCameraDisable")
end)
local v10 = v8 and v9
local v11, v12 = pcall(function() --[[ Line: 57 ]]
	return UserSettings():IsUserFeatureEnabled("UserFixGamepadSensitivity")
end)
local v13 = v11 and v12
local v14 = Instance.new("BindableEvent")
local v15 = Instance.new("BindableEvent")
local v16 = v14.Event
local v17 = v15.Event
UserInputService.InputBegan:Connect(function(p1, p2) --[[ Line: 71 | Upvalues: v14 (copy) ]]
	if p2 or p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
		return
	end
	v14:Fire()
end)
UserInputService.InputEnded:Connect(function(p1, p2) --[[ Line: 77 | Upvalues: v15 (copy) ]]
	if p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
		return
	end
	v15:Fire()
end)
local function thumbstickCurve(p1) --[[ thumbstickCurve | Line: 88 ]]
	local v2 = (math.exp((math.abs(p1) - 0.1) / 0.9 * 2) - 1) / (math.exp(2) - 1)
	return math.sign(p1) * math.clamp(v2, 0, 1)
end
local function adjustTouchPitchSensitivity(p1) --[[ adjustTouchPitchSensitivity | Line: 102 ]]
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
local function isInDynamicThumbstickArea(p1) --[[ isInDynamicThumbstickArea | Line: 128 | Upvalues: LocalPlayer (copy) ]]
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
local v18 = 1 / 60
RunService.Stepped:Connect(function(p1, p2) --[[ Line: 153 | Upvalues: v18 (ref) ]]
	v18 = p2
end)
local t = {}
local t2 = {}
local v19 = 0
local function incPanInputCount() --[[ incPanInputCount | Line: 163 | Upvalues: v19 (ref) ]]
	v19 = math.max(0, v19 + 1)
end
local function decPanInputCount() --[[ decPanInputCount | Line: 167 | Upvalues: v19 (ref) ]]
	v19 = math.max(0, v19 - 1)
end
local function resetPanInputCount() --[[ resetPanInputCount | Line: 171 | Upvalues: v19 (ref) ]]
	v19 = 0
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
local v20 = Instance.new("BindableEvent")
t.gamepadZoomPress = v20.Event
local v21 = VRService.VREnabled and Instance.new("BindableEvent") or nil
if VRService.VREnabled then
	t.gamepadReset = v21.Event
end
function t.getRotationActivated() --[[ getRotationActivated | Line: 204 | Upvalues: v19 (ref), t3 (copy) ]]
	return if v19 > 0 then true else t3.Thumbstick2.Magnitude > 0
end
function t.getRotation(p1, p2) --[[ getRotation | Line: 208 | Upvalues: UserGameSettings (copy), UserCameraInputDt (copy), t4 (copy), v18 (ref), v13 (ref), t3 (copy), t5 (copy), adjustTouchPitchSensitivity (copy), t6 (copy), v1 (ref), v2 (copy), v3 (copy), v4 (copy) ]]
	local v12 = Vector2.new(1, UserGameSettings:GetCameraYInvertValue())
	local v22 = if UserCameraInputDt then Vector2.new(t4.Right - t4.Left, 0) * p1 else Vector2.new(t4.Right - t4.Left, 0) * v18
	local v32 = if v13 then t3.Thumbstick2 * UserGameSettings.GamepadCameraSensitivity else t3.Thumbstick2
	if UserCameraInputDt then
		v32 = v32 * p1
	end
	local v42 = adjustTouchPitchSensitivity(t6.Move)
	if p2 then
		v22 = Vector2.new()
	end
	return (v22 * math.rad(120) + v32 * v1 + t5.Movement * v2 + t5.Pan * v3 + v42 * v4) * v12
end
function t.getZoomDelta() --[[ getZoomDelta | Line: 248 | Upvalues: t4 (copy), t5 (copy), t6 (copy) ]]
	return (t4.O - t4.I) * 0.1 + (-t5.Wheel + t5.Pinch) * 1 + -t6.Pinch * 0.04
end
local function thumbstick(p1, p2, p3) --[[ thumbstick | Line: 256 | Upvalues: t3 (copy), thumbstickCurve (ref) ]]
	local Position = p3.Position
	t3[p3.KeyCode.Name] = Vector2.new(thumbstickCurve(Position.X), -thumbstickCurve(Position.Y))
	return Enum.ContextActionResult.Pass
end
local function mouseMovement(p1) --[[ mouseMovement | Line: 262 | Upvalues: t5 (copy) ]]
	local Delta = p1.Delta
	t5.Movement = Vector2.new(Delta.X, Delta.Y)
end
local function mouseWheel(p1, p2, p3) --[[ mouseWheel | Line: 267 | Upvalues: t5 (copy) ]]
	t5.Wheel = p3.Position.Z
	return Enum.ContextActionResult.Pass
end
local function keypress(p1, p2, p3) --[[ keypress | Line: 272 | Upvalues: t4 (copy) ]]
	t4[p3.KeyCode.Name] = if p2 == Enum.UserInputState.Begin then 1 else 0
end
local function gamepadZoomPress(p1, p2, p3) --[[ gamepadZoomPress | Line: 276 | Upvalues: v20 (copy) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	v20:Fire()
end
local function gamepadReset(p1, p2, p3) --[[ gamepadReset | Line: 282 | Upvalues: v21 (copy) ]]
	if p2 ~= Enum.UserInputState.Begin then
		return
	end
	v21:Fire()
end
local function resetInputDevices() --[[ resetInputDevices | Line: 288 | Upvalues: t3 (copy), t4 (copy), t5 (copy), t6 (copy), v10 (ref), v19 (ref) ]]
	for k, v in pairs({ t3, t4, t5, t6 }) do
		for k2, v2 in pairs(v) do
			if type(v2) == "boolean" then
				v[k2] = false
				continue
			end
			v[k2] = v[k2] * 0
		end
	end
	if not v10 then
		return
	end
	v19 = 0
end
local t7 = {}
local v22 = nil
local v23 = nil
local function touchBegan(p1, p2) --[[ touchBegan | Line: 316 | Upvalues: v22 (ref), isInDynamicThumbstickArea (copy), v19 (ref), t7 (ref) ]]
	assert(if p1.UserInputType == Enum.UserInputType.Touch then true else false)
	assert(if p1.UserInputState == Enum.UserInputState.Begin then true else false)
	if v22 == nil and (isInDynamicThumbstickArea(p1.Position) and not p2) then
		v22 = p1
		return
	end
	if not p2 then
		v19 = math.max(0, v19 + 1)
	end
	t7[p1] = p2
end
local function touchEnded(p1, p2) --[[ touchEnded | Line: 336 | Upvalues: v22 (ref), t7 (ref), v23 (ref), v19 (ref) ]]
	assert(p1.UserInputType == Enum.UserInputType.Touch)
	assert(p1.UserInputState == Enum.UserInputState.End)
	if p1 == v22 then
		v22 = nil
	end
	if t7[p1] ~= false then
		t7[p1] = nil
		return
	end
	v23 = nil
	v19 = math.max(0, v19 - 1)
	t7[p1] = nil
end
local function touchChanged(p1, p2) --[[ touchChanged | Line: 355 | Upvalues: v22 (ref), t7 (ref), t6 (copy), v23 (ref) ]]
	assert(if p1.UserInputType == Enum.UserInputType.Touch then true else false)
	assert(if p1.UserInputState == Enum.UserInputState.Change then true else false)
	if p1 == v22 then
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
		v23 = nil
		return
	end
	local Magnitude = (t[1].Position - t[2].Position).Magnitude
	if v23 then
		local v4 = t6
		v4.Pinch = v4.Pinch + (Magnitude - v23)
	end
	v23 = Magnitude
end
local function resetTouchState() --[[ resetTouchState | Line: 399 | Upvalues: t7 (ref), v22 (ref), v23 (ref), v7 (ref), v19 (ref) ]]
	t7 = {}
	v22 = nil
	v23 = nil
	if not v7 then
		return
	end
	v19 = 0
end
local function pointerAction(p1, p2, p3, p4) --[[ pointerAction | Line: 409 | Upvalues: t5 (copy) ]]
	if p4 then
		return
	end
	t5.Wheel = p1
	t5.Pan = p2
	t5.Pinch = -p3
end
local function inputBegan(p1, p2) --[[ inputBegan | Line: 417 | Upvalues: touchBegan (ref), v19 (ref) ]]
	if p1.UserInputType == Enum.UserInputType.Touch then
		touchBegan(p1, p2)
		return
	end
	if p1.UserInputType ~= Enum.UserInputType.MouseButton2 or p2 then
		return
	end
	v19 = math.max(0, v19 + 1)
end
local function inputChanged(p1, p2) --[[ inputChanged | Line: 426 | Upvalues: touchChanged (ref), t5 (copy) ]]
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
local function inputEnded(p1, p2) --[[ inputEnded | Line: 435 | Upvalues: touchEnded (ref), v19 (ref) ]]
	if p1.UserInputType == Enum.UserInputType.Touch then
		touchEnded(p1, p2)
		return
	end
	if p1.UserInputType ~= Enum.UserInputType.MouseButton2 then
		return
	end
	v19 = math.max(0, v19 - 1)
end
local v24 = false
function t.setInputEnabled(p1) --[[ setInputEnabled | Line: 446 | Upvalues: v24 (ref), resetInputDevices (copy), resetTouchState (ref), ContextActionService (copy), thumbstick (copy), Medium (copy), keypress (copy), VRService (copy), gamepadReset (copy), gamepadZoomPress (copy), t2 (ref), UserInputService (copy), inputBegan (copy), inputChanged (copy), inputEnded (copy), pointerAction (copy), v7 (ref) ]]
	if v24 == p1 then
		return
	end
	v24 = p1
	resetInputDevices()
	resetTouchState()
	if p1 then
		ContextActionService:BindActionAtPriority("RbxCameraThumbstick", thumbstick, false, Medium, Enum.KeyCode.Thumbstick2)
		ContextActionService:BindActionAtPriority("RbxCameraKeypress", keypress, false, Medium, Enum.KeyCode.Left, Enum.KeyCode.Right, Enum.KeyCode.I, Enum.KeyCode.O)
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
function t.getInputEnabled() --[[ getInputEnabled | Line: 518 | Upvalues: v24 (ref) ]]
	return v24
end
function t.resetInputForFrameEnd() --[[ resetInputForFrameEnd | Line: 522 | Upvalues: t5 (copy), t6 (copy) ]]
	t5.Movement = Vector2.new()
	t6.Move = Vector2.new()
	t6.Pinch = 0
	t5.Wheel = 0
	t5.Pan = Vector2.new()
	t5.Pinch = 0
end
UserInputService.WindowFocused:Connect(resetInputDevices)
UserInputService.WindowFocusReleased:Connect(resetInputDevices)
local v25 = false
local v26 = false
local v27 = 0
function t.getHoldPan() --[[ getHoldPan | Line: 543 | Upvalues: v25 (ref) ]]
	return v25
end
function t.getTogglePan() --[[ getTogglePan | Line: 547 | Upvalues: v26 (ref) ]]
	return v26
end
function t.getPanning() --[[ getPanning | Line: 551 | Upvalues: v26 (ref), v25 (ref) ]]
	return v26 or v25
end
function t.setTogglePan(p1) --[[ setTogglePan | Line: 555 | Upvalues: v26 (ref) ]]
	v26 = p1
end
local v28 = false
local v29 = nil
local v30 = nil
function t.enableCameraToggleInput() --[[ enableCameraToggleInput | Line: 563 | Upvalues: v28 (ref), v25 (ref), v26 (ref), v29 (ref), v30 (ref), v16 (ref), v27 (ref), v17 (ref), UserInputService (copy) ]]
	if v28 then
		return
	end
	v28 = true
	v25 = false
	v26 = false
	if v29 then
		v29:Disconnect()
	end
	if not v30 then
		v29 = v16:Connect(function() --[[ Line: 580 | Upvalues: v25 (ref), v27 (ref) ]]
			v25 = true
			v27 = tick()
		end)
		v30 = v17:Connect(function() --[[ Line: 585 | Upvalues: v25 (ref), v27 (ref), v26 (ref), UserInputService (ref) ]]
			v25 = false
			if not (tick() - v27 < 0.3 and (v26 or UserInputService:GetMouseDelta().Magnitude < 2)) then
				return
			end
			v26 = not v26
		end)
		return
	end
	v30:Disconnect()
	v29 = v16:Connect(function() --[[ Line: 580 | Upvalues: v25 (ref), v27 (ref) ]]
		v25 = true
		v27 = tick()
	end)
	v30 = v17:Connect(function() --[[ Line: 585 | Upvalues: v25 (ref), v27 (ref), v26 (ref), UserInputService (ref) ]]
		v25 = false
		if not (tick() - v27 < 0.3 and (v26 or UserInputService:GetMouseDelta().Magnitude < 2)) then
			return
		end
		v26 = not v26
	end)
end
function t.disableCameraToggleInput() --[[ disableCameraToggleInput | Line: 593 | Upvalues: v28 (ref), v29 (ref), v30 (ref) ]]
	if not v28 then
		return
	end
	v28 = false
	if v29 then
		v29:Disconnect()
		v29 = nil
	end
	if not v30 then
		return
	end
	v30:Disconnect()
	v30 = nil
end
return t