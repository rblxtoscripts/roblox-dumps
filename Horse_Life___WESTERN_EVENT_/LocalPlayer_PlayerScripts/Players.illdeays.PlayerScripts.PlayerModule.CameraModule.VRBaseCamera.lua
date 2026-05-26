-- https://lua.expert/
local VRService = game:GetService("VRService")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local ZoomController = require(script.Parent:WaitForChild("ZoomController"))
local LocalPlayer = game:GetService("Players").LocalPlayer
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local v1 = setmetatable({}, BaseCamera)
v1.__index = v1
function v1.new() --[[ new | Line: 32 | Upvalues: BaseCamera (copy), v1 (copy), LocalPlayer (copy) ]]
	local v3 = setmetatable(BaseCamera.new(), v1)
	v3.defaultDistance = 7
	v3.defaultSubjectDistance = math.clamp(v3.defaultDistance, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
	v3.currentSubjectDistance = math.clamp(v3.defaultDistance, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
	v3.VRFadeResetTimer = 0
	v3.VREdgeBlurTimer = 0
	v3.gamepadResetConnection = nil
	v3.needsReset = true
	return v3
end
function v1.GetModuleName(p1) --[[ GetModuleName | Line: 51 ]]
	return "VRBaseCamera"
end
function v1.GamepadZoomPress(p1) --[[ GamepadZoomPress | Line: 55 ]]
	if p1:GetCameraToSubjectDistance() > 3.5 then
		p1:SetCameraToSubjectDistance(0)
		p1.currentSubjectDistance = 0
	else
		p1:SetCameraToSubjectDistance(7)
		p1.currentSubjectDistance = 7
	end
	p1:GamepadReset()
	p1:ResetZoom()
end
function v1.GamepadReset(p1) --[[ GamepadReset | Line: 70 ]]
	p1.needsReset = true
end
function v1.ResetZoom(p1) --[[ ResetZoom | Line: 74 | Upvalues: ZoomController (copy) ]]
	ZoomController.SetZoomParameters(p1.currentSubjectDistance, 0)
	ZoomController.ReleaseSpring()
end
function v1.OnEnable(p1, p2) --[[ OnEnable | Line: 79 | Upvalues: CameraInput (copy), LocalPlayer (copy), Lighting (copy) ]]
	if p2 then
		p1.gamepadResetConnection = CameraInput.gamepadReset:Connect(function() --[[ Line: 81 | Upvalues: p1 (copy) ]]
			p1:GamepadReset()
		end)
		return
	end
	if p1.inFirstPerson then
		p1:GamepadZoomPress()
	end
	if p1.gamepadResetConnection then
		p1.gamepadResetConnection:Disconnect()
		p1.gamepadResetConnection = nil
	end
	p1.VREdgeBlurTimer = 0
	p1:UpdateEdgeBlur(LocalPlayer, 1)
	local VRFade = Lighting:FindFirstChild("VRFade")
	if not VRFade then
		return
	end
	VRFade.Brightness = 0
end
function v1.UpdateDefaultSubjectDistance(p1) --[[ UpdateDefaultSubjectDistance | Line: 105 | Upvalues: LocalPlayer (copy) ]]
	p1.defaultSubjectDistance = math.clamp(7, LocalPlayer.CameraMinZoomDistance, LocalPlayer.CameraMaxZoomDistance)
end
function v1.GetCameraToSubjectDistance(p1) --[[ GetCameraToSubjectDistance | Line: 110 ]]
	return p1.currentSubjectDistance
end
function v1.SetCameraToSubjectDistance(p1, p2) --[[ SetCameraToSubjectDistance | Line: 115 | Upvalues: LocalPlayer (copy), ZoomController (copy) ]]
	local currentSubjectDistance = p1.currentSubjectDistance
	local v1 = math.clamp(p2, 0, LocalPlayer.CameraMaxZoomDistance)
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
	ZoomController.SetZoomParameters(p1.currentSubjectDistance, (math.sign(p2 - currentSubjectDistance)))
	return p1.currentSubjectDistance
end
function v1.GetVRFocus(p1, p2, p3) --[[ GetVRFocus | Line: 139 ]]
	local v1 = p1.lastCameraFocus or p2
	p1.cameraTranslationConstraints = Vector3.new(p1.cameraTranslationConstraints.x, math.min(1, p1.cameraTranslationConstraints.y + p3), p1.cameraTranslationConstraints.z)
	local v5 = Vector3.new(0, p1:GetCameraHeight(), 0)
	return CFrame.new(Vector3.new(p2.x, v1.y, p2.z):lerp(p2 + v5, p1.cameraTranslationConstraints.y))
end
function v1.StartFadeFromBlack(p1) --[[ StartFadeFromBlack | Line: 155 | Upvalues: UserGameSettings (copy), Lighting (copy) ]]
	if UserGameSettings.VignetteEnabled == false then
		return
	end
	local VRFade = Lighting:FindFirstChild("VRFade")
	if not VRFade then
		local VRFade_2 = Instance.new("ColorCorrectionEffect")
		VRFade_2.Name = "VRFade"
		VRFade_2.Parent = Lighting
		VRFade = VRFade_2
	end
	VRFade.Brightness = -1
	p1.VRFadeResetTimer = 0.1
end
function v1.UpdateFadeFromBlack(p1, p2) --[[ UpdateFadeFromBlack | Line: 170 | Upvalues: Lighting (copy) ]]
	local VRFade = Lighting:FindFirstChild("VRFade")
	if p1.VRFadeResetTimer > 0 then
		p1.VRFadeResetTimer = math.max(p1.VRFadeResetTimer - p2, 0)
		local VRFade_2 = Lighting:FindFirstChild("VRFade")
		if VRFade_2 and VRFade_2.Brightness < 0 then
			VRFade_2.Brightness = math.min(VRFade_2.Brightness + p2 * 10, 0)
		end
	else
		if not VRFade then
			return
		end
		VRFade.Brightness = 0
	end
end
function v1.StartVREdgeBlur(p1, p2) --[[ StartVREdgeBlur | Line: 186 | Upvalues: UserGameSettings (copy), RunService (copy), VRService (copy) ]]
	if UserGameSettings.VignetteEnabled == false then
		return
	end
	local VRBlurPart = workspace.CurrentCamera:FindFirstChild("VRBlurPart")
	if not VRBlurPart then
		VRBlurPart = Instance.new("Part")
		VRBlurPart.Name = "VRBlurPart"
		VRBlurPart.Parent = workspace.CurrentCamera
		VRBlurPart.CanTouch = false
		VRBlurPart.CanCollide = false
		VRBlurPart.CanQuery = false
		VRBlurPart.Anchored = true
		VRBlurPart.Size = Vector3.new(0.44, 0.47, 1)
		VRBlurPart.Transparency = 1
		VRBlurPart.CastShadow = false
		RunService.RenderStepped:Connect(function(p1) --[[ Line: 205 | Upvalues: VRService (ref), VRBlurPart (ref) ]]
			local v2 = workspace.Camera.CFrame * VRService:GetUserCFrame(Enum.UserCFrame.Head)
			VRBlurPart.CFrame = v2 * CFrame.Angles(0, math.pi, 0) + v2.LookVector * 1.05
		end)
	end
	local VRBlurScreen = p2.PlayerGui:FindFirstChild("VRBlurScreen")
	local v1 = if VRBlurScreen then VRBlurScreen:FindFirstChild("VRBlur") else nil
	if not v1 then
		if not VRBlurScreen then
			VRBlurScreen = Instance.new("SurfaceGui") or Instance.new("ScreenGui")
		end
		VRBlurScreen.Name = "VRBlurScreen"
		VRBlurScreen.Parent = p2.PlayerGui
		VRBlurScreen.Adornee = VRBlurPart
		local VRBlur = Instance.new("ImageLabel")
		VRBlur.Name = "VRBlur"
		VRBlur.Parent = VRBlurScreen
		VRBlur.Image = "rbxasset://textures/ui/VR/edgeBlur.png"
		VRBlur.AnchorPoint = Vector2.new(0.5, 0.5)
		VRBlur.Position = UDim2.new(0.5, 0, 0.5, 0)
		local v3 = workspace.CurrentCamera.ViewportSize.X * 2.3 / 512
		VRBlur.Size = UDim2.fromScale(v3, workspace.CurrentCamera.ViewportSize.Y * 2.3 / 512)
		VRBlur.BackgroundTransparency = 1
		VRBlur.Active = true
		VRBlur.ScaleType = Enum.ScaleType.Stretch
		v1 = VRBlur
	end
	v1.Visible = true
	v1.ImageTransparency = 0
	p1.VREdgeBlurTimer = 0.14
end
function v1.UpdateEdgeBlur(p1, p2, p3) --[[ UpdateEdgeBlur | Line: 252 ]]
	local VRBlurScreen = p2.PlayerGui:FindFirstChild("VRBlurScreen")
	local v1 = if VRBlurScreen then VRBlurScreen:FindFirstChild("VRBlur") else nil
	if not v1 then
		return
	end
	if p1.VREdgeBlurTimer > 0 then
		p1.VREdgeBlurTimer = p1.VREdgeBlurTimer - p3
		local VRBlurScreen_2 = p2.PlayerGui:FindFirstChild("VRBlurScreen")
		if not VRBlurScreen_2 then
			return
		end
		local VRBlur = VRBlurScreen_2:FindFirstChild("VRBlur")
		if VRBlur then
			VRBlur.ImageTransparency = 1 - math.clamp(p1.VREdgeBlurTimer, 0.01, 0.14) * 7.142857142857142
		end
	else
		v1.Visible = false
	end
end
function v1.GetCameraHeight(p1) --[[ GetCameraHeight | Line: 277 ]]
	if p1.inFirstPerson then
		return 0
	else
		return 0.25881904510252074 * p1.currentSubjectDistance
	end
end
function v1.GetSubjectCFrame(p1) --[[ GetSubjectCFrame | Line: 284 | Upvalues: BaseCamera (copy) ]]
	local v1 = BaseCamera.GetSubjectCFrame(p1)
	local CurrentCamera = workspace.CurrentCamera
	local v2 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	if not v2 then
		return v1
	end
	if v2:IsA("Humanoid") then
		local isDead = v2:GetState() == Enum.HumanoidStateType.Dead
		if isDead and v2 == p1.lastSubject then
			v1 = p1.lastSubjectCFrame
		end
	end
	if v1 then
		p1.lastSubjectCFrame = v1
	end
	return v1
end
function v1.GetSubjectPosition(p1) --[[ GetSubjectPosition | Line: 310 | Upvalues: BaseCamera (copy) ]]
	local v1 = BaseCamera.GetSubjectPosition(p1)
	local CurrentCamera = game.Workspace.CurrentCamera
	local v2 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	if not v2 then
		return
	end
	if v2:IsA("Humanoid") then
		if (if v2:GetState() == Enum.HumanoidStateType.Dead then true else false) and v2 == p1.lastSubject then
			v1 = p1.lastSubjectPosition
		end
	elseif v2:IsA("VehicleSeat") then
		v1 = v2.CFrame.p + v2.CFrame:vectorToWorldSpace(Vector3.new(0, 4, 0))
	end
	p1.lastSubjectPosition = v1
	return v1
end
return v1