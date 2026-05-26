-- https://lua.expert/
local t = {}
t.__index = t
local t2 = {
	"CameraMinZoomDistance",
	"CameraMaxZoomDistance",
	"CameraMode",
	"DevCameraOcclusionMode",
	"DevComputerCameraMode",
	"DevTouchCameraMode",
	"DevComputerMovementMode",
	"DevTouchMovementMode",
	"DevEnableMouseLock"
}
local t3 = { "ComputerCameraMovementMode", "ComputerMovementMode", "ControlMode", "GamepadCameraSensitivity", "MouseSensitivity", "RotationType", "TouchCameraMovementMode", "TouchMovementMode" }
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VRService = game:GetService("VRService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local CameraUtils = require(script:WaitForChild("CameraUtils"))
local CameraInput = require(script:WaitForChild("CameraInput"))
local ClassicCamera = require(script:WaitForChild("ClassicCamera"))
local OrbitalCamera = require(script:WaitForChild("OrbitalCamera"))
local LegacyCamera = require(script:WaitForChild("LegacyCamera"))
local VehicleCamera = require(script:WaitForChild("VehicleCamera"))
local VRCamera = require(script:WaitForChild("VRCamera"))
local VRVehicleCamera = require(script:WaitForChild("VRVehicleCamera"))
local Invisicam = require(script:WaitForChild("Invisicam"))
local Poppercam = require(script:WaitForChild("Poppercam"))
local TransparencyController = require(script:WaitForChild("TransparencyController"))
local MouseLockController = require(script:WaitForChild("MouseLockController"))
local t4 = {}
local t5 = {}
local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts")
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
function t.new() --[[ new | Line: 94 | Upvalues: t (copy), Players (copy), TransparencyController (copy), UserInputService (copy), MouseLockController (copy), RunService (copy), t2 (copy), t3 (copy), UserGameSettings (copy) ]]
	local v2 = setmetatable({}, t)
	v2.activeCameraController = nil
	v2.activeOcclusionModule = nil
	v2.activeTransparencyController = nil
	v2.activeMouseLockController = nil
	v2.currentComputerCameraMovementMode = nil
	v2.cameraSubjectChangedConn = nil
	v2.cameraTypeChangedConn = nil
	for k, v in pairs(Players:GetPlayers()) do
		v2:OnPlayerAdded(v)
	end
	Players.PlayerAdded:Connect(function(p1) --[[ Line: 115 | Upvalues: v2 (copy) ]]
		v2:OnPlayerAdded(p1)
	end)
	v2.activeTransparencyController = TransparencyController.new()
	v2.activeTransparencyController:Enable(true)
	if not UserInputService.TouchEnabled then
		v2.activeMouseLockController = MouseLockController.new()
		local v3 = v2.activeMouseLockController:GetBindableToggleEvent()
		if v3 then
			v3:Connect(function() --[[ Line: 126 | Upvalues: v2 (copy) ]]
				v2:OnMouseLockToggled()
			end)
		end
	end
	v2:ActivateCameraController(v2:GetCameraControlChoice())
	v2:ActivateOcclusionModule(Players.LocalPlayer.DevCameraOcclusionMode)
	v2:OnCurrentCameraChanged()
	RunService:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p1) --[[ Line: 135 | Upvalues: v2 (copy) ]]
		v2:Update(p1)
	end)
	for k, v in pairs(t2) do
		Players.LocalPlayer:GetPropertyChangedSignal(v):Connect(function() --[[ Line: 139 | Upvalues: v2 (copy), v (copy) ]]
			v2:OnLocalPlayerCameraPropertyChanged(v)
		end)
	end
	for k, v in pairs(t3) do
		UserGameSettings:GetPropertyChangedSignal(v):Connect(function() --[[ Line: 145 | Upvalues: v2 (copy), v (copy) ]]
			v2:OnUserGameSettingsPropertyChanged(v)
		end)
	end
	game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 149 | Upvalues: v2 (copy) ]]
		v2:OnCurrentCameraChanged()
	end)
	return v2
end
function t.GetCameraMovementModeFromSettings(p1) --[[ GetCameraMovementModeFromSettings | Line: 156 | Upvalues: Players (copy), CameraUtils (copy), UserInputService (copy), UserGameSettings (copy) ]]
	if Players.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
		return CameraUtils.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic)
	end
	local v1, v2
	if UserInputService.TouchEnabled then
		local v3 = CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevTouchCameraMode)
		v1, v2 = v3, CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.TouchCameraMovementMode)
	else
		local v5 = CameraUtils.ConvertCameraModeEnumToStandard(Players.LocalPlayer.DevComputerCameraMode)
		v1, v2 = v5, CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.ComputerCameraMovementMode)
	end
	if v1 == Enum.DevComputerCameraMovementMode.UserChoice then
		return v2
	else
		return v1
	end
