-- https://lua.expert/
Vector2.new(0.2617993877991494, 0)
Vector2.new(0.7853981633974483, 0)
Vector2.new(0, 0)
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local ZoomController = require(script.Parent:WaitForChild("ZoomController"))
local CameraToggleStateController = require(script.Parent:WaitForChild("CameraToggleStateController"))
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local CameraUI = require(script.Parent:WaitForChild("CameraUI"))
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
game:GetService("StarterGui")
local VRService = game:GetService("VRService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local LocalPlayer = Players.LocalPlayer
local v1, v2 = pcall(function() --[[ Line: 63 ]]
	return UserSettings():IsUserFeatureEnabled("UserFixCameraPanAfterShiftLock")
end)
local v3 = v1 and v2
local v4, v5 = pcall(function() --[[ Line: 71 ]]
	return UserSettings():IsUserFeatureEnabled("UserCameraGamepadZoomFix")
end)
local v6 = v4 and v5
local t = {}
t.__index = t
function t.new() --[[ new | Line: 81 | Upvalues: t (copy), LocalPlayer (copy), UserGameSettings (copy) ]]
	local v2 = setmetatable({}, t)
	v2.FIRST_PERSON_DISTANCE_THRESHOLD = 1
	v2.cameraType = nil
	v2.cameraMovementMode = nil
	v2.lastCameraTransform = nil
	v2.lastUserPanCamera = tick()
	v2.humanoidRootPart = nil
	v2.humanoidCache = {}
	v2.lastSubject = nil
	v2.lastSubjectPosition = Vector3.new(0, 5, 0)
	v2.lastSubjectCFrame = CFrame.new(v2.lastSubjectPosition)
	v2.defaultSubjectDistance = math.clamp(12.5, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
	v2.currentSubjectDistance = math.clamp(12.5, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
	v2.inFirstPerson = false
	v2.inMouseLockedMode = false
	v2.portraitMode = false
	v2.isSmallTouchScreen = false
	v2.resetCameraAngle = true
	v2.enabled = false
	v2.PlayerGui = nil
	v2.cameraChangedConn = nil
	v2.viewportSizeChangedConn = nil
	v2.shouldUseVRRotation = false
	v2.VRRotationIntensityAvailable = false
	v2.lastVRRotationIntensityCheckTime = 0
	v2.lastVRRotationTime = 0
	v2.vrRotateKeyCooldown = {}
	v2.cameraTranslationConstraints = Vector3.new(1, 1, 1)
	v2.humanoidJumpOrigin = nil
	v2.trackingHumanoid = nil
	v2.cameraFrozen = false
	v2.subjectStateChangedConn = nil
	v2.gamepadZoomPressConnection = nil
	v2.mouseLockOffset = Vector3.new(0, 0, 0)
	if LocalPlayer.Character then
		v2:OnCharacterAdded(LocalPlayer.Character)
	end
	LocalPlayer.CharacterAdded:Connect(function(p1) --[[ Line: 149 | Upvalues: v2 (copy) ]]
		v2:OnCharacterAdded(p1)
	end)
	if v2.cameraChangedConn then
		v2.cameraChangedConn:Disconnect()
	end
	v2.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 154 | Upvalues: v2 (copy) ]]
		v2:OnCurrentCameraChanged()
	end)
	v2:OnCurrentCameraChanged()
	if v2.playerCameraModeChangeConn then
		v2.playerCameraModeChangeConn:Disconnect()
	end
	v2.playerCameraModeChangeConn = LocalPlayer:GetPropertyChangedSignal("CameraMode"):Connect(function() --[[ Line: 160 | Upvalues: v2 (copy) ]]
		v2:OnPlayerCameraPropertyChange()
	end)
	if v2.minDistanceChangeConn then
		v2.minDistanceChangeConn:Disconnect()
	end
	v2.minDistanceChangeConn = LocalPlayer:GetPropertyChangedSignal("CameraMinZoomDistance"):Connect(function() --[[ Line: 165 | Upvalues: v2 (copy) ]]
		v2:OnPlayerCameraPropertyChange()
	end)
	if v2.maxDistanceChangeConn then
		v2.maxDistanceChangeConn:Disconnect()
	end
	v2.maxDistanceChangeConn = LocalPlayer:GetPropertyChangedSignal("CameraMaxZoomDistance"):Connect(function() --[[ Line: 170 | Upvalues: v2 (copy) ]]
		v2:OnPlayerCameraPropertyChange()
	end)
	if v2.playerDevTouchMoveModeChangeConn then
		v2.playerDevTouchMoveModeChangeConn:Disconnect()
	end
	v2.playerDevTouchMoveModeChangeConn = LocalPlayer:GetPropertyChangedSignal("DevTouchMovementMode"):Connect(function() --[[ Line: 175 | Upvalues: v2 (copy) ]]
		v2:OnDevTouchMovementModeChanged()
	end)
	v2:OnDevTouchMovementModeChanged()
	if v2.gameSettingsTouchMoveMoveChangeConn then
		v2.gameSettingsTouchMoveMoveChangeConn:Disconnect()
	end
	v2.gameSettingsTouchMoveMoveChangeConn = UserGameSettings:GetPropertyChangedSignal("TouchMovementMode"):Connect(function() --[[ Line: 181 | Upvalues: v2 (copy) ]]
		v2:OnGameSettingsTouchMovementModeChanged()
	end)
	v2:OnGameSettingsTouchMovementModeChanged()
	UserGameSettings:SetCameraYInvertVisible()
	UserGameSettings:SetGamepadCameraSensitivityVisible()
	v2.hasGameLoaded = game:IsLoaded()
	if not v2.hasGameLoaded then
		v2.gameLoadedConn = game.Loaded:Connect(function() --[[ Line: 191 | Upvalues: v2 (copy) ]]
			v2.hasGameLoaded = true
			v2.gameLoadedConn:Disconnect()
			v2.gameLoadedConn = nil
		end)
	end
	v2:OnPlayerCameraPropertyChange()
	return v2
