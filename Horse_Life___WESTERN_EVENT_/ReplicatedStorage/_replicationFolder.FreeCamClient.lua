-- https://lua.expert/
local v1 = require(game.ReplicatedStorage.Sonar)("PlayerWrapper").GetClient()
local t = {}
local abs = math.abs
local clamp = math.clamp
local exp = math.exp
local rad = math.rad
local sign = math.sign
local sqrt = math.sqrt
local tan = math.tan
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local CurrentCamera = Workspace.CurrentCamera
Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 25 | Upvalues: Workspace (copy), CurrentCamera (ref) ]]
	local CurrentCamera_2 = Workspace.CurrentCamera
	if not CurrentCamera_2 then
		return
	end
	CurrentCamera = CurrentCamera_2
end)
local High = Enum.ContextActionPriority.High.Value
local v2 = Vector2.new(0.75, 1) * 8
local t2 = {}
t2.__index = t2
function t2.new(p1, p2) --[[ new | Line: 51 | Upvalues: t2 (copy) ]]
	local v2 = setmetatable({}, t2)
	v2.f = p1
	v2.p = p2
	v2.v = p2 * 0
	return v2
end
function t2.Update(p1, p2, p3) --[[ Update | Line: 59 | Upvalues: exp (copy) ]]
	local v1 = p1.f * 2 * math.pi
	local v = p1.v
	local v2 = p3 - p1.p
	local v3 = exp(-v1 * p2)
	local v4 = p3 + (v * p2 - v2 * (v1 * p2 + 1)) * v3
	p1.p = v4
	p1.v = (v1 * p2 * (v2 * v1 - v) + v) * v3
	return v4
end
function t2.Reset(p1, p2) --[[ Reset | Line: 76 ]]
	p1.p = p2
	p1.v = p2 * 0
end
local v3 = Vector3.new()
local v4 = Vector2.new()
local v5 = 0
local v6 = t2.new(1.5, (Vector3.new()))
local v7 = t2.new(1, Vector2.new())
local v8 = t2.new(4, 0)
local v9 = nil
local t3 = {}
local function fCurve(p1) --[[ fCurve | Line: 101 | Upvalues: exp (copy) ]]
	return (exp(2 * p1) - 1) / (math.exp(2) - 1)
end
local function fDeadzone(p1) --[[ fDeadzone | Line: 105 | Upvalues: exp (copy) ]]
	return (exp(2 * ((p1 - 0.15) / 0.85)) - 1) / (math.exp(2) - 1)
end
local function thumbstickCurve(p1) --[[ thumbstickCurve | Line: 109 | Upvalues: sign (copy), abs (copy), exp (copy), clamp (copy) ]]
	return sign(p1) * clamp((exp(2 * ((abs(p1) - 0.15) / 0.85)) - 1) / (math.exp(2) - 1), 0, 1)
end
local t4 = {
	ButtonX = 0,
	ButtonY = 0,
	DPadDown = 0,
	DPadUp = 0,
	ButtonL2 = 0,
	ButtonR2 = 0,
	Thumbstick1 = Vector2.new(),
	Thumbstick2 = Vector2.new()
}
local t5 = {
	W = 0,
	A = 0,
	S = 0,
	D = 0,
	E = 0,
	Q = 0,
	U = 0,
	H = 0,
	J = 0,
	K = 0,
	I = 0,
	Y = 0,
	Up = 0,
	Down = 0,
	LeftShift = 0,
	RightShift = 0
}
local t6 = {
	MouseWheel = 0,
	Delta = Vector2.new()
}
local v10 = Vector2.new(1, 1) * 0.04908738521234052
local v11 = Vector2.new(1, 1) * 0.39269908169872414
local v12 = 1
function t3.Vel(p1) --[[ Vel | Line: 160 | Upvalues: v1 (copy), v12 (ref), t5 (copy), clamp (copy), thumbstickCurve (ref), t4 (copy), UserInputService (copy) ]]
	if not v1:IsInAction("CameraMode") then
		return
	end
	v12 = clamp(v12 + p1 * (t5.Up - t5.Down) * 0.75, 0.01, 4)
	local v5 = Vector3.new(thumbstickCurve(t4.Thumbstick1.X), thumbstickCurve(t4.ButtonR2) - thumbstickCurve(t4.ButtonL2), thumbstickCurve(-t4.Thumbstick1.Y)) * Vector3.new(1, 1, 1)
	local v6 = if UserInputService.TouchEnabled then v1.PlayerControls:GetMoveVector() * Vector3.new(1, 1, 1) * 0.65 else Vector3.new(t5.D - t5.A + t5.K - t5.H, t5.E - t5.Q + t5.I - t5.Y, t5.S - t5.W + t5.J - t5.U) * Vector3.new(1, 1, 1) or v1.PlayerControls:GetMoveVector() * Vector3.new(1, 1, 1) * 0.65
	return (v5 + v6) * (v12 * (if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 0.25 else 1))