end
function t.ActivateOcclusionModule(p1, p2) --[[ ActivateOcclusionModule | Line: 181 | Upvalues: Poppercam (copy), Invisicam (copy), t5 (copy), Players (copy) ]]
	local v1
	if p2 == Enum.DevCameraOcclusionMode.Zoom then
		v1 = Poppercam
	else
		if p2 ~= Enum.DevCameraOcclusionMode.Invisicam then
			warn("CameraScript ActivateOcclusionModule called with unsupported mode")
			return
		end
		v1 = Invisicam
	end
	p1.occlusionMode = p2
	if p1.activeOcclusionModule and p1.activeOcclusionModule:GetOcclusionMode() == p2 then
		if p1.activeOcclusionModule:GetEnabled() then
			return
		end
	else
		local activeOcclusionModule = p1.activeOcclusionModule
		p1.activeOcclusionModule = t5[v1]
		if not p1.activeOcclusionModule then
			p1.activeOcclusionModule = v1.new()
			if p1.activeOcclusionModule then
				t5[v1] = p1.activeOcclusionModule
			end
		end
		if not p1.activeOcclusionModule then
			return
		end
		if p1.activeOcclusionModule:GetOcclusionMode() ~= p2 then
			warn("CameraScript ActivateOcclusionModule mismatch: ", p1.activeOcclusionModule:GetOcclusionMode(), "~=", p2)
		end
		if activeOcclusionModule and activeOcclusionModule == p1.activeOcclusionModule then
			warn("CameraScript ActivateOcclusionModule failure to detect already running correct module")
		elseif activeOcclusionModule then
			activeOcclusionModule:Enable(false)
		end
		if p2 == Enum.DevCameraOcclusionMode.Invisicam then
			if Players.LocalPlayer.Character then
				p1.activeOcclusionModule:CharacterAdded(Players.LocalPlayer.Character, Players.LocalPlayer)
			end
		else
			for k, v in pairs(Players:GetPlayers()) do
				if v and v.Character then
					p1.activeOcclusionModule:CharacterAdded(v.Character, v)
				end
			end
			p1.activeOcclusionModule:OnCameraSubjectChanged(game.Workspace.CurrentCamera.CameraSubject)
		end
	end
	p1.activeOcclusionModule:Enable(true)
end
function t.ShouldUseVehicleCamera(p1) --[[ ShouldUseVehicleCamera | Line: 260 ]]
	local CurrentCamera = workspace.CurrentCamera
	if not CurrentCamera then
		return false
	end
	local CameraType = CurrentCamera.CameraType
	local CameraSubject = CurrentCamera.CameraSubject
	local v1 = if CameraType == Enum.CameraType.Custom then true else CameraType == Enum.CameraType.Follow
	local v2 = CameraSubject and CameraSubject:IsA("VehicleSeat") or false
	return if v2 then if v1 then if p1.occlusionMode == Enum.DevCameraOcclusionMode.Invisicam then false else true else v1 else v2