end
function t.GetModuleName(p1) --[[ GetModuleName | Line: 203 ]]
	return "BaseCamera"
end
function t.OnCharacterAdded(p1, p2) --[[ OnCharacterAdded | Line: 207 | Upvalues: UserInputService (copy), LocalPlayer (copy) ]]
	p1.resetCameraAngle = p1.resetCameraAngle or p1:GetEnabled()
	p1.humanoidRootPart = nil
	if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		return
	end
	p1.PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
	for i, v in ipairs(p2:GetChildren()) do
		if v:IsA("Tool") then
			p1.isAToolEquipped = true
		end
	end
	p2.ChildAdded:Connect(function(p12) --[[ Line: 217 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Tool") then
			return
		end
		p1.isAToolEquipped = true
	end)
	p2.ChildRemoved:Connect(function(p12) --[[ Line: 222 | Upvalues: p1 (copy) ]]
		if not p12:IsA("Tool") then
			return
		end
		p1.isAToolEquipped = false
	end)
end
function t.GetHumanoidRootPart(p1) --[[ GetHumanoidRootPart | Line: 230 | Upvalues: LocalPlayer (copy) ]]
	if not p1.humanoidRootPart and LocalPlayer.Character then
		local Humanoid = LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
		if Humanoid then
			p1.humanoidRootPart = Humanoid.RootPart
		end
	end
	return p1.humanoidRootPart
end
function t.GetBodyPartToFollow(p1, p2, p3) --[[ GetBodyPartToFollow | Line: 242 ]]
	if p2:GetState() == Enum.HumanoidStateType.Dead then
		local v1 = p2.Parent
		if v1 and v1:IsA("Model") then
			return v1:FindFirstChild("Head") or p2.RootPart
		end
	end
	return p2.RootPart
end
function t.GetSubjectCFrame(p1) --[[ GetSubjectCFrame | Line: 254 ]]
	local lastSubjectCFrame = p1.lastSubjectCFrame
	local CurrentCamera = workspace.CurrentCamera
	local v1 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	if not v1 then
		return lastSubjectCFrame
	end
	if v1:IsA("Humanoid") then
		local v2 = if v1:GetState() == Enum.HumanoidStateType.Dead then true else false
		local RootPart = v1.RootPart
		if v2 and (v1.Parent and v1.Parent:IsA("Model")) then
			RootPart = v1.Parent:FindFirstChild("Head") or RootPart
		end
		if RootPart and RootPart:IsA("BasePart") then
			local sum
			if v1.RigType == Enum.HumanoidRigType.R15 then
				if v1.AutomaticScalingEnabled then
					sum = Vector3.new(0, 1.5, 0)
					local RootPart_2 = v1.RootPart
					if RootPart == RootPart_2 then
						sum = sum + Vector3.new(0, (RootPart_2.Size.Y - 2) / 2, 0)
					end
				else
					sum = Vector3.new(0, 2, 0)
				end
			else
				sum = Vector3.new(0, 1.5, 0)
			end
			if v2 then
				sum = Vector3.new(0, 0, 0)
			end
			lastSubjectCFrame = RootPart.CFrame * CFrame.new(sum + v1.CameraOffset)
		end
	elseif v1:IsA("BasePart") then
		lastSubjectCFrame = v1.CFrame
	elseif v1:IsA("Model") then
		lastSubjectCFrame = if v1.PrimaryPart then v1:GetPrimaryPartCFrame() else CFrame.new()
	end
	if lastSubjectCFrame then
		p1.lastSubjectCFrame = lastSubjectCFrame
	end
	return lastSubjectCFrame
end
function t.GetSubjectVelocity(p1) --[[ GetSubjectVelocity | Line: 320 ]]
	local CurrentCamera = workspace.CurrentCamera
	local v1 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	if not v1 then
		return Vector3.new(0, 0, 0)
	end
	if v1:IsA("BasePart") then
		return v1.Velocity
	end
	if v1:IsA("Humanoid") then
		local RootPart = v1.RootPart
		if RootPart then
			return RootPart.Velocity
		end
	else
		if not v1:IsA("Model") then
			return Vector3.new(0, 0, 0)
		end
		local PrimaryPart = v1.PrimaryPart
		if PrimaryPart then
			return PrimaryPart.Velocity
		end
	end
	return Vector3.new(0, 0, 0)
end
function t.GetSubjectRotVelocity(p1) --[[ GetSubjectRotVelocity | Line: 349 ]]
	local CurrentCamera = workspace.CurrentCamera
	local v1 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	if not v1 then
		return Vector3.new(0, 0, 0)
	end
	if v1:IsA("BasePart") then
		return v1.RotVelocity
	end
	if v1:IsA("Humanoid") then
		local RootPart = v1.RootPart
		if RootPart then
			return RootPart.RotVelocity
		end
	else
		if not v1:IsA("Model") then
			return Vector3.new(0, 0, 0)
		end
		local PrimaryPart = v1.PrimaryPart
		if PrimaryPart then
			return PrimaryPart.RotVelocity
		end
	end
	return Vector3.new(0, 0, 0)
end
function t.StepZoom(p1) --[[ StepZoom | Line: 378 | Upvalues: CameraInput (copy), ZoomController (copy) ]]
	local currentSubjectDistance = p1.currentSubjectDistance
	local v1 = CameraInput.getZoomDelta()
	if not (math.abs(v1) > 0) then
		return ZoomController.GetZoomRadius()
	end
	local v2 = if v1 > 0 then math.max(currentSubjectDistance + v1 * (currentSubjectDistance * 0.5 + 1), p1.FIRST_PERSON_DISTANCE_THRESHOLD) else math.max((currentSubjectDistance + v1) / (1 - v1 * 0.5), 0.5)
	if v2 < p1.FIRST_PERSON_DISTANCE_THRESHOLD then
		v2 = 0.5
	end
	p1:SetCameraToSubjectDistance(v2)
	return ZoomController.GetZoomRadius()
end
function t.GetSubjectPosition(p1) --[[ GetSubjectPosition | Line: 403 ]]
	local lastSubjectPosition = p1.lastSubjectPosition
	local CurrentCamera = game.Workspace.CurrentCamera
	local v1 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	if not v1 then
		return nil
	end
	if v1:IsA("Humanoid") then
		local v2 = if v1:GetState() == Enum.HumanoidStateType.Dead then true else false
		local RootPart = v1.RootPart
		if v2 and (v1.Parent and v1.Parent:IsA("Model")) then
			RootPart = v1.Parent:FindFirstChild("Head") or RootPart
		end
		if RootPart and RootPart:IsA("BasePart") then
			local sum
			if v1.RigType == Enum.HumanoidRigType.R15 then
				if v1.AutomaticScalingEnabled then
					sum = Vector3.new(0, 1.5, 0)
					if RootPart == v1.RootPart then
						sum = sum + Vector3.new(0, v1.RootPart.Size.Y / 2 - 1, 0)
					end
				else
					sum = Vector3.new(0, 2, 0)
				end
			else
				sum = Vector3.new(0, 1.5, 0)
			end
			if v2 then
				sum = Vector3.new(0, 0, 0)
			end
			lastSubjectPosition = RootPart.CFrame.p + RootPart.CFrame:vectorToWorldSpace(sum + v1.CameraOffset)
		end
	elseif v1:IsA("VehicleSeat") then
		lastSubjectPosition = v1.CFrame.p + v1.CFrame:vectorToWorldSpace(Vector3.new(0, 5, 0))
	elseif v1:IsA("SkateboardPlatform") then
		lastSubjectPosition = v1.CFrame.p + Vector3.new(0, 5, 0)
	elseif v1:IsA("BasePart") then
		lastSubjectPosition = v1.CFrame.p
	elseif v1:IsA("Model") then
		lastSubjectPosition = if v1.PrimaryPart then v1:GetPrimaryPartCFrame().p else v1:GetModelCFrame().p
	end
	p1.lastSubject = v1
	p1.lastSubjectPosition = lastSubjectPosition
	return lastSubjectPosition
end
function t.UpdateDefaultSubjectDistance(p1) --[[ UpdateDefaultSubjectDistance | Line: 473 | Upvalues: LocalPlayer (copy) ]]
	if p1.portraitMode then
		p1.defaultSubjectDistance = math.clamp(25, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
	else
		p1.defaultSubjectDistance = math.clamp(12.5, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
	end
end
function t.OnViewportSizeChanged(p1) --[[ OnViewportSizeChanged | Line: 481 | Upvalues: UserInputService (copy) ]]
	local ViewportSize = game.Workspace.CurrentCamera.ViewportSize
	p1.portraitMode = if ViewportSize.X < ViewportSize.Y then true else false
	p1.isSmallTouchScreen = if UserInputService.PreferredInput == Enum.PreferredInput.Touch then if ViewportSize.Y < 500 then true else ViewportSize.X < 700 else false
	p1:UpdateDefaultSubjectDistance()
end
function t.OnCurrentCameraChanged(p1) --[[ OnCurrentCameraChanged | Line: 491 | Upvalues: UserInputService (copy) ]]
	if UserInputService.PreferredInput == Enum.PreferredInput.Touch then
		if p1.viewportSizeChangedConn then
			p1.viewportSizeChangedConn:Disconnect()
			p1.viewportSizeChangedConn = nil
		end
		local CurrentCamera = game.Workspace.CurrentCamera
		if CurrentCamera then
			p1:OnViewportSizeChanged()
			p1.viewportSizeChangedConn = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 502 | Upvalues: p1 (copy) ]]
				p1:OnViewportSizeChanged()
			end)
		end
	end
	if p1.cameraSubjectChangedConn then
		p1.cameraSubjectChangedConn:Disconnect()
		p1.cameraSubjectChangedConn = nil
	end
	local CurrentCamera = game.Workspace.CurrentCamera
	if not CurrentCamera then
		return
	end
	p1.cameraSubjectChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 516 | Upvalues: p1 (copy) ]]
		p1:OnNewCameraSubject()
	end)
	p1:OnNewCameraSubject()
