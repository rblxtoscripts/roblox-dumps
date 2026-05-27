-- https://lua.expert/
local Players = game:GetService("Players")
local VRService = game:GetService("VRService")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
require(script.Parent:WaitForChild("CameraUtils"))
local VRBaseCamera = require(script.Parent:WaitForChild("VRBaseCamera"))
local v1 = setmetatable({}, VRBaseCamera)
v1.__index = v1
function v1.new() --[[ new | Line: 23 | Upvalues: VRBaseCamera (copy), v1 (copy) ]]
	local v3 = setmetatable(VRBaseCamera.new(), v1)
	v3.lastUpdate = tick()
	v3:Reset()
	return v3
end
function v1.Reset(p1) --[[ Reset | Line: 32 ]]
	p1.needsReset = true
	p1.needsBlackout = true
	p1.motionDetTime = 0
	p1.blackOutTimer = 0
	p1.lastCameraResetPosition = nil
	p1.stepRotateTimeout = 0
end
function v1.Update(p1, p2) --[[ Update | Line: 41 | Upvalues: Players (copy) ]]
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
function v1.UpdateFirstPersonTransform(p1, p2, p3, p4, p5, p6) --[[ UpdateFirstPersonTransform | Line: 96 | Upvalues: Players (copy), CameraInput (copy) ]]
	if p1.needsReset then
		p1:StartFadeFromBlack()
		p1.needsReset = false
		p1.stepRotateTimeout = 0.25
		p1.VRCameraFocusFrozen = true
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
	if p1.stepRotateTimeout <= 0 and math.abs(v2.X) > 0.03 then
		v3 = if v2.X < 0 then -0.5 else 0.5
		p1.needsReset = true
	end
	return CFrame.new(p - 0.5 * p1:CalculateNewLookVectorFromArg(Unit, Vector2.new(v3, 0)), p), p4
end
function v1.UpdateThirdPersonTransform(p1, p2, p3, p4, p5, p6) --[[ UpdateThirdPersonTransform | Line: 138 | Upvalues: Players (copy), VRService (copy) ]]
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
		if p1.VRCameraFocusFrozen and (if p1.lastCameraResetPosition == nil then true elseif (p6 - p1.lastCameraResetPosition).Magnitude > 1 then true else false) or p1.needsReset then
			VRService:RecenterUserHeadCFrame()
			p1.VRCameraFocusFrozen = false
			p1.needsReset = false
			p1.lastCameraResetPosition = p6
			p1:ResetZoom()
			p1:StartFadeFromBlack()
			local v5 = p1:GetHumanoid()
			local v6 = v5.Torso and v5.Torso.CFrame.lookVector or Vector3.new(1, 0, 0)
			local v8 = p4.Position - Vector3.new(v6.X, 0, v6.Z) * v1
			Vector3.new(p4.x, v8.y, p4.z)
			p3 = CFrame.new(v8, (Vector3.new(p4.Position.X, v8.Y, p4.Position.Z)))
		end
	end
	return p3, p4
end
function v1.EnterFirstPerson(p1) --[[ EnterFirstPerson | Line: 198 ]]
	p1.inFirstPerson = true
	p1:UpdateMouseBehavior()
end
function v1.LeaveFirstPerson(p1) --[[ LeaveFirstPerson | Line: 203 ]]
	p1.inFirstPerson = false
	p1.needsReset = true
	p1:UpdateMouseBehavior()
	if not p1.VRBlur then
		return
	end
	p1.VRBlur.Visible = false
end
return v1