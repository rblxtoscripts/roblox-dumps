-- https://lua.expert/
local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
require(script.Parent:WaitForChild("CameraUtils"))
local VRBaseCamera = require(script.Parent:WaitForChild("VRBaseCamera"))
local v1 = setmetatable({}, VRBaseCamera)
v1.__index = v1
local v2, v3 = pcall(function() --[[ Line: 26 ]]
	return UserSettings():IsUserFeatureEnabled("UserFlagEnableVRUpdate3")
end)
local v4 = v2 and v3
function v1.new() --[[ new | Line: 32 | Upvalues: VRBaseCamera (copy), v1 (copy) ]]
	local v3 = setmetatable(VRBaseCamera.new(), v1)
	v3.lastUpdate = tick()
	v3:Reset()
	return v3
end
function v1.Reset(p1) --[[ Reset | Line: 41 ]]
	p1.needsReset = true
	p1.needsBlackout = true
	p1.motionDetTime = 0
	p1.blackOutTimer = 0
	p1.lastCameraResetPosition = nil
	p1.stepRotateTimeout = 0
	p1.cameraOffsetRotation = 0
	p1.cameraOffsetRotationDiscrete = 0
end
function v1.Update(p1, p2) --[[ Update | Line: 52 | Upvalues: Players (copy) ]]
	local CurrentCamera = workspace.CurrentCamera
	local v1 = CurrentCamera.CFrame
	local Focus = CurrentCamera.Focus
	local LocalPlayer = Players.LocalPlayer
	p1:GetHumanoid()
	local CameraSubject = CurrentCamera.CameraSubject
	if p1.lastUpdate == nil or p2 > 1 then
		p1.lastCameraTransform = nil
	end
	p1:StepZoom()
	p1:UpdateFadeFromBlack(p2)
	p1:UpdateEdgeBlur(LocalPlayer, p2)
	local lastSubjectPosition = p1.lastSubjectPosition
	local v2 = p1:GetSubjectPosition()
	if p1.needsBlackout then
		p1:StartFadeFromBlack()
		p1.blackOutTimer = p1.blackOutTimer + math.clamp(p2, 0.0001, 0.1)
		if p1.blackOutTimer > 0.1 and game:IsLoaded() then
			p1.needsBlackout = false
			p1.needsReset = true
		end
	end
	if v2 and (LocalPlayer and CurrentCamera) then
		local v4 = p1:GetVRFocus(v2, p2)
		if p1:IsInFirstPerson() then
			local v5, v6 = p1:UpdateFirstPersonTransform(p2, v1, v4, lastSubjectPosition, v2)
			v1 = v5
			Focus = v6
		else
			local v7, v8 = p1:UpdateThirdPersonTransform(p2, v1, v4, lastSubjectPosition, v2)
			v1 = v7
			Focus = v8
		end
		p1.lastCameraTransform = v1
		p1.lastCameraFocus = Focus
	end
	p1.lastUpdate = tick()
	return v1, Focus
end
function v1.UpdateFirstPersonTransform(p1, p2, p3, p4, p5, p6) --[[ UpdateFirstPersonTransform | Line: 105 | Upvalues: Players (copy), CameraInput (copy), v4 (ref), UserGameSettings (copy) ]]
	if p1.needsReset then
		p1:StartFadeFromBlack()
		p1.needsReset = false
		p1.stepRotateTimeout = 0.25
		p1.VRCameraFocusFrozen = true
		p1.cameraOffsetRotation = 0
		p1.cameraOffsetRotationDiscrete = 0
	end
	local LocalPlayer = Players.LocalPlayer
	if (p5 - p6).magnitude > 0.01 then
		p1:StartVREdgeBlur(LocalPlayer)
	end
	local p = p4.p
	local v1 = p1:GetCameraLookVector()
	local Unit = Vector3.new(v1.X, 0, v1.Z).Unit
	if p1.stepRotateTimeout > 0 then
		p1.stepRotateTimeout = p1.stepRotateTimeout - p2
	end
	local v2 = CameraInput.getRotation()
	local v3 = 0
	if v4 and UserGameSettings.VRSmoothRotationEnabled then
		v3 = v2.X
	elseif p1.stepRotateTimeout <= 0 and math.abs(v2.X) > 0.03 then
		v3 = if v2.X < 0 then -0.5 else 0.5
		p1.needsReset = true
	end
	return CFrame.new(p - 0.5 * p1:CalculateNewLookVectorFromArg(Unit, Vector2.new(v3, 0)), p), p4