end
function t.OnDynamicThumbstickEnabled(p1) --[[ OnDynamicThumbstickEnabled | Line: 523 | Upvalues: UserInputService (copy) ]]
	if UserInputService.PreferredInput ~= Enum.PreferredInput.Touch then
		return
	end
	p1.isDynamicThumbstickEnabled = true
end
function t.OnDynamicThumbstickDisabled(p1) --[[ OnDynamicThumbstickDisabled | Line: 529 ]]
	p1.isDynamicThumbstickEnabled = false
end
function t.OnGameSettingsTouchMovementModeChanged(p1) --[[ OnGameSettingsTouchMovementModeChanged | Line: 533 | Upvalues: LocalPlayer (copy), UserGameSettings (copy) ]]
	if LocalPlayer.DevTouchMovementMode ~= Enum.DevTouchMovementMode.UserChoice then
		return
	end
	if UserGameSettings.TouchMovementMode == Enum.TouchMovementMode.DynamicThumbstick or UserGameSettings.TouchMovementMode == Enum.TouchMovementMode.Default then
		p1:OnDynamicThumbstickEnabled()
		return
	end
	p1:OnDynamicThumbstickDisabled()
end
function t.OnDevTouchMovementModeChanged(p1) --[[ OnDevTouchMovementModeChanged | Line: 544 | Upvalues: LocalPlayer (copy) ]]
	if LocalPlayer.DevTouchMovementMode == Enum.DevTouchMovementMode.DynamicThumbstick then
		p1:OnDynamicThumbstickEnabled()
	else
		p1:OnGameSettingsTouchMovementModeChanged()
	end
