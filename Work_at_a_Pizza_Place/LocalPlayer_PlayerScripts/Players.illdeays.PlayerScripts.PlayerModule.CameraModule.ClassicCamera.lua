-- https://lua.expert/
Vector2.new(0, 0)
local v1 = 0
local v2 = CFrame.fromOrientation(-0.2617993877991494, 0, 0)
local CommonUtils = script.Parent.Parent:WaitForChild("CommonUtils")
local FlagUtil = require(CommonUtils:WaitForChild("FlagUtil"))
local UserFixCameraOffsetJitter2 = FlagUtil.getUserFlag("UserFixCameraOffsetJitter2")
local UserCameraInputDt = FlagUtil.getUserFlag("UserCameraInputDt")
local UserFixCameraFPError = FlagUtil.getUserFlag("UserFixCameraFPError")
local Players = game:GetService("Players")
local CameraInput = require(script.Parent:WaitForChild("CameraInput"))
local CameraUtils = require(script.Parent:WaitForChild("CameraUtils"))
local BaseCamera = require(script.Parent:WaitForChild("BaseCamera"))
local v3 = setmetatable({}, BaseCamera)
v3.__index = v3
function v3.new() --[[ new | Line: 41 | Upvalues: BaseCamera (copy), v3 (copy), CameraUtils (copy) ]]
	local v32 = setmetatable(BaseCamera.new(), v3)
	v32.isFollowCamera = false
	v32.isCameraToggle = false
	v32.lastUpdate = tick()
	v32.cameraToggleSpring = CameraUtils.Spring.new(5, 0)
	return v32
end
function v3.GetCameraToggleOffset(p1, p2) --[[ GetCameraToggleOffset | Line: 52 | Upvalues: CameraInput (copy), CameraUtils (copy) ]]
	if not p1.isCameraToggle then
		return Vector3.new()
	end
	local currentSubjectDistance = p1.currentSubjectDistance
	if CameraInput.getTogglePan() then
		p1.cameraToggleSpring.goal = math.clamp(CameraUtils.map(currentSubjectDistance, 0.5, p1.FIRST_PERSON_DISTANCE_THRESHOLD, 0, 1), 0, 1)
	else
		p1.cameraToggleSpring.goal = 0
	end
	local v3 = math.clamp(CameraUtils.map(currentSubjectDistance, 0.5, 64, 0, 1), 0, 1) + 1
	return Vector3.new(0, p1.cameraToggleSpring:step(p2) * v3, 0)
end
function v3.SetCameraMovementMode(p1, p2) --[[ SetCameraMovementMode | Line: 70 | Upvalues: BaseCamera (copy) ]]
	BaseCamera.SetCameraMovementMode(p1, p2)
	p1.isFollowCamera = p2 == Enum.ComputerCameraMovementMode.Follow
	p1.isCameraToggle = p2 == Enum.ComputerCameraMovementMode.CameraToggle
