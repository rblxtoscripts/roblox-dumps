-- https://lua.expert/
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
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer
if not LocalPlayer then
	Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
	LocalPlayer = Players.LocalPlayer
end
if table.find({ 79745056, 148378203, 2726552643, 2732748403, 64723938 }, LocalPlayer.UserId) then
	local CurrentCamera = Workspace.CurrentCamera
	Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 34 | Upvalues: Workspace (copy), CurrentCamera (ref) ]]
		local CurrentCamera_2 = Workspace.CurrentCamera
		if not CurrentCamera_2 then
			return
		end
		CurrentCamera = CurrentCamera_2
	end)
	local Low = Enum.ContextActionPriority.Low.Value
	local High = Enum.ContextActionPriority.High.Value
	local t = { Enum.KeyCode.LeftShift, Enum.KeyCode.P }
	local t2 = { Enum.KeyCode.LeftShift, Enum.KeyCode.L }
	local v1 = Vector2.new(0.75, 1) * 8
	local t3 = {}
	t3.__index = t3
	function t3.new(p1, p2) --[[ new | Line: 63 | Upvalues: t3 (copy) ]]
		local v2 = setmetatable({}, t3)
		v2.f = p1
		v2.p = p2
		v2.v = p2 * 0
		return v2
	end
	function t3.Update(p1, p2, p3) --[[ Update | Line: 71 | Upvalues: exp (copy) ]]
		local v1 = p1.f * 2 * math.pi
		local v = p1.v
		local v2 = p3 - p1.p
		local v3 = exp(-v1 * p2)
		local v4 = p3 + (v * p2 - v2 * (v1 * p2 + 1)) * v3
		p1.p = v4
		p1.v = (v1 * p2 * (v2 * v1 - v) + v) * v3
		return v4
	end
	function t3.Reset(p1, p2) --[[ Reset | Line: 88 ]]
		p1.p = p2
		p1.v = p2 * 0
	end
	local v2 = Vector3.new()
	local v3 = Vector2.new()
	local v4 = 0
	local v5 = t3.new(1.5, (Vector3.new()))
	local v6 = t3.new(1, Vector2.new())
	local v7 = t3.new(4, 0)
	local t4 = {}
	local function fCurve(p1) --[[ fCurve | Line: 111 | Upvalues: exp (copy) ]]
		return (exp(2 * p1) - 1) / (math.exp(2) - 1)
	end
	local function fDeadzone(p1) --[[ fDeadzone | Line: 115 | Upvalues: exp (copy) ]]
		return (exp(2 * ((p1 - 0.15) / 0.85)) - 1) / (math.exp(2) - 1)
	end
	local function thumbstickCurve(p1) --[[ thumbstickCurve | Line: 119 | Upvalues: sign (copy), abs (copy), exp (copy), clamp (copy) ]]
		return sign(p1) * clamp((exp(2 * ((abs(p1) - 0.15) / 0.85)) - 1) / (math.exp(2) - 1), 0, 1)
	end
	local t5 = {
		ButtonX = 0,
		ButtonY = 0,
		DPadDown = 0,
		DPadUp = 0,
		ButtonL2 = 0,
		ButtonR2 = 0,
		Thumbstick1 = Vector2.new(),
		Thumbstick2 = Vector2.new()
	}
	local t6 = {
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
	local t7 = {
		MouseWheel = 0,
		Delta = Vector2.new()
	}
	local v8 = Vector2.new(1, 1) * 0.04908738521234052
	local v9 = Vector2.new(1, 1) * 0.39269908169872414
	local v10 = 1
	function t4.Vel(p1) --[[ Vel | Line: 170 | Upvalues: v10 (ref), t6 (copy), clamp (copy), thumbstickCurve (ref), t5 (copy), UserInputService (copy) ]]
		v10 = clamp(v10 + p1 * (t6.Up - t6.Down) * 0.75, 0.01, 4)
		local v5 = Vector3.new(thumbstickCurve(t5.Thumbstick1.X), thumbstickCurve(t5.ButtonR2) - thumbstickCurve(t5.ButtonL2), thumbstickCurve(-t5.Thumbstick1.Y)) * Vector3.new(1, 1, 1)
		local v9 = Vector3.new(t6.D - t6.A + t6.K - t6.H, t6.E - t6.Q + t6.I - t6.Y, t6.S - t6.W + t6.J - t6.U) * Vector3.new(1, 1, 1)
		return (v5 + v9) * (v10 * (if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then 0.25 else 1))
	end
	function t4.Pan(p1) --[[ Pan | Line: 190 | Upvalues: thumbstickCurve (ref), t5 (copy), v9 (copy), t7 (copy), v8 (copy) ]]
		local v1 = Vector2.new(thumbstickCurve(t5.Thumbstick2.Y), thumbstickCurve(-t5.Thumbstick2.X)) * v9
		local v2 = t7.Delta * v8
		t7.Delta = Vector2.new()
		return v1 + v2
	end
	function t4.Fov(p1) --[[ Fov | Line: 200 | Upvalues: t5 (copy), t7 (copy) ]]
		local v2 = t7.MouseWheel * 1
		t7.MouseWheel = 0
		return (t5.ButtonX - t5.ButtonY) * 0.25 + v2
	end
	local function Keypress(p1, p2, p3) --[[ Keypress | Line: 208 | Upvalues: t6 (copy) ]]
		t6[p3.KeyCode.Name] = if p2 == Enum.UserInputState.Begin then 1 else 0
		return Enum.ContextActionResult.Sink
	end
	local function GpButton(p1, p2, p3) --[[ GpButton | Line: 213 | Upvalues: t5 (copy) ]]
		t5[p3.KeyCode.Name] = if p2 == Enum.UserInputState.Begin then 1 else 0
		return Enum.ContextActionResult.Sink
	end
	local function MousePan(p1, p2, p3) --[[ MousePan | Line: 218 | Upvalues: t7 (copy) ]]
		local Delta = p3.Delta
		t7.Delta = Vector2.new(-Delta.y, -Delta.x)
		return Enum.ContextActionResult.Sink
	end
	local function Thumb(p1, p2, p3) --[[ Thumb | Line: 224 | Upvalues: t5 (copy) ]]
		t5[p3.KeyCode.Name] = p3.Position
		return Enum.ContextActionResult.Sink
	end
	local function Trigger(p1, p2, p3) --[[ Trigger | Line: 229 | Upvalues: t5 (copy) ]]
		t5[p3.KeyCode.Name] = p3.Position.z
		return Enum.ContextActionResult.Sink
	end
	local function MouseWheel(p1, p2, p3) --[[ MouseWheel | Line: 234 | Upvalues: t7 (copy) ]]
		t7[p3.UserInputType.Name] = -p3.Position.z
		return Enum.ContextActionResult.Sink
	end
	local function Zero(p1) --[[ Zero | Line: 239 ]]
		for k, v in pairs(p1) do
			p1[k] = v * 0
		end
	end
	function t4.StartCapture() --[[ StartCapture | Line: 245 | Upvalues: ContextActionService (copy), Keypress (copy), High (copy), MousePan (copy), MouseWheel (copy), GpButton (copy), Trigger (copy), Thumb (copy) ]]
		ContextActionService:BindActionAtPriority("FreecamKeyboard", Keypress, false, High, Enum.KeyCode.W, Enum.KeyCode.U, Enum.KeyCode.A, Enum.KeyCode.H, Enum.KeyCode.S, Enum.KeyCode.J, Enum.KeyCode.D, Enum.KeyCode.K, Enum.KeyCode.E, Enum.KeyCode.I, Enum.KeyCode.Q, Enum.KeyCode.Y, Enum.KeyCode.Up, Enum.KeyCode.Down)
		ContextActionService:BindActionAtPriority("FreecamMousePan", MousePan, false, High, Enum.UserInputType.MouseMovement)
		ContextActionService:BindActionAtPriority("FreecamMouseWheel", MouseWheel, false, High, Enum.UserInputType.MouseWheel)
		ContextActionService:BindActionAtPriority("FreecamGamepadButton", GpButton, false, High, Enum.KeyCode.ButtonX, Enum.KeyCode.ButtonY)
		ContextActionService:BindActionAtPriority("FreecamGamepadTrigger", Trigger, false, High, Enum.KeyCode.ButtonR2, Enum.KeyCode.ButtonL2)
		ContextActionService:BindActionAtPriority("FreecamGamepadThumbstick", Thumb, false, High, Enum.KeyCode.Thumbstick1, Enum.KeyCode.Thumbstick2)
	end
	function t4.StopCapture() --[[ StopCapture | Line: 262 | Upvalues: v10 (ref), t5 (copy), t6 (copy), t7 (copy), ContextActionService (copy) ]]
		v10 = 1
		local v1 = t5
		for k, v in pairs(v1) do
			v1[k] = v * 0
		end
		local v2 = t6
		for k, v in pairs(v2) do
			v2[k] = v * 0
		end
		local v3 = t7
		for k, v in pairs(v3) do
			v3[k] = v * 0
		end
		ContextActionService:UnbindAction("FreecamKeyboard")
		ContextActionService:UnbindAction("FreecamMousePan")
		ContextActionService:UnbindAction("FreecamMouseWheel")
		ContextActionService:UnbindAction("FreecamGamepadButton")
		ContextActionService:UnbindAction("FreecamGamepadTrigger")
		ContextActionService:UnbindAction("FreecamGamepadThumbstick")
	end
	local function GetFocusDistance(p1) --[[ GetFocusDistance | Line: 277 | Upvalues: CurrentCamera (ref), v4 (ref), tan (copy), Workspace (copy) ]]
		local ViewportSize = CurrentCamera.ViewportSize
		local v1 = tan(v4 / 2) * 2
		local v2 = ViewportSize.x / ViewportSize.y * v1
		local rightVector = p1.rightVector
		local upVector = p1.upVector
		local lookVector = p1.lookVector
		local v3 = Vector3.new()
		local v42 = 512
		for i = 0, 1, 0.5 do
			for j = 0, 1, 0.5 do
				local v5 = rightVector * ((i - 0.5) * v2) - upVector * ((j - 0.5) * v1) + lookVector
				local v6 = p1.p + v5 * 0.1
				local _, v7 = Workspace:FindPartOnRay(Ray.new(v6, v5.unit * v42))
				local magnitude = (v7 - v6).magnitude
				if magnitude < v42 then
					v3 = v5.unit
					v42 = magnitude
				end
			end
		end
		return lookVector:Dot(v3) * v42
	end
	local function StepFreecam(p1) --[[ StepFreecam | Line: 309 | Upvalues: v5 (copy), t4 (copy), v6 (copy), v7 (copy), v4 (ref), rad (copy), tan (copy), sqrt (copy), clamp (copy), v3 (ref), v1 (copy), v2 (ref), CurrentCamera (ref), GetFocusDistance (copy) ]]
		local v12 = v5:Update(p1, t4.Vel(p1))
		local v22 = v6:Update(p1, t4.Pan(p1))
		local v32 = v7:Update(p1, t4.Fov(p1))
		local v42 = sqrt(0.7002075382097097 / tan((rad(v4 / 2))))
		v4 = clamp(v4 + v32 * 300 * (p1 / v42), 1, 120)
		v3 = v3 + v22 * v1 * (p1 / v42)
		v3 = Vector2.new(clamp(v3.x, -1.5707963267948966, 1.5707963267948966), v3.y % 6.283185307179586)
		local v52 = CFrame.new(v2) * CFrame.fromOrientation(v3.x, v3.y, 0) * CFrame.new(v12 * Vector3.new(64, 64, 64) * p1)
		v2 = v52.p
		CurrentCamera.CFrame = v52
		CurrentCamera.Focus = v52 * CFrame.new(0, 0, -GetFocusDistance(v52))
		CurrentCamera.FieldOfView = v4
	end
	local t8 = {}
	local v11 = nil
	local v12 = nil
	local v13 = nil
	local v14 = nil
	local v15 = nil
	local v16 = nil
	local t9 = {}
	local t10 = {
		Backpack = true,
		Chat = true,
		Health = true,
		PlayerList = true
	}
	local t11 = {
		BadgesNotificationsActive = true,
		PointsNotificationsActive = true
	}
	function t8.PushUI() --[[ PushUI | Line: 349 | Upvalues: t10 (copy), StarterGui (copy), t11 (copy), LocalPlayer (ref), t9 (copy), v12 (ref), UserInputService (copy) ]]
		for k in pairs(t10) do
			t10[k] = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType[k])
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], false)
		end
		for k in pairs(t11) do
			t11[k] = StarterGui:GetCore(k)
			StarterGui:SetCore(k, false)
		end
		local PlayerGui = LocalPlayer:FindFirstChildOfClass("PlayerGui")
		if not PlayerGui then
			v12 = UserInputService.MouseIconEnabled
			UserInputService.MouseIconEnabled = false
			return
		end
		for k, v in pairs(PlayerGui:GetChildren()) do
			if v:IsA("ScreenGui") and v.Enabled then
				t9[#t9 + 1] = v
				v.Enabled = false
			end
		end
		v12 = UserInputService.MouseIconEnabled
		UserInputService.MouseIconEnabled = false
	end
	function t8.Push() --[[ Push | Line: 373 | Upvalues: t8 (copy), v16 (ref), CurrentCamera (ref), v13 (ref), v15 (ref), v14 (ref), v11 (ref), UserInputService (copy) ]]
		t8.PushUI()
		v16 = CurrentCamera.FieldOfView
		CurrentCamera.FieldOfView = 70
		v13 = CurrentCamera.CameraType
		CurrentCamera.CameraType = Enum.CameraType.Custom
		v15 = CurrentCamera.CFrame
		v14 = CurrentCamera.Focus
		v11 = UserInputService.MouseBehavior
		UserInputService.MouseBehavior = Enum.MouseBehavior.Default
	end
	function t8.PopUI() --[[ PopUI | Line: 389 | Upvalues: t10 (copy), StarterGui (copy), t11 (copy), t9 (copy), UserInputService (copy), v12 (ref) ]]
		for k, v in pairs(t10) do
			StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType[k], v)
		end
		for k, v in pairs(t11) do
			StarterGui:SetCore(k, v)
		end
		for k, v in pairs(t9) do
			if v.Parent then
				v.Enabled = true
			end
		end
		UserInputService.MouseIconEnabled = v12
		v12 = nil
	end
	function t8.Pop() --[[ Pop | Line: 407 | Upvalues: t8 (copy), CurrentCamera (ref), v16 (ref), v13 (ref), v15 (ref), v14 (ref), UserInputService (copy), v11 (ref) ]]
		t8.PopUI()
		CurrentCamera.FieldOfView = v16
		v16 = nil
		CurrentCamera.CameraType = v13
		v13 = nil
		CurrentCamera.CFrame = v15
		v15 = nil
		CurrentCamera.Focus = v14
		v14 = nil
		UserInputService.MouseBehavior = v11
		v11 = nil
	end
	local function StartFreecam() --[[ StartFreecam | Line: 427 | Upvalues: CurrentCamera (ref), v3 (ref), v2 (ref), v4 (ref), v5 (copy), v6 (copy), v7 (copy), t8 (copy), RunService (copy), StepFreecam (copy), t4 (copy) ]]
		local v1 = CurrentCamera.CFrame
		v3 = Vector2.new(v1:toEulerAnglesYXZ())
		v2 = v1.p
		v4 = CurrentCamera.FieldOfView
		v5:Reset((Vector3.new()))
		v6:Reset(Vector2.new())
		v7:Reset(0)
		t8.Push()
		RunService:BindToRenderStep("Freecam", Enum.RenderPriority.Camera.Value, StepFreecam)
		t4.StartCapture()
	end
	local function StopFreecam() --[[ StopFreecam | Line: 442 | Upvalues: t4 (copy), RunService (copy), t8 (copy) ]]
		t4.StopCapture()
		RunService:UnbindFromRenderStep("Freecam")
		t8.Pop()
	end
	local v17 = false
	local v18 = false
	local function ToggleFreecam() --[[ ToggleFreecam | Line: 454 | Upvalues: v17 (ref), t4 (copy), RunService (copy), t8 (copy), StartFreecam (copy), v18 (ref) ]]
		if v17 then
			t4.StopCapture()
			RunService:UnbindFromRenderStep("Freecam")
			t8.Pop()
		else
			StartFreecam()
		end
		v17 = not v17
		v18 = v17
	end
	local function CheckMacro(p1) --[[ CheckMacro | Line: 464 | Upvalues: UserInputService (copy), v17 (ref), t4 (copy), RunService (copy), t8 (copy), StartFreecam (copy), v18 (ref) ]]
		for i = 1, #p1 - 1 do
			if not UserInputService:IsKeyDown(p1[i]) then
				return
			end
		end
		if v17 then
			t4.StopCapture()
			RunService:UnbindFromRenderStep("Freecam")
			t8.Pop()
		else
			StartFreecam()
		end
		v17 = not v17
		v18 = v17
	end
	local function HandleActivationInput(p1, p2, p3) --[[ HandleActivationInput | Line: 473 | Upvalues: t (copy), CheckMacro (copy) ]]
		if p2 ~= Enum.UserInputState.Begin or p3.KeyCode ~= t[#t] then
			return Enum.ContextActionResult.Pass
		end
		CheckMacro(t)
		return Enum.ContextActionResult.Pass
	end
	local function CheckUiMacro(p1) --[[ CheckUiMacro | Line: 481 | Upvalues: UserInputService (copy), v18 (ref), t8 (copy) ]]
		for i = 1, #p1 - 1 do
			if not UserInputService:IsKeyDown(p1[i]) then
				return
			end
		end
		if v18 then
			t8.PopUI()
		else
			t8.PushUI()
		end
		v18 = not v18
	end
	local function HandleUiActivationInput(p1, p2, p3) --[[ HandleUiActivationInput | Line: 495 | Upvalues: t2 (copy), CheckUiMacro (copy) ]]
		if p2 ~= Enum.UserInputState.Begin or p3.KeyCode ~= t2[#t2] then
			return Enum.ContextActionResult.Pass
		end
		CheckUiMacro(t2)
		return Enum.ContextActionResult.Pass
	end
	ContextActionService:BindActionAtPriority("FreecamToggle", HandleActivationInput, false, Low, t[#t])
	ContextActionService:BindActionAtPriority("NoUiToggle", HandleUiActivationInput, false, Low, t2[#t2])
else
	wait()
	script.Parent:Destroy()
end