end
function t3.Pan(p1) --[[ Pan | Line: 182 | Upvalues: thumbstickCurve (ref), t4 (copy), v11 (copy), t6 (copy), v10 (copy) ]]
	local v1 = Vector2.new(thumbstickCurve(t4.Thumbstick2.Y), thumbstickCurve(-t4.Thumbstick2.X)) * v11
	local v2 = t6.Delta * v10
	t6.Delta = Vector2.new()
	return v1 + v2
end
function t3.Fov(p1) --[[ Fov | Line: 192 | Upvalues: t4 (copy), t6 (copy) ]]
	local v2 = t6.MouseWheel * 1
	t6.MouseWheel = 0
	return (t4.ButtonX - t4.ButtonY) * 0.25 + v2
end
local function Keypress(p1, p2, p3) --[[ Keypress | Line: 200 | Upvalues: t5 (copy) ]]
	t5[p3.KeyCode.Name] = if p2 == Enum.UserInputState.Begin then 1 else 0
	return Enum.ContextActionResult.Sink
end
local function GpButton(p1, p2, p3) --[[ GpButton | Line: 205 | Upvalues: t4 (copy) ]]
	t4[p3.KeyCode.Name] = if p2 == Enum.UserInputState.Begin then 1 else 0
	return Enum.ContextActionResult.Sink
end
local function MousePan(p1, p2, p3) --[[ MousePan | Line: 210 | Upvalues: t6 (copy) ]]
	local Delta = p3.Delta
	t6.Delta = Vector2.new(-Delta.y, -Delta.x)
	return Enum.ContextActionResult.Pass
end
local function Thumb(p1, p2, p3) --[[ Thumb | Line: 216 | Upvalues: t4 (copy) ]]
	t4[p3.KeyCode.Name] = p3.Position
	return Enum.ContextActionResult.Sink
end
local function Trigger(p1, p2, p3) --[[ Trigger | Line: 221 | Upvalues: t4 (copy) ]]
	t4[p3.KeyCode.Name] = p3.Position.z
	return Enum.ContextActionResult.Sink
end
local function MouseWheel(p1, p2, p3) --[[ MouseWheel | Line: 226 | Upvalues: t6 (copy) ]]
	t6[p3.UserInputType.Name] = -p3.Position.z
	return Enum.ContextActionResult.Sink
end
local function Zero(p1) --[[ Zero | Line: 231 ]]
	for k, v in pairs(p1) do
		p1[k] = v * 0
	end
