-- https://lua.expert/
local t = {}
t.__index = t
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local GuiService = game:GetService("GuiService")
local Workspace = game:GetService("Workspace")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local VRService = game:GetService("VRService")
local Keyboard = require(script:WaitForChild("Keyboard"))
local Gamepad = require(script:WaitForChild("Gamepad"))
local DynamicThumbstick = require(script:WaitForChild("DynamicThumbstick"))
local v1, v2 = pcall(function() --[[ Line: 31 ]]
	return UserSettings():IsUserFeatureEnabled("UserHideControlsWhenMenuOpen")
end)
local v3 = v1 and v2
local TouchThumbstick = require(script:WaitForChild("TouchThumbstick"))
local ClickToMoveController = require(script:WaitForChild("ClickToMoveController"))
local TouchJump = require(script:WaitForChild("TouchJump"))
local VehicleController = require(script:WaitForChild("VehicleController"))
local Default = Enum.ContextActionPriority.Default.Value
local t2 = {
	[Enum.TouchMovementMode.DPad] = DynamicThumbstick,
	[Enum.DevTouchMovementMode.DPad] = DynamicThumbstick,
	[Enum.TouchMovementMode.Thumbpad] = DynamicThumbstick,
	[Enum.DevTouchMovementMode.Thumbpad] = DynamicThumbstick,
	[Enum.TouchMovementMode.Thumbstick] = TouchThumbstick,
	[Enum.DevTouchMovementMode.Thumbstick] = TouchThumbstick,
	[Enum.TouchMovementMode.DynamicThumbstick] = DynamicThumbstick,
	[Enum.DevTouchMovementMode.DynamicThumbstick] = DynamicThumbstick,
	[Enum.TouchMovementMode.ClickToMove] = ClickToMoveController,
	[Enum.DevTouchMovementMode.ClickToMove] = ClickToMoveController,
	[Enum.TouchMovementMode.Default] = DynamicThumbstick,
	[Enum.ComputerMovementMode.Default] = Keyboard,
	[Enum.ComputerMovementMode.KeyboardMouse] = Keyboard,
	[Enum.DevComputerMovementMode.KeyboardMouse] = Keyboard,
	[Enum.DevComputerMovementMode.Scriptable] = nil,
	[Enum.ComputerMovementMode.ClickToMove] = ClickToMoveController,
	[Enum.DevComputerMovementMode.ClickToMove] = ClickToMoveController
}
local t3 = {
	[Enum.UserInputType.Keyboard] = Keyboard,
	[Enum.UserInputType.MouseButton1] = Keyboard,
	[Enum.UserInputType.MouseButton2] = Keyboard,
	[Enum.UserInputType.MouseButton3] = Keyboard,
	[Enum.UserInputType.MouseWheel] = Keyboard,
	[Enum.UserInputType.MouseMovement] = Keyboard,
	[Enum.UserInputType.Gamepad1] = Gamepad,
	[Enum.UserInputType.Gamepad2] = Gamepad,
	[Enum.UserInputType.Gamepad3] = Gamepad,
	[Enum.UserInputType.Gamepad4] = Gamepad
}
local v4 = nil
function t.new() --[[ new | Line: 88 | Upvalues: t (copy), Players (copy), v3 (ref), GuiService (copy), VehicleController (copy), Default (copy), RunService (copy), UserInputService (copy), UserGameSettings (copy) ]]
	local v2 = setmetatable({}, t)
	v2.controllers = {}
	v2.activeControlModule = nil
	v2.activeController = nil
	v2.touchJumpController = nil
	v2.moveFunction = Players.LocalPlayer.Move
	v2.humanoid = nil
	v2.lastInputType = Enum.UserInputType.None
	v2.controlsEnabled = true
	v2.humanoidSeatedConn = nil
	v2.vehicleController = nil
	v2.touchControlFrame = nil
	if v3 then
		GuiService.MenuOpened:Connect(function() --[[ Line: 110 | Upvalues: v2 (copy) ]]
			if not (v2.touchControlFrame and v2.touchControlFrame.Visible) then
				return
			end
			v2.touchControlFrame.Visible = false
		end)
		GuiService.MenuClosed:Connect(function() --[[ Line: 116 | Upvalues: v2 (copy) ]]
			if not v2.touchControlFrame then
				return
			end
			v2.touchControlFrame.Visible = true
		end)
	end
	v2.vehicleController = VehicleController.new(Default)
	Players.LocalPlayer.CharacterAdded:Connect(function(p1) --[[ Line: 125 | Upvalues: v2 (copy) ]]
		v2:OnCharacterAdded(p1)
	end)
	Players.LocalPlayer.CharacterRemoving:Connect(function(p1) --[[ Line: 126 | Upvalues: v2 (copy) ]]
		v2:OnCharacterRemoving(p1)
	end)
	if Players.LocalPlayer.Character then
		v2:OnCharacterAdded(Players.LocalPlayer.Character)
	end
	RunService:BindToRenderStep("ControlScriptRenderstep", Enum.RenderPriority.Input.Value, function(p1) --[[ Line: 131 | Upvalues: v2 (copy) ]]
		v2:OnRenderStepped(p1)
	end)
	UserInputService.LastInputTypeChanged:Connect(function(p1) --[[ Line: 135 | Upvalues: v2 (copy) ]]
		v2:OnLastInputTypeChanged(p1)
	end)
	UserGameSettings:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 140 | Upvalues: v2 (copy) ]]
		v2:OnTouchMovementModeChange()
	end)
	Players.LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 143 | Upvalues: v2 (copy) ]]
		v2:OnTouchMovementModeChange()
	end)
	UserGameSettings:GetPropertyChangedSignal("ComputerMovementMode"):Connect(function() --[[ Line: 147 | Upvalues: v2 (copy) ]]
		v2:OnComputerMovementModeChange()
	end)
	Players.LocalPlayer:GetPropertyChangedSignal("DevComputerMovementMode"):Connect(function() --[[ Line: 150 | Upvalues: v2 (copy) ]]
		v2:OnComputerMovementModeChange()
	end)
	v2.playerGui = nil
	v2.touchGui = nil
	v2.playerGuiAddedConn = nil
	GuiService:GetPropertyChangedSignal("TouchControlsEnabled"):Connect(function() --[[ Line: 159 | Upvalues: v2 (copy) ]]
		v2:UpdateTouchGuiVisibility()
		v2:UpdateActiveControlModuleEnabled()
	end)
	if not UserInputService.TouchEnabled then
		v2:OnLastInputTypeChanged(UserInputService:GetLastInputType())
		return v2
	end
	v2.playerGui = Players.LocalPlayer:FindFirstChildOfClass("PlayerGui")
	if v2.playerGui then
		v2:CreateTouchGuiContainer()
		v2:OnLastInputTypeChanged(UserInputService:GetLastInputType())
	else
		v2.playerGuiAddedConn = Players.LocalPlayer.ChildAdded:Connect(function(p1) --[[ Line: 170 | Upvalues: v2 (copy), UserInputService (ref) ]]
			if not p1:IsA("PlayerGui") then
				return
			end
			v2.playerGui = p1
			v2:CreateTouchGuiContainer()
			v2.playerGuiAddedConn:Disconnect()
			v2.playerGuiAddedConn = nil
			v2:OnLastInputTypeChanged(UserInputService:GetLastInputType())
		end)
	end
	return v2