end
function v1.UpdateThirdPersonTransform(p1, p2, p3, p4, p5, p6) --[[ UpdateThirdPersonTransform | Line: 151 | Upvalues: Players (copy), CameraInput (copy), v4 (ref), UserGameSettings (copy), VRService (copy) ]]
	local v1 = p1:GetCameraToSubjectDistance()
	if v1 < 0.5 then
		v1 = 0.5
	end
	if p5 ~= nil and p1.lastCameraFocus ~= nil then
		local v3 = if (p5 - p6).magnitude > 0.01 then true else require(Players.LocalPlayer:WaitForChild("PlayerScripts").PlayerModule:WaitForChild("ControlModule")):GetMoveVector().magnitude > 0.01
		if v3 then
			p1.motionDetTime = 0.1
		end
		p1.motionDetTime = p1.motionDetTime - p2
		if p1.motionDetTime > 0 then
			v3 = true
		end
		if v3 and not p1.needsReset then
			local lastCameraFocus = p1.lastCameraFocus
			p1.VRCameraFocusFrozen = true
			return p3, lastCameraFocus
		end
		local v42 = if p1.lastCameraResetPosition == nil then true elseif (p6 - p1.lastCameraResetPosition).Magnitude > 1 then true else false
		local v5 = CameraInput.getRotation()
		local v7 = false
		if v4 and (if v5 == Vector2.new() then false else true) and v5.X ~= 0 then
			local v8 = p1.cameraOffsetRotation + v5.X
			if v8 < -3.141592653589793 then
				v8 = math.pi - (v8 + math.pi)
			elseif v8 > math.pi then
				v8 = -3.141592653589793 + (v8 - math.pi)
			end
			p1.cameraOffsetRotation = math.clamp(v8, -3.141592653589793, math.pi)
			if UserGameSettings.VRSmoothRotationEnabled then
				p1.cameraOffsetRotationDiscrete = p1.cameraOffsetRotation
				local v9 = p1:GetHumanoid()
				local v10 = v9.Torso and v9.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
				local v12 = p4.Position - Vector3.new(v10.X, 0, v10.Z) * v1
				local v13 = Vector3.new(p4.Position.X, v12.Y, p4.Position.Z)
				p3 = CFrame.new(v13 - (CFrame.new(v12, v13) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p1.cameraOffsetRotationDiscrete)).LookVector * (v13 - v12).Magnitude, v13)
			else
				local v17 = math.floor(p1.cameraOffsetRotation * 12 / 12)
				if v17 ~= p1.cameraOffsetRotationDiscrete then
					p1.cameraOffsetRotationDiscrete = v17
					v7 = true
				end
			end
		end
		if p1.VRCameraFocusFrozen and v42 or (p1.needsReset or v7) then
			if not v7 then
				p1.cameraOffsetRotationDiscrete = 0
				p1.cameraOffsetRotation = 0
			end
			VRService:RecenterUserHeadCFrame()
			p1.VRCameraFocusFrozen = false
			p1.needsReset = false
			p1.lastCameraResetPosition = p6
			p1:ResetZoom()
			p1:StartFadeFromBlack()
			local v18 = p1:GetHumanoid()
			local v19 = v18.Torso and v18.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
			local v21 = p4.Position - Vector3.new(v19.X, 0, v19.Z) * v1
			local v22 = Vector3.new(p4.Position.X, v21.Y, p4.Position.Z)
			if v4 and p1.cameraOffsetRotation ~= 0 then
				v21 = v22 - (CFrame.new(v21, v22) * CFrame.fromAxisAngle(Vector3.new(0, 1, 0), p1.cameraOffsetRotationDiscrete)).LookVector * (v22 - v21).Magnitude
			end
			p3 = CFrame.new(v21, v22)
		end
	end
	return p3, p4
end
function v1.EnterFirstPerson(p1) --[[ EnterFirstPerson | Line: 264 ]]
	p1.inFirstPerson = true
	p1:UpdateMouseBehavior()
end
function v1.LeaveFirstPerson(p1) --[[ LeaveFirstPerson | Line: 269 ]]
	p1.inFirstPerson = false
	p1.needsReset = true
	p1:UpdateMouseBehavior()
	if not p1.VRBlur then
		return
	end
	p1.VRBlur.Visible = false
end
return v1