end
function t3.StartCapture() --[[ StartCapture | Line: 237 | Upvalues: ContextActionService (copy), Keypress (copy), High (copy), MousePan (copy), MouseWheel (copy), GpButton (copy), Trigger (copy), Thumb (copy) ]]
	ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, High, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down)
	ContextActionService:BindActionAtPriority("FreecamMousePan", MousePan, false, High, Enum.UserInputType.MouseMovement)
	ContextActionService:BindActionAtPriority("FreecamTouchPan", MousePan, false, High, Enum.UserInputType.Touch)
	ContextActionService:BindActionAtPriority("FreecamMouseWheel", MouseWheel, false, High, Enum.UserInputType.MouseWheel)
	ContextActionService:BindActionAtPriority("FreecamGamepadButton", GpButton, false, High, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
	ContextActionService:BindActionAtPriority("FreecamGamepadTrigger", Trigger, false, High, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
	ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb, false, High, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
end
function t3.StopCapture() --[[ StopCapture | Line: 255 | Upvalues: v12 (ref), t4 (copy), t5 (copy), t6 (copy), ContextActionService (copy) ]]
	v12 = 1
	local v1 = t4
	for k, v in pairs(v1) do
		v1[k] = v * 0
	end
	local v2 = t5
	for k, v in pairs(v2) do
		v2[k] = v * 0
	end
	local v3 = t6
	for k, v in pairs(v3) do
		v3[k] = v * 0
	end
	ContextActionService:UnbindAction("FreecamKeyboard")
	ContextActionService:UnbindAction("FreecamTouchPan")
	ContextActionService:UnbindAction("FreecamMousePan")
	ContextActionService:UnbindAction("FreecamMouseWheel")
	ContextActionService:UnbindAction("FreecamGamepadButton")
	ContextActionService:UnbindAction("FreecamGamepadTrigger")
	ContextActionService:UnbindAction("FreecamGamepadThumbstick")
end
local function GetFocusDistance(p1) --[[ GetFocusDistance | Line: 271 | Upvalues: CurrentCamera (ref), v5 (ref), tan (copy), Workspace (copy) ]]
	local ViewportSize = CurrentCamera.ViewportSize
	local v1 = tan(v5 / 2) * 2
	local v2 = ViewportSize.x / ViewportSize.y * v1
	local rightVector = p1.rightVector
	local upVector = p1.upVector
	local lookVector = p1.lookVector
	local v3 = Vector3.new()
	local v4 = 512
	for i = 0, 1, 0.5 do
		for j = 0, 1, 0.5 do
			local v52 = rightVector * ((i - 0.5) * v2) - upVector * ((j - 0.5) * v1) + lookVector
			local v6 = p1.p + v52 * 0.1
			local _, v7 = Workspace:FindPartOnRay(Ray.new(v6, v52.unit * v4))
			local magnitude = (v7 - v6).magnitude
			if magnitude < v4 then
				v3 = v52.unit
				v4 = magnitude
			end
		end
	end
	return lookVector:Dot(v3) * v4
end
local function ClampDistanceBetweenVectors(p1, p2, p3) --[[ ClampDistanceBetweenVectors | Line: 303 ]]
	return p1 + (p2 - p1).Unit * math.min((p2 - p1).Magnitude, p3)
end
local v13 = nil
local function StepFreecam(p1) --[[ StepFreecam | Line: 308 | Upvalues: v6 (copy), t3 (copy), v7 (copy), v8 (copy), v5 (ref), rad (copy), tan (copy), sqrt (copy), clamp (copy), v4 (ref), v2 (copy), Players (copy), v13 (ref), CurrentCamera (ref), v3 (ref), GetFocusDistance (copy) ]]
	local v1 = v6:Update(p1, t3.Vel(p1))
	local v22 = v7:Update(p1, t3.Pan(p1))
	local v32 = v8:Update(p1, t3.Fov(p1))
	local v42 = sqrt(0.7002075382097097 / tan((rad(v5 / 2))))
	v5 = clamp(v5 + v32 * 300 * (p1 / v42), 1, 120)
	v4 = v4 + v22 * v2 * (p1 / v42)
	v4 = Vector2.new(clamp(v4.x, -1.5707963267948966, 1.5707963267948966), v4.y % 6.283185307179586)
	local v52 = 150
	local Character = Players.LocalPlayer.Character
	if Character then
		local PrimaryPart = Character.PrimaryPart
		if PrimaryPart then
			v52 = math.max(PrimaryPart.Size.Magnitude / 2, v52)
		end
	end
	local v82, v9, v10, v11, v12, v132, v14
	if v13 then
		v82 = CurrentCamera.CFrame
		if not v82 then
			v9 = CFrame.new
			v10 = game.Players.LocalPlayer.Character:GetPivot().p
			v11 = v3
			v12 = if v13 then 30 else v52
			v132 = (v3 - v10).Unit
			v14 = (v3 - v10).Magnitude
			v82 = v9(v10 + v132 * math.min(v14, v12)) * CFrame.fromOrientation(v4.x, v4.y, 0) * CFrame.new(v1 * Vector3.new(64, 64, 64) * p1)
		end
	else
		v9 = CFrame.new
		v10 = game.Players.LocalPlayer.Character:GetPivot().p
		v11 = v3
		v12 = if v13 then 30 else v52
		v132 = (v3 - v10).Unit
		v14 = (v3 - v10).Magnitude
		v82 = v9(v10 + v132 * math.min(v14, v12)) * CFrame.fromOrientation(v4.x, v4.y, 0) * CFrame.new(v1 * Vector3.new(64, 64, 64) * p1)
	end
	v3 = v82.p
	CurrentCamera.CFrame = v82
	CurrentCamera.Focus = v82 * CFrame.new(0, 0, -GetFocusDistance(v82))
	CurrentCamera.FieldOfView = v5
end
local t7 = {}
local v14 = nil
local v15 = nil
local v16 = nil
local v17 = nil
local v18 = nil
function t7.Push() --[[ Push | Line: 345 | Upvalues: v18 (ref), CurrentCamera (ref), v15 (ref), v17 (ref), v16 (ref), v14 (ref), UserInputService (copy) ]]
	v18 = CurrentCamera.FieldOfView
	CurrentCamera.FieldOfView = 70
	v15 = CurrentCamera.CameraType
	CurrentCamera.CameraType = Enum.CameraType.Custom
	v17 = CurrentCamera.CFrame
	v16 = CurrentCamera.Focus
	v14 = UserInputService.MouseBehavior
	UserInputService.MouseBehavior = Enum.MouseBehavior.Default
end
function t7.Pop() --[[ Pop | Line: 360 | Upvalues: v18 (ref), CurrentCamera (ref), v15 (ref), v17 (ref), v16 (ref), v14 (ref), UserInputService (copy) ]]
	if v18 then
		CurrentCamera.FieldOfView = v18
		v18 = nil
	end
	if v15 then
		CurrentCamera.CameraType = Enum.CameraType.Scriptable
		v15 = nil
	end
	if v17 then
		CurrentCamera.CFrame = v17
		v17 = nil
	end
	if v16 then
		CurrentCamera.Focus = v16
		v16 = nil
	end
	if not v14 then
		return
	end
	UserInputService.MouseBehavior = v14
	v14 = nil
end
local function StartFreecam() --[[ StartFreecam | Line: 388 | Upvalues: v9 (ref), CurrentCamera (ref), v4 (ref), v3 (ref), v5 (ref), v1 (copy), v6 (copy), v7 (copy), v8 (copy), t7 (copy), RunService (copy), StepFreecam (copy), t3 (copy) ]]
	v9 = game.Players.LocalPlayer.Character.PrimaryPart.CFrame:ToObjectSpace(CurrentCamera.CFrame)
	local v12 = CurrentCamera.CFrame
	v4 = Vector2.new(v12:toEulerAnglesYXZ())
	v3 = v12.p
	v5 = CurrentCamera.FieldOfView
	v1._isInFreecam = true
	v6:Reset((Vector3.new()))
	v7:Reset(Vector2.new())
	v8:Reset(0)
	t7.Push()
	RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
	t3.StartCapture()
end
local function StopFreecam(p1) --[[ StopFreecam | Line: 406 | Upvalues: t3 (copy), RunService (copy), t7 (copy), t (copy), v1 (copy) ]]
	t3.StopCapture()
	RunService:UnbindFromRenderStep("Freecam")
	t7.Pop()
	if not p1 then
		t.SetCameraLock(false)
	end
	v1._isInFreecam = false
end
local v19 = false
function t.SetFreecam(p1) --[[ SetFreecam | Line: 422 | Upvalues: v19 (ref), StartFreecam (copy), t3 (copy), RunService (copy), t7 (copy), t (copy), v1 (copy) ]]
	v19 = p1
	if p1 then
		StartFreecam()
	else
		t3.StopCapture()
		RunService:UnbindFromRenderStep("Freecam")
		t7.Pop()
		t.SetCameraLock(false)
		v1._isInFreecam = false
	end
end
local v20 = nil
function t.SetCameraLock(p1) --[[ SetCameraLock | Line: 432 | Upvalues: v13 (ref), v9 (ref), CurrentCamera (ref), v20 (ref), RunService (copy) ]]
	v13 = p1
	if p1 then
		v9 = CFrame.new(game.Players.LocalPlayer.Character:GetPivot().p):ToObjectSpace(CurrentCamera.CFrame)
	end
	if not p1 then
		return
	end
	if v20 then
		v20:Disconnect()
	end
	v20 = RunService.RenderStepped:Connect(function() --[[ Line: 441 | Upvalues: p1 (copy), v13 (ref), CurrentCamera (ref), v9 (ref), v20 (ref) ]]
		if p1 and v13 then
			CurrentCamera.CFrame = CFrame.new(game.Players.LocalPlayer.Character:GetPivot().p) * v9
		else
			v20:Disconnect()
		end
	end)
end
return t