end
function t.GetMoveVector(p1) --[[ GetMoveVector | Line: 190 ]]
	if p1.activeController then
		return p1.activeController:GetMoveVector()
	else
		return Vector3.new(0, 0, 0)
	end
end
function t.GetActiveController(p1) --[[ GetActiveController | Line: 197 ]]
	return p1.activeController
end
function t.UpdateActiveControlModuleEnabled(p1) --[[ UpdateActiveControlModuleEnabled | Line: 202 | Upvalues: Players (copy), ClickToMoveController (copy), GuiService (copy), UserInputService (copy), TouchThumbstick (copy), DynamicThumbstick (copy) ]]
	local function f1() --[[ Line: 212 | Upvalues: p1 (copy), ClickToMoveController (ref), Players (ref) ]]
		if p1.activeControlModule == ClickToMoveController then
			p1.activeController:Enable(true, Players.LocalPlayer.DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice, p1.touchJumpController)
		elseif p1.touchControlFrame then
			p1.activeController:Enable(true, p1.touchControlFrame)
		else
			p1.activeController:Enable(true)
		end
	end
	if not p1.activeController then
		return
	end
	if p1.controlsEnabled and (GuiService.TouchControlsEnabled or (not UserInputService.TouchEnabled or p1.activeControlModule ~= ClickToMoveController and (p1.activeControlModule ~= TouchThumbstick and p1.activeControlModule ~= DynamicThumbstick))) then
		f1()
		return
	end
	p1.activeController:Enable(false)
	if not p1.moveFunction then
		return
	end
	p1.moveFunction(Players.LocalPlayer, Vector3.new(0, 0, 0), true)