end
function v3.Update(p1, p2) --[[ Update | Line: 77 | Upvalues: UserCameraInputDt (copy), v2 (copy), Players (copy), CameraInput (copy), v1 (ref), UserFixCameraOffsetJitter2 (copy), CameraUtils (copy), UserFixCameraFPError (copy) ]]
	local v12 = tick()
	local v22 = v12 - p1.lastUpdate
	if UserCameraInputDt then
		v22 = p2
	end
	local CurrentCamera = workspace.CurrentCamera
	local v3 = CurrentCamera.CFrame
	local Focus = CurrentCamera.Focus
	p1.resetCameraAngle = false
	local v4
	if p1.resetCameraAngle then
		local v5 = p1:GetHumanoidRootPart()
		v4 = if v5 then (v5.CFrame * v2).lookVector else v2.lookVector
		p1.resetCameraAngle = false
	else
		v4 = nil
	end
	local v6 = p1:GetHumanoid()
	local CameraSubject = CurrentCamera.CameraSubject
	local v7 = if CameraSubject then CameraSubject:IsA("VehicleSeat") else CameraSubject
	local v8 = if CameraSubject then CameraSubject:IsA("SkateboardPlatform") else CameraSubject
	local v9 = if v6 then if v6:GetState() == Enum.HumanoidStateType.Climbing then true else false else v6
	if p1.lastUpdate == nil or v22 > 1 then
		p1.lastCameraTransform = nil
	end
	local sum = CameraInput.getRotation(v22)
	p1:StepZoom()
	local v10 = p1:GetCameraHeight()
	if sum ~= Vector2.new() then
		v1 = 0
		p1.lastUserPanCamera = tick()
	end
	local v11 = if v12 - p1.lastUserPanCamera < 2 then true else false
	local sum_2 = p1:GetSubjectPosition()
	if sum_2 and (Players.LocalPlayer and CurrentCamera) then
		local v122 = p1:GetCameraToSubjectDistance()
		if v122 < 0.5 then
			v122 = 0.5
		end
		if p1:GetIsMouseLocked() and not p1:IsInFirstPerson() then
			local v13 = p1:CalculateNewLookCFrameFromArg(v4, sum)
			local sum_3 = p1:GetMouseLockOffset()
			if UserFixCameraOffsetJitter2 and v6 then
				sum_3 = sum_3 + v6.CameraOffset
			end
			local v14 = sum_3.X * v13.RightVector + sum_3.Y * v13.UpVector + sum_3.Z * v13.LookVector
			if CameraUtils.IsFiniteVector3(v14) then
				sum_2 = sum_2 + v14
			end
		elseif not (if sum == Vector2.new() then false else true) and p1.lastCameraTransform then
			local v16 = p1:IsInFirstPerson()
			if (v7 or (v8 or p1.isFollowCamera and v9)) and (p1.lastUpdate and (v6 and v6.Torso)) then
				if v16 then
					if p1.lastSubjectCFrame and (v7 or v8) and CameraSubject:IsA("BasePart") then
						local v19 = -CameraUtils.GetAngleBetweenXZVectors(p1.lastSubjectCFrame.lookVector, CameraSubject.CFrame.lookVector)
						if CameraUtils.IsFinite(v19) then
							sum = sum + Vector2.new(v19, 0)
						end
						v1 = 0
					end
				elseif not v11 then
					v1 = math.clamp(v1 + 3.839724354387525 * v22, 0, 4.363323129985824)
					local v222 = math.clamp(v1 * v22, 0, 1)
					if p1:IsInFirstPerson() and not (p1.isFollowCamera and p1.isClimbing) then
						v222 = 1
					end
					local v23 = CameraUtils.GetAngleBetweenXZVectors(v6.Torso.CFrame.lookVector, p1:GetCameraLookVector())
					if CameraUtils.IsFinite(v23) and math.abs(v23) > 0.0001 then
						sum = sum + Vector2.new(v23 * v222, 0)
					end
				end
			else
				local v17, v18
				if p1.isFollowCamera and not (v16 or v11) then
					v17 = -(p1.lastCameraTransform.p - sum_2)
					v18 = CameraUtils.GetAngleBetweenXZVectors(v17, p1:GetCameraLookVector())
					if CameraUtils.IsFinite(v18) and (math.abs(v18) > 0.0001 and 0.4 * v22 < math.abs(v18)) then
						sum = sum + Vector2.new(v18, 0)
					end
				end
			end
		end
		local v24, v25
		if p1.isFollowCamera then
			local v26 = p1:CalculateNewLookVectorFromArg(v4, sum)
			local v27 = CFrame.new(sum_2)
			if UserFixCameraFPError then
				v24, v25 = v27, CFrame.lookAlong(v27.p - v122 * v26, v26)
			else
				v25 = CFrame.new(v27.p - v122 * v26, v27.p) + Vector3.new(0, v10, 0)
				v24 = v27
			end
		else
			local v29 = CFrame.new(sum_2)
			local p = v29.p
			local v30 = p1:CalculateNewLookVectorFromArg(v4, sum)
			if UserFixCameraFPError then
				v24, v25 = v29, CFrame.lookAlong(p - v122 * v30, v30)
			else
				v24, v25 = v29, CFrame.new(p - v122 * v30, p)
			end
		end
		local v33 = p1:GetCameraToggleOffset(v22)
		Focus = v24 + v33
		v3 = v25 + v33
		p1.lastCameraTransform = v3
		p1.lastCameraFocus = Focus
		if (v7 or v8) and CameraSubject:IsA("BasePart") then
			p1.lastSubjectCFrame = CameraSubject.CFrame
		else
			p1.lastSubjectCFrame = nil
		end
	end
	p1.lastUpdate = v12
	return v3, Focus
end
return v3