end
function t.ActivateCameraController(p1, p2, p3) --[[ ActivateCameraController | Line: 278 | Upvalues: LegacyCamera (copy), VRService (copy), VRCamera (copy), ClassicCamera (copy), OrbitalCamera (copy), VRVehicleCamera (copy), VehicleCamera (copy), t4 (copy) ]]
	local v1 = nil
	if p3 ~= nil and p3 == Enum.CameraType.Scriptable then
		if not p1.activeCameraController then
			return
		end
		p1.activeCameraController:Enable(false)
		p1.activeCameraController = nil
		return
	elseif p3 ~= nil and p3 == Enum.CameraType.Custom then
		p2 = p1:GetCameraMovementModeFromSettings()
	elseif p3 ~= nil and p3 == Enum.CameraType.Track then
		p2 = Enum.ComputerCameraMovementMode.Classic
	elseif p3 ~= nil and p3 == Enum.CameraType.Follow then
		p2 = Enum.ComputerCameraMovementMode.Follow
	elseif p3 ~= nil and p3 == Enum.CameraType.Orbital then
		p2 = Enum.ComputerCameraMovementMode.Orbital
	elseif p3 ~= nil and (p3 == Enum.CameraType.Attach or (p3 == Enum.CameraType.Watch or p3 == Enum.CameraType.Fixed)) then
		v1 = LegacyCamera
	elseif p3 ~= nil then
		warn("CameraScript encountered an unhandled Camera.CameraType value: ", p3)
	end
	if not v1 and VRService.VREnabled then
		v1 = VRCamera
	elseif not v1 and (p2 == Enum.ComputerCameraMovementMode.Classic or (p2 == Enum.ComputerCameraMovementMode.Follow or (p2 == Enum.ComputerCameraMovementMode.Default or p2 == Enum.ComputerCameraMovementMode.CameraToggle))) then
		v1 = ClassicCamera
	elseif not v1 then
		if p2 ~= Enum.ComputerCameraMovementMode.Orbital then
			warn("ActivateCameraController did not select a module.")
			return
		end
		v1 = OrbitalCamera
	end
	if p1:ShouldUseVehicleCamera() then
		v1 = if VRService.VREnabled then VRVehicleCamera else VehicleCamera
	end
	local v3
	if t4[v1] then
		v3 = t4[v1]
		if v3.Reset then
			v3:Reset()
		end
	else
		local v4 = v1.new()
		t4[v1] = v4
		v3 = v4
	end
	if p1.activeCameraController then
		if p1.activeCameraController == v3 then
			if not p1.activeCameraController:GetEnabled() then
				p1.activeCameraController:Enable(true)
			end
		else
			p1.activeCameraController:Enable(false)
			p1.activeCameraController = v3
			p1.activeCameraController:Enable(true)
		end
	elseif v3 ~= nil then
		p1.activeCameraController = v3
		p1.activeCameraController:Enable(true)
	end
	if not p1.activeCameraController then
		return
	end
	if p2 ~= nil then
		p1.activeCameraController:SetCameraMovementMode(p2)
		return
	end
	if p3 == nil then
		return
	end
	p1.activeCameraController:SetCameraType(p3)
end
function t.OnCameraSubjectChanged(p1) --[[ OnCameraSubjectChanged | Line: 383 ]]
	local CurrentCamera = workspace.CurrentCamera
	local v1 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	if p1.activeTransparencyController then
		p1.activeTransparencyController:SetSubject(v1)
	end
	if p1.activeOcclusionModule then
		p1.activeOcclusionModule:OnCameraSubjectChanged(v1)
	end
	p1:ActivateCameraController(nil, CurrentCamera.CameraType)
end
function t.OnCameraTypeChanged(p1, p2) --[[ OnCameraTypeChanged | Line: 398 | Upvalues: UserInputService (copy), CameraUtils (copy) ]]
	if p2 ~= Enum.CameraType.Scriptable or UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
		p1:ActivateCameraController(nil, p2)
		return
	end
	CameraUtils.restoreMouseBehavior()
	p1:ActivateCameraController(nil, p2)
end
function t.OnCurrentCameraChanged(p1) --[[ OnCurrentCameraChanged | Line: 410 ]]
	local CurrentCamera = game.Workspace.CurrentCamera
	if not CurrentCamera then
		return
	end
	if p1.cameraSubjectChangedConn then
		p1.cameraSubjectChangedConn:Disconnect()
	end
	if p1.cameraTypeChangedConn then
		p1.cameraTypeChangedConn:Disconnect()
	end
	p1.cameraSubjectChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 422 | Upvalues: p1 (copy), CurrentCamera (copy) ]]
		p1:OnCameraSubjectChanged(CurrentCamera.CameraSubject)
	end)
	p1.cameraTypeChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 426 | Upvalues: p1 (copy), CurrentCamera (copy) ]]
		p1:OnCameraTypeChanged(CurrentCamera.CameraType)
	end)
	p1:OnCameraSubjectChanged(CurrentCamera.CameraSubject)
	p1:OnCameraTypeChanged(CurrentCamera.CameraType)
end
function t.OnLocalPlayerCameraPropertyChanged(p1, p2) --[[ OnLocalPlayerCameraPropertyChanged | Line: 434 | Upvalues: Players (copy), CameraUtils (copy) ]]
	if p2 == "CameraMode" then
		if Players.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
			if not p1.activeCameraController or p1.activeCameraController:GetModuleName() ~= "ClassicCamera" then
				p1:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard(Enum.DevComputerCameraMovementMode.Classic))
			end
			if p1.activeCameraController then
				p1.activeCameraController:UpdateForDistancePropertyChange()
			end
		elseif Players.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
			p1:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard((p1:GetCameraMovementModeFromSettings())))
		else
			warn("Unhandled value for property player.CameraMode: ", Players.LocalPlayer.CameraMode)
		end
	else
		if p2 == "DevComputerCameraMode" or p2 == "DevTouchCameraMode" then
			p1:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard((p1:GetCameraMovementModeFromSettings())))
			return
		end
		if p2 == "DevCameraOcclusionMode" then
			p1:ActivateOcclusionModule(Players.LocalPlayer.DevCameraOcclusionMode)
			return
		end
		if p2 == "CameraMinZoomDistance" or p2 == "CameraMaxZoomDistance" then
			if p1.activeCameraController then
				p1.activeCameraController:UpdateForDistancePropertyChange()
			end
		else
			if p2 == "DevTouchMovementMode" then
				return
			end
			if p2 == "DevComputerMovementMode" then
			end
		end
	end