end
function t.OnPlayerCameraPropertyChange(p1) --[[ OnPlayerCameraPropertyChange | Line: 552 ]]
	p1:SetCameraToSubjectDistance(p1.currentSubjectDistance)
end
function t.InputTranslationToCameraAngleChange(p1, p2, p3) --[[ InputTranslationToCameraAngleChange | Line: 557 ]]
	return p2 * p3
end
function t.GamepadZoomPress(p1) --[[ GamepadZoomPress | Line: 561 | Upvalues: v6 (ref), LocalPlayer (copy) ]]
	local v1 = p1:GetCameraToSubjectDistance()
	if v6 then
		local CameraMinZoomDistance = LocalPlayer.CameraMinZoomDistance
		local CameraMaxZoomDistance = LocalPlayer.CameraMaxZoomDistance
		local v2 = if CameraMinZoomDistance > 0.5 then CameraMinZoomDistance else 0
		local v3 = v2 + 10
		local v4 = v3 + 10
		if CameraMaxZoomDistance < v4 then
			v3 = v2 + (CameraMaxZoomDistance - v2) / 2
			v4 = CameraMaxZoomDistance
		end
		if (v3 + v4) / 2 < v1 then
			p1:SetCameraToSubjectDistance(v3)
			return
		end
		if (v2 + v3) / 2 < v1 then
			p1:SetCameraToSubjectDistance(v2)
		else
			p1:SetCameraToSubjectDistance(v4)
		end
	else
		if v1 > 15 then
			p1:SetCameraToSubjectDistance(10)
			return
		end
		if v1 > 5 then
			p1:SetCameraToSubjectDistance(0)
		else
			p1:SetCameraToSubjectDistance(20)
		end
	end