end
function t.Enable(p1, p2) --[[ Enable | Line: 252 ]]
	if p2 == nil then
		p2 = true
	end
	p1.controlsEnabled = p2
	if p1.activeController then
		p1:UpdateActiveControlModuleEnabled()
	end
end
function t.Disable(p1) --[[ Disable | Line: 266 ]]
	p1.controlsEnabled = false
	p1:UpdateActiveControlModuleEnabled()
end
function t.SelectComputerMovementModule(p1) --[[ SelectComputerMovementModule | Line: 274 | Upvalues: UserInputService (copy), Players (copy), t3 (copy), v4 (ref), UserGameSettings (copy), Keyboard (copy), ClickToMoveController (copy), t2 (copy) ]]
	if not (UserInputService.KeyboardEnabled or UserInputService.GamepadEnabled) then
		return nil, false
	end
	local DevComputerMovementMode = Players.LocalPlayer.DevComputerMovementMode
	local v1
	if DevComputerMovementMode == Enum.DevComputerMovementMode.UserChoice then
		v1 = t3[v4]
		if UserGameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove and v1 == Keyboard then
			v1 = ClickToMoveController
		end
	else
		v1 = t2[DevComputerMovementMode]
		if not v1 and DevComputerMovementMode ~= Enum.DevComputerMovementMode.Scriptable then
			warn("No character control module is associated with DevComputerMovementMode ", DevComputerMovementMode)
		end
	end
	if v1 then
		return v1, true
	end
	if DevComputerMovementMode == Enum.DevComputerMovementMode.Scriptable then
		return nil, true
	else
		return nil, false
	end
end
function t.SelectTouchModule(p1) --[[ SelectTouchModule | Line: 312 | Upvalues: UserInputService (copy), Players (copy), t2 (copy), UserGameSettings (copy) ]]
	if not UserInputService.TouchEnabled then
		return nil, false
	end
	local DevTouchMovementMode = Players.LocalPlayer.DevTouchMovementMode
	local v1
	if DevTouchMovementMode == Enum.DevTouchMovementMode.UserChoice then
		v1 = t2[UserGameSettings.TouchMovementMode]
	else
		if DevTouchMovementMode == Enum.DevTouchMovementMode.Scriptable then
			return nil, true
		end
		v1 = t2[DevTouchMovementMode]
	end
	return v1, true
