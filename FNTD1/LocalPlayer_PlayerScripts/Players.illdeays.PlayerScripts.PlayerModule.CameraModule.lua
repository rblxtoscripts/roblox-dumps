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
local CommonUtils = script.Parent:WaitForChild("CommonUtils")
local ConnectionUtil = require(CommonUtils:WaitForChild("ConnectionUtil"))
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
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
if Players.LocalPlayer then
	assert(Players.LocalPlayer, "Strict typing check")
	local PlayerScripts = Players.LocalPlayer:WaitForChild("PlayerScripts")
	PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Default)
	PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Follow)
	PlayerScripts:RegisterTouchCameraMovementMode(Enum.TouchCameraMovementMode.Classic)
	PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Default)
	PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Follow)
	PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.Classic)
	PlayerScripts:RegisterComputerCameraMovementMode(Enum.ComputerCameraMovementMode.CameraToggle)
	local UserPlayerConnectionMemoryLeak = FlagUtil.getUserFlag("UserPlayerConnectionMemoryLeak")
	local UserPSFixCameraControllerReset = FlagUtil.getUserFlag("UserPSFixCameraControllerReset")
	function t.new() --[[ new | Line: 144 | Upvalues: TransparencyController (copy), UserPlayerConnectionMemoryLeak (copy), ConnectionUtil (copy), t (copy), Players (copy), MouseLockController (copy), RunService (copy), t2 (copy), t3 (copy), UserGameSettings (copy), UserInputService (copy) ]]
		local t4 = {
			activeTransparencyController = TransparencyController.new()
		}
		t4.connectionUtil = if UserPlayerConnectionMemoryLeak then ConnectionUtil.new() else nil
		local v3 = setmetatable(t4, t)
		v3.activeCameraController = nil
		v3.activeOcclusionModule = nil
		v3.activeMouseLockController = nil
		v3.currentComputerCameraMovementMode = nil
		v3.cameraSubjectChangedConn = nil
		v3.cameraTypeChangedConn = nil
		for k, v in pairs(Players:GetPlayers()) do
			v3:OnPlayerAdded(v)
		end
		Players.PlayerAdded:Connect(function(p1) --[[ Line: 167 | Upvalues: v3 (copy) ]]
			v3:OnPlayerAdded(p1)
		end)
		if UserPlayerConnectionMemoryLeak then
			Players.PlayerRemoving:Connect(function(p1) --[[ Line: 172 | Upvalues: v3 (copy) ]]
				v3:OnPlayerRemoving(p1)
			end)
		end
		v3.activeTransparencyController:Enable(true)
		v3.activeMouseLockController = MouseLockController.new()
		assert(v3.activeMouseLockController, "Strict typing check")
		local v4 = v3.activeMouseLockController:GetBindableToggleEvent()
		if v4 then
			v4:Connect(function() --[[ Line: 184 | Upvalues: v3 (copy) ]]
				v3:OnMouseLockToggled()
			end)
		end
		v3:ActivateCameraController()
		v3:ActivateOcclusionModule(Players.LocalPlayer.DevCameraOcclusionMode)
		v3:OnCurrentCameraChanged()
		RunService:BindToRenderStep("cameraRenderUpdate", Enum.RenderPriority.Camera.Value, function(p1) --[[ Line: 192 | Upvalues: v3 (copy) ]]
			v3:Update(p1)
		end)
		for k, v in pairs(t2) do
			Players.LocalPlayer:GetPropertyChangedSignal(v):Connect(function() --[[ Line: 196 | Upvalues: v3 (copy), v (copy) ]]
				v3:OnLocalPlayerCameraPropertyChanged(v)
			end)
		end
		for k, v in pairs(t3) do
			UserGameSettings:GetPropertyChangedSignal(v):Connect(function() --[[ Line: 202 | Upvalues: v3 (copy), v (copy) ]]
				v3:OnUserGameSettingsPropertyChanged(v)
			end)
		end
		game.Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 206 | Upvalues: v3 (copy) ]]
			v3:OnCurrentCameraChanged()
		end)
		UserInputService:GetPropertyChangedSignal("PreferredInput"):Connect(function() --[[ Line: 209 | Upvalues: v3 (copy) ]]
			v3:OnPreferredInputChanged()
		end)
		return v3
	end
	function t.GetCameraMovementModeFromSettings(p1) --[[ GetCameraMovementModeFromSettings | Line: 216 | Upvalues: Players (copy), CameraUtils (copy), UserInputService (copy), UserGameSettings (copy) ]]
		if Players.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
			return CameraUtils.ConvertCameraModeEnumToStandard(Enum.ComputerCameraMovementMode.Classic)
		end
		local v1, v2
		if UserInputService.PreferredInput == Enum.PreferredInput.Touch then
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
	function t.ActivateOcclusionModule(p1, p2) --[[ ActivateOcclusionModule | Line: 241 | Upvalues: Poppercam (copy), Invisicam (copy), t5 (copy), Players (copy) ]]
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
	function t.ShouldUseVehicleCamera(p1) --[[ ShouldUseVehicleCamera | Line: 320 ]]
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
	function t.ActivateCameraController(p1) --[[ ActivateCameraController | Line: 336 | Upvalues: LegacyCamera (copy), VRService (copy), VRCamera (copy), ClassicCamera (copy), OrbitalCamera (copy), VRVehicleCamera (copy), VehicleCamera (copy), t4 (copy), UserPSFixCameraControllerReset (copy) ]]
		local CameraType = workspace.CurrentCamera.CameraType
		local v1 = p1:GetCameraMovementModeFromSettings()
		local v2 = nil
		if CameraType == Enum.CameraType.Scriptable then
			if not p1.activeCameraController then
				return
			end
			p1.activeCameraController:Enable(false)
			p1.activeCameraController = nil
		else
			if CameraType == Enum.CameraType.Custom then
				v1 = p1:GetCameraMovementModeFromSettings()
			elseif CameraType == Enum.CameraType.Track then
				v1 = Enum.ComputerCameraMovementMode.Classic
			elseif CameraType == Enum.CameraType.Follow then
				v1 = Enum.ComputerCameraMovementMode.Follow
			elseif CameraType == Enum.CameraType.Orbital then
				v1 = Enum.ComputerCameraMovementMode.Orbital
			elseif CameraType == Enum.CameraType.Attach or (CameraType == Enum.CameraType.Watch or CameraType == Enum.CameraType.Fixed) then
				v2 = LegacyCamera
			else
				warn("CameraScript encountered an unhandled Camera.CameraType value: ", CameraType)
			end
			if not v2 and VRService.VREnabled then
				v2 = VRCamera
			elseif not v2 and (v1 == Enum.ComputerCameraMovementMode.Classic or (v1 == Enum.ComputerCameraMovementMode.Follow or (v1 == Enum.ComputerCameraMovementMode.Default or v1 == Enum.ComputerCameraMovementMode.CameraToggle))) then
				v2 = ClassicCamera
			elseif not v2 then
				if v1 ~= Enum.ComputerCameraMovementMode.Orbital then
					warn("ActivateCameraController did not select a module.")
					return
				end
				v2 = OrbitalCamera
			end
			if p1:ShouldUseVehicleCamera() then
				v2 = if VRService.VREnabled then VRVehicleCamera else VehicleCamera
			end
			local v4
			if t4[v2] then
				v4 = t4[v2]
				if UserPSFixCameraControllerReset then
					if v4.Reset and p1.activeCameraController ~= v4 then
						v4:Reset()
					end
				elseif v4.Reset then
					v4:Reset()
				end
			else
				local v5 = v2.new()
				t4[v2] = v5
				v4 = v5
			end
			if p1.activeCameraController then
				if p1.activeCameraController == v4 then
					if not p1.activeCameraController:GetEnabled() then
						p1.activeCameraController:Enable(true)
					end
				else
					p1.activeCameraController:Enable(false)
					p1.activeCameraController = v4
					p1.activeCameraController:Enable(true)
				end
			elseif v4 ~= nil then
				p1.activeCameraController = v4
				assert(p1.activeCameraController, "Strict typing check")
				p1.activeCameraController:Enable(true)
			end
			if not p1.activeCameraController then
				return
			end
			p1.activeCameraController:SetCameraMovementMode(v1)
			p1.activeCameraController:SetCameraType(CameraType)
		end
	end
	function t.OnCameraSubjectChanged(p1) --[[ OnCameraSubjectChanged | Line: 442 ]]
		local CurrentCamera = workspace.CurrentCamera
		local v1 = if CurrentCamera then CurrentCamera.CameraSubject else nil
		if p1.activeTransparencyController then
			p1.activeTransparencyController:SetSubject(v1)
		end
		if p1.activeOcclusionModule then
			p1.activeOcclusionModule:OnCameraSubjectChanged(v1)
		end
		p1:ActivateCameraController()
	end
	function t.OnCameraTypeChanged(p1, p2) --[[ OnCameraTypeChanged | Line: 457 | Upvalues: UserInputService (copy), CameraUtils (copy) ]]
		if p2 ~= Enum.CameraType.Scriptable or UserInputService.MouseBehavior ~= Enum.MouseBehavior.LockCenter then
			p1:ActivateCameraController()
			return
		end
		CameraUtils.restoreMouseBehavior()
		p1:ActivateCameraController()
	end
	function t.OnCurrentCameraChanged(p1) --[[ OnCurrentCameraChanged | Line: 469 ]]
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
		p1.cameraSubjectChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function() --[[ Line: 481 | Upvalues: p1 (copy) ]]
			p1:OnCameraSubjectChanged()
		end)
		p1.cameraTypeChangedConn = CurrentCamera:GetPropertyChangedSignal("CameraType"):Connect(function() --[[ Line: 485 | Upvalues: p1 (copy), CurrentCamera (copy) ]]
			p1:OnCameraTypeChanged(CurrentCamera.CameraType)
		end)
		p1:OnCameraSubjectChanged()
		p1:OnCameraTypeChanged(CurrentCamera.CameraType)
	end
	function t.OnLocalPlayerCameraPropertyChanged(p1, p2) --[[ OnLocalPlayerCameraPropertyChanged | Line: 493 | Upvalues: Players (copy) ]]
		if p2 == "CameraMode" then
			if Players.LocalPlayer.CameraMode == Enum.CameraMode.LockFirstPerson then
				if not p1.activeCameraController or p1.activeCameraController:GetModuleName() ~= "ClassicCamera" then
					p1:ActivateCameraController()
				end
				if p1.activeCameraController then
					p1.activeCameraController:UpdateForDistancePropertyChange()
				end
			elseif Players.LocalPlayer.CameraMode == Enum.CameraMode.Classic then
				p1:ActivateCameraController()
			else
				warn("Unhandled value for property player.CameraMode: ", Players.LocalPlayer.CameraMode)
			end
		else
			if p2 == "DevComputerCameraMode" or p2 == "DevTouchCameraMode" then
				p1:ActivateCameraController()
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
	function t.OnUserGameSettingsPropertyChanged(p1, p2) --[[ OnUserGameSettingsPropertyChanged | Line: 535 ]]
		if p2 ~= "ComputerCameraMovementMode" and p2 ~= "TouchCameraMovementMode" then
			return
		end
		p1:ActivateCameraController()
	end
	function t.OnPreferredInputChanged(p1) --[[ OnPreferredInputChanged | Line: 541 ]]
		p1:ActivateCameraController()
	end
	function t.Update(p1, p2) --[[ Update | Line: 551 | Upvalues: CameraInput (copy) ]]
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
		local CurrentCamera = game.Workspace.CurrentCamera
		CurrentCamera.CFrame = v1
		CurrentCamera.Focus = v2
		if p1.activeTransparencyController then
			p1.activeTransparencyController:Update(p2)
		end
		if not CameraInput.getInputEnabled() then
			return
		end
		CameraInput.resetInputForFrameEnd()
	end
	function t.OnCharacterAdded(p1, p2, p3) --[[ OnCharacterAdded | Line: 577 ]]
		if not p1.activeOcclusionModule then
			return
		end
		p1.activeOcclusionModule:CharacterAdded(p2, p3)
	end
	function t.OnCharacterRemoving(p1, p2, p3) --[[ OnCharacterRemoving | Line: 583 ]]
		if not p1.activeOcclusionModule then
			return
		end
		p1.activeOcclusionModule:CharacterRemoving(p2, p3)
	end
	function t.OnPlayerAdded(p1, p2) --[[ OnPlayerAdded | Line: 589 | Upvalues: UserPlayerConnectionMemoryLeak (copy) ]]
		if UserPlayerConnectionMemoryLeak then
			if p1.connectionUtil then
				p1.connectionUtil:trackConnection(("%*CharacterAdded"):format(p2.UserId), p2.CharacterAdded:Connect(function(p12) --[[ Line: 593 | Upvalues: p1 (copy), p2 (copy) ]]
					p1:OnCharacterAdded(p12, p2)
				end))
				p1.connectionUtil:trackConnection(("%*CharacterRemoving"):format(p2.UserId), p2.CharacterRemoving:Connect(function(p12) --[[ Line: 596 | Upvalues: p1 (copy), p2 (copy) ]]
					p1:OnCharacterRemoving(p12, p2)
				end))
			end
		else
			p2.CharacterAdded:Connect(function(p12) --[[ Line: 601 | Upvalues: p1 (copy), p2 (copy) ]]
				p1:OnCharacterAdded(p12, p2)
			end)
			p2.CharacterRemoving:Connect(function(p12) --[[ Line: 604 | Upvalues: p1 (copy), p2 (copy) ]]
				p1:OnCharacterRemoving(p12, p2)
			end)
		end
	end
	function t.OnPlayerRemoving(p1, p2) --[[ OnPlayerRemoving | Line: 610 ]]
		if not p1.connectionUtil then
			return
		end
		p1.connectionUtil:disconnect((("%*CharacterAdded"):format(p2.UserId)))
		p1.connectionUtil:disconnect((("%*CharacterRemoving"):format(p2.UserId)))
	end
	function t.OnMouseLockToggled(p1) --[[ OnMouseLockToggled | Line: 618 ]]
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
	t.new()
end
return {}