end
function t.Enable(p1, p2) --[[ Enable | Line: 602 | Upvalues: CameraInput (copy), LocalPlayer (copy) ]]
	if p1.enabled == p2 then
		return
	end
	p1.enabled = p2
	if p1.enabled then
		CameraInput.setInputEnabled(true)
		p1.gamepadZoomPressConnection = CameraInput.gamepadZoomPress:Connect(function() --[[ Line: 608 | Upvalues: p1 (copy) ]]
			p1:GamepadZoomPress()
		end)
		if LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
			p1.currentSubjectDistance = 0.5
			if not p1.inFirstPerson then
				p1:EnterFirstPerson()
			end
		end
	else
		CameraInput.setInputEnabled(false)
		if p1.gamepadZoomPressConnection then
			p1.gamepadZoomPressConnection:Disconnect()
			p1.gamepadZoomPressConnection = nil
		end
		p1:Cleanup()
	end
	p1:OnEnable(p2)
end
function t.OnEnable(p1, p2) --[[ OnEnable | Line: 633 ]] end
function t.GetEnabled(p1) --[[ GetEnabled | Line: 637 ]]
	return p1.enabled
end
function t.Cleanup(p1) --[[ Cleanup | Line: 641 | Upvalues: CameraUtils (copy) ]]
	if p1.subjectStateChangedConn then
		p1.subjectStateChangedConn:Disconnect()
		p1.subjectStateChangedConn = nil
	end
	if p1.viewportSizeChangedConn then
		p1.viewportSizeChangedConn:Disconnect()
		p1.viewportSizeChangedConn = nil
	end
	p1.lastCameraTransform = nil
	p1.lastSubjectCFrame = nil
	CameraUtils.restoreMouseBehavior()
