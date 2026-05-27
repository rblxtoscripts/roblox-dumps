-- https://lua.expert/
local VRBaseCamera = require(script.Parent:WaitForChild("VRBaseCamera"))
require(script.Parent:WaitForChild("CameraInput"))
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local ZoomController = require(script.Parent:WaitForChild("ZoomController"))
require(script.Parent:WaitForChild("VehicleCamera"))
local VehicleCameraCore = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraCore"))
local VehicleCameraConfig = require(script.Parent.VehicleCamera:FindFirstChild("VehicleCameraConfig"))
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
game:GetService("VRService")
local LocalPlayer = Players.LocalPlayer
local Spring = CameraUtils.Spring
local mapClamp = CameraUtils.mapClamp
local sanitizeAngle = CameraUtils.sanitizeAngle
local function pitchVelocity(p1, p2) --[[ pitchVelocity | Line: 34 ]]
	return math.abs((p2.XVector:Dot(p1)))
end
local function yawVelocity(p1, p2) --[[ yawVelocity | Line: 39 ]]
	return math.abs((p2.YVector:Dot(p1)))
end
local v1 = 1 / 60
local v2 = setmetatable({}, VRBaseCamera)
v2.__index = v2
function v2.new() --[[ new | Line: 47 | Upvalues: VRBaseCamera (copy), v2 (copy), RunService (copy), v1 (ref) ]]
	local v3 = setmetatable(VRBaseCamera.new(), v2)
	v3:Reset()
	RunService.Stepped:Connect(function(p1, p2) --[[ Line: 52 | Upvalues: v1 (ref) ]]
		v1 = p2
	end)
	return v3
end
function v2.Reset(p1) --[[ Reset | Line: 59 | Upvalues: VehicleCameraCore (copy), Spring (copy), VehicleCameraConfig (copy), CameraUtils (copy) ]]
	p1.vehicleCameraCore = VehicleCameraCore.new(p1:GetSubjectCFrame())
	p1.pitchSpring = Spring.new(0, -math.rad(VehicleCameraConfig.pitchBaseAngle))
	p1.yawSpring = Spring.new(0, 0)
	local CurrentCamera = workspace.CurrentCamera
	local v2 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	assert(CurrentCamera, "VRVehicleCamera initialization error")
	assert(v2)
	assert(v2:IsA("VehicleSeat"))
	local v4, v5 = CameraUtils.getLooseBoundingSphere((v2:GetConnectedParts(true)))
	p1.assemblyRadius = math.max(v5, 0.001)
	p1.assemblyOffset = v2.CFrame:Inverse() * v4
	p1.lastCameraFocus = nil
	p1:_StepInitialZoom()
end
function v2._StepInitialZoom(p1) --[[ _StepInitialZoom | Line: 84 | Upvalues: ZoomController (copy), VehicleCameraConfig (copy) ]]
	local v1 = ZoomController.GetZoomRadius()
	p1:SetCameraToSubjectDistance((math.max(v1, p1.assemblyRadius * VehicleCameraConfig.initialZoomRadiusMul)))
end
function v2._GetThirdPersonLocalOffset(p1) --[[ _GetThirdPersonLocalOffset | Line: 91 | Upvalues: VehicleCameraConfig (copy) ]]
	return p1.assemblyOffset + Vector3.new(0, p1.assemblyRadius * VehicleCameraConfig.verticalCenterOffset, 0)
end
function v2._GetFirstPersonLocalOffset(p1, p2) --[[ _GetFirstPersonLocalOffset | Line: 95 | Upvalues: LocalPlayer (copy) ]]
	local Character = LocalPlayer.Character
	if not (Character and Character.Parent) then
		return p1:_GetThirdPersonLocalOffset()
	end
	local Head = Character:FindFirstChild("Head")
	if Head and Head:IsA("BasePart") then
		return p2:Inverse() * Head.Position
	else
		return p1:_GetThirdPersonLocalOffset()
	end
end
function v2.Update(p1) --[[ Update | Line: 109 | Upvalues: v1 (ref), mapClamp (copy), LocalPlayer (copy) ]]
	local CurrentCamera = workspace.CurrentCamera
	local v12 = if CurrentCamera then CurrentCamera.CameraSubject else CurrentCamera
	local vehicleCameraCore = p1.vehicleCameraCore
	assert(CurrentCamera)
	assert(v12)
	assert(v12:IsA("VehicleSeat"))
	local v2 = v1
	v1 = 0
	local v3 = p1:GetSubjectCFrame()
	local v4 = p1:GetSubjectVelocity()
	local v5 = p1:GetSubjectRotVelocity()
	math.abs((v4:Dot(v3.ZVector)))
	local v8 = math.abs((v3.YVector:Dot(v5)))
	local v10 = math.abs((v3.XVector:Dot(v5)))
	local v11 = p1:StepZoom()
	local v122 = mapClamp(v11, 0.5, p1.assemblyRadius, 1, 0)
	local v13 = p1:_GetThirdPersonLocalOffset():Lerp(p1:_GetFirstPersonLocalOffset(v3), v122)
	vehicleCameraCore:setTransform(v3)
	local v14 = vehicleCameraCore:step(v2, v10, v8, v122)
	p1:UpdateFadeFromBlack(v2)
	local v15, v16
	if p1:IsInFirstPerson() then
		local Unit = Vector3.new(v14.LookVector.X, 0, v14.LookVector.Z).Unit
		local v17 = CFrame.new(v14.Position, Unit)
		v15 = CFrame.new(v3 * v13) * v17
		v16 = v15 * CFrame.new(0, 0, v11)
		p1:StartVREdgeBlur(LocalPlayer)
	else
		v15 = CFrame.new(v3 * v13) * v14
		v16 = v15 * CFrame.new(0, 0, v11)
		if not p1.lastCameraFocus then
			p1.lastCameraFocus = v15
			p1.needsReset = true
		end
		local v18 = v15.Position - CurrentCamera.CFrame.Position
		if v18.Unit:Dot(CurrentCamera.CFrame.LookVector) > 0.56 and (v18.magnitude < 200 and not p1.needsReset) then
			v15 = p1.lastCameraFocus
			local p = v15.p
			local v19 = p1:GetCameraLookVector()
			v16 = CFrame.new(p - v11 * p1:CalculateNewLookVectorFromArg(Vector3.new(v19.X, 0, v19.Z).Unit, Vector2.new(0, 0)), p)
		else
			p1.currentSubjectDistance = 16
			p1.lastCameraFocus = p1:GetVRFocus(v3.Position, v2)
			p1.needsReset = false
			p1:StartFadeFromBlack()
			p1:ResetZoom()
		end
		p1:UpdateEdgeBlur(LocalPlayer, v2)
	end
	return v16, v15
end
function v2.EnterFirstPerson(p1) --[[ EnterFirstPerson | Line: 202 ]]
	p1.inFirstPerson = true
	p1:UpdateMouseBehavior()
end
function v2.LeaveFirstPerson(p1) --[[ LeaveFirstPerson | Line: 207 ]]
	p1.inFirstPerson = false
	p1:UpdateMouseBehavior()
end
return v2