end
function t.OnUserGameSettingsPropertyChanged(p1, p2) --[[ OnUserGameSettingsPropertyChanged | Line: 478 | Upvalues: CameraUtils (copy) ]]
	if p2 ~= "ComputerCameraMovementMode" then
		return
	end
	p1:ActivateCameraController(CameraUtils.ConvertCameraModeEnumToStandard((p1:GetCameraMovementModeFromSettings())))
end
function t.Update(p1, p2) --[[ Update | Line: 491 | Upvalues: CameraInput (copy) ]]
	if not p1.activeCameraController then
		return
	end
	p1.activeCameraController:UpdateMouseBehavior()
	local v1, v2 = p1.activeCameraController:Update(p2)
	if p1.activeOcclusionModule then
		local v3, v4 = p1.activeOcclusionModule:Update(p2, v1, v2)
		v1 = v3
		v2 = v4
	end
	game.Workspace.CurrentCamera:SetAttribute("TargetCFrame", v1)
	game.Workspace.CurrentCamera.CFrame = v1
	game.Workspace.CurrentCamera.Focus = v2
	if p1.activeTransparencyController then
		p1.activeTransparencyController:Update(p2)
	end
	if not CameraInput.getInputEnabled() then
		return
	end
	CameraInput.resetInputForFrameEnd()
end
function t.GetCameraControlChoice(p1) --[[ GetCameraControlChoice | Line: 519 | Upvalues: Players (copy), UserInputService (copy), CameraUtils (copy), UserGameSettings (copy) ]]
	local LocalPlayer = Players.LocalPlayer
	if not LocalPlayer then
		return
	end
	if UserInputService:GetLastInputType() == Enum.UserInputType.Touch or UserInputService.TouchEnabled then
		if LocalPlayer.DevTouchCameraMode == Enum.DevTouchCameraMovementMode.UserChoice then
			return CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.TouchCameraMovementMode)
		else
			return CameraUtils.ConvertCameraModeEnumToStandard(LocalPlayer.DevTouchCameraMode)
		end
	elseif LocalPlayer.DevComputerCameraMode == Enum.DevComputerCameraMovementMode.UserChoice then
		return CameraUtils.ConvertCameraModeEnumToStandard((CameraUtils.ConvertCameraModeEnumToStandard(UserGameSettings.ComputerCameraMovementMode)))
	else
		return CameraUtils.ConvertCameraModeEnumToStandard(LocalPlayer.DevComputerCameraMode)
	end
end
function t.OnCharacterAdded(p1, p2, p3) --[[ OnCharacterAdded | Line: 542 ]]
	if not p1.activeOcclusionModule then
		return
	end
	p1.activeOcclusionModule:CharacterAdded(p2, p3)
end
function t.OnCharacterRemoving(p1, p2, p3) --[[ OnCharacterRemoving | Line: 548 ]]
	if not p1.activeOcclusionModule then
		return
	end
	p1.activeOcclusionModule:CharacterRemoving(p2, p3)
end
function t.OnPlayerAdded(p1, p2) --[[ OnPlayerAdded | Line: 554 ]]
	p2.CharacterAdded:Connect(function(p12) --[[ Line: 555 | Upvalues: p1 (copy), p2 (copy) ]]
		p1:OnCharacterAdded(p12, p2)
	end)
	p2.CharacterRemoving:Connect(function(p12) --[[ Line: 558 | Upvalues: p1 (copy), p2 (copy) ]]
		p1:OnCharacterRemoving(p12, p2)
	end)
end
function t.OnMouseLockToggled(p1) --[[ OnMouseLockToggled | Line: 563 ]]
	if not p1.activeMouseLockController then
		return
	end
	local v1 = p1.activeMouseLockController:GetIsMouseLocked()
	local v2 = p1.activeMouseLockController:GetMouseLockOffset()
	if not p1.activeCameraController then
		return
	end
	p1.activeCameraController:SetIsMouseLocked(v1)
	p1.activeCameraController:SetMouseLockOffset(v2)
end
return t.new()