end
function t.UpdateMouseBehavior(p1) --[[ UpdateMouseBehavior | Line: 658 | Upvalues: UserGameSettings (copy), CameraUI (copy), CameraInput (copy), CameraToggleStateController (copy), CameraUtils (copy), v3 (ref) ]]
	if p1.isCameraToggle and (if UserGameSettings.ComputerMovementMode == Enum.ComputerMovementMode.ClickToMove then true else false) == false then
		CameraUI.setCameraModeToastEnabled(true)
		CameraInput.enableCameraToggleInput()
		CameraToggleStateController(p1.inFirstPerson)
		return
	end
	CameraUI.setCameraModeToastEnabled(false)
	CameraInput.disableCameraToggleInput()
	if p1.inFirstPerson or p1.inMouseLockedMode then
		CameraUtils.setRotationTypeOverride(Enum.RotationType.CameraRelative)
		CameraUtils.setMouseBehaviorOverride(Enum.MouseBehavior.LockCenter)
		return
	end
	CameraUtils.restoreRotationType()
	if not v3 then
		CameraUtils.restoreMouseBehavior()
		return
	end
	if CameraInput.getRotationActivated() then
		CameraUtils.setMouseBehaviorOverride(Enum.MouseBehavior.LockCurrentPosition)
	else
		CameraUtils.restoreMouseBehavior()
	end
end
function t.UpdateForDistancePropertyChange(p1) --[[ UpdateForDistancePropertyChange | Line: 690 ]]
	p1:SetCameraToSubjectDistance(p1.currentSubjectDistance)