end
local function calculateRawMoveVector(p1, p2) --[[ calculateRawMoveVector | Line: 328 | Upvalues: Workspace (copy), VRService (copy) ]]
	local CurrentCamera = Workspace.CurrentCamera
	if not CurrentCamera then
		return p2
	end
	if p1:GetState() == Enum.HumanoidStateType.Swimming then
		return CurrentCamera.CFrame:VectorToWorldSpace(p2)
	end
	local v1 = CurrentCamera.CFrame
	if VRService.VREnabled and (p1.RootPart and (p1.RootPart.CFrame.Position - v1.Position).Magnitude < 3) then
		v1 = v1 * VRService:GetUserCFrame(Enum.UserCFrame.Head)
	end
	local _, _2, _3, v2, v3, v4, _4, _5, v5, _6, _7, v6 = v1:GetComponents()
	local v7, v8
	if v5 < 1 and v5 > -1 then
		v7 = v6
		v8 = v4
	else
		v8 = -v3 * math.sign(v5)
		v7 = v2
	end
	local v9 = math.sqrt(v7 * v7 + v8 * v8)
	return Vector3.new((v7 * p2.x + v8 * p2.z) / v9, 0, (v7 * p2.z - v8 * p2.x) / v9)
end
function t.OnRenderStepped(p1, p2) --[[ OnRenderStepped | Line: 369 | Upvalues: Gamepad (copy), calculateRawMoveVector (copy), Players (copy) ]]
	if not (p1.activeController and (p1.activeController.enabled and p1.humanoid)) then
		return
	end
	p1.activeController:OnRenderStepped(p2)
	local v1 = p1.activeController:GetMoveVector()
	if _G.StopMovement then
		v1 = Vector3.new(0, 0, 0)
	end
	local v2 = p1.activeController:IsMoveVectorCameraRelative()
	local v3 = p1:GetClickToMoveController()
	if p1.activeController ~= v3 then
		if v1.magnitude > 0 then
			v3:CleanupPath()
		else
			v3:OnRenderStepped(p2)
			local v4 = v3:GetMoveVector()
			v1, v2 = v4, v3:IsMoveVectorCameraRelative()
		end
	end
	if p1.vehicleController then
		local v6, _ = p1.vehicleController:Update(v1, v2, p1.activeControlModule == Gamepad)
		v1 = v6
	end
	if v2 then
		v1 = calculateRawMoveVector(p1.humanoid, v1)
	end
	p1.moveFunction(Players.LocalPlayer, v1, false)
	p1.humanoid.Jump = p1.activeController:GetIsJumping() or p1.touchJumpController and p1.touchJumpController:GetIsJumping()
end
function t.OnHumanoidSeated(p1, p2, p3) --[[ OnHumanoidSeated | Line: 415 | Upvalues: Default (copy) ]]
	if p2 then
		if not (p3 and p3:IsA("VehicleSeat")) then
			return
		end
		if not p1.vehicleController then
			p1.vehicleController = p1.vehicleController.new(Default)
		end
		p1.vehicleController:Enable(true, p3)
		return
	end
	if not p1.vehicleController then
		return
	end
	p1.vehicleController:Enable(false, p3)
end
function t.OnCharacterAdded(p1, p2) --[[ OnCharacterAdded | Line: 430 ]]
	p1.humanoid = p2:FindFirstChildOfClass("Humanoid")
	while not p1.humanoid do
		p2.ChildAdded:wait()
		p1.humanoid = p2:FindFirstChildOfClass("Humanoid")
	end
	p1:UpdateTouchGuiVisibility()
	if p1.humanoidSeatedConn then
		p1.humanoidSeatedConn:Disconnect()
		p1.humanoidSeatedConn = nil
	end
	p1.humanoidSeatedConn = p1.humanoid.Seated:Connect(function(p12, p2) --[[ Line: 443 | Upvalues: p1 (copy) ]]
		p1:OnHumanoidSeated(p12, p2)
	end)
end
function t.OnCharacterRemoving(p1, p2) --[[ OnCharacterRemoving | Line: 448 ]]
	p1.humanoid = nil
	p1:UpdateTouchGuiVisibility()
end
function t.UpdateTouchGuiVisibility(p1) --[[ UpdateTouchGuiVisibility | Line: 454 | Upvalues: GuiService (copy) ]]
	if not p1.touchGui then
		return
	end
	p1.touchGui.Enabled = GuiService.TouchControlsEnabled and true or false