end
function t.SetCameraToSubjectDistance(p1, p2) --[[ SetCameraToSubjectDistance | Line: 696 | Upvalues: LocalPlayer (copy), ZoomController (copy) ]]
	local currentSubjectDistance = p1.currentSubjectDistance
	if LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		p1.currentSubjectDistance = 0.5
		if not p1.inFirstPerson then
			p1:EnterFirstPerson()
		end
	else
		local v1 = math.clamp(p2, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
		if v1 < 1 then
			p1.currentSubjectDistance = 0.5
			if not p1.inFirstPerson then
				p1:EnterFirstPerson()
			end
		else
			p1.currentSubjectDistance = v1
			if p1.inFirstPerson then
				p1:LeaveFirstPerson()
			end
		end
	end
	ZoomController.SetZoomParameters(p1.currentSubjectDistance, (math.sign(p2 - currentSubjectDistance)))
	return p1.currentSubjectDistance
end
function t.SetCameraType(p1, p2) --[[ SetCameraType | Line: 730 ]]
	p1.cameraType = p2
end
function t.GetCameraType(p1) --[[ GetCameraType | Line: 735 ]]
	return p1.cameraType
end
function t.SetCameraMovementMode(p1, p2) --[[ SetCameraMovementMode | Line: 740 ]]
	p1.cameraMovementMode = p2
end
function t.GetCameraMovementMode(p1) --[[ GetCameraMovementMode | Line: 744 ]]
	return p1.cameraMovementMode
end
function t.SetIsMouseLocked(p1, p2) --[[ SetIsMouseLocked | Line: 748 ]]
	p1.inMouseLockedMode = p2
end
function t.GetIsMouseLocked(p1) --[[ GetIsMouseLocked | Line: 752 ]]
	return p1.inMouseLockedMode
end
function t.SetMouseLockOffset(p1, p2) --[[ SetMouseLockOffset | Line: 756 ]]
	p1.mouseLockOffset = p2
end
function t.GetMouseLockOffset(p1) --[[ GetMouseLockOffset | Line: 760 ]]
	return p1.mouseLockOffset
end
function t.InFirstPerson(p1) --[[ InFirstPerson | Line: 764 ]]
	return p1.inFirstPerson
end
function t.EnterFirstPerson(p1) --[[ EnterFirstPerson | Line: 768 ]] end
function t.LeaveFirstPerson(p1) --[[ LeaveFirstPerson | Line: 772 ]] end
function t.GetCameraToSubjectDistance(p1) --[[ GetCameraToSubjectDistance | Line: 777 ]]
	return p1.currentSubjectDistance
end
function t.GetMeasuredDistanceToFocus(p1) --[[ GetMeasuredDistanceToFocus | Line: 784 ]]
	local CurrentCamera = game.Workspace.CurrentCamera
	if CurrentCamera then
		return (CurrentCamera.CoordinateFrame.p - CurrentCamera.Focus.p).magnitude
	else
		return nil
	end
end
function t.GetCameraLookVector(p1) --[[ GetCameraLookVector | Line: 792 ]]
	return if game.Workspace.CurrentCamera then game.Workspace.CurrentCamera.CFrame.LookVector or Vector3.new(0, 0, 1) else Vector3.new(0, 0, 1)
end
function t.CalculateNewLookCFrameFromArg(p1, p2, p3) --[[ CalculateNewLookCFrameFromArg | Line: 796 ]]
	local v1 = if p2 then p2 else p1:GetCameraLookVector()
	local v2 = math.asin(v1.Y)
	local v4 = Vector2.new(p3.X, (math.clamp(p3.Y, v2 + -1.3962634015954636, v2 + 1.3962634015954636)))
	local v5 = CFrame.new(Vector3.new(0, 0, 0), v1)
	return CFrame.Angles(0, -v4.X, 0) * v5 * CFrame.Angles(-v4.Y, 0, 0)
end
function t.CalculateNewLookVectorFromArg(p1, p2, p3) --[[ CalculateNewLookVectorFromArg | Line: 806 ]]
	return p1:CalculateNewLookCFrameFromArg(p2, p3).LookVector
end
function t.CalculateNewLookVectorVRFromArg(p1, p2) --[[ CalculateNewLookVectorVRFromArg | Line: 811 ]]
	local unit = ((p1:GetSubjectPosition() - game.Workspace.CurrentCamera.CFrame.p) * Vector3.new(1, 0, 1)).unit
	local v1 = Vector2.new(p2.X, 0)
	local v2 = CFrame.new(Vector3.new(0, 0, 0), unit)
	return ((CFrame.Angles(0, -v1.X, 0) * v2 * CFrame.Angles(-v1.Y, 0, 0)).LookVector * Vector3.new(1, 0, 1)).unit
end
function t.GetHumanoid(p1) --[[ GetHumanoid | Line: 821 | Upvalues: LocalPlayer (copy) ]]
	local v1 = LocalPlayer and LocalPlayer.Character
	if not v1 then
		return nil
	end
	local v2 = p1.humanoidCache[LocalPlayer]
	if v2 and v2.Parent == v1 then
		return v2
	end
	p1.humanoidCache[LocalPlayer] = nil
	local Humanoid = v1:FindFirstChildOfClass("Humanoid")
	if Humanoid then
		p1.humanoidCache[LocalPlayer] = Humanoid
	end
	return Humanoid
end
function t.GetHumanoidPartToFollow(p1, p2, p3) --[[ GetHumanoidPartToFollow | Line: 839 ]]
	if p3 ~= Enum.HumanoidStateType.Dead then
		return p2.Torso
	end
	local v1 = p2.Parent
	if not v1 then
		return p2.Torso
	end
	return v1:FindFirstChild("Head") or p2.Torso
end
function t.OnNewCameraSubject(p1) --[[ OnNewCameraSubject | Line: 853 ]]
	if not p1.subjectStateChangedConn then
		return
	end
	p1.subjectStateChangedConn:Disconnect()
	p1.subjectStateChangedConn = nil
end
function t.IsInFirstPerson(p1) --[[ IsInFirstPerson | Line: 860 ]]
	return p1.inFirstPerson
end
function t.Update(p1, p2) --[[ Update | Line: 864 ]]
	error("BaseCamera:Update() This is a virtual function that should never be getting called.", 2)
end
function t.GetCameraHeight(p1) --[[ GetCameraHeight | Line: 868 | Upvalues: VRService (copy) ]]
	if VRService.VREnabled and not p1.inFirstPerson then
		return 0.25881904510252074 * p1.currentSubjectDistance
	else
		return 0
	end
end
return t