end
function t.SwitchToController(p1, p2) --[[ SwitchToController | Line: 468 | Upvalues: Default (copy), ClickToMoveController (copy), TouchThumbstick (copy), DynamicThumbstick (copy), TouchJump (copy) ]]
	if p2 then
		if not p1.controllers[p2] then
			p1.controllers[p2] = p2.new(Default)
		end
		if p1.activeController == p1.controllers[p2] then
			return
		end
		if p1.activeController then
			p1.activeController:Enable(false)
		end
		p1.activeController = p1.controllers[p2]
		p1.activeControlModule = p2
		if p1.touchControlFrame and (p1.activeControlModule == ClickToMoveController or (p1.activeControlModule == TouchThumbstick or p1.activeControlModule == DynamicThumbstick)) then
			if not p1.controllers[TouchJump] then
				p1.controllers[TouchJump] = TouchJump.new()
			end
			p1.touchJumpController = p1.controllers[TouchJump]
			p1.touchJumpController:Enable(true, p1.touchControlFrame)
		elseif p1.touchJumpController then
			p1.touchJumpController:Enable(false)
		end
		p1:UpdateActiveControlModuleEnabled()
	else
		if p1.activeController then
			p1.activeController:Enable(false)
		end
		p1.activeController = nil
		p1.activeControlModule = nil
	end
end
function t.OnLastInputTypeChanged(p1, p2) --[[ OnLastInputTypeChanged | Line: 510 | Upvalues: v4 (ref), t3 (copy) ]]
	if v4 == p2 then
		warn("LastInputType Change listener called with current type.")
	end
	v4 = p2
	if p2 == Enum.UserInputType.Touch then
		local v1, v2 = p1:SelectTouchModule()
		if v2 then
			while not p1.touchControlFrame do
				wait()
			end
			p1:SwitchToController(v1)
		end
	elseif t3[p2] ~= nil then
		local v3 = p1:SelectComputerMovementModule()
		if v3 then
			p1:SwitchToController(v3)
		end
	end
	p1:UpdateTouchGuiVisibility()
end
function t.OnComputerMovementModeChange(p1) --[[ OnComputerMovementModeChange | Line: 537 ]]
	local v1, v2 = p1:SelectComputerMovementModule()
	if not v2 then
		return
	end
	p1:SwitchToController(v1)
end
function t.OnTouchMovementModeChange(p1) --[[ OnTouchMovementModeChange | Line: 544 ]]
	local v1, v2 = p1:SelectTouchModule()
	if not v2 then
		return
	end
	while not p1.touchControlFrame do
		wait()
	end
	p1:SwitchToController(v1)
end
function t.CreateTouchGuiContainer(p1) --[[ CreateTouchGuiContainer | Line: 554 ]]
	if p1.touchGui then
		p1.touchGui:Destroy()
	end
	p1.touchGui = Instance.new("ScreenGui")
	p1.touchGui.Name = "TouchGui"
	p1.touchGui.ResetOnSpawn = false
	p1.touchGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	p1:UpdateTouchGuiVisibility()
	p1.touchControlFrame = Instance.new("Frame")
	p1.touchControlFrame.Name = "TouchControlFrame"
	p1.touchControlFrame.Size = UDim2.new(1, 0, 1, 0)
	p1.touchControlFrame.BackgroundTransparency = 1
	p1.touchControlFrame.Parent = p1.touchGui
	p1.touchGui.Parent = p1.playerGui
end
function t.GetClickToMoveController(p1) --[[ GetClickToMoveController | Line: 573 | Upvalues: ClickToMoveController (copy), Default (copy) ]]
	if not p1.controllers[ClickToMoveController] then
		p1.controllers[ClickToMoveController] = ClickToMoveController.new(Default)
	end
	return p1.controllers[ClickToMoveController]